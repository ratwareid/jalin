import task.GenerateReportTask;
import task.SendAlertTask;

import java.util.*;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/***********************************************************************
 * Module:  PACKAGE_NAME.Main
 * Author:  Ratwareid
 * Created: 07/09/2023
 * Info:  If You dont know me ? Just type ratwareid in google.
 ***********************************************************************/

public class Main {

    public static void main(String[] args){

        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

        // Mengatur waktu untuk menjalankan task
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0); // Mengatur jam eksekusi (misalnya, pukul 00:00)
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);

        Date dailyExecutionTime = calendar.getTime();
        long initialDelay = dailyExecutionTime.getTime() - System.currentTimeMillis();

        String[] clientReport = {"JLN","ABC"};

        // Menjadwalkan task
        scheduler.scheduleAtFixedRate(new SendAlertTask(), 0, 1, TimeUnit.DAYS);
        scheduler.scheduleAtFixedRate(new GenerateReportTask(clientReport), 0, 1, TimeUnit.DAYS);
    }


}