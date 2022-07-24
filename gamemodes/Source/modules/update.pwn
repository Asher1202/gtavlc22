/* ** Inckuyde ** */
#include <YSI_Coding\y_hooks>

/* ** Debug ** */
#if !defined UPDATEDIRECTORY
    #define KiemTraVersion(%0)    ( "KHONG RO" )
    #endinput
#endif

/* ** Def/stock ** */

CMD:updates( playerid, params[ ] )// de zcmd thu
{
    new
        File: handle = fopen( LINKMOFILELOG, io_read );

    if ( ! handle )
    	return SendClientMessage( playerid, COLOR_YELLOW, "Khong co update nao de show." );

    new
        count = 0;

    stringDocFileTo = " {B6EEBD}Version\t \n";

    // Doc file 
    while ( fread( handle, stringDocFileNho ) )
    {
        // xoa khoang trang thanks to Slice
        strreplace( stringDocFileNho, "\n", "" ), trimString( stringDocFileNho );

        // format string
        if ( ! count ) {
            format( stringDocFileTo, sizeof( stringDocFileTo ), "%s%s\t{FDE6CC}GAN NHAT\n", stringDocFileTo, stringDocFileNho );
        } else {
            format( stringDocFileTo, sizeof( stringDocFileTo ), "%s{333333}%s\t \n", stringDocFileTo, stringDocFileNho );
        }
        count ++;
    }

    
    Dialog_Show( playerid, DIALOG_UPDATE, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}PHIEN BAN", stringDocFileTo, "Select", "Close" );
    return 1;
}

stock KiemTraVersion( )
{
    static
        phienban[ 32 ];

    if ( phienban[ 0 ] == '\0' )
    {
        new
            File: handle = fopen( LINKMOFILELOG, io_read );

        if ( handle )
        {
            // doc doan dau
            fread( handle, phienban );

            // xoa khoang trang
            strreplace( phienban, "\n", "" ), trimString( phienban );
        }
        else
        {
            phienban = "KHONG RO";
        }

        fclose( handle );
    }
    return phienban;
}


// purpose: trim a string
stock trimString( strSrc[ ] )
{
    new
        strPos
    ;
    for( strPos = strlen( strSrc ); strSrc[ strPos ] <= ' '; )
        strPos--;

    strSrc[ strPos + 1 ] = EOS;

    for( strPos = 0; strSrc[ strPos ] <= ' '; )
        strPos++;

    strdel( strSrc, 0, strPos );
}