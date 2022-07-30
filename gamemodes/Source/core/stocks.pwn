#include <YSI_Coding\y_hooks>
// iswheelmodel(modelid) {
//     new wheelmodels[17] = {1025,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1096,1097,1098};
//     for(new I = 0, b = sizeof(wheelmodels); I != b; ++I) {
// 		if(modelid == wheelmodels[I]) return true;
//     }
//     return false;
// }

// IllegalCarNitroIde(carmodel) {
//     new illegalvehs[29] = { 581, 523, 462, 521, 463, 522, 461, 448, 468, 586, 509, 481, 510, 472, 473, 493, 595, 484, 430, 453, 452, 446, 454, 590, 569, 537, 538, 570, 449 };
//     for(new I = 0, b = sizeof(illegalvehs); I != b; ++I) {
// 		if(carmodel == illegalvehs[I]) return true;
//     }
//     return false;
// }
// islegalcarmod(vehicleide, componentid) {
//     new modok = false;
//     if( (iswheelmodel(componentid)) || (componentid == 1086) || (componentid == 1087) || ((componentid >= 1008) && (componentid <= 1010))) {
// 		new nosblocker = IllegalCarNitroIde(vehicleide);
// 		if(!nosblocker) modok = true;
//     } else {
// 		for(new I = 0, b = sizeof(legalmods); I != b; ++I) {
// 			if(legalmods[I][0] == vehicleide) {
// 				for(new J = 1; J < 22; J++) { 
// 					if(legalmods[I][J] == componentid) modok = true;
// 				}
// 			}
// 		}
//     }
//     return modok;
// }	
SaveObject(const id) {
    new szQuery[1024];
    format(szQuery, sizeof(szQuery), "UPDATE `fobjects` SET `Model`='%d', `X`='%f', `Y`='%f', `Z`='%f', `RotX`='%f', `RotY`='%f', `RotZ`='%f', `Virtual`='%d', `House`='%d' WHERE `ID`='%d'",
    FurnitureInfo[id][fiModel], FurnitureInfo[id][fiX], FurnitureInfo[id][fiY], FurnitureInfo[id][fiZ], FurnitureInfo[id][fiRotX], FurnitureInfo[id][fiRotY], FurnitureInfo[id][fiRotZ], FurnitureInfo[id][fiVirtual], FurnitureInfo[id][fiHouse], id);
    mysql_tquery(SQL, szQuery, "", "");
    return 1;
}

// static g_TriviaQuestions[][2][] = 
// {
//     {"Bac Ho sinh ngay nao?", "19"},
//     {"Bac Ho sinh thang may?", "5"},
//     {"Bac Ho sinh nam nao?", "1890"},
//     {"Ngo Dinh Diem sinh ngay may?", "3"},
//     {"Ngo Dinh Diem sinh thang may?", "1"},
//     {"Ngo Dinh Diem sinh nam may?", "1901"},
//     {"Ai la nguoi lap lo chau mai?", "Phan Dinh Giot"},
//     {"Chu server la ai", "thanh toan"},
//     {"Scripter ten gi?", "Phu"},
//     {"Tuoi di nghia vu chuan doi voi dan ong?", "18"},
//     {"Yeu hay khong yeu, khong yeu hay yeu?", "khong yeu"},
//     {"Gang nao nam gan LSPD nhat", "Vagos"},
//     {"Ai noi tieng bi nguoi yeu cam sung", "Tien Dat"},
//     {"Vo Tran Thanh?", "Harri Won"},
//     {"Con Mua Ngang Qua la do ai sang tac?", "Son Tung"},
//     {"Xem sex nhieu bi gi?", "Suy than"},
//     {"Vua Minh Mang da an nam voi bao nhieu phi tan?", "43"},
//     {"'Roi con mua chieu nay se dua bong toi khuat xa dan' la bai hat gi?", "toi la toi"},
//     {"Dien vao cho trong: Mot mat troi trong lan rat ...?", "do"},
//     {"Hiep dam tre duoi 18 o tu it nhat bao nhieu nam?", "5"},
//     {"Hiep dam tre duoi 18 o tu nhieu nhat bao nhieu nam?", "10"},
//     {"Trang hentai lon nhat Vietnam?", "hentaiz"},
//     {"Bai hat dau tien cua Erik khi debut?", "sau tat ca"},
//     {"Ho Cam Dao la tong thong cua nuoc nao?", "Trung Quoc"},
//     {"Quay tay ngoai mat Protein thi mat gi?", "Canxi"},
//     {"Thuc an gi bo xung canxi tot nhung gay yeu sinh ly?", "Ta hu"},
//     {"Quoc hieu dau tien cua Viet Nam?", "Van Lang"},
//     {"Co giao noi tieng nhat?", "Thao"},
//     {"Nuoc uong chua sat va canxi?", "Cafe"},
//     {"Ai la nguoi sang tao ra: 1 + 1 > 2?", "Son Tung"},
//     {"1 + 2 × 2?", "5"},
//     {"An cut khong?", "Co"},
//     {"Ngay thanh lap dang (ngay/thang/nam)?", "3/2/1930"},
//     {"Dong phuc cua linh muc goi la gi?", "Muc su"},
//     {"Da den hay da trang?", "trang"},
//     {"Can benh the ki?", "HIV"},
//     {"Co bao nhieu gio trong mot thang?", "720"},
//     {"Cong ti nao da tao ra Windows?", "Microsoft"},
//     {"Cong ty nao tao ra League of Legends?", "Riot"},
//     {"Thu do cua Han Quoc la gi?", "Seoul"},
//     {"It nhat bao nhieu tuoi thi duoc lam Admin/Helper", "16"},
//     {"Con gi tuong trung cho cung hoang dao 20.02 - 20.03?", "Ca"},
//     {"Quan rong nhat la quan gi?", "Quan dao"},
//     {"Con trai co gi quy nhat?", "Con trai"},
//     {"Nang ba nam ta chua he bo ban?", "Bong"},
//     {"Con duong nao dai nhat?", "Duong doi"},
//     {"Cai gi nguoi mua biet, nguoi ban biet, nguoi xai khong biet?", "Quan tai"},
//     {"Co quan quan trong nhat cua phu nu la gi?", "Hoi lien hiep phu nu"},
//     {"Benh gi ma bac si bo tay?", "Benh gay tay"},
//     {"Cang choi cang ra nuoc?", "Choi co"},
//     {"Lich nao dai nhat?", "Lich su"}
// };
// RandomTriviaEvent()
// {
//     new idx = random(sizeof(g_TriviaQuestions));
//     format(TriviaText, sizeof(TriviaText), "%s", g_TriviaQuestions[idx][0]), format(FastEventText, sizeof(FastEventText), "%s", g_TriviaQuestions[idx][1]);
//     TEvent = 4, TEventReward = 2000 + RandomEx(1500, 4101);
//     new string[250];
//     format(string, sizeof(string), "Trivia Event: Cau hoi: ''{FFA200}%s{ADD63C}''. Tra loi bang cach bam T va nhap dap an, phan thuong: %s$.", g_TriviaQuestions[idx][0], FormatNumber(TEventReward));
//     foreach(new i: Player) {
//         if(IsPlayerLogged[i] == 1) {
//             MesajLung(i, 0xADD63CFF, string);
//         }
//     }
// }
RandomMathEvent()
{
    new operation = random(4), numbers, result, string[100], small_str[16], prize = 1200 + RandomEx(2500, 3801);
    format(string, sizeof(string), "Math Event: Nguoi dau tien tra loi duoc ket qua cua ");
    switch(operation)
    {
        case 0: // +
        {
            numbers = 2 + random(4);
            for(new i = 0, number; i < numbers; i++) number = 1 + random(50), format(small_str, sizeof(small_str), "%s%d+", small_str, number), result += number;
            small_str[strlen(small_str) - 1] = EOS, strcat(string, small_str);  
        }
        case 1: // -
        {
            numbers = 2 + random(4);
            for(new i = 0, number; i < numbers; i++) number = 1 + random(50), number = -number, format(small_str, sizeof(small_str), "%s%d", small_str, number), result += number;
            strcat(string, small_str);
        }
        case 2: // *
        {
            numbers = 2 + random(3), result = 1;
            for(new i = 0, number; i < numbers; i++) number = 1 + random(50), format(small_str, sizeof(small_str), "%s%d*", small_str, number), result *= number;
            small_str[strlen(small_str) - 1] = EOS, strcat(string, small_str);
        }
        case 3: // sqrt
        {
            new number = 1 + random(125);
            result = floatround(floatsqroot(float(number * number))), format(small_str, sizeof (small_str), "V%d", number * number);
            strcat(string, small_str);
        }
    }
    format(string, sizeof(string), "%s se nhan duoc %s$.", string, FormatNumber(prize)), SCMTA(0xADD63CFF, string);
    TEvent = 3, TEventReward = prize, MathEvent_Active = true, MathEvent_Result = result;
}
IsPlayerNearVehicle(playerid, vehicleid, Float:range)
{
    new Float:X, Float:Y, Float:Z;
    GetVehiclePos(vehicleid, X, Y, Z);
    if(IsPlayerInRangeOfPoint(playerid, range, X, Y, Z))return true;
    else return false;
}
GetRankName(playerid) {
    new name[17];
    format(name, 17, fRankNames[PlayerInfo[playerid][pMember]][PlayerInfo[playerid][pRank]-1]);
    return name;
}
DestroyPlayerCar(dbid) {
    if(CarInfo[dbid][Spawned] == 0) return 1;
    
    VehicleOwned[CarInfo[dbid][Spawned]] = 0;
    VehicleSQL[CarInfo[dbid][Spawned]] = 0;
        
    new Float: Pos[3];
    GetVehiclePos(CarInfo[dbid][Spawned], Pos[0], Pos[1], Pos[2]);
    if(CarInfo[dbid][cNeon] != 0) {
        DestroyDynamicObject(neon[0][CarInfo[dbid][Spawned]]);
        DestroyDynamicObject(neon[1][CarInfo[dbid][Spawned]]);
        neon[0][CarInfo[dbid][Spawned]] = 0;
        neon[1][CarInfo[dbid][Spawned]] = 0;    
    }
    if(strlen(CarInfo[dbid][cText]) >= 3) DestroyDynamicObject(nameobject[CarInfo[dbid][Spawned]]);
    CarInfo[dbid][cFuel] = Gas[CarInfo[dbid][Spawned]];
    new query[256];
    format(query, sizeof(query), "UPDATE `cars` SET `Fuel`='%d' WHERE `ID`='%d'", CarInfo[dbid][cFuel], dbid);
    mysql_query(SQL, query, false);
    
    CarInfo[dbid][cLastPos][0] = Pos[0];
    CarInfo[dbid][cLastPos][1] = Pos[1];
    CarInfo[dbid][cLastPos][2] = Pos[2];    
        
    DestroyVehicle(CarInfo[dbid][Spawned]);
    CarInfo[dbid][Spawned] = 0;
    new string[70];
    mysql_format(SQL, string, sizeof(string), "UPDATE cars SET Spawned='%d' WHERE ID=%d", CarInfo[dbid][Spawned], dbid);
    mysql_tquery(SQL, string, "", "");
    return 1;
}


SpawnPlayerCar(dbid) {
    if(dbid != 0) {
        new string[80];
        new engine,lights,alarm,doors,bonnet,boot,objective;
        if(CarInfo[dbid][Confiscated] == 1) return 1;
        CarInfo[dbid][Spawned] = CreateVehicleEx(CarInfo[dbid][cModel],CarInfo[dbid][cLocationx],CarInfo[dbid][cLocationy],CarInfo[dbid][cLocationz],CarInfo[dbid][cAngle],CarInfo[dbid][cColorOne],CarInfo[dbid][cColorTwo],-1);

        VehicleOwned[CarInfo[dbid][Spawned]] = CarInfo[dbid][Spawned];
        VehicleSQL[CarInfo[dbid][Spawned]] = dbid;
        
        attach_vip_text(dbid);                      
        // if(CarInfo[dbid][cNeon] != 0) {
        //     new h = CarInfo[dbid][Spawned];
        //     if(CarInfo[dbid][cNeon] == 1) {
        //         neon[0][h] = CreateDynamicObject(18648,0,0,0,0,0,0);
        //         neon[1][h] = CreateDynamicObject(18648,0,0,0,0,0,0);
        //     }
        //     else if(CarInfo[dbid][cNeon] == 2) {
        //         neon[0][h] = CreateDynamicObject(18649,0,0,0,0,0,0);
        //         neon[1][h] = CreateDynamicObject(18649,0,0,0,0,0,0);
        //     }
        //     else if(CarInfo[dbid][cNeon] == 3) {
        //         neon[0][h] = CreateDynamicObject(18650,0,0,0,0,0,0);
        //         neon[1][h] = CreateDynamicObject(18650,0,0,0,0,0,0);
        //     }
        //     else if(CarInfo[dbid][cNeon] == 4) {
        //         neon[0][h] = CreateDynamicObject(18652,0,0,0,0,0,0);
        //         neon[1][h] = CreateDynamicObject(18652,0,0,0,0,0,0);
        //     }
        //     else if(CarInfo[dbid][cNeon] == 5) {
        //         neon[0][h] = CreateDynamicObject(18651,0,0,0,0,0,0);
        //         neon[1][h] = CreateDynamicObject(18651,0,0,0,0,0,0);
        //     }
        //     else if(CarInfo[dbid][cNeon] == 6) {
        //         neon[0][h] = CreateDynamicObject(18647,0,0,0,0,0,0);
        //         neon[1][h] = CreateDynamicObject(18647,0,0,0,0,0,0);
        //     }
        //     AttachDynamicObjectToVehicle(neon[0][h], h, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
        //     AttachDynamicObjectToVehicle(neon[1][h], h, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
        // }   
    
        Gas[CarInfo[dbid][Spawned]] = CarInfo[dbid][cFuel];
        GetVehicleParamsEx(CarInfo[dbid][Spawned],engine,lights,alarm,doors,bonnet,boot,objective);
        SetVehicleParamsEx(CarInfo[dbid][Spawned],0,lights,alarm,CarInfo[dbid][cLock],bonnet,boot,objective);
        new carid = CarInfo[dbid][Spawned];
        if(CarInfo[dbid][mod0] != 0) AddVehicleComponent(carid,CarInfo[dbid][mod0]);
        if(CarInfo[dbid][mod1] != 0) AddVehicleComponent(carid,CarInfo[dbid][mod1]);
        if(CarInfo[dbid][mod2] != 0) AddVehicleComponent(carid,CarInfo[dbid][mod2]);
        if(CarInfo[dbid][mod3] != 0) AddVehicleComponent(carid,CarInfo[dbid][mod3]);
        if(CarInfo[dbid][mod4] != 0) AddVehicleComponent(carid,CarInfo[dbid][mod4]);
        if(CarInfo[dbid][mod5] != 0) AddVehicleComponent(carid,CarInfo[dbid][mod5]);
        if(CarInfo[dbid][mod7] != 0) AddVehicleComponent(carid,CarInfo[dbid][mod7]);
        if(CarInfo[dbid][mod8] != 0) AddVehicleComponent(carid,CarInfo[dbid][mod8]);
        if(CarInfo[dbid][mod9] != 0) AddVehicleComponent(carid,CarInfo[dbid][mod9]);
        if(CarInfo[dbid][mod10] != 0) AddVehicleComponent(carid,CarInfo[dbid][mod10]);
        if(CarInfo[dbid][mod11] != 0) AddVehicleComponent(carid,CarInfo[dbid][mod11]);
        if(CarInfo[dbid][mod12] != 0) AddVehicleComponent(carid,CarInfo[dbid][mod12]);
        if(CarInfo[dbid][mod13] != 0) AddVehicleComponent(carid,CarInfo[dbid][mod13]);
        SetVehicleNumberPlate(carid,CarInfo[dbid][cLicense]);
        ChangeVehiclePaintjob(carid,CarInfo[dbid][paintjob]);
        mysql_format(SQL, string, sizeof(string), "UPDATE cars SET Spawned='%d' WHERE ID=%d", CarInfo[dbid][Spawned], dbid);
        mysql_tquery(SQL, string, "", "");
    }
    return 1;
}
FindSpawnID(car) {
    if(VehicleOwned[car] != 0) return VehicleSQL[car];
    return 0;
}
Float:GetDistanceBetweenPoints(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2) {
    return VectorSize(x1-x2, y1-y2, z1-z2);
}

GetClosestVehicle(playerid) {
    new closestdist = 999999999, closestvehicle = -1;
    new Float:x[2],Float:y[2],Float:z[2],distance;
    foreach(new i : Vehicle) {
        GetVehiclePos(i,x[0],y[0],z[0]);
        GetPlayerPos(playerid,x[1],y[1],z[1]);
        distance = floatround(GetDistanceBetweenPoints(x[0],y[0],z[0],x[1],y[1],z[1]));
        if(distance < closestdist) {
            closestdist = distance;
            closestvehicle = i;
        }
    }
    return closestvehicle;
}

GetClosestVehicle2(playerid) { // closest vehicle and unoccupied
    new Float: Distance;
    if(!Distance) Distance = 200.0;
    new Float:X[2], Float:Y[2], Float:Z[2], Float:NearestPos = floatabs(Distance), NearestVehicle = INVALID_VEHICLE_ID;
    GetPlayerPos(playerid, X[0], Y[0], Z[0]);
    foreach(new i : Vehicle) {
        if(!IsVehicleStreamedIn(i, playerid) || IsPlayerInVehicle(playerid, i)) continue;
        GetVehiclePos(i, X[1], Y[1], Z[1]);
        if(NearestPos > GetDistanceBetweenPoints(X[0], Y[0], Z[0], X[1], Y[1], Z[1])) NearestPos = GetDistanceBetweenPoints(X[0], Y[0], Z[0], X[1], Y[1], Z[1]), NearestVehicle = i;
    }
    return NearestVehicle;
}
DecimalNumber(playerid) {
    new str[30];
    new money=PlayerInfo[playerid][pPhone];
    if(money >= 0) {
        format(str, sizeof(str), "%d", money);
        if(1000000 <= money < 10000000) strins(str, "-", 3, sizeof(str));
    }
    return str;
}
serverColors(id) {
    new string[180];
    switch(id) {
        case 0: string = "FFFFFF";
        case 1: string = "0BA10B"; 
        case 2: string = "D1FF99";
        case 3: string = "FF3D98";
        case 4: string = "F9FF3D";
        case 5: string = "FFEF85";          
        case 6: string = "3DE5FF";          
        case 7: string = "FFAB3D";          
        case 8: string = "A13DFF";          
        case 9: string = "FFC27D";          
        case 10: string = "FFA3A3";         
        case 11: string = "C5A3FF";                             
    }
    return string;
}
DeleteAllRb(playerid)
{
    new string[140];
    new count = 0;
    for(new i = 0; i < sizeof(RbInfo); i++) if(RbInfo[i][rbCreated] == 1)
        RbInfo[i][rbCreated] = 0, RbInfo[i][sX] = 0.0, RbInfo[i][sY] = 0.0, RbInfo[i][sZ] = 0.0, DestroyObject(RbInfo[i][sObject]), count++;
    if(count > 0) {
        format(string, 140, "HQ: %s da xoa tat ca road block objects.", GetName(playerid));
        SendTeamMessage(3, COLOR_DEPART2, string);
        SendTeamMessage(2, COLOR_DEPART2, string);
        SendTeamMessage(1, COLOR_DEPART2, string);
        SendTeamMessage(15, COLOR_DEPART2, string);
    } 
    return 0;
}
CreateRb(playerid,model,Float:xrb,Float:yrb,Float:zrb,Float:Angle)
{
    new string[140];
    for(new i = 0; i < sizeof(RbInfo); i++) if(RbInfo[i][rbCreated] == 0)
    {
        RbInfo[i][rbCreated] = 1, RbInfo[i][sX] = xrb, RbInfo[i][sY] = yrb, RbInfo[i][sZ] = zrb-0.7;
        RbInfo[i][sObject] = CreateObject(model, xrb, yrb, zrb-0.9, 0, 0, Angle-90);
        format(string, 140, "HQ: %s da tao mot Road Block Object, model: %d.", GetName(playerid), model),
        SendTeamMessage(3, COLOR_DEPART2, string);
        SendTeamMessage(2, COLOR_DEPART2, string);
        SendTeamMessage(1, COLOR_DEPART2, string);
        SendTeamMessage(15, COLOR_DEPART2, string);
        return 1;
    }
    return 0;
}
DeleteClosestRb(playerid)
{
    new string[140];
    for(new i = 0; i < sizeof(RbInfo); i++) if(IsPlayerInRangeOfPoint(playerid, 2.0, RbInfo[i][sX], RbInfo[i][sY], RbInfo[i][sZ]) && RbInfo[i][rbCreated] == 1)
    {
        RbInfo[i][rbCreated] = 0, RbInfo[i][sX] = 0.0, RbInfo[i][sY] = 0.0, RbInfo[i][sZ] = 0.0, DestroyObject(RbInfo[i][sObject]);
        format(string, 140, "HQ: %s da xoa mot road block object.", GetName(playerid)),
        SendTeamMessage(3, COLOR_DEPART2, string);
        SendTeamMessage(2, COLOR_DEPART2, string);
        SendTeamMessage(1, COLOR_DEPART2, string);
        SendTeamMessage(15, COLOR_DEPART2, string);
        return 1;
    }
    return 0;
}
VehicleHaveDriver(car) {
    foreach(new i: Player) {
        if(IsPlayerConnected(i) && IsPlayerInVehicle(i, car)) return 1;
    }
    return 0;
}
ShowFactionMembers(playerid) {
    if(PlayerInfo[playerid][pMember] == 0) return SendClientMessage(playerid, -1, "Ban khong o trong mot co chuc");
    new szQuery[256], string[180], Memberstring[3000], days[180];
    new name[180], lastl[180], rank[180], fw[180], Titlestring[180], tmembers, onmembers;
    format(szQuery, sizeof(szQuery), "SELECT * FROM `users` WHERE `Member` = '%d' ORDER BY `users`.`Rank` DESC LIMIT 50", PlayerInfo[playerid][pMember]);
    new Cache: result = mysql_query(SQL, szQuery);
    strcat(Memberstring, "#. Ten\tRank - FW\tStatus\tDays\n");
    for(new i, j = cache_num_rows (); i != j; ++i)
    {
        cache_get_value_name(i, "name", name); 
        cache_get_value_name(i, "lastOn", lastl);
        cache_get_value_name(i, "Rank", rank); 
        cache_get_value_name(i, "FWarn", fw);
        cache_get_value_name(i, "Days", days);  
        
        format(Selected[playerid][tmembers], MAX_PLAYER_NAME, name);
        new userID = GetPlayerID(name); 
        
        if(userID != INVALID_PLAYER_ID) {
            onmembers++;
            format(string, sizeof(string), "%d. %s (%d)\t%d - %s/3\tOnline\t%s\n", tmembers+1, name, userID, PlayerInfo[userID][pRank], fw, days);
            strcat(Memberstring, string, sizeof(Memberstring));
        }
        else {
            format(string, sizeof(string), "%d. %s\t%s - %s/3\t%s\t%s\n", tmembers+1, name, rank, fw, lastl, days);
            strcat(Memberstring, string, sizeof(Memberstring));
        }
        tmembers++;
    }
    cache_delete(result);
    format(Titlestring, sizeof(Titlestring), "Members (%d/%d)", onmembers, tmembers);
    Dialog_Show(playerid, DIALOG_MEMBERS, DIALOG_STYLE_TABLIST_HEADERS, Titlestring, Memberstring, "Ok", "Exit");
    return 1;
}
LaCineEsteIntrebarea(playerid) {
    new szName[50];
    format(szName, sizeof(szName), "Server");
    foreach(new i: Player) {
        if(HaveHelp[i] == playerid) {
            format(szName, sizeof(szName), GetName(i));
            return szName;
        }
    }
    return szName;
}
GetAdminRank(playerid) {
    new string[25];
    switch(PlayerInfo[playerid][pAdmin]) {
        case 1: string = "Trial Admin";
        case 2: string = "Junior Admin";
        case 3: string = "Moderator";
        case 4: string = "Global Moderator";
        case 5: string = "Coordonator";
        case 6: string = "Boss";
        case 7: string = "Scripter";
    }
    return string;
}

GetCity(playerid) {
    new string[9];
    if(IsPlayerInArea(playerid, -2997.40, -1115.50, -1213.90, 1659.60)) string ="SF";
    else if(IsPlayerInArea(playerid, 44.60, -2892.90, 2997.00, -768.00)) string ="LS";
    else if(IsPlayerInArea(playerid, 869.40, 596.30, 2997.00, 2993.80)) string ="LV";
    else string="Khong ro";
    return string;
}
GetCity1(Float:X,Float:Y) {
    if (X > -3000 && X < -444 && Y > -2984 && Y < 1592) return 1; //sf
    else if ((X > -440 && X < 3000 && Y > 456 && Y < 3000) || (X >  -2964 && X < -424 && Y > 1580 && Y < 3000)) return 2; //lv
    else if (X > -440 && X < 3000 && Y >  -2836 && Y < 456) return 3;//ls
    return 0;
}
GetLeader(faction) {
    new lead[60], query[60];
    format(lead, MAX_PLAYER_NAME, "Khong ai");
    format(query, sizeof(query), "SELECT * FROM `users` WHERE `Leader` = '%d' LIMIT 1", faction);
    new Cache: masta = mysql_query(SQL, query);
    if(cache_num_rows() > 0) {
        cache_get_value_name(0, "name", lead);
        new userID = GetPlayerID(lead);
        if(userID != INVALID_PLAYER_ID) format(lead, 60, "%s (%d)", lead, userID);
    }
    cache_delete(masta);
    return lead;
}
GetFactionStatus(fid) {
    new szStatus[32];
    if(DynamicFactions[fid][fApp] == 1) format(szStatus, 22, "{FF0000}Khong{FFFFFF}");
    else format(szStatus, 32, "{2FC914}Dang tuyen dung{FFFFFF}");
    return szStatus;
}

FailRob(playerid, reason[]) {
    if(CP[playerid] != 0) DisablePlayerCheckpointEx(playerid), CP[playerid] = 0;
    InRob[playerid] = 0;
    HaveBag[playerid] = 0;
    BizRobbed[playerid] = 0;
    Bags[playerid] = 0;
    SafeRTime[playerid] = 0;
    RemovePlayerAttachedObject(playerid,0);
    RemovePlayerAttachedObject(playerid,1); 
    BagTime[playerid] = 0;
    new string[180];
    format(string, sizeof(string), "Rob that bai! Li do: %s.", reason);
    SendClientMessage(playerid, COLOR_YELLOW, string);
    return 1;
}
saveCar(idd) {
    if(idd == 0) return 1;
    new query[512];
    mysql_format(SQL, query, sizeof(query), 
        "UPDATE cars SET Model='%d', Locationx='%f', Locationy='%f', Locationz='%f', Angle='%f', ColorOne='%d', ColorTwo='%d', Owner='%s', Value='%d', License='%s', Userid='%d', Special='%d' WHERE ID=%d", 
    CarInfo[idd][cModel], CarInfo[idd][cLocationx], CarInfo[idd][cLocationy], CarInfo[idd][cLocationz], CarInfo[idd][cAngle], CarInfo[idd][cColorOne], CarInfo[idd][cColorTwo], CarInfo[idd][cOwner], CarInfo[idd][cValue],
    CarInfo[idd][cLicense], CarInfo[idd][Userid], CarInfo[idd][cSpecial], idd);
    mysql_tquery(SQL, query, "", "");
    return 1;
}
TTCFunction(playerid) {
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
        if(strlen(PlayerInfo[playerid][pPin]) != 0 && PlayerInfo[playerid][pPinLogged] == 0) {
             SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay vi ban chua dang nhap PIN.");
             SendClientMessage(playerid, COLOR_GREY, "De xac thuc, su dung '/loginpin'!");
             return 1;
        }       
        new m = GetVehicleModel(GetPlayerVehicleID(playerid));
        if(m == 525) {
            if(GetPlayerState(playerid)==2) {
                new idd, vid;
                vid = GetClosestVehicle2(playerid);
                idd = FindSpawnID(vid); 
                
                if(vid == 0) return 1;
                if(IsABike2(vid) || IsAPlane(vid) || GetVehicleModel(vid) == 448 || GetVehicleModel(vid) == 461 || GetVehicleModel(vid) == 462 || GetVehicleModel(vid) == 463 || GetVehicleModel(vid) == 468 || GetVehicleModel(vid) == 471 || GetVehicleModel(vid) == 521 || GetVehicleModel(vid) == 522 || GetVehicleModel(vid) == 523)
                    return SendClientMessage(playerid,-1, "ban khong the keo chiec xe nay!");
                    
                if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid))) {
                    DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
                    DisablePlayerCheckpointEx(playerid);
                    gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
                }
                else {
                    if(CP[playerid] != 0 || targetfind[playerid] != -1) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Anuleaza");
                    new Float: hp;
                    GetVehicleHealth(vid, hp);
                    if(hp >= 900) return SendClientMessage(playerid, COLOR_LGREEN, "[ERROR] Phuong tien bi keo phai co tu 900.0 HP tro len!");
                    SetPVarFloat(playerid, "VehHP", hp);
                    AttachTrailerToVehicle(vid,GetPlayerVehicleID(playerid));
                    new rand;
                    rand = random(sizeof(TowCarCk));
                    SetPlayerCheckpointEx(playerid, TowCarCk[rand][0],TowCarCk[rand][1],TowCarCk[rand][2], 6);
                    CP[playerid] = 34;
                    if(idd != 0) {
                        new string[180];
                        format(string, 256, "Ban dang keo xe cua %s.", CarInfo[idd][cOwner]);
                        SendClientMessage(playerid, -1, string);  
                    }
                }
            }
        }
    }
    return 1;
}
IsACBUGWeapon(playerid) {
    if(IsPlayerConnected(playerid) && (IsPlayerLogged[playerid] == 1)) {
        new wID = GetPlayerWeapon ( playerid ) ;
        if(wID == 24 || wID == 25 || wID == 27 || wID == 34 ) return 1 ;
    }
    return 0 ;
}

GetPlayerID(playerName[]) {
    foreach(new i: Player) {
        if(IsPlayerConnected(i) && IsPlayerLogged[i] == 1) {
            if(strcmp(PlayerInfo[i][pUsername], playerName, true) == 0) return i;
        }
    }
    return INVALID_PLAYER_ID;
}

stock strmatch(const str1[], const str2[]) {
	if((strcmp(str1, str2, true, strlen(str2)) == 0) && (strlen(str2) == strlen(str1))) { return true; }
	else { return false; }   }

GetNameEx(playerid) {
    new Name[32];
  
    GetPlayerName(playerid, Name, 32);
    return Name;
}
GetFactionMembers(fid) {
    new string[5];
    format(string, sizeof(string), "%02d", FactionMembers[fid]);
    return string;
}
SendClanMessage(clanid, text[]) {
    new string[180];
    foreach(new i: Player) {
        if(IsPlayerLogged[i] == 1 && clanid != 0) {
            if(PlayerInfo[i][pClan] == clanid && togclan[i] == 0) SendClientMessage(i, COLOR_WHITE, text);
            if(SpecClan[i] == clanid) {
                format(string, sizeof(string), "{9C91FF}* %s", text);
                SendClientMessage(i, 0x9C91FFFF, string);
            }
        }
    }
    return 1;
}
GetNeedPointsR2(rank, faction) {
    new points;
    new x = faction;
    switch(rank) {
        case 1: points = FactionInfo[x][fRank1];
        case 2: points = FactionInfo[x][fRank2];
        case 3: points = FactionInfo[x][fRank3];
        case 4: points = FactionInfo[x][fRank4];
        case 5: points = FactionInfo[x][fRank5];
        case 6: points = FactionInfo[x][fRank6];
    }
    return points;
}
GetHouseObjects(houseid) {
    new x;
    for(new i = 0; i != sizeof(FurnitureInfo); i++) {
        if(FurnitureInfo[i][fiHouse] == houseid) x++;
    }
    return x;
}
MesajLicitatie(color, const string[]) {
    foreach(new i: Player) {
        if(IsPlayerConnected(i) && toglicitatie[i] == 1) {
            SendClientMessage(i, color, string);
        }
    }
    return 1;
}
ShowPlayerFriends(playerid) {
    new szDialog[100], szDialog2[1024], szQuery[256], szTitle[180], szstring[180], x, onf;
    format(szQuery, sizeof(szQuery), "SELECT * FROM `friends` WHERE `AddBy` = '%d'", PlayerInfo[playerid][pSQLID]);
    new Cache: result = mysql_query(SQL, szQuery);
    strcat(szDialog2, "{FFB469}(+) Them ban{FFFFFF}\n");
    if(cache_num_rows())
    {
        for(new i, j = cache_num_rows (); i != j; ++i) {
            cache_get_value_name(i, "friendName", Selected[playerid][x], MAX_PLAYER_NAME);
            new userID = GetPlayerID( szstring );
            if(userID != INVALID_PLAYER_ID) {
                onf++;
                format(szDialog, sizeof(szDialog), "{1FA612}(Online){FFFFFF} %s (%d)\n", szstring, userID);
                strcat(szDialog2, szDialog);
            }
            else {
                format(szDialog, sizeof(szDialog), "{D60909}(Offline){FFFFFF} %s\n", szstring);
                strcat(szDialog2, szDialog);
            }
            x++;
        }
    }
    cache_delete(result);
    format(szTitle, sizeof(szTitle), "Friends: %d", onf);
    Dialog_Show(playerid, DIALOG_FRIENDS, DIALOG_STYLE_LIST, szTitle, szDialog2, "Select", "Back");
    return 1;
}
swap(& var1, & var2) {
    #emit lref.s.pri var1
    #emit lref.s.alt var2
    #emit sref.s.pri var2
    #emit sref.s.alt var1
}
strscramble(src[], dest[], ssize = sizeof src, dsize = sizeof dest) {
    if (dsize < ssize) {
        return false;
    }
    strcat(dest, src, dsize);
    ssize = strlen(src);
    dsize = 0;

    while (dsize != ssize) 
    {
        #if defined WHILE_DEBUG
            print("[DEBUG] Strscramble dang hoat dong.");
        #endif
    
        swap(dest[dsize], dest[dsize + random (ssize - dsize)]);
        dsize++;
    }
    return true;
}
GetWeekDay(day=0, month=0, year=0) {
    if(!day) getdate(year, month, day);
    new weekday_str[10], j, e;
    if(month <= 2) {
        month += 12;
        --year;
    }

    j = year % 100;
    e = year / 100;

    switch ((day + (month+1)*26/10 + j + j/4 + e/4 - 2*e) % 7) {
        case 0: weekday_str = "Saturday";
        case 1: weekday_str = "Sunday";
        case 2: weekday_str = "Monday";
        case 3: weekday_str = "Tuesday";
        case 4: weekday_str = "Wednesday";
        case 5: weekday_str = "Thursday";
        case 6: weekday_str = "Friday";
    }
    return weekday_str;
}
SystemName(id) {
    new string[50];
    switch(id) {
        case 0: string = "Anti Teleport Hack (da bi xoa)";
        case 1: string = "Anti Weapon Hack";
        case 2: string = "Anti Ammo Hack";
        case 3: string = "Anti Armour Hack";
        case 4: string = "Anti Checkpoint Teleport (da bi xoa)";
        case 5: string = "Anti Speed Hack";
        case 6: string = "Anti Fly Hack";
        case 7: string = "Anti Vehicle Repair";
        case 8: string = "Anti Health Hack (khong hoat dong)";    
        case 9: string = "Anti Jetpack Hack";
        case 10: string = "Dau gia";
        case 11: string = "Anti trollcar (*)";
        case 12: string = "NEX-AC (*)";
        case 13: string = "Yeu cau SAMPCAC";
        case 14: string = "Fakekill (da bi xoa)";
        case 15: string = "GodMode (da bi xoa)";
        case 16: string = "Airbreak (da bi xoa)";
        case 17: string = "CarSwing (da bi xoa)";
        case 18: string = "CarSpam (da bi xoa)";
        case 19: string = "Khoa farm 24-6h sang SAMPCAC";
        case 20: string = "War bu";
        case 21: string = "X2 Payday";
    }
    return string;
}
IsPlayerFalling(playerid) {
    new index = GetPlayerAnimationIndex(playerid);
    if(index >= 958 && index <= 979 || index == 1130 || index == 1195 || index == 1132) return 1;
    return 0;
}
GetHudColor(cid) {
    switch(cid) {
        case 0: return 0xFFFFFFFF;
        case 1: return 0xB8BFC2FF;
        case 2: return 0xFF0000FF;
        case 3: return 0x00FF2FFF;
        case 4: return 0x0E8C19FF;
        case 5: return 0x0022FFFF;
        case 6: return 0x00AAFFFF;
        case 7: return 0x00FFD0FF;
        case 8: return 0xFFFB00FF;
        case 9: return 0xFF8800FF;
        case 10: return 0xFFB957FF;
        case 11: return 0x8000FFFF;
        case 12: return 0xFF0077FF;                     
    }
    return 1;
}

GetHudColor2(cid) {
    switch(cid) {
        case 0: return 0xFFFFFF10;
        case 1: return 0xB8BFC210;
        case 2: return 0xFF000010;
        case 3: return 0x00FF2F10;
        case 4: return 0x0E8C1910;
        case 5: return 0x0022FF10;
        case 6: return 0x00AAFF10;
        case 7: return 0x00FFD010;
        case 8: return 0xFFFB0010;
        case 9: return 0xFF880010;
        case 10: return 0xFFB95710;
        case 11: return 0x8000FF10;
        case 12: return 0xFF007710;                             
    }
    return 1;
}

FailRaport(playerid, id) {
    switch(id) {
        case 0: SendClientMessage(playerid, COLOR_YELLOW, "Ban bi phat mot diem 'bao cao khong hop le' vi ban chua tat dien thoai.");
        case 1: SendClientMessage(playerid, COLOR_YELLOW, "Ban bi phat mot diem 'bao cao khong hop le' vi ban chua cai trang.");
        case 2: SendClientMessage(playerid, COLOR_YELLOW, "Ban bi phat mot diem 'bao cao khong hop le' vi khoang cach giua ban va muc tieu it hon 100m.");
    }
    PlayerInfo[playerid][pInvalidCommands] ++;
    UpdateVar(playerid, "InvalidCommands", PlayerInfo[playerid][pInvalidCommands]);
    return 1;
}
TempBanCheck(playerid) {
    new str[128];
    new year, month, day;
    getdate(year, month, day);
    if(PlayerInfo[playerid][pBTemp] == 1) {
        if(!(year >= PlayerInfo[playerid][pBYear] && month >= PlayerInfo[playerid][pBMonth] && day >= PlayerInfo[playerid][pBDay])) {
            SendClientMessage(playerid, COLOR_WARNING, "Tai khoan cua ban dang bi nhot o dao khi!");
            format(str, sizeof str, "Admin da phat ban la %s.",PlayerInfo[playerid][pBBy],PlayerInfo[playerid][pBDay], PlayerInfo[playerid][pBMonth], PlayerInfo[playerid][pBYear],PlayerInfo[playerid][pBReason]);
            SendClientMessage(playerid, COLOR_CLIENT, str);
            format(str, sizeof str, "Tai khoan se duoc mo khoa vao %d.%d.%d",PlayerInfo[playerid][pBDay], PlayerInfo[playerid][pBMonth], PlayerInfo[playerid][pBYear],PlayerInfo[playerid][pBReason]);
            SendClientMessage(playerid, COLOR_CLIENT, str);
            format(str, sizeof str, "Li do: %s",PlayerInfo[playerid][pBReason]);
            SendClientMessage(playerid, COLOR_CLIENT, str);
            SetPlayerCameraPos(playerid, 1183.0143, -965.7394, 129.6071);
            SetPlayerCameraLookAt(playerid, 1183.7214, -965.0270, 129.2470);        
            return KickEx(playerid);        
        }
        else {
            PlayerInfo[playerid][pBTemp] = 0;
            PlayerInfo[playerid][pBYear] = 0;
            PlayerInfo[playerid][pBMonth] = 0;
            PlayerInfo[playerid][pBDay] = 0;
            Update(playerid,pBTempx);
            Update(playerid,pBYearx);
            Update(playerid,pBMonthx);
            Update(playerid,pBDayx);
        }
    }
    return 1;
}

IsMonth31(month) {
    switch (month) {
        case 1: return 1;
        case 3: return 1;
        case 5: return 1;
        case 7: return 1;
        case 8: return 1;
        case 10: return 1;
        case 12: return 1;
        default: return 0;
    }
    return 0;
}

IsMonth29(year) {
    new y = 2000;
    for(new i = 4; i < 3000; i += 4) if((y+i) == year) return 1;
    return 0;
}
YoutubeStreamForPlayer(playerid, link[]) {
    PlayAudioStreamForPlayer(playerid, link);
}
timer HideMoneyTD[4500](playerid) {
    PlayerTextDrawHide(playerid, ShowMoneyPlus);
    return 1;
}
GivePlayerCash(playerid, money) {
    Cash[playerid] += money;
    new string[22];
    if(money > 0) format(string, sizeof(string), "~g~~h~+$%s", FormatNumber(money));
    else format(string, sizeof(string), "~r~~h~-$%s",FormatNumber(-money));
    PlayerTextDrawSetString(playerid, ShowMoneyPlus, string);
    PlayerTextDrawShow(playerid, ShowMoneyPlus);

    stop TDCashTimer[playerid];
    TDCashTimer[playerid] = defer HideMoneyTD(playerid);
    return 1;
}
GetPlayerCash(playerid) return Cash[playerid];
ResetPlayerCash(playerid) return Cash[playerid] = 0;

CalculeazaTimp2(secunde) {
    new time = secunde;
    time = time%3600;
    new minute = time/60;
    time = time%60;
    new secunde2 = time;
    new string[10];
    format(string, sizeof(string), "%02d:%02d",minute,secunde2);
    return string;
}

PlayAudioStreamForPlayersInCar(vehicleid,url[]) {
    foreach(new i: Player) {
        if(IsPlayerInAnyVehicle(i)) {
            if(GetPlayerVehicleID(i) == vehicleid) PlayAudioStreamForPlayer(i,url);
        }
    }
    return 1;
}

StopAudioStreamForPlayersInCar(vehicleid) {
    foreach(new i: Player) {
        if(IsPlayerInAnyVehicle(i)) {
            if(GetPlayerVehicleID(i) == vehicleid) StopAudioStreamForPlayer(i);
        }
    }
    return 1;
}
FormatNumber(number) {

   new Str[15];
   format(Str, 15, "%d", number);
   if(strlen(Str) < sizeof(Str)) {
      if(number >= 1000 && number < 10000) strins( Str, ".", 1, sizeof(Str));
      else if(number >= 10000 && number < 100000) strins(Str, ".", 2, sizeof(Str));
      else if(number >= 100000 && number < 1000000) strins(Str, ".", 3, sizeof(Str));
      else if(number >= 1000000 && number < 10000000) strins(Str, ".", 1, sizeof(Str)),strins(Str, ".", 5, sizeof(Str));
      else if(number >= 10000000 && number < 100000000) strins(Str, ".", 2, sizeof(Str)),strins(Str, ".", 6, sizeof(Str));
      else if(number >= 100000000 && number < 1000000000) strins(Str, ".", 3, sizeof(Str)),strins(Str, ".", 7, sizeof(Str));
      else if(number >= 1000000000)
           strins(Str, ".", 1, sizeof(Str)),
           strins(Str, ".", 5, sizeof(Str)),
           strins(Str, ".", 9, sizeof(Str));
      else format(Str, 10, "%d", number);
   }
   return Str;
}
IsMail(email[]) {
    new len=strlen(email), cstate=0, i;
    for(i=0;i<len;i++) {
        if((cstate==0 || cstate==1) && (email[i]>='A' && email[i]<='Z')||(email[i]>='0' && email[i]<='9') || (email[i]>='a' && email[i]<='z')  || (email[i]=='.')  || (email[i]=='-')  || (email[i]=='_')) { }
        else {
           if((cstate==0) &&(email[i]=='@')) cstate=1;
           else return false;
        }
    }
    if(cstate<1) return false;
    if(len<6) return false;
    if((email[len-3]=='.') || (email[len-4]=='.') || (email[len-5]=='.')) return true;
    return false;
}
CheckObjects(playerid) {
    new x;
    for(new i = 0; i < 100; i++) {
        if(PlayerInfo[playerid][pSpecialQuest][i]) x ++;
    }
    return x;
}
CountIP(ip[]) {
    new c = 0;
    foreach(new i: Player) if(!strcmp(GetIP(i),ip)) c++;
    return c;
}

hook ResetVariables(playerid) {
    deathLabel[playerid] = Create3DTextLabel("", -1, 0.0, 0.0, 0.0, 10.0, 0, 0);
    // UseNewestClient{playerid} = 0;
    // AcWarning{playerid} = 0; 
    // UsingSampcac{playerid} = 0;
    
    // DMV System
    DrivingTest[playerid] = 0, 
    PlayerInfo[playerid][c_DmvLastStage] = 1;
    SelectTD[playerid] = 0;
    LamViecChung[playerid] = 0;
    DaThueThuyen[playerid] = 0;
    QuestDeelay[playerid] = 0;
    TradeID[playerid] = -1;    
    InsideTradeToys[playerid] = 0;
    // PlayerInfo[playerid][pSelection] = -1;
    for(new i = 0; i < 5; i++)
    {
        PlayerInfo[playerid][Seeds][i] = 0;
        PlayerInfo[playerid][Weed][i] = 0;
    }
    ResetToyVariables(playerid);
    if(IsValidDynamicObject(GetPVarInt(playerid, "BoomboxObject"))) DestroyDynamicObject(GetPVarInt(playerid, "BoomboxObject"));    
    if(Iter_Contains(PlayerAdmins, playerid)) Iter_Remove(PlayerAdmins, playerid);
    if(Iter_Contains(AdminDuty, playerid)) Iter_Remove(AdminDuty, playerid);
    if(Iter_Contains(PlayerHelpers, playerid)) Iter_Remove(PlayerHelpers, playerid);
    if(Iter_Contains(PlayerYoutuber, playerid)) Iter_Remove(PlayerYoutuber, playerid);
    if(Iter_Contains(PlayerWanted, playerid)) Iter_Remove(PlayerWanted, playerid);
    if(Iter_Contains(HelpersDuty, playerid)) Iter_Remove(HelpersDuty, playerid);
    if(Iter_Contains(PlayerHelped, playerid)) Iter_Remove(PlayerHelped, playerid); 
    if(Iter_Contains(PlayerGangster, playerid)) Iter_Remove(PlayerGangster, playerid); 
    if(Iter_Contains(PlayerInRace, playerid)) Iter_Remove(PlayerInRace, playerid); 
    if(Iter_Contains(InTaixiu, playerid)) Iter_Remove(InTaixiu, playerid); 
    if(Iter_Contains(ChonTai, playerid)) Iter_Remove(ChonTai, playerid);
    if(Iter_Contains(ChonXiu, playerid)) Iter_Remove(ChonXiu, playerid);
    if(Iter_Contains(SelectA, playerid)) Iter_Remove(SelectA, playerid); 
    if(Iter_Contains(SelectB, playerid)) Iter_Remove(SelectB, playerid); 
    if(Iter_Contains(SelectC, playerid)) Iter_Remove(SelectC, playerid); 
    #if defined _nex_ac_included
        stop SetSpawnTimer[playerid];
        SetSpawnTimer[playerid] = Timer:0;
    #endif
    stop TimerRainCar[playerid];
    stop TimeOut[playerid];
    // stop logina[playerid];
    stop drug[playerid];
    stop FishTimer[playerid];
    stop DiceTimer[playerid];
    stop DMGTimer[playerid]; 
    
    TimerRainCar[playerid] = Timer:0;
    TimeOut[playerid] = Timer:0;
    // logina[playerid] = Timer:0;
    drug[playerid] = Timer:0;
    FishTimer[playerid] = Timer:0;
    DiceTimer[playerid] = Timer:0;
    
    DestroyWoodObject(playerid);
    for(new i; i < 5; i++)
    {
        RocketExplosions[playerid][i] = 0;
    }
    // ids[playerid] = 0;
    TimpMateriale[playerid] = 0;
    //pFishess[playerid] = 0;
    InvitedClan[playerid] = 0;
    //FishPrice[playerid] = 0;
    JobCP[playerid] = 0;
    // RollTimer[playerid] = 0;
    ResetBlockList(playerid);
    BagTime[playerid] = 0;
    SetPVarInt(playerid, "RollPrize", -1);
    SetPVarInt(playerid, "OfferedClan", -1);
    SetPVarInt(playerid, "OfferBy", -1);    
    SetPVarInt(playerid, "Lesson", -1);
    SetPVarInt(playerid, "InLesson", -1);
    // ChosenSkin[playerid] = 0;
    PlayerInfo[playerid][pEscapeTime] = 0;
    PlayerInfo[playerid][pEscapeCar] = 0;
    PlayerInfo[playerid][pEscape] = 0;
    PlayerInfo[playerid][pEscapeExit] = 0;

    TradeTime[playerid] = 0;               ThuySan[playerid] = 0;
    Times[playerid] = 0;
    PlayerInfo[playerid][pClan] = 0;
    EnableBoast[playerid] = 
    JobWorking[playerid] = 
    JobLeftTime[playerid] = 0;
    InDealer[playerid] = 0;                 SpamTimes[playerid] = 0;
    Exception{playerid} = 0;
    //playerFire[playerid] = 0;
    NearWanted[playerid] = 0;
    WarKills[playerid] = 0;                 WarDeaths[playerid] = 0;        
    TaxiDuty[playerid] = 0;
    AcceptedReport[playerid] = -1;          requestingevent[playerid] = 0;
    Escape[playerid] = 0;                   Escape2[playerid] = 0;
    EscapeProces[playerid] = 0;             SondajVote[playerid] = 0;
    TeleportDest[playerid][0] = 0;          InTraining[playerid] = 0;
    Combo[playerid] = 0;                    PlayerInfo[playerid][pLevel] = 0;
                       
    Question[playerid] = 0;                 SFID[playerid] = 0;
    Showed[playerid] = 0;                   FreezeTime[playerid] = 0;   
    LastCP[playerid] = 0;                   CheatWarnings[playerid] = 0;
    TaxiService[playerid] = 0;              togevent[playerid] = 0;
    togding[playerid] = 0;                  MedicCall[playerid] = -1;
    MechanicCall[playerid] = -1;            InstructorCall[playerid] = -1;
    MDCOn[playerid] = -1;                   Voted2[playerid] = 0;
    RaceBet[playerid] = 0;
    SelCar[playerid] = 0;                   RaceColor[playerid][0] = 1;
    RaceColor[playerid][1] = 1;             AcceptedService[playerid] = -1;
    PlayerInfo[playerid][pSleeping] = 0;    SpecClan[playerid] = 0;
    StartFish[playerid] = 0;                eventorganizer[playerid] = 0;
    InstructorCall[playerid] = 0;           License[playerid] = 0;
    LicenseOffer[playerid] = -1;            togclan[playerid] = 0;
    BurgerOffer[playerid] = -1;             BurgerMoney[playerid] = 0;
    SpecFaction[playerid] = 0;              WarSeconds[playerid] = 0;
    Helped[playerid] = 0;                   OnHelper[playerid] = 0;
    TradePlayer[playerid] = -1;             Helmet[playerid] = 0;               
    ShowWanted[playerid] = -1;              PlayerInfo[playerid][pPinLogged] = 0;
    stop ReportTimer[playerid];             
    SetPVarInt(playerid,"KilledFlood",0);
    PlayerInfo[playerid][pMember] = 0;      PlayerInfo[playerid][pLeader] = 0;
    DiceID[playerid] = -1;                  AdTimer[playerid] = Timer:0;
    PlayerInfo[playerid][pAdmin] = 0;       PlayerInfo[playerid][pHelper] = 0;
    Reply[playerid] = -1;                   VehicleKey[playerid] = 0;
    Helped[playerid] = 0;                   Freezed[playerid]=0;
    LicenseDays[playerid] = -1; 
    PlayerInfo[playerid][pDailyMission][0] = -1;
    PlayerInfo[playerid][pDailyMission][1] = -1;
    PlayerInfo[playerid][pDailyMission][2] = -1;
    PlayerInfo[playerid][pWantedLevel] = 0;
    gPlayerUsingLoopingAnim[playerid] = 0;
    InitFly(playerid);  

    AFKSeconds[playerid] = 0;               Contract[playerid] = 0;
    HeadValue[playerid] = 0;                UsedContract[playerid] = 0;
    PlayerHit[playerid] = -1;               
    AcceptedBy[playerid] = 0;               gDice[playerid] = 0;
    DiceInvited[playerid] = -1;             InDice[playerid] = 0;
    PlayWith[playerid] = -1;                SafeRTime[playerid] = 0;
    InRob[playerid] = 0;                    toglicitatie[playerid] = 0;
    Invited[playerid] = -1;                 PlayerInfo[playerid][pShowHud] = 0;
    TotalMoney[playerid] = 0;               Team[playerid] = 0;
    Ajutor[playerid] = 0;                   PaintType[playerid] = 0;
    IsPlayerSpec[playerid] = 0;             SpecPlayers[playerid] = 0;
    DutyAFK[playerid] = 0;    
    // SecondsQuestion[playerid] = 0;
    HaveHelp[playerid] = -1;                HelperDuty[playerid] = 0;
    NewbieChat[playerid] = 0;               Helped[playerid]=0;
    HelpMuted[playerid] = 0;                LastRecon[playerid] = 0;
    IsPlayerLogged[playerid] = 0;           WantedTime[playerid] = 0;
    LastCar[playerid] = 0;                  InEvent[playerid] = 0;
    InShop[playerid] = 0;
    ClanDuty[playerid] = 0;                 StartedSpray[playerid] = 0; 
    StartedSpray2[playerid] = 0;            pDrunkLevelLast[playerid] = 0;
    FPS2[playerid] = 0;                     
    // TruckerStep[playerid] = 0;               
    AntiFlood_InitPlayer(playerid);
    XDeaths[playerid] = 0;                  LastDeath[playerid] = 0;
    
    // SelectChar[playerid] = 0;                SelectCharPlace[playerid] = 0;          
    // SelectCharID[playerid] = 0;              ChosenSkin[playerid] = 0;   
    HidePM[playerid] = 0;                   PhoneOnline[playerid] = 0;              
    
    UsingDrugs[playerid] = 0;
    UsedFind[playerid] = 0;                 CP[playerid] = 0;
    SpawnChange[playerid] = 1;              DrugType[playerid] = 0;        
    RepairOffer[playerid] = 999;            RepairPrice[playerid] = 0;
    RepairCar[playerid] = 0;                TalkingLive[playerid] = 255;
    LiveOffer[playerid] = 999;              TakingLesson[playerid] = 0;
    RefillOffer[playerid] = 999;            RefillPrice[playerid] = 0;
    DrugOffer[playerid] = 999;              PlayerCuffed[playerid] = 0;
    PlayerCuffedTime[playerid] = 0;         DrugPrice[playerid] = 0;
    RegistrationStep[playerid] = 0;         PlayerCuffed2[playerid] = 0;
    DrugGram[playerid] = 0;                 HouseOffer[playerid] = 999;
    HouseID[playerid] = 0;                  HousePrice[playerid] = 0;
    JailPrice[playerid] = 0;                MedicTime[playerid] = 0;
    NeedMedicTime[playerid] = 0;            
    // PlacedNews[playerid] = 0;
    GoChase[playerid] = 999;                GetChased[playerid] = 999;
    OnDuty[playerid] = 0;                   ConnectedToPC[playerid] = 0;
    OrderReady[playerid] = 0;               IsPlayerLogged[playerid] = 0;
    GotHit[playerid] = 0;                   MedicCall[playerid] = -1;
    SafeTime[playerid] = 60;                gOoc[playerid] = 0;
    PlayerTied[playerid] = 0;               TaxiCallTime[playerid] = 0;
    TaxiCall[playerid] = -1;                MedicCallTime[playerid] = 0;
    MechanicCallTime[playerid] = 0;         NoFuel[playerid] = 0;
    Mobile[playerid] = 255;                 MechanicCall[playerid] = -1;
    Spectate[playerid] = 255;               PlayerDrunk[playerid] = 0;
    PlayerDrunkTime[playerid] = 0;          Unspec[playerid][sLocal] = 255;
    gLastCar[playerid] = 0;                 FirstSpawn[playerid] = 0;
    gNews[playerid] = 0;                    BigEar[playerid] = 0;
    gDice[playerid] = 0;                    gFam[playerid] = 0; 
    gPlayerLogTries[playerid] = 0;          PlayerAccount[playerid] = 0;    
    gPlayerSpawned[playerid] = 0;           FreeOffer[playerid] = -1;
    FreePrice[playerid] = 0;                PlayerTazeTime[playerid] = 0;
    PlayerStoned[playerid] = 0;             AcceptOffer[playerid] = -1;
    AcceptPrice[playerid] = 0;              TicketOffer[playerid] = 999;
    TicketMoney[playerid] = 0;              
    TaxiAccepted[playerid] = 999;
    TurfsDisp[playerid] = 0;                PlayerInfo[playerid][pCash] = dollah;
    HireCar[playerid] = -1;                 gPlayerAnimLibsPreloaded[playerid] = 0;
    TransferOffer[playerid] = 999;          ConsumingMoney[playerid] = 0;
    TransferMoney[playerid] = 0;            IsSmoking[playerid] = 0;
    InHouse[playerid] = -1;                 InBussines[playerid] = -1;
    targetfind[playerid] = -1;              MatsHolding[playerid] = 0;
    MatsOffer[playerid] = -1;               MatsPrice[playerid] = 0;
    MatsAmmo[playerid] = 0;                 SellgunOffer[playerid] = -1;
    SellgunPrice[playerid] = 0;             SellgunMats[playerid] = 0;
    SellgunAmmo[playerid] = 0;              SellgunID[playerid] = 0;
    togfind[playerid] = 0;                  SwitchKey[playerid] = 2;
    bizid[playerid] = 0;                    bizprice[playerid] = 0;
    bizoffer[playerid] = 999;               biztype[playerid] = 0;
    playerDeath[playerid] = 0;              InHQ[playerid] = -1;
    tazer[playerid] = 0;                    togip[playerid] = 0;
    Speedlimit[playerid] = 0;               Dicem[playerid] = 999; 
    WTChannel[playerid] = 0;                Refueling[playerid] = 0;
    radio[playerid] = 0;                                
    radiop[playerid] = 0;                   balem[playerid] = 0;                        
    toglc[playerid] = 0;                    taxim[playerid] = 0;
    Wartimeon[playerid] = 1;                DeathP[playerid] = 0;
    towcarm[playerid] = 0;                  shotTime[playerid] = 0;
    shot[playerid] = 0;                     tuningenter[playerid] = 0;
    KillP[playerid] = 0;                    playevent[playerid] = 0;
    
    WeaponData[playerid][0] = false;            WeaponData[playerid][1] = false;
    WeaponData[playerid][2] = false;            WeaponData[playerid][3] = false;
    WeaponData[playerid][4] = false;            WeaponData[playerid][5] = false;
    WeaponData[playerid][6] = false;            WeaponData[playerid][7] = false;
    WeaponData[playerid][8] = false;            WeaponData[playerid][9] = false;
    WeaponData[playerid][10] = false;           WeaponData[playerid][11] = false;
    WeaponData[playerid][12] = false;   
    
    for(new i = 0; i < 8; i++) DeelayCommand[playerid][i] = 0;
    return 1;
}
GetName(playerid) {
    new iName[40];
    if(playerid == INVALID_PLAYER_ID) format(iName, sizeof(iName), "Unknown");
    else format(iName, sizeof(iName), PlayerInfo[playerid][pUsername]);
    if(GetPVarInt(playerid, "Cover") == 1) format(iName, sizeof(iName), GetNameEx(playerid));
    return iName;
}
MapName(paint) {
    new string[30];
    switch(PaintMap[paint]) {
        case 0: string = "rc_arena";
        case 1: string = "farm";
        case 2: string = "island";
        case 3: string = "desert";
        case 4: string = "beach";
        case 5: string = "forest";      
    }
    return string;
}
MapName2(paint) {
    new string[30];
    switch(paint) {
        case 0: string = "rc_arena";
        case 1: string = "farm";
        case 2: string = "island";
        case 3: string = "desert";
        case 4: string = "beach";
        case 5: string = "forest";
    }
    return string;
}
SetPlayerPosEx(playerid, Float:x, Float:y, Float:z) {
    Exception{playerid} += 2;
    SetPlayerPos(playerid, x, y, z);
    GetPlayerPos(playerid, LastPos[playerid][0], LastPos[playerid][1], LastPos[playerid][2]);
    foreach(new i: PlayerHelpers) {
        if(Spectate[i] == playerid) {
            TogglePlayerSpectating(i, true);
            SetPlayerInterior(i, GetPlayerInterior(playerid));
            SetPlayerVirtualWorld(i, GetPlayerVirtualWorld(playerid));
            if(IsPlayerInAnyVehicle(playerid)) PlayerSpectateVehicle(i, GetPlayerVehicleID(playerid));
            else PlayerSpectatePlayer(i, playerid); 
        }
    }
    foreach(new i: PlayerAdmins) {
        if(Spectate[i] == playerid) {
            TogglePlayerSpectating(i, true);
            SetPlayerInterior(i, GetPlayerInterior(playerid));
            SetPlayerVirtualWorld(i, GetPlayerVirtualWorld(playerid));
            if(IsPlayerInAnyVehicle(playerid)) PlayerSpectateVehicle(i, GetPlayerVehicleID(playerid));
            else PlayerSpectatePlayer(i, playerid); 
        }
    }    
    if(GetPVarInt(playerid, "Undercover") == 1) {
        foreach(new i: Player) ShowPlayerNameTagForPlayer(i, playerid, false);
        TextDrawShowForPlayer(playerid, UndercoverTD);
    }   
    return 1;
}

CreateVehicleEx(modelid, Float:x, Float:y, Float:z, Float:angle, color1, color2, respawn_delay, addsiren = 0) {
    new vehid = CreateVehicle(modelid, x, y, z, angle, color1, color2, respawn_delay, addsiren);
    VehicleStats[vehid][vColorOne] = color1;
    VehicleStats[vehid][vColorTwo] = color2;
    SetVehicleHealth(vehid, 999);
    VehicleExist[vehid] = 1;
    return vehid;
}

// DestroyVehicleEx(vehid) {
//     VehicleStats[vehid][vColorOne] = 0;
//     VehicleStats[vehid][vColorTwo] = 0;
//     SetVehicleHealth(vehid, 999);
//     VehicleExist[vehid] = 0;
//     return 1;
// }

ChangeVehicleColorEx(vehicleid, color1, color2) {
    VehicleStats[vehicleid][vColorOne] = color1;
    VehicleStats[vehicleid][vColorTwo] = color2;    
    ChangeVehicleColor(vehicleid, color1, color2);
    return 1;
}

SetVehicleColor(vehicleid) {
    ChangeVehicleColor(vehicleid, VehicleStats[vehicleid][vColorOne], VehicleStats[vehicleid][vColorTwo]);
    return 1;
}

SetVehiclePosEx(playerid, vehicleid, Float:x, Float:y, Float:z) {
    if(GetPlayerVehicleID(playerid) == vehicleid) GetPlayerPos(playerid, LastPos[playerid][0], LastPos[playerid][1], LastPos[playerid][2]);
    SetVehiclePos(vehicleid, x, y, z);
    return 1;
}

SetVehicleZAngleEx(vehicleid, Float:z_angle) {
    SetVehicleZAngle(vehicleid, z_angle);
    return 1;
}
ResetWeapons(playerid) {
    ResetPlayerWeapons(playerid);
    for(new i = 0; i < 47; i++) {
        Weapons[playerid][i] = 0;
        WeaponAmmo[playerid][i] = 0;
    }
    return 1;
}

stock playerTextDrawSetString(playerid, PlayerText:textdrawid, const string[], va_args<>) {
    new UsageString[250]; UsageString[0] = (EOS); va_format(UsageString, sizeof UsageString, string, va_start<3>);
    PlayerTextDrawSetString(playerid, textdrawid, UsageString);
    return 1; 
}
    
GetWeaponSlot(weaponid) {
    new slot;
    switch(weaponid) {
        case 0,1: slot = 0;
        case 2 .. 9: slot = 1;
        case 10 .. 15: slot = 10;
        case 16 .. 18, 39: slot = 8;
        case 22 .. 24: slot =2;
        case 25 .. 27: slot = 3;
        case 28, 29, 32: slot = 4;
        case 30, 31: slot = 5;
        case 33, 34: slot = 6;
        case 35 .. 38: slot = 7;
        case 40: slot = 12;
        case 41 .. 43: slot = 9;
        case 44 .. 46: slot = 11;
    }
    return slot;
}
t_customMap()
{
    // Khu nha thang grays
    new drp0 = CreateDynamicObject(19482, 1122.369019, -2037.077026, 74.906998, 0.000000, 0.000000, 0.000000);
    SetDynamicObjectMaterial(drp0, 1, 3970, "", "");
    new drp1 = CreateDynamicObject(19482, 1122.369019, -2037.077026, 74.376999, 0.000000, 0.000000, 0.000000);
    SetDynamicObjectMaterial(drp1, 1, 3970, "", "");
    new drp2 = CreateDynamicObject(3934, 1154.222046, -2020.042969, 68.007004, 0.000000, 0.000000, 0.000000);
    SetDynamicObjectMaterial(drp2, 0, 65535, "none", "none");
    new drp3 = CreateDynamicObject(3934, 1154.222046, -2055.355957, 68.007004, 0.000000, 0.000000, 0.000000);
    SetDynamicObjectMaterial(drp3, 0, 65535, "none", "none");
    new drp4 = CreateDynamicObject(11245, 1175.061035, -2036.615967, 77.542999, 0.000000, -68.400002, 82.799004);
    SetDynamicObjectMaterial(drp4, 256, 19480, "signsurf", "sign");
    new drp5 = CreateDynamicObject(11245, 1175.077026, -2036.494995, 77.495003, 0.000000, -70.598999, 82.799004);
    SetDynamicObjectMaterial(drp5, 256, 19058, "xmasboxes", "silk5-128x128");

    // Hang rao
    CreateDynamicObject(997, 1238.673950, -2002.838989, 58.903000, 0.000000, 0.000000, 0.000000);
    CreateDynamicObject(997, 1242.630981, -2002.837036, 58.903000, 0.000000, 1.750000, 0.000000);
    CreateDynamicObject(997, 1246.663940, -2002.802979, 58.803001, 0.000000, 1.500000, 0.000000);
    CreateDynamicObject(997, 1250.644043, -2002.813965, 58.702999, 0.000000, 1.500000, 0.000000);
    CreateDynamicObject(997, 1254.512939, -2002.843994, 58.603001, 0.000000, 1.500000, 0.000000);
    CreateDynamicObject(997, 1258.489014, -2002.796021, 58.478001, 0.000000, 1.750000, 0.000000);
    CreateDynamicObject(997, 1262.751953, -2002.781982, 58.377998, 359.750214, 2.000000, 0.008698);
    CreateDynamicObject(997, 1267.178955, -2002.843018, 58.252998, 0.000000, 1.750000, 0.000000);
    CreateDynamicObject(997, 1271.719971, -2002.828979, 58.153000, 359.750092, 1.500031, 0.006561);
    CreateDynamicObject(997, 1276.218994, -2002.836060, 57.952999, 0.000000, 1.750000, 0.000000);
    CreateDynamicObject(997, 1280.583984, -2002.824951, 57.827999, 0.000000, 1.250000, 0.000000);
    CreateDynamicObject(997, 1284.067993, -2037.494995, 57.754002, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1284.072998, -2033.470947, 57.754002, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1284.046997, -2041.421021, 57.778999, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1284.078979, -2029.447021, 57.729000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1284.046021, -2045.667969, 57.778999, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1284.055054, -2025.522949, 57.729000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1284.031006, -2021.595947, 57.729000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1284.036987, -2017.633057, 57.729000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1284.009033, -2013.845947, 57.754002, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1283.987061, -2009.970947, 57.754002, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1283.958008, -2006.171021, 57.754002, 0.000000, 0.000000, 90.000000);
    //
    CreateDynamicObject(7496, -73.334961, -150.088867, 5.593000, 0.000000, 0.000000, 345.986938);
    CreateDynamicObject(7496, 7.698242, -168.947266, 3.086000, 0.000000, 0.000000, 355.989990);
    CreateDynamicObject(1281, 1764.602051, -1889.722046, 13.355000, 0.000000, 0.000000, 301.997681);
    CreateDynamicObject(1281, 1769.348022, -1889.769043, 13.361000, 0.000000, 0.000000, 302.000000);
    CreateDynamicObject(1281, 1759.727051, -1889.754028, 13.356000, 0.000000, 0.000000, 301.997681);
    CreateDynamicObject(997, 1774.264038, -1897.043945, 12.552000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1774.237061, -1892.399048, 12.552000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1774.281006, -1901.598022, 12.552000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(1256, 1762.202026, -1906.706055, 13.227000, 0.000000, 0.000000, 270.000000);
    CreateDynamicObject(2754, 1768.124512, -1906.754150, 13.500000, 0.000000, 0.000000, 270.000000);
    CreateDynamicObject(2223, 1753.741943, -1897.941040, 13.444000, 0.000000, 0.000000, 0.000000);
    CreateDynamicObject(2342, 1753.770020, -1899.168945, 13.509000, 0.000000, 0.000000, 40.500000);
    CreateDynamicObject(997, 1774.219971, -1887.756958, 12.552000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(3863, 1753.050049, -1898.623047, 13.730000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1774.270996, -1906.175049, 12.552000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1774.279053, -1910.904053, 12.552000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1774.270020, -1915.458008, 12.552000, 0.000000, 0.000000, 90.000000);
    new drp46 = CreateDynamicObject(3063, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000);
    SetDynamicObjectMaterial(drp46, 769, 1636, "", "");
    CreateDynamicObject(1257, 1772.273438, -1918.659180, 13.831000, 0.000000, 0.000000, 179.994507);
    CreateDynamicObject(997, 1774.255981, -1924.984009, 12.552000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1774.276001, -1929.485962, 12.552000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1774.270996, -1934.038940, 12.552000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1770.350952, -1934.936035, 12.552000, 0.000000, 0.000000, 0.000000);
    CreateDynamicObject(997, 1808.209961, -1880.258057, 12.434000, 0.000000, 0.000000, 0.000000);
    CreateDynamicObject(966, 1811.649048, -1894.215942, 12.414000, 0.000000, 0.000000, 270.000000);
    CreateDynamicObject(997, 1811.661011, -1898.660034, 12.434000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1811.656006, -1887.092041, 12.434000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(997, 1811.659058, -1883.436035, 12.434000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(1260, 1833.063965, -1883.931030, 21.461000, 0.000000, 0.000000, 340.000000);
    CreateDynamicObject(970, 1700.546997, -1869.979980, 13.100000, 0.000000, 0.000000, 90.000000);
    new drp47 = CreateDynamicObject(4729, 1833.381958, -1883.532959, 27.457001, 0.000000, 0.000000, 179.747314);
    SetDynamicObjectMaterial(drp47, 1, 1410, "", "");
    new drp48 = CreateDynamicObject(4729, 1833.521973, -1883.587036, 27.457001, 0.000000, 0.000000, 179.747925);
    SetDynamicObjectMaterial(drp48, 0, 8395, "pyramid", "white");
    CreateDynamicObject(970, 1700.541992, -1865.848022, 13.100000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(970, 1700.520020, -1859.961060, 13.100000, 0.000000, 0.000000, 90.000000);
    CreateDynamicObject(18659, 1683.780029, -1997.079956, 15.123000, 0.000000, 0.000000, 174.699997);
    CreateDynamicObject(970, 1940.925049, -1777.016968, 13.092000, 0.000000, 0.000000, 270.000000);
    CreateDynamicObject(970, 1942.359009, -1777.036011, 13.092000, 0.000000, 0.000000, 270.000000);
    CreateDynamicObject(970, 1940.925049, -1772.864014, 13.092000, 0.000000, 0.000000, 270.000000);
    CreateDynamicObject(970, 1942.357056, -1772.859985, 13.092000, 0.000000, 0.000000, 270.000000);
    CreateDynamicObject(970, 1940.921021, -1768.688965, 13.092000, 0.000000, 0.000000, 270.000000);
    CreateDynamicObject(970, 1942.354980, -1768.707031, 13.092000, 0.000000, 0.000000, 270.000000);
    new drp49 = CreateDynamicObject(19483, 1950.396973, -1771.707031, 14.886000, 0.000000, 0.000000, 90.299004);
    SetDynamicObjectMaterial(drp49, 1, 1410, "", "");
    new drp50 = CreateDynamicObject(19483, 1950.987061, -1771.973022, 14.836000, 0.000000, 0.000000, 90.299004);
    SetDynamicObjectMaterial(drp50, 0, 18646, "matcolours", "orange");
    new drp51 = CreateDynamicObject(19483, 1950.985962, -1771.743042, 14.836000, 0.000000, 0.000000, 90.299004);
    SetDynamicObjectMaterial(drp51, 0, 18646, "matcolours", "orange");
    new drp52 = CreateDynamicObject(19483, 1951.287964, -1771.983032, 14.886000, -0.000000, -0.000000, -89.598999);
    SetDynamicObjectMaterial(drp52, 1, 1410, "", "");
    new drp53 = CreateDynamicObject(19483, 1951.537964, -1771.989990, 14.466000, -0.000000, -0.000000, -89.698997);
    SetDynamicObjectMaterial(drp53, 1, 1410, "", "");
    new drp54 = CreateDynamicObject(19483, 1951.537964, -1771.989990, 15.256000, -0.000000, -0.000000, -89.698997);
    SetDynamicObjectMaterial(drp54, 1, 1410, "", "");
    new drp55 = CreateDynamicObject(11453, 1951.594971, -1771.963013, 14.838000, 0.000000, 0.000000, 0.250000);
    SetDynamicObjectMaterial(drp55, 256, 18646, "matcolours", "grey-50-percent");
    new drp56 = CreateDynamicObject(19483, 1951.536987, -1771.699951, 14.466000, 0.000000, 0.000000, 90.299004);
    SetDynamicObjectMaterial(drp56, 1, 1410, "", "");
    new drp57 = CreateDynamicObject(19483, 1951.536987, -1771.699951, 15.256000, 0.000000, 0.000000, 90.299004);
    SetDynamicObjectMaterial(drp57, 1, 1410, "", "");
    new drp58 = CreateDynamicObject(19483, 1951.947021, -1771.697998, 14.886000, 0.000000, 0.000000, 90.299004);
    SetDynamicObjectMaterial(drp58, 1, 1410, "", "");
    new drp59 = CreateDynamicObject(19483, 1952.259033, -1771.967041, 14.836000, 0.000000, 0.000000, 90.299004);
    SetDynamicObjectMaterial(drp59, 0, 18646, "matcolours", "orange");
    new drp60 = CreateDynamicObject(19483, 1952.255981, -1771.745972, 14.836000, 0.000000, 0.000000, 90.299004);
    SetDynamicObjectMaterial(drp60, 0, 18646, "matcolours", "orange");
    new drp61 = CreateDynamicObject(19483, 1952.848022, -1771.983032, 14.886000, -0.000000, -0.000000, -89.698997);
    SetDynamicObjectMaterial(drp61, 1, 1410, "", "");
    CreateDynamicObject(970, 1534.748047, -1712.885986, 13.001000, 0.000000, 0.000000, 89.994003);
    CreateDynamicObject(970, 1534.748047, -1708.725952, 13.001000, 0.000000, 0.000000, 89.994003);
    CreateDynamicObject(970, 1534.748047, -1704.556030, 13.001000, 0.000000, 0.000000, 89.994003);
    new drp62 = CreateDynamicObject(4186, 1482.088013, -1680.718994, 18.799000, 0.000000, 0.000000, 0.000000);
    SetDynamicObjectMaterial(drp62, 768, 8396, "sphinx01", "luxorceiling01_128");
    new drp63 = CreateDynamicObject(3985, 1482.094971, -1619.036987, 11.298000, 0.000000, 0.000000, 0.000000);
    SetDynamicObjectMaterial(drp63, 768, 10101, "2notherbuildsfe", "Bow_Abpave_Gen");
    return 1;
}
t_map() {
    t_customMap();
    //PD MAP+ by LeOn
    CreateDynamicObject(1231, 1578.99707, -1620.30676, 15.16350,   0.00000, 0.00000, 0.00000,-1,-1,-1,300.0);
    CreateDynamicObject(1231, 1553.49438, -1620.19385, 15.16350,   0.00000, 0.00000, 0.00000,-1,-1,-1,300.0);
    CreateDynamicObject(1231, 1606.46729, -1622.99597, 15.04350,   0.00000, 0.00000, -91.14001,-1,-1,-1,300.0);

    // Anti bug 0,0,0
    CreateDynamicObject(10846, -14.53252, -4.09788, 6.13280,   0.00000, 0.00000, -21.47997,-1,-1,-1,300.0);
    CreateDynamicObject(10846, 1.59602, -10.46069, 6.13280,   0.00000, 0.00000, -21.47997,-1,-1,-1,300.0);
    CreateDynamicObject(10846, 4.82450, -2.14363, 6.13280,   0.00000, 0.00000, -21.47997,-1,-1,-1,300.0);
    CreateDynamicObject(10846, -11.50102, 4.27582, 6.13280,   0.00000, 0.00000, -21.47997,-1,-1,-1,300.0);

    //Rent Bike
    CreateDynamicObject(1235, 1862.8128662109, -1390.7751464844, 12.982385635376, 0, 0, 0,-1,-1,-1,300.0);
    CreateDynamicObject(8168, 1865.0567626953, -1394.6265869141, 14.470960617065, 0, 0, 108,-1,-1,-1,300.0);
    CreateDynamicObject(3472, 1863.0369873047, -1398.5378417969, 12.474538803101, 0, 0, 0,-1,-1,-1,300.0);      

    //gard cnn
    CreateDynamicObject(970,1113.8122600,-1415.9564200,12.9976000,0.0000000,0.0000000,1.0200000,-1, -1, -1, 100.00, 100.00); //
    CreateDynamicObject(970,1118.9519000,-1415.8880600,12.9976000,0.0000000,0.0000000,0.2400000,-1, -1, -1, 100.00, 100.00); //
    CreateDynamicObject(970,1123.8713400,-1415.8917200,13.0176000,0.0000000,0.0000000,0.0000000,-1, -1, -1, 100.00, 100.00); //
    CreateDynamicObject(970,1128.8493700,-1415.8739000,13.0576000,0.0000000,0.0000000,0.0000000,-1, -1, -1, 100.00, 100.00); //
    CreateDynamicObject(970,1133.6292700,-1415.8953900,13.0576000,0.0000000,0.0000000,0.0000000,-1, -1, -1, 100.00, 100.00); //
    CreateDynamicObject(970,1138.5471200,-1415.9095500,13.0776000,0.0000000,0.0000000,0.0000000,-1, -1, -1, 100.00, 100.00); //
    CreateDynamicObject(970,1143.4871800,-1415.9598400,13.0776000,0.0000000,0.0000000,-0.5400000,-1, -1, -1, 100.00, 100.00); //
    CreateDynamicObject(970,1186.1047400,-1495.6710200,12.9611000,0.0000000,0.0000000,-90.0600000,-1, -1, -1, 100.00, 100.00); //
    CreateDynamicObject(970,1186.1428200,-1490.9211400,12.9611000,0.0000000,0.0000000,-90.0600000,-1, -1, -1, 100.00, 100.00); //
    CreateDynamicObject(970,1186.1361100,-1486.2572000,12.9611000,0.0000000,0.0000000,-90.0600000,-1, -1, -1, 100.00, 100.00); //
    CreateDynamicObject(970,1186.1005900,-1481.4856000,12.9611000,0.0000000,0.0000000,-90.0600000,-1, -1, -1, 100.00, 100.00); //
    CreateDynamicObject(970,1124.0059800,-1562.1618700,12.9591000,0.0000000,0.0000000,-0.4800000,-1, -1, -1, 100.00, 100.00); //
    CreateDynamicObject(970,1133.2240000,-1562.1650400,12.9591000,0.0000000,0.0000000,0.1200000,-1, -1, -1, 100.00, 100.00); //
    CreateDynamicObject(970,1128.5814200,-1562.1766400,12.9591000,0.0000000,0.0000000,-0.4800000,-1, -1, -1, 100.00, 100.00); //
    CreateDynamicObject(970,1061.4932900,-1492.5927700,12.9696000,0.0000000,0.0000000,-105.7800100,-1, -1, -1, 100.00, 100.00); //
    CreateDynamicObject(970,1059.1200000,-1501.5114700,12.9696000,0.0000000,0.0000000,-104.7000000,-1, -1, -1, 100.00, 100.00); //
    CreateDynamicObject(970,1060.2679400,-1497.0108600,12.9896000,0.0000000,0.0000000,-105.3000000,-1, -1, -1, 100.00, 100.00); //

    //Garduri Fish
    CreateDynamicObject(970, 382.19919, -2042.00671, 7.32180,   0.00000, 0.00000, 0.00000,-1,-1,-1,500.0);
    CreateDynamicObject(970, 378.70398, -2045.08789, 7.32180,   0.00000, 0.00000, -91.98001,-1,-1,-1,500.0);
    CreateDynamicObject(970, 378.51715, -2050.44434, 7.32180,   0.00000, 0.00000, -92.76000,-1,-1,-1,500.0);
    CreateDynamicObject(970, 352.48499, -2050.70313, 7.29520, 0.00000, 0.00000, 0.00000,-1,-1,-1,500.0);        
}
load_dealership()
{
    //Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
    new tmpobjid;
    tmpobjid = CreateDynamicObject(3095,1328.182,-1420.345,11.963,-0.099,0.000,-0.099,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0);
    tmpobjid = CreateDynamicObject(19379,1328.447,-1429.661,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1318.067,-1429.661,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1307.637,-1429.661,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1297.167,-1429.661,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1286.687,-1429.661,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1276.267,-1429.661,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1265.898,-1429.661,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1264.988,-1429.661,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1264.988,-1420.650,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1275.438,-1420.650,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1285.938,-1420.650,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1296.448,-1420.650,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1306.908,-1420.650,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1317.198,-1420.650,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1327.488,-1420.650,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1327.488,-1439.230,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1317.148,-1439.230,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1306.708,-1439.230,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1296.228,-1439.230,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1285.739,-1439.230,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1275.309,-1439.230,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1264.869,-1439.230,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1267.889,-1443.020,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1278.348,-1443.020,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1288.759,-1443.020,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1299.229,-1443.020,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1309.588,-1443.020,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1320.018,-1443.020,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,1328.788,-1443.020,12.420,180.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(8646,1317.786,-1415.898,13.301,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -1);
    tmpobjid = CreateDynamicObject(8646,1331.645,-1430.400,13.301,0.000,0.000,-3.999,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -1);
    tmpobjid = CreateDynamicObject(8646,1282.016,-1415.898,13.301,0.000,0.000,270.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -1);
    tmpobjid = CreateDynamicObject(8646,1280.696,-1415.898,13.301,0.000,0.000,450.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -1);
    tmpobjid = CreateDynamicObject(8646,1266.116,-1430.519,13.301,0.000,0.000,540.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -1);
    tmpobjid = CreateDynamicObject(19360,1321.550,-1440.966,14.256,0.000,0.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1321.550,-1431.546,14.256,0.000,0.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19325,1321.461,-1436.182,13.936,0.000,0.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -1);
    tmpobjid = CreateDynamicObject(19360,1320.030,-1430.026,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19325,1315.271,-1429.991,13.936,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -1);
    tmpobjid = CreateDynamicObject(19360,1310.361,-1430.026,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1307.161,-1430.026,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1300.601,-1430.026,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1297.421,-1430.026,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19325,1292.541,-1429.991,13.936,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -1);
    tmpobjid = CreateDynamicObject(19360,1287.632,-1430.026,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19325,1282.732,-1429.991,13.936,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -1);
    tmpobjid = CreateDynamicObject(19360,1277.822,-1430.026,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1276.310,-1431.546,14.256,0.000,0.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19325,1276.291,-1436.182,13.936,0.000,0.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -1);
    tmpobjid = CreateDynamicObject(19360,1276.320,-1440.966,14.256,0.000,0.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1277.839,-1442.516,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1281.039,-1442.516,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1284.229,-1442.516,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1287.388,-1442.516,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1290.568,-1442.516,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1293.778,-1442.516,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1296.948,-1442.516,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1300.148,-1442.516,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1303.328,-1442.516,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1306.538,-1442.516,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1309.717,-1442.516,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1312.897,-1442.516,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1316.097,-1442.516,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1319.296,-1442.516,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1320.037,-1442.516,14.256,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(14855,1302.223,-1439.329,9.056,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(14855,1302.223,-1439.329,15.036,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1321.550,-1440.966,17.736,0.000,0.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19325,1321.461,-1436.182,17.416,0.000,0.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -1);
    tmpobjid = CreateDynamicObject(19360,1321.550,-1431.546,17.746,0.000,0.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1320.030,-1430.026,17.746,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1310.361,-1430.026,17.756,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1307.161,-1430.026,17.746,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1300.601,-1430.026,17.736,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1297.421,-1430.026,17.736,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1287.631,-1430.026,17.736,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1277.822,-1430.026,17.736,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1276.310,-1431.546,17.736,0.000,0.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1276.320,-1440.966,17.756,0.000,0.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1277.839,-1442.516,17.756,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1281.039,-1442.516,17.756,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1284.229,-1442.516,17.756,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1287.388,-1442.516,17.756,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1290.568,-1442.516,17.756,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1293.778,-1442.516,17.756,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1296.948,-1442.516,17.756,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1300.148,-1442.516,17.756,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1303.328,-1442.516,17.766,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1306.517,-1442.516,17.766,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1309.717,-1442.516,17.766,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1312.896,-1442.516,17.766,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1316.086,-1442.516,17.766,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1319.276,-1442.516,17.766,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1320.047,-1442.516,17.766,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19325,1292.541,-1429.991,17.406,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -1);
    tmpobjid = CreateDynamicObject(19325,1315.271,-1429.991,17.466,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -1);
    tmpobjid = CreateDynamicObject(19325,1282.732,-1429.991,17.406,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -1);
    tmpobjid = CreateDynamicObject(19325,1276.291,-1436.182,17.406,0.000,0.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -1);
    tmpobjid = CreateDynamicObject(19360,1305.461,-1430.026,17.736,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1302.261,-1430.026,17.736,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19429,1296.250,-1436.780,14.232,0.000,0.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1296.408,-1437.795,17.756,0.000,0.000,180.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(19360,1296.408,-1440.836,17.756,0.000,0.000,180.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0);
    tmpobjid = CreateDynamicObject(3850,1306.874,-1432.994,16.532,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -10066330);
    tmpobjid = CreateDynamicObject(3850,1303.355,-1432.994,16.532,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -10066330);
    tmpobjid = CreateDynamicObject(3850,1299.834,-1432.994,16.532,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -10066330);
    tmpobjid = CreateDynamicObject(3850,1296.324,-1432.994,16.532,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -10066330);
    tmpobjid = CreateDynamicObject(3850,1292.794,-1432.994,16.532,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -10066330);
    tmpobjid = CreateDynamicObject(3850,1289.294,-1432.994,16.532,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -10066330);
    tmpobjid = CreateDynamicObject(3850,1285.754,-1432.994,16.532,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -10066330);
    tmpobjid = CreateDynamicObject(3850,1282.254,-1432.994,16.532,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -10066330);
    tmpobjid = CreateDynamicObject(3850,1278.734,-1432.994,16.532,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -10066330);
    tmpobjid = CreateDynamicObject(19375,1316.412,-1434.684,19.456,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0);
    tmpobjid = CreateDynamicObject(19375,1305.952,-1434.684,19.456,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0);
    tmpobjid = CreateDynamicObject(19375,1295.442,-1434.684,19.456,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0);
    tmpobjid = CreateDynamicObject(19375,1284.953,-1434.684,19.456,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0);
    tmpobjid = CreateDynamicObject(19375,1281.342,-1434.684,19.456,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0);
    tmpobjid = CreateDynamicObject(19375,1281.342,-1437.944,19.456,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0);
    tmpobjid = CreateDynamicObject(19375,1291.812,-1437.944,19.456,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0);
    tmpobjid = CreateDynamicObject(19375,1302.282,-1437.944,19.456,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0);
    tmpobjid = CreateDynamicObject(19375,1312.762,-1437.944,19.456,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0);
    tmpobjid = CreateDynamicObject(19375,1316.392,-1437.944,19.456,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0);
    tmpobjid = CreateDynamicObject(14397,1320.133,-1429.669,15.226,0.000,0.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0);
    tmpobjid = CreateDynamicObject(14397,1303.153,-1429.669,15.226,0.000,0.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0);
    tmpobjid = CreateDynamicObject(14397,1291.742,-1429.669,15.226,0.000,0.000,0.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0);
    tmpobjid = CreateDynamicObject(4238,1301.739,-1429.852,17.926,0.000,0.000,-149.799,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterialText(tmpobjid, 0, "DEALERSHIP", 40, "Ariel", 20, 1, -16777216, 0, 0);
    tmpobjid = CreateDynamicObject(2747,1296.773,-1436.727,13.162,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    tmpobjid = CreateDynamicObject(2747,1297.593,-1436.727,13.162,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    tmpobjid = CreateDynamicObject(2747,1298.513,-1436.727,13.162,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    tmpobjid = CreateDynamicObject(2747,1299.453,-1436.727,13.162,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    tmpobjid = CreateDynamicObject(2747,1300.333,-1436.727,13.162,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    tmpobjid = CreateDynamicObject(2747,1301.193,-1436.727,13.162,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    tmpobjid = CreateDynamicObject(2747,1302.093,-1436.727,13.162,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    tmpobjid = CreateDynamicObject(2747,1303.073,-1436.727,13.162,0.000,0.000,90.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    tmpobjid = CreateDynamicObject(2747,1303.932,-1436.792,13.162,0.000,0.000,81.600,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    tmpobjid = CreateDynamicObject(2747,1304.815,-1436.970,13.162,0.000,0.000,76.100,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    tmpobjid = CreateDynamicObject(2747,1305.557,-1437.247,13.162,0.000,0.000,64.100,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    tmpobjid = CreateDynamicObject(2747,1306.296,-1437.685,13.162,0.000,0.000,55.100,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    tmpobjid = CreateDynamicObject(2747,1306.878,-1438.204,13.162,0.000,0.000,43.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    tmpobjid = CreateDynamicObject(2747,1307.281,-1438.807,13.162,0.000,0.000,25.400,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    tmpobjid = CreateDynamicObject(2747,1307.560,-1439.571,13.162,0.000,0.000,14.400,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    tmpobjid = CreateDynamicObject(2747,1307.670,-1440.337,13.162,0.000,0.000,2.300,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    tmpobjid = CreateDynamicObject(2747,1307.703,-1441.247,13.162,0.000,0.000,180.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    tmpobjid = CreateDynamicObject(2747,1307.703,-1441.937,13.162,0.000,0.000,180.000,-1,-1,-1,300.000,300.000);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0);
    SetDynamicObjectMaterial(tmpobjid, 3, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 4, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 5, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 6, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 7, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 8, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    CreateDynamicObject(19375,1316.252,-1434.794,12.506,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    CreateDynamicObject(19375,1305.742,-1434.794,12.506,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    CreateDynamicObject(19375,1295.263,-1434.794,12.506,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    CreateDynamicObject(19375,1284.982,-1434.794,12.506,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    CreateDynamicObject(19375,1281.522,-1434.794,12.506,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    CreateDynamicObject(19375,1281.522,-1437.635,12.506,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    CreateDynamicObject(19375,1292.002,-1437.635,12.506,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    CreateDynamicObject(19375,1302.372,-1437.635,12.506,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    CreateDynamicObject(19375,1313.231,-1437.635,12.506,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    CreateDynamicObject(19356,1319.751,-1440.852,12.502,0.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    CreateDynamicObject(10009,1313.777,-1436.764,12.822,0.000,0.000,180.000,-1,-1,-1,300.000,300.000);
    CreateDynamicObject(19375,1303.383,-1437.624,15.956,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    CreateDynamicObject(19375,1292.913,-1437.624,15.956,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    CreateDynamicObject(19375,1282.433,-1437.624,15.956,180.000,270.000,0.000,-1,-1,-1,300.000,300.000);
    CreateDynamicObject(19356,1278.095,-1440.834,15.952,0.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    CreateDynamicObject(19356,1278.095,-1437.635,15.952,0.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    CreateDynamicObject(19356,1278.095,-1434.414,15.952,0.000,90.000,0.000,-1,-1,-1,300.000,300.000);
    CreateDynamicObject(10183,1281.663,-1425.160,12.506,0.000,0.000,225.000,-1,-1,-1,300.000,300.000);
    return 1;
}
load_apartaments() {
    new
        x,
        apartaments,
        Cache: db = mysql_query(SQL, "SELECT * FROM `apartaments` ORDER BY `apartaments`.`ID` ASC");

    for(new i, j = cache_num_rows(); i != j; ++i) {
        cache_get_value_name_int(i, "ID", x);
        cache_get_value_name_float(i, "X", apartamentInfo[x][apPos][0]);
        cache_get_value_name_float(i, "Y", apartamentInfo[x][apPos][1]);
        cache_get_value_name_float(i, "Z", apartamentInfo[x][apPos][2]);
        cache_get_value_name_float(i, "Angle", apartamentInfo[x][apPos][3]);
        cache_get_value_name_int(i, "UserID", apartamentInfo[x][apUser]);
        cache_get_value_name_int(i, "Value", apartamentInfo[x][apValue]);
        cache_get_value_name(i, "Owner", apartamentInfo[x][apOwner]);
        cache_get_value_name_int(i, "Lock", apartamentInfo[x][apLock]);
        apartaments ++;
        
        apartamentInfo[x][apLabel] = CreateDynamic3DTextLabel("", -1, apartamentInfo[x][apPos][0], apartamentInfo[x][apPos][1], apartamentInfo[x][apPos][2], 25, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, -1, -1, 100.0);
        refresh_label(x);
    }
    cache_delete(db);
    
    apartament_door[0] = CreateDynamicObject(1506, 295.460693, -1622.989990, 63.994999, 0.000000, 0.000000, -100.000000);
    apartament_door[1] = CreateDynamicObject(1506, 275.864990, -1619.536011, 59.494999, 0.000000, 0.000000, 260.000000);
    apartament_door[2] = CreateDynamicObject(1506, 275.864990, -1619.536011, 63.994999, 0.000000, 0.000000, 260.000000);
    apartament_door[3] = CreateDynamicObject(1506, 295.460693, -1622.989990, 59.494999, 0.000000, 0.000000, -100.000000);
    apartament_door[4] = CreateDynamicObject(1506, 275.864990, -1619.536011, 68.494995, 0.000000, 0.000000, 260.000000);
    apartament_door[5] = CreateDynamicObject(1506, 295.460693, -1622.989990, 68.494995, 0.000000, 0.000000, -100.000000);
    apartament_door[6] = CreateDynamicObject(1506, 295.4607, -1622.9900, 72.9950, 0.0000, 0.0000, -100.0000);
    apartament_door[7] = CreateDynamicObject(1506, 295.460693, -1622.989990, 77.494995, 0.000000, 0.000000, -100.000000);
    apartament_door[8] = CreateDynamicObject(1506, 275.864990, -1619.536011, 72.994995, 0.000000, 0.000000, 260.000000);
    apartament_door[9] = CreateDynamicObject(1506, 295.460693, -1622.989990, 81.994995, 0.000000, 0.000000, -100.000000);
    apartament_door[10] = CreateDynamicObject(1506, 275.864990, -1619.536011, 77.494995, 0.000000, 0.000000, 260.000000);
    apartament_door[11] = CreateDynamicObject(1506, 275.864990, -1619.536011, 81.994995, 0.000000, 0.000000, 260.000000);
    apartament_door[12] = CreateDynamicObject(1506, 295.460693, -1622.989990, 86.494995, 0.000000, 0.000000, -100.000000);
    apartament_door[13] = CreateDynamicObject(1506, 275.864990, -1619.536011, 86.494995, 0.000000, 0.000000, 260.000000);
    apartament_door[14] = CreateDynamicObject(1506, 275.864990, -1619.536011, 90.994995, 0.000000, 0.000000, 260.000000);
    apartament_door[15] = CreateDynamicObject(1506, 295.460693, -1622.989990, 90.994995, 0.000000, 0.000000, -100.000000);
    apartament_door[16] = CreateDynamicObject(1506, 295.460693, -1622.989990, 95.494995, 0.000000, 0.000000, -100.000000);
    apartament_door[17] = CreateDynamicObject(1506, 275.864990, -1619.536011, 95.494995, 0.000000, 0.000000, 260.000000);
    apartament_door[18] = CreateDynamicObject(1506, 275.864990, -1619.536011, 54.994999, 0.000000, 0.000000, 260.000000);
    apartament_door[19] = CreateDynamicObject(1506, 295.460693, -1622.989990, 54.994999, 0.000000, 0.000000, -100.000000);
    apartament_door[20] = CreateDynamicObject(1506, 295.460693, -1622.989990, 50.494999, 0.000000, 0.000000, -100.000000);
    apartament_door[21] = CreateDynamicObject(1506, 295.460693, -1622.989990, 45.994999, 0.000000, 0.000000, -100.000000);
    apartament_door[22] = CreateDynamicObject(1506, 275.864990, -1619.536011, 50.494999, 0.000000, 0.000000, 260.000000);
    apartament_door[23] = CreateDynamicObject(1506, 275.864990, -1619.536011, 45.994999, 0.000000, 0.000000, 260.000000);
    
    printf("Apartaments: %d", apartaments);
    return 1;
}
enter_apartament(playerid) {
    new
        Float: Pos[3];
    
    for(new i = 1; i < 25; i++) {
        if(PlayerToPoint(3.0, playerid, apartamentInfo[i][apPos][0], apartamentInfo[i][apPos][1], apartamentInfo[i][apPos][2])) {
            if(apartamentInfo[i][apLock] == 1 && have_apartament(playerid) != i) 
                return SendClientMessage(playerid, COLOR_LGREEN, "ERROR: Ban khong the mo cua can ho nay!");
        }   
    }    

    for(new i = 0; i < 24; i++) {
        GetDynamicObjectPos(apartament_door[i], Pos[0], Pos[1], Pos[2]);
        if(PlayerToPoint(3.0, playerid, Pos[0], Pos[1], Pos[2])) {
            if(apartament_door_status[i] == 0) {
                if(i == 0 || i == 3 || i == 5 || i == 6 || i == 7 || i == 9 || i == 12 || i == 15 || i == 16 || i== 19 || i == 20 || i == 21) MoveDynamicObject(apartament_door[i], Pos[0], Pos[1], Pos[2], 10.0, 0.0, 0.0, -6.2800);
                else MoveDynamicObject(apartament_door[i], Pos[0], Pos[1], Pos[2], 10.0, 0.0, 0.0, -188.4399);
                apartament_door_status[i] = 1;
            }
            else {
                if(i == 0 || i == 3 || i == 5 || i == 6 || i == 7 || i == 9 || i == 12 || i == 15 || i == 16 || i== 19 || i == 20 || i == 21) MoveDynamicObject(apartament_door[i], Pos[0], Pos[1], Pos[2], 10.0, 0.0, 0.0, -100.000000);
                else MoveDynamicObject(apartament_door[i], Pos[0], Pos[1], Pos[2], 10.0, 0.0, 0.0, 260.000000);
                apartament_door_status[i] = 0;
            }
        }
    }
    return 1;
}
refresh_label(x) {
    new
        label[256];

    if(apartamentInfo[x][apValue] > 0) {
        if(apartamentInfo[x][apLock] == 0) format(label, sizeof(label), "Can ho {008080}%d{FFFFFF}\nNguoi so huu: {008080}%s{FFFFFF}\nValue: {008080}$%s{FFFFFF}\nTrang thai cua: {18d21b}khong khoa{FFFFFF}\n[/muacanho]", x, apartamentInfo[x][apOwner], FormatNumber(apartamentInfo[x][apValue]));
        else format(label, sizeof(label), "Can ho {008080}%d{FFFFFF}\nNguoi so huu: {008080}%s{FFFFFF}\nValue: {008080}$%s{FFFFFF}\nDoors: {C40000}Da khoa{FFFFFF}\n[/muacanho]", x, apartamentInfo[x][apOwner], FormatNumber(apartamentInfo[x][apValue]));
    }
    else {
        if(apartamentInfo[x][apLock] == 0) format(label, sizeof(label), "Can ho {008080}%d{FFFFFF}\nNguoi so huu: {008080}%s{FFFFFF}\nTrang thai cua: {18d21b}khong khoa{FFFFFF}", x, apartamentInfo[x][apOwner]);
        else format(label, sizeof(label), "Can ho {008080}%d{FFFFFF}\nNguoi so huu: {008080}%s{FFFFFF}\nTrang thai cua: {C40000}Da khoa{FFFFFF}", x, apartamentInfo[x][apOwner]);
    }

    UpdateDynamic3DTextLabelText(apartamentInfo[x][apLabel], -1, label);
    return 1;
}

have_apartament(playerid) {
    for(new i = 1; i < 25; i++) {
        if(apartamentInfo[i][apUser] == PlayerInfo[playerid][pSQLID]) return i;
    }
    return -1;
}

//if(have_apartament(playerid) != -1) spawn_in_apartament(playerid);
spawn_in_apartament(playerid) {
    new
        id = have_apartament(playerid);
    
    SetPlayerFacingAngle(playerid, apartamentInfo[id][apPos][3]);
    
    if(id == 1 || id == 3 || id == 5 || id == 7 || id == 9 || id == 11 || id == 13 || id == 15 || id == 17 || id == 19 || id == 21 || id == 23)
        SetPlayerPosEx(playerid, apartamentInfo[id][apPos][0]+2, apartamentInfo[id][apPos][1], apartamentInfo[id][apPos][2]);
    else
        SetPlayerPosEx(playerid, apartamentInfo[id][apPos][0]-2, apartamentInfo[id][apPos][1], apartamentInfo[id][apPos][2]);
    return 1;
}

update_apartament_int(id, const var[], value) {
    new
        query[128];

    format(query, sizeof(query), "UPDATE `apartaments` SET `%s`='%d' WHERE `ID`='%d'", var, value, id);
    mysql_tquery(SQL, query, "", "");
    return 1;
}

update_apartament_str(id, const var[], const value[]) {
    new
        query[128];

    format(query, sizeof(query), "UPDATE `apartaments` SET `%s`='%s' WHERE `ID`='%d'", var, value, id);
    mysql_tquery(SQL, query, "", "");
    return 1;
}
SaveSeif(const id) {
    new szQuery[600];
    format(szQuery, sizeof(szQuery), "UPDATE seif SET `sMoney` = '%d', `sDrugs` = '%d', `sMaterials` = '%d' WHERE `sID` = '%d'",
    SafeInfo[id][sMoney], SafeInfo[id][sDrugs], SafeInfo[id][sMaterials], id);
    mysql_query(SQL, szQuery, false);
    return 1;
}
missionName(playerid, type, id) {
    new string[256];
    switch(type) {
        case 0: format(string, sizeof(string), "Giet %d nguoi choi trong dau truong paintball", PlayerInfo[playerid][pNeedProgress][id]);
        case 1: format(string, sizeof(string), "Giao %d banh pizza", PlayerInfo[playerid][pNeedProgress][id]);
        case 2: format(string, sizeof(string), "Cau %d ca", PlayerInfo[playerid][pNeedProgress][id]);
        case 3: format(string, sizeof(string), "Lay va giao vat lieu %d lan", PlayerInfo[playerid][pNeedProgress][id]);
        case 4: format(string, sizeof(string), "Che tao hamburger %d lan", PlayerInfo[playerid][pNeedProgress][id]);
        case 5: format(string, sizeof(string), "Hut %d dieu thuoc", PlayerInfo[playerid][pNeedProgress][id]); 
        case 6: format(string, sizeof(string), "Ban sung cho nguoi choi");      
        case 7: format(string, sizeof(string), "Treo len dinh nui Chilliad");
        case 8: format(string, sizeof(string), "Ghe tham san bay Los Santos");
        case 9: format(string, sizeof(string), "Ghe tham san van dong Baseball LV");        
        case 10: format(string, sizeof(string), "Di den mot cau lac bo va say sua");    
        case 11: format(string, sizeof(string), "Chien thang tro choi Mine Sweeper");
        case 12: format(string, sizeof(string), "Trao doi hamburger voi nguoi choi khac [/traodoi]");
        case 13: format(string, sizeof(string), "Choi thuoc phien");    
        case 14: format(string, sizeof(string), "Mua cafe o quan bar"); 
        case 15..16: {
            if(PlayerInfo[playerid][pMember] == 1 || PlayerInfo[playerid][pMember] == 2 || PlayerInfo[playerid][pMember] == 3) 
                format(string, sizeof(string), "Bat %d toi pham", PlayerInfo[playerid][pNeedProgress][id]);
            else if(PlayerInfo[playerid][pMember] == 7) 
                format(string, sizeof(string), "Cung cap %d giay phep", PlayerInfo[playerid][pNeedProgress][id]);
            else if(PlayerInfo[playerid][pMember] == 8) 
                format(string, sizeof(string), "Sua chua %d phuong tien", PlayerInfo[playerid][pNeedProgress][id]);
            else if(PlayerInfo[playerid][pMember] == 9) 
                format(string, sizeof(string), "Co %d quang cao", PlayerInfo[playerid][pNeedProgress][id]);
            else if(PlayerInfo[playerid][pMember] == 11) 
                format(string, sizeof(string), "Hoan thanh %d hop dong", PlayerInfo[playerid][pNeedProgress][id]);
            else if(PlayerInfo[playerid][pMember] == 12) 
                format(string, sizeof(string), "Dua %d nguoi choi den noi ma ho can den", PlayerInfo[playerid][pNeedProgress][id]);
            else if(PlayerInfo[playerid][pMember] == 13) 
                format(string, sizeof(string), "Chua tri cho %d nguoi choi", PlayerInfo[playerid][pNeedProgress][id]);
            else format(string, sizeof(string), "Cau %d ca", PlayerInfo[playerid][pNeedProgress][id]);
        }
        case 17: format(string, sizeof(string), "Hoan thanh %d cuoc dua", PlayerInfo[playerid][pNeedProgress][id]); 
        case 18: format(string, sizeof(string), "Sua xe cua ban %d lan o PNS", PlayerInfo[playerid][pNeedProgress][id]);
        case 19: format(string, sizeof(string), "Ban hamburger cho cua hang Burger shoot %d lan [/banthucan]", PlayerInfo[playerid][pNeedProgress][id]); 
        case 20: format(string, sizeof(string), "Choi dice voi mot nguoi");
    
    }
    return string;
}
stock Dayss(timestamp) {  //TODO: can be use in the future to calculate car remain days. 
    return (timestamp - gtm) / (60 * 60 * 24); 
} 
GetWeaponNameEx(id, name[], len) return format(name,len, "%s", GunNames[id]);
MesajLung(playerid, color, const text[]) {
    new string[300], szText1[180], szText2[180];
    if(strlen(text) > 100) {
        strmid(szText1, text, 100, 256);
        strmid(szText2, text, 0, 100);
        format(string, sizeof(string), "%s", szText2);
        SendClientMessage(playerid, color, string);
        format(string, sizeof(string), "... %s", szText1);
        SendClientMessage(playerid, color, string);
    }
    else SendClientMessage(playerid, color, text);
    return 1;
}

MesajLung2(color, text[]) {
    new string[300], szText1[180], szText2[180];
    if(strlen(text) > 100) {
        strmid(szText1, text, 100, 256);
        strmid(szText2, text, 0, 100);
        format(string, sizeof(string), "%s", szText2);
        SCMTA(color, string);
        format(string, sizeof(string), "... %s", szText1);
        SCMTA(color, string);
    }
    else SCMTA(color, text);

    return 1;
}
PreloadAnimLib(playerid)
{
    ApplyAnimation(playerid, "AIRPORT", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "SAMP", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "Attractors", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BAR", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BASEBALL", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BD_FIRE", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "benchpress", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BF_injection", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BIKED", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BIKEH", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BIKELEAP", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BIKES", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BIKEV", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BIKE_DBZ", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BMX", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BOX", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BSKTBALL", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BUDDY", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BUS", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "CAMERA", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "CAR", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "CAR_CHAT", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "CASINO", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "CHAINSAW", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "CHOPPA", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "CLOTHES", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "COACH", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "COLT45", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "COP_DVBYZ", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "CRIB", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "DAM_JUMP", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "DANCING", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "DILDO", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "DODGE", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "DOZER", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "DRIVEBYS", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "FAT", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "FIGHT_B", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "FIGHT_C", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "FIGHT_D", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "FIGHT_E", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "FINALE", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "FINALE2", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "Flowers", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "FOOD", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "Freeweights", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "GANGS", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "GHANDS", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "GHETTO_DB", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "goggles", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "GRAFFITI", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "GRAVEYARD", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "GRENADE", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "GYMNASIUM", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "HAIRCUTS", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "HEIST9", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "INT_HOUSE", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "INT_OFFICE", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "INT_SHOP", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "JST_BUISNESS", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "KART", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "KISSING", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "KNIFE", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "LAPDAN1", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "LAPDAN2", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "LAPDAN3", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "LOWRIDER", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "MD_CHASE", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "MEDIC", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "MD_END", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "MISC", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "MTB", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "MUSCULAR", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "NEVADA", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "ON_LOOKERS", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "OTB", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "PARACHUTE", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "PARK", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "PAULNMAC", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "PED", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "PLAYER_DVBYS", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "PLAYIDLES", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "POLICE", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "POOL", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "POOR", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "PYTHON", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "QUAD", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "QUAD_DBZ", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "RIFLE", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "RIOT", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "ROB_BANK", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "ROCKET", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "RUSTLER", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "RYDER", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "SCRATCHING", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "SHAMAL", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "SHOTGUN", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "SILENCED", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "SKATE", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "SPRAYCAN", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "STRIP", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "SUNBATHE", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "SWAT", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "SWEET", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "SWIM", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "SWORD", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "TANK", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "TATTOOS", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "TEC", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "TRAIN", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "TRUCK", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "UZI", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "VAN", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "VENDING", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "VORTEX", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "WAYFARER", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "WEAPONS", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "WUZI", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "SNM", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BLOWJOBZ", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "SEX", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BOMBER", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "RAPPING", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "SHOP", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BEACH", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "SMOKING", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "FOOD", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "ON_LOOKERS", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "DEALER", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "CRACK", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "CARRY", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "COP_AMBIENT", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "PARK", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "INT_HOUSE", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "FOOD", "null", 0, 0, 0, 0, 0, 0, 0);
    ApplyAnimation(playerid, "BOMBER", "null", 0, 0, 0, 0, 0, 1);
    ApplyAnimation(playerid, "PED", "null", 0, 0, 0, 0, 0, 1);
    ApplyAnimation(playerid, "GRENADE", "null", 4.0, 0, 0, 0, 0, 0); // can
    ApplyAnimation(playerid, "BSKTBALL", "null", 4.0, 0, 0, 0, 0, 0); // can2
    ApplyAnimation(playerid, "WUZI", "null", 4.0, 1, 1, 1, 0, 0); // zchet
    ApplyAnimation(playerid, "FIGHT_B", "null", 4.0, 1, 0, 0, 0, 0); // bican
    ApplyAnimation(playerid, "BASEBALL", "null", 4.0, 0, 1, 1, 0, 0); // dap2
    ApplyAnimation(playerid, "DILDO", "null", 4.0, 0, 1, 1, 0, 0); // boss1danh1
}
// ChatLog(playerid, text[])
// {
//     new
//      File:lFile = fopen("Logs/Chat.txt", io_append),
//      logData[178],
//         fyear, fmonth, fday,
//         fhour, fminute, fsecond;
        
//     getdate(fyear, fmonth, fday);
//     gettime(fhour, fminute, fsecond);
    
//     format(logData, sizeof(logData),"[%02d/%02d/%04d %02d:%02d:%02d] %s: %s \r\n", fday, fmonth, fyear, fhour, fminute, fsecond, GetName(playerid), text);
//     fwrite(lFile, logData);

//     fclose(lFile);
//     return 1;
// }
NearMessage(playerid, color, string[], Float: distance = 25.0) {
    new Float: Coordss[3];
    GetPlayerPos(playerid, Coordss[0], Coordss[1], Coordss[2]);
    foreach(new i: Player) {
        if(IsPlayerInRangeOfPoint(i, distance, Coordss[0], Coordss[1], Coordss[2]) && (GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid))) {
            SendClientMessage(i, color, string);
        }
    }
    return 1;
}

function CheckEventWinner() {
    new string[180];
    if(GetPlayersOnEvent() == 1 && EventType != 3) {
        foreach(new i: Player) {
            if(InEvent[i]) {
                format(string, sizeof(string), "Xin chuc mung! Ban nhan duoc tien thuong su kien: $%s.", FormatNumber(EventMoney));
                SendClientMessage(i, COLOR_MONEY, string);
                SpawnPlayer(i);
                ActiveEvent = 0;
                EventTime = 1;
                format(string, sizeof(string), "(( AdmBot: {FF9696}%s (%d){A9C4E4} da gianh chien thang su kien va da nhan duoc tien thuong $%s. Xin chuc mung! ))", GetName(i), i, FormatNumber(EventMoney));
                SCMTA(COLOR_CLIENT, string);
                GivePlayerCash(i, EventMoney);              
            }
        }
        for(new v = 0; v < 45; v++) SetVehicleVirtualWorld(LCS[v], 556);
    }
    return 1;
}

FactionName(fid) {
    new string[32];
    if(fid == 0) string = "Khong";
    else format(string, sizeof(string), DynamicFactions[fid][fName]);
    return string;
}
GetWeatherName(weatherid)
{
    new WeatherNamestring[66];
    switch(weatherid)
    {
        case 0: format(WeatherNamestring, sizeof(WeatherNamestring), "Nang nhieu, mot tam nhin tot voi nhung dam may vua phai");
        case 1: format(WeatherNamestring, sizeof(WeatherNamestring), "Sunny mot tam nhin tot voi nhung dam may vua phai");
        case 2: format(WeatherNamestring, sizeof(WeatherNamestring), "Nang nhieu, mot tam nhin tot voi nhung dam may vua phai");
        case 3: format(WeatherNamestring, sizeof(WeatherNamestring), "Nang nhieu, mot tam nhin tot voi nhung dam may vua phai");
        case 4: format(WeatherNamestring, sizeof(WeatherNamestring), "Nang nhieu, mot tam nhin tot voi nhung dam may vua phai");
        case 5: format(WeatherNamestring, sizeof(WeatherNamestring), "Nang nhieu, mot tam nhin tot voi nhung dam may vua phai");
        case 6: format(WeatherNamestring, sizeof(WeatherNamestring), "Nang nhieu, mot tam nhin tot voi nhung dam may vua phai");
        case 7: format(WeatherNamestring, sizeof(WeatherNamestring), "Nang nhieu, mot tam nhin tot voi nhung dam may vua phai");
        case 8: format(WeatherNamestring, sizeof(WeatherNamestring), "Am uot, mua roi voi tam nhin trung binh va nhung dam may khong lo");
        case 9: format(WeatherNamestring, sizeof(WeatherNamestring), "Thick Foggy with low visibility va nhung dam may khong lo");
        case 10: format(WeatherNamestring, sizeof(WeatherNamestring), "Sunny mot tam nhin tot voi nhung dam may vua phai");
        case 11: format(WeatherNamestring, sizeof(WeatherNamestring), "HeatWave mot tam nhin tot voi nhung dam may vua phai");
        case 12: format(WeatherNamestring, sizeof(WeatherNamestring), "Suong mu, tam nhin thuong va may cao");
        case 13: format(WeatherNamestring, sizeof(WeatherNamestring), "Suong mu, tam nhin thuong va may cao");
        case 14: format(WeatherNamestring, sizeof(WeatherNamestring), "Suong mu, tam nhin thuong va may cao");
        case 15: format(WeatherNamestring, sizeof(WeatherNamestring), "Bao lon, tam nhin kho cung nhung dam may day dac");
        case 16: format(WeatherNamestring, sizeof(WeatherNamestring), "Am uot, mua roi voi tam nhin trung binh va nhung dam may khong lo");
        case 17: format(WeatherNamestring, sizeof(WeatherNamestring), "Nang choi chang, mot tam nhin tot va it may");
        case 18: format(WeatherNamestring, sizeof(WeatherNamestring), "Nang choi chang, mot tam nhin tot va it may");
        case 19: format(WeatherNamestring, sizeof(WeatherNamestring), "Bao cat voi mot tam nhin yeu va may cao");
        case 20: format(WeatherNamestring, sizeof(WeatherNamestring), "Khoi doc mau xanh cung voi tam nhin thap va may cao");
    }
    return WeatherNamestring;
}
// static randomWeather[] = {1,2,1,0,1,2,3,4,5,6,7,8,17,18};
static randomWeather[] = {1,2,3,4,5,6,7,10,11,12,13,14,15,17,18,20};
task ThayDoiThoiTiet[1800000]() {   
    new NEWS[135];  
    ServerWeather = randomWeather[random(sizeof(randomWeather))];
    SetWeather(ServerWeather);
    format(NEWS, sizeof(NEWS), "[DU BAO THOI TIET] Troi hom nay %s. [%d]", GetWeatherName(ServerWeather), ServerWeather);
    SCMTA(COLOR_ORANGE, NEWS);  
    return 1;
}

stock getGunID(const name[]) {
    new id;
    if(strmatch("9mm Pistol", name)) id = 22;
    else if(strmatch("Silenced", name)) id = 23;
    else if(strmatch("DE", name)) id = 24;
    else if(strmatch("Shotgun", name)) id = 25;
    else if(strmatch("MP5", name)) id = 29;
    else if(strmatch("Ak47", name)) id = 30;
    else if(strmatch("Baseballbat", name)) id = 5;
    else if(strmatch("M4", name)) id = 31;
    else if(strmatch("Uzi", name)) id = 28;
    else if(strmatch("Country rifle", name)) id = 33;
    return id;
}

stock NearMessage2(playerid, Float:range, color, const text[], va_args<>) {
	new Float:pos[3]; GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
	new UsageString[250]; UsageString[0] = (EOS); va_format(UsageString, sizeof UsageString, text, va_start< 4 >);
	foreach(new x: Player) { if(IsPlayerConnected(x) && IsPlayerInRangeOfPoint(x, range, pos[0], pos[1], pos[2]) && GetPlayerVirtualWorld(x) == GetPlayerVirtualWorld(playerid) && GetPlayerInterior(x) == GetPlayerInterior(playerid)) { SendClientMessage(x, color, UsageString); } }
	return 1;  }

stock GetFactionMembersOn2(fid) {
    new x;
    foreach(new i: Player) {
        if(/*UsingSampcac{i} == 1 &&*/ IsPlayerLogged[i] == 1) {
            if(PlayerInfo[i][pMember] == fid) { x++; }
        }
    }
    return x;
}
stock RemovePlayerWeapon(playerid, weaponid)
{
    SetPlayerArmedWeapon(playerid, weaponid);
    if(GetPlayerWeapon(playerid) != 0) GivePlayerWeapon(playerid, weaponid, -(GetPlayerAmmo(playerid)));

    return 1;
}
PutPlayerInVehicleEx(playerid,vehicleid,seatid) {
    PutPlayerInVehicle(playerid,vehicleid,seatid);
    GetPlayerPos(playerid, LastPos[playerid][0], LastPos[playerid][1], LastPos[playerid][2]);
    return 1;
}

RemovePlayerFromVehicleEx(playerid) {
    RemovePlayerFromVehicle(playerid);
    return 1;
}
generateCode() {
    new 
        string[50],
        randn[8],
        randl[8][23],
        LetterList[26][] = {
        "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
    };
    for(new i = 0; i < 8; i++) randn[i] = random(10);
    for(new i = 0; i < 8; i++) format(randl[i], 23, "%s", LetterList[random(26)]);

    format(string, sizeof(string), 
        "%d%s%d%s-%d%s%d%s-%d%s%d%s-%d%s%d%s", 
        randn[0], randl[0], randn[1], randl[1],
        randn[2], randl[2], randn[3], randl[3],
        randn[4], randl[4], randn[5], randl[5],
        randn[6], randl[6], randn[7], randl[7]);

    return string;
}
// PhanThuong(i) {
//     new string[11];
//     switch(i) {
//         case 0: string = "2,018,000$";
//         case 1: string = "128 xu";
//         case 2: string = "73 RP";
//         case 3: string = "Vortex VIP";
//     }
//     return string;
// }
RaceMapName(map) {
    new string[21];
    switch(map) {
        case 0: string = "San bay bo hoang";
        case 1: string = "Xa lo";
        case 2: string = "Chuyen leo nui";
        case 3: string = "Duong dua Los Santos";
        case 4: string = "Duong dua San Fierro";        
    }
    return string;
}
/*
CanPlayerBurn(playerid, val = 0) {
    //CallRemoteFunction("CanBurn", "d", playerid) >= 0 && 
    if(GetPlayerSkin(playerid) != 277 && GetPlayerSkin(playerid) != 278 
    && GetPlayerSkin(playerid) != 279 && !IsPlayerInWater(playerid) && ((!val && !GetPVarInt(playerid, "IsOnFire")) 
    || (val && GetPVarInt(playerid, "IsOnFire")))) { return 1; }
    
    return 0;
}

Pissing_at_Flame(playerid) {
    if(Peeing(playerid)) return Aiming_at_Flame(playerid);
    return -1;
}
 
IsInWaterCar(playerid) {
    return GetVehicleModel(GetPlayerVehicleID(playerid)) == 407 
        || GetVehicleModel(GetPlayerVehicleID(playerid)) == 601;
}
 
HasExtinguisher(playerid) {
    return GetPlayerWeapon(playerid) == 42 && !IsPlayerInAnyVehicle(playerid);
}*/
// Carspeed(playerid,mode = 1) {
//     new Float:Velocity [3];
//     GetVehicleVelocity ( GetPlayerVehicleID ( playerid ) , Velocity [ 0 ] , Velocity [ 1 ] , Velocity [ 2 ] ) ;
//     return IsPlayerInAnyVehicle ( playerid ) ? floatround ( ( ( floatsqroot ( ( ( Velocity [ 0 ] * Velocity [ 0 ] ) + ( Velocity [ 1 ] * Velocity [ 1 ] ) + ( Velocity [ 2 ] * Velocity [ 2 ] ) ) ) * ( !mode ? 105.0 : 170.0 ) ) ) * 1 ) : 0;
// }
/*Pressing(playerid) {
    new keys, updown, leftright;
    GetPlayerKeys(playerid, keys, updown, leftright);
    return keys;
}*/
/*Aiming_at_Flame(playerid) {
    if(gettime() - AaF_cacheTime[playerid] < 1) return AaF_cache[playerid];
    AaF_cacheTime[playerid] = gettime();
    new id = -1;
    new Float:dis = 99999.99;
    new Float:dis2;
    new Float:px, Float:py, Float:pz;
    new Float:x, Float:y, Float:z, Float:a;
    GetXYInFrontOfPlayer(playerid, x, y, z, a, 1);
    z -= Z_DIFFERENCE;
    new Float:cx,Float:cy,Float:cz,Float:fx,Float:fy,Float:fz;
    GetPlayerCameraPos(playerid, cx, cy, cz);
    GetPlayerCameraFrontVector(playerid, fx, fy, fz);
    foreach(new i: Player) {
        if(GetPVarInt(i, "IsOnFire") && IsPlayerConnected(i) && (IsInWaterCar(playerid) || HasExtinguisher(playerid) || GetPlayerWeapon(playerid) == 41 || Peeing(playerid)) && GetPVarInt(i, "IsOnFire")) {
            GetPlayerPos(i, px, py, pz);
            if(!Peeing(playerid)) dis2 = DistanceCameraTargetToLocation(cx, cy, cz, px, py, pz, fx, fy, fz);
            else {
                if(IsPlayerInRangeOfPoint(playerid, ONFOOT_RADIUS, px, py, pz)) dis2 = 0.0;
            }
            if(dis2 < dis) {
                dis = dis2;
                id = i;
                if(Peeing(playerid)) return id;
            }
        }
    }
    if(id != -1) { return id-MAX_PLAYERS; }
    foreach(new i: iFlame) {
        if(Flame[i][Flame_Exists]) {
            if(IsInWaterCar(playerid) || HasExtinguisher(playerid) || GetPlayerWeapon(playerid) == 41 || Peeing(playerid)) {
                if(!Peeing(playerid)) dis2 = DistanceCameraTargetToLocation(cx, cy, cz, Flame[i][Flame_pos][0], Flame[i][Flame_pos][1], Flame[i][Flame_pos][2]+Z_DIFFERENCE, fx, fy, fz);
                else dis2 = GetDistanceBetweenPoints(x,y,z,Flame[i][Flame_pos][0],Flame[i][Flame_pos][1],Flame[i][Flame_pos][2]);
                if((IsPlayerInAnyVehicle(playerid) && dis2 < CAR_RADIUS && dis2 < dis) || (!IsPlayerInAnyVehicle(playerid) && ((dis2 < ONFOOT_RADIUS && dis2 < dis) || (Peeing(playerid) && dis2 < PISSING_DISTANCE && dis2 < dis)))) {
                    dis = dis2;
                    id = i;
                }
            }
        }
    }
    if(id != -1) {
        if
        (
            (
                IsPlayerInAnyVehicle(playerid) && !IsPlayerInRangeOfPoint(playerid, 50, Flame[id][Flame_pos][0], Flame[id][Flame_pos][1], Flame[id][Flame_pos][2])
            )
            ||
            (
                !IsPlayerInAnyVehicle(playerid)  && !IsPlayerInRangeOfPoint(playerid, 5, Flame[id][Flame_pos][0], Flame[id][Flame_pos][1], Flame[id][Flame_pos][2])
            )
        )
        { id = -1; }
    }
    AaF_cache[playerid] = id;
    return id;
}
GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, &Float:z, &Float:a, Float:distance) {
    GetPlayerPos(playerid, x, y ,z);
    if(IsPlayerInAnyVehicle(playerid)) GetVehicleZAngle(GetPlayerVehicleID(playerid),a);
    else GetPlayerFacingAngle(playerid, a);
    x += (distance * floatsin(-a, degrees));
    y += (distance * floatcos(-a, degrees));
    return 0;
}

IsAtFlame(playerid) {
    foreach(new i: iFlame) {
        if(Flame[i][Flame_Exists]) {
            if(!IsPlayerInAnyVehicle(playerid) && (IsPlayerInRangeOfPoint(playerid, BURNING_RADIUS, Flame[i][Flame_pos][0], Flame[i][Flame_pos][1], Flame[i][Flame_pos][2]+Z_DIFFERENCE) ||
            IsPlayerInRangeOfPoint(playerid, BURNING_RADIUS, Flame[i][Flame_pos][0], Flame[i][Flame_pos][1], Flame[i][Flame_pos][2]+Z_DIFFERENCE-1))) return 1;
        }
    }
    return 0;
}

IsPlayerInWater(playerid) {
    new Float:X, Float:Y, Float:Z, an = GetPlayerAnimationIndex(playerid);
    GetPlayerPos(playerid, X, Y, Z);
    if((1544 >= an >= 1538 || an == 1062 || an == 1250) && (Z <= 0 || (Z <= 41.0 && IsPlayerInArea(playerid, -1387, -473, 2025, 2824))) ||
    (1544 >= an >= 1538 || an == 1062 || an == 1250) && (Z <= 2 || (Z <= 39.0 && IsPlayerInArea(playerid, -1387, -473, 2025, 2824)))) return 1;
    return 0;
}*/

forward DiaDiemCauCaO(playerid);
public DiaDiemCauCaO(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    if(IsPlayerInRangeOfPoint(playerid, 147,472.8250,-2710.4888,0.1202) || IsPlayerInRangeOfPoint(playerid, 147,792.2823,-2665.4868,0.1865))
		{
		    return 1;
		}
		else if(IsPlayerInRangeOfPoint(playerid, 147,717.1935,-2903.2546,0.0501) || IsPlayerInRangeOfPoint(playerid, 147, 209.5, -2785.01, 0.1865) || IsPlayerInRangeOfPoint(playerid, 147, 1039.5, -2824.01, 0.1202))
		{
		    return 1;
		}
	}
	return 0;
}

function IsANguDanZ(carid) {
	if(GetVehicleModel(carid) == 453 || GetVehicleModel(carid) == 454)
		return 1;
	return 0;
}