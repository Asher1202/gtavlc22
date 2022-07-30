#include <YSI_Coding\y_hooks>

enum E_TAX_TYPE {
    e_SELL_GUN,
    e_CHUYEN_TIEN,
    // e_RUT_TIEN,
    e_BAN_VAT_LIEU,
    e_BAN_MA_TUY,
    /*
        Bán súng - chỉ nhận được 80% số tiền mình bán ra
        Chuyển tiền - Trừ đi 15% số tiền mình chuyển
        Rút tiền - Chỉ nhận được 95% số tiền mình rút
        Bán vật liệu - chỉ nhận được 90% số tiền mình bán ra
        Bán ma túy - chỉ nhận được 80% số tiền mình bán ra
        Mua xe - sẽ bị trừ thêm 5% thuế khi mua xe, tính theo giá trị chiếc xe mình mua
        Dice - chỉ nhận được 90% số tiền mình chiến thắng (pain)
        Tai xiu - chỉ nhận được 90% số tiền mình chiến thắng
        Sử dụng lệnh [/trade] sẽ bị trừ 10% tổng giá trị của 2 người (đây là lệnh được sử dụng ở các cuộc giao dịch lớn, nên số tiền bị trừ chỉ ở mức đó và sẽ tăng lên vào tương lai)
        Bán nhà, căn hộ - Trừ 10% giá trị căn nhà bán ra
    */
    e_TRAO_DOI,
    e_SELL_TOY,
    e_MUA_XE,
    e_DICE,
    e_TAI_XIU,
    e_TRADE,
    e_BAN_NHA,
};

// Chưa làm: thuế bán nhà, thuế dice

/*
    Thanh toán thuế
*/
function PayTax(playerid, moneyAmount, E_TAX_TYPE:type) {
    new tax = 0;
    new taxText[200];

    switch (type) {
        case e_SELL_GUN: {
            tax = floatround(float(moneyAmount) * 0.2);
            format(taxText, sizeof(taxText), "(Thue ban sung: %02f%%)", 0.2);
        }
        case e_CHUYEN_TIEN: {
            tax = floatround(float(moneyAmount) * 0.15);
            format(taxText, sizeof(taxText), "(Thue chuyen tien: %02f%%)", 0.15);
        }
        // case e_RUT_TIEN: {
        //     tax = floatround(float(moneyAmount) * 0.05);
        // }
        case e_BAN_VAT_LIEU: {
            tax = floatround(float(moneyAmount) * 0.15);
            format(taxText, sizeof(taxText), "(Thue ban vat lieu: %02f%%)", 0.15);
        }
        case e_BAN_MA_TUY: {
            tax = floatround(float(moneyAmount) * 0.2);
            format(taxText, sizeof(taxText), "(Thue ban ma tuy: %02f%%)", 0.2);
        }
        case e_MUA_XE: {
            tax = floatround(float(moneyAmount) * 0.05);
            format(taxText, sizeof(taxText), "(Thue mua xe: %02f%%)", 0.05);
        }
        case e_DICE: {
            tax = floatround(float(moneyAmount) * 0.1);
            format(taxText, sizeof(taxText), "(Thue dice: %02f%%)", 0.1);
        }
        case e_SELL_TOY: {
            tax = floatround(float(moneyAmount) * 0.2);
            format(taxText, sizeof(taxText), "(Thue sell toy: %02f%%)", 0.2);
        }
        case e_TAI_XIU: {
            tax = floatround(float(moneyAmount) * 0.1);
            format(taxText, sizeof(taxText), "(Thue tai xiu: %02f%%)", 0.1);
        }
        case e_TRADE: {
            tax = floatround(float(moneyAmount) * 0.1);
            format(taxText, sizeof(taxText), "(Thue trade: %02f%%)", 0.1);
        }
        case e_BAN_NHA: {
            tax = floatround(float(moneyAmount) * 0.1);
            format(taxText, sizeof(taxText), "(Thue ban nha: %02f%%)", 0.1);
        }
        case e_TRAO_DOI: {
            tax = floatround(float(moneyAmount) * 0.1);
            format(taxText, sizeof(taxText), "(Thue trao doi: %02f%%)", 0.1);
        }
    }

    GivePlayerCash(playerid, -tax);
	Update(playerid, pCashx);

    new str[200];
    format(str, sizeof(str), "Ban da thanh toan thue %s$ %s", FormatNumber(tax), taxText);
    SendSuccessMessage(playerid, str);

    return moneyAmount - tax;
}

stock getTextTask() {
    new str[1000];
    strcat(str, "\
Ban sung - chi nhan duoc 80% so tien minh ban ra\n\
Chuyen tien - Tru di 15% so tien minh chuyen\n\
Rut tien - Chi nhan duoc 95% so tien minh rut\n\
Ban vat lieu - chi nhan duoc 90% so tien minh ban ra\n\
Ban ma tuy - chi nhan duoc 80% so tien minh ban ra\n\
Mua xe - se bi tru them 5% thue khi mua xe, tinh theo gia tri chiec xe minh mua\n\
Dice - chi nhan duoc 90% so tien minh chien thang (pain)\n\
Tai xiu - chi nhan duoc 90% so tien minh chien thang\n\
Su dung lenh [/trade] se bi tru 10% tong gia tri cua 2 nguoi\n\
(day la lenh duoc su dung o cac cuoc giao dich lon,\n\
nen so tien bi tru chi o muc do va se tang len vao tuong lai)\n\
Ban nha, can ho - Tru 10% gia tri can nha ban ra\n\");

    return str;
}

function payTaxTaiXiu(playerid, chip) {
    new taxText[200];
    format(taxText, sizeof(taxText), "(Thue tai xiu: %02f%%)", 0.05);

    new tax = floatround(float(chip) * 0.05);
    new str[200];
    format(str, sizeof(str), "Ban da thanh toan thue %s$ %s", FormatNumber(tax), taxText);
    SendSuccessMessage(playerid, str);


    return chip - tax;
}