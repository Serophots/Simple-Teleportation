package me.Serophots.SimpleTpa.databases;

import me.Serophots.SimpleTpa.Main;
import org.bukkit.command.CommandSender;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TpLog {

    public static String getDateString() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh:mm");
        return sdf.format(new Date());
    }

    public static File tpLog;

    public static void init(String path) {
        try {

            tpLog = new File(path + "/message.log");
            if (!tpLog.getParentFile().exists())
                tpLog.getParentFile().mkdirs();
            if (!tpLog.exists()) {
                tpLog.createNewFile();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void addLog(String log) {
        try {
            File filename = tpLog;
            FileWriter fw = new FileWriter(filename,true);
            fw.write("[" + getDateString() + "] " + log + "\n");
            fw.close();
        } catch(IOException ioe) {
            System.err.println("IOException: " + ioe.getMessage());
        }
    }
    public static void clearLog(CommandSender staff) {
        tpLog.delete();
        init(Main.plugin.getDataFolder().getPath());
        addLog("Log was cleared by " + staff.getName());
    }
}
