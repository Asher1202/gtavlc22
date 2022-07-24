#include <requests>
#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_timers>
#include <easyDialog>

static COINGECKO_BASE_URL[] = "https://api.coingecko.com";
static Float:g_BitcoinPrice;
static RequestsClient:client;
static g_totalOrder = 0;

enum e_ORDER {
    orderSQLID,
    orderType,
    Float:orderAmount,
    orderLeverage,
    Float:orderMarkPrice,
    Float:orderStopLoss,
    Float:orderTakeProfit,
    orderUserSQLId
};


TradeCoin_MigrateDb() {
    // Migrate DB
    new query[400];
    // check if table order-book exists mySQL
    format(query, sizeof(query), "SHOW TABLES LIKE 'orderbooks'");
    new Cache:cache = mysql_query(SQL, query);

    if(cache_num_rows() == 0) {
        // create table order-book
        format(query, sizeof(query), "CREATE TABLE orderbooks (id INT NOT NULL AUTO_INCREMENT, type VARCHAR(20), amount FLOAT, leverage FLOAT, mark_price FLOAT, stop_loss FLOAT, \
        take_profit FLOAT, user_sql_id INT, PRIMARY KEY (id), INDEX (user_sql_id))");
        mysql_query(SQL, query, false);
    }

    //add some data to the table
    format(query, sizeof(query), "INSERT INTO orderbooks (type, amount, leverage, mark_price, stop_loss, take_profit, user_sql_id) VALUES ('buy', 0.1, 1, 0, 0, 0, 0)");
    mysql_query(SQL, query, false);

    format(query, sizeof(query), "INSERT INTO orderbooks (type, amount, leverage, mark_price, stop_loss, take_profit, user_sql_id) VALUES ('sell', 0.3, 1, 0, 0, 0, 0)");
    mysql_query(SQL, query, false);

    format(query, sizeof(query), "INSERT INTO orderbooks (type, amount, leverage, mark_price, stop_loss, take_profit, user_sql_id) VALUES ('buy', 0.5, 1, 0, 0, 0, 0)");
    mysql_query(SQL, query, false);

    format(query, sizeof(query), "INSERT INTO orderbooks (type, amount, leverage, mark_price, stop_loss, take_profit, user_sql_id) VALUES ('sell', 3.1, 1, 0, 0, 0, 0)");
    mysql_query(SQL, query, false);

    cache_delete(cache);
}

hook OnGameModeInit() {
    printf("Fetching data from Coingecko...\n");

    client = RequestsClient(COINGECKO_BASE_URL);
    RequestJSON(
        client,
        "api/v3/simple/price?ids=bitcoin&vs_currencies=usd",
        HTTP_METHOD_GET,
        "OnGetJson",
        .headers = RequestHeaders()
    );

    // Try migrate
    printf("Migrating DB...\n");
    TradeCoin_MigrateDb();
}

function OnGetJson(Request:id, E_HTTP_STATUS:status, Node:node) {
    new ret;
    new Node:parsedNode;
    ret = JsonGetObject(node, "bitcoin", parsedNode);
    if (ret) {
        printf("Error accessing bitcoin object: %d\n", ret);
        return;
    }

    new Float:btcPrice;
    ret = JsonGetFloat(parsedNode, "usd", btcPrice);
    if (ret) {
        printf("Error get float: %d\n", ret);
        return;
    }

    printf("Bitcoin price: %02f", btcPrice);
    g_BitcoinPrice = btcPrice;
}

task getBitcoinPrice[60000]() 
{
    RequestJSON(
        client,
        "api/v3/simple/price?ids=bitcoin&vs_currencies=usd",
        HTTP_METHOD_GET,
        "OnGetJson",
        .headers = RequestHeaders()
    ); 
}

TradeCoin_ShowDialog(playerid) {
    new title[100];
    format(title, sizeof(title), "Bitcoin price: %02f", g_BitcoinPrice);

    new info[200];
    strcat(info, "Thao tac\tSo luong\n");
    format(info, sizeof(info), "LONG\nSHORT\nLenh cua toi\nSo Lenh Server\t%s lenh\nHuong dan\n", FormatNumber(g_totalOrder));

    Dialog_Show(playerid, DIALOG_TRADECOIN, DIALOG_STYLE_TABLIST_HEADERS, title, info, "Xem thong tin", "Huy");
}

TradeCoin_ShowOrderbookDialog(playerid) {
    new title[100];
    format(title, sizeof(title), "Bitcoin price: %02f", g_BitcoinPrice);

    new info[200];
    strcat(info, "Nguoi dat\tDon bay\tSo tien\tROI (loi nhuan)\tThanh khoan tai\n");

    Dialog_Show(playerid, DIALOG_TRADECOIN, DIALOG_STYLE_TABLIST_HEADERS, title, info, "Xem thong tin", "Huy");
}

Dialog:DIALOG_TRADECOIN(playerid, response, listitem, inputtext[]) {
    if(!response) {
        return 1;
    }

    switch(listitem) {
        case 3: {
            TradeCoin_ShowOBByAmount(playerid);
        }
    }

    return 1;
}

CMD:tradecoin(playerid, params[]) {
    TradeCoin_ShowDialog(playerid);

    return 1;
}

// get orderbook order by profit
TradeCoin_ShowOBByAmount(playerid, page = 1, limit = 20) {
    new Float:currentPrice = g_BitcoinPrice;

    new orders[30][e_ORDER]; // 30 is big enough

    new query[200];
    format(query, sizeof(query), "SELECT * FROM orderbooks ORDER BY amount DESC LIMIT %d, %d", (page - 1) * limit, limit);
    new Cache:cache = mysql_query(SQL, query);

    new totalOrder = cache_num_rows();
    if(totalOrder == 0) {
        return;
    }

    for(new i = 0; i != totalOrder; i++) {
        cache_get_value_name_int(i, "user_sql_id", orders[i][orderUserSQLId]);
        cache_get_value_name_float(i, "amount", orders[i][orderAmount]);
        cache_get_value_name_float(i, "mark_price", orders[i][orderMarkPrice]);
        cache_get_value_name_float(i, "stop_loss", orders[i][orderStopLoss]);
        cache_get_value_name_float(i, "take_profit", orders[i][orderTakeProfit]);
        cache_get_value_name_int(i, "leverage", orders[i][orderLeverage]);
        cache_get_value_name_int(i, "type", orders[i][orderType]);
        cache_get_value_name_int(i, "id", orders[i][orderSQLID]);
    }

    cache_delete(cache);

    // Show dialog
    new title[100];
    format(title, sizeof(title), "Bitcoin price: %02f", g_BitcoinPrice);

    new info[2000];
    strcat(info, "Nguoi dat\tDon bay\tSo tien\tROI (loi nhuan)\tChay tai khoan tai\n");
    for(new i = 0; i != totalOrder; i++) {
        new Float:profit = orders[i][orderMarkPrice] - currentPrice;
        new Float:profitPercent = profit / currentPrice;
        new profitPercentStr[100];
        format(profitPercentStr, sizeof(profitPercentStr), "%02f%%", profitPercent * 100);
        new leverageStr[100];
        format(leverageStr, sizeof(leverageStr), "x%d", orders[i][orderLeverage]);

        format(info, sizeof(info), "%s\t%s\t%s\t%s\t%0.2f$\n", 
            GetPlayerName(orders[i][orderUserSQLId]), orders[i][orderType] == 0 ? "LONG" : "SHORT",  
            leverageStr, profitPercentStr, orders[i][orderAmount]);
    }

    Dialog_Show(playerid, DIALOG_TRADECOIN, DIALOG_STYLE_TABLIST_HEADERS, title, info, "Xem thong tin", "Huy");
}