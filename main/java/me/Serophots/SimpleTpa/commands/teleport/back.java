package me.Serophots.SimpleTpa.commands.teleport;

import me.Serophots.SimpleTpa.Main;
import me.Serophots.SimpleTpa.utils;
import org.bukkit.Bukkit;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;

public class back implements CommandExecutor {
    private Main plugin;
    public back(Main plugin){
        this.plugin = plugin;
        plugin.getCommand("back").setExecutor(this);
    }

    @Override
    public boolean onCommand(CommandSender sender, Command cmd, String string, String[] args) {
        if(sender instanceof Player){
            Player p = (Player) sender;
            if(Main.lastLocation.containsKey(p.getUniqueId())){
                p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.backMessage").replace("{prefix}", plugin.getConfig().getString("prefix")).replace("{timer}", String.valueOf(plugin.getConfig().getInt("coreCommands.tpaWarmup")))));
                Bukkit.getScheduler().scheduleSyncDelayedTask(plugin, () -> {
                    p.teleport(Main.lastLocation.get(p.getUniqueId()));
                    Main.lastLocation.put(p.getUniqueId(), p.getLocation());
                }, plugin.getConfig().getInt("coreCommands.tpaWarmup") * 20);
            }else{
                p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.backUnknownLocation").replace("{prefix}", plugin.getConfig().getString("prefix"))));
            }
        }else{
            sender.sendMessage("Console cannot run this command!");
        }
        return false;
    }
}
