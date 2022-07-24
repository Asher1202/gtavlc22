#include <a_mysql>
#include <YSI_Coding\y_hooks>
#include <YSI_Data\y_iterate>

new 
    MySQL: SQL;

forward Cache:va_mysql_query(const fmat[], va_args<>);

hook OnGameModeInit() {
    mysql_log(ERROR | WARNING);
   // mysql_log(LOG_ERROR, LOG_TYPE_TEXT);
    SQL = mysql_connect_file("mysql.ini");
}