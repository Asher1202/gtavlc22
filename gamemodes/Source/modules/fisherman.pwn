getFishAttemptPerHour(jobId) {
    if(jobId == FISHING_LS_JOB_ID) {
        // get number of online players
        new onlineCount = Iter_Count(Player);

        // => 1 - 10 người: 40
        // => 11 - 20 người: 120
        // => 21 - 30 người: 200
        // => 31 - 60 người: 240
        // => 61 - 100 người: 300
        // else: 350

        if(onlineCount <= 10) {
            return 60;
        } else if(onlineCount <= 20) {
            return 120;
        } else if(onlineCount <= 30) {
            return 200;
        } else if(onlineCount <= 60) {
            return 240;
        } else if(onlineCount <= 100) {
            return 300;
        } else {
            return 350;
        }
    }
    if(jobId == FISHING_LV_JOB_ID) {
        // get number of online players
        new onlineCount = Iter_Count(Player);

        // => 1 - 10 người: 40
        // => 11 - 20 người: 120
        // => 21 - 30 người: 200
        // => 31 - 60 người: 240
        // => 61 - 100 người: 300
        // else: 350

        if(onlineCount <= 10) {
            return 60;
        } else if(onlineCount <= 20) {
            return 120;
        } else if(onlineCount <= 30) {
            return 200;
        } else if(onlineCount <= 60) {
            return 240;
        } else if(onlineCount <= 100) {
            return 300;
        } else {
            return 350;
        }
    }
    return 0;
}

updateFishingTag(job) {
	if(job == FISHING_LS_JOB_ID || job == FISHING_LV_JOB_ID) {
        new string[290];

        format(string, sizeof(string), "{ffffff}ID: {AB0000}#%d{FFFFFF}\n{ffffff}Job: {AB0000}%s{FFFFFF}\nLevel: {AB0000}%d{FFFFFF}\n{FFFFFF}Bam {AB0000}Y{FFFFFF} de nhan cong viec.\n{FFFFFF}Bam {AB0000}N{FFFFFF} de thoat viec.", job, JobInfo[job][jName], JobInfo[job][jLevel]);
        format(string, sizeof(string), "%s\n\n{ffffff}So ca trong ho: {FF0000}%d{FFFFFF}", string, JobInfo[job][jAttemptPerHour]);

        DestroyDynamic3DTextLabel(JobInfo[job][jLabel]);
        JobInfo[job][jLabel] = CreateDynamic3DTextLabel(string, -1, JobInfo[job][jPosX], JobInfo[job][jPosY], JobInfo[job][jPosZ], 25, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, -1, -1, -1, 100.0);
    }
}