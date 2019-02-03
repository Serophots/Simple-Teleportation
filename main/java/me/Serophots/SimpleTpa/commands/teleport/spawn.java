package me.Serophots.SimpleTpa.commands.teleport;

import me.Serophots.SimpleTpa.Main;
import me.Serophots.SimpleTpa.utils;
import org.bukkit.Bukkit;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;

public class spawn implements CommandExecutor {
    private Main plugin;
    public spawn(Main plugin){
        this.plugin = plugin;
        plugin.getCommand("spawn").setExecutor(this);
    }

    @Override
    public boolean onCommand(CommandSender sender, Command cmd, String string, String[] args) {
        if(sender instanceof Player){
            Player p = (Player) sender;
            p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.spawnMessage").replace("{prefix}", plugin.getConfig().getString("prefix")).replace("{timer}", String.valueOf(plugin.getConfig().getInt("coreCommands.tpaWarmup")))));
            Bukkit.getScheduler().scheduleSyncDelayedTask(plugin, () -> {
                Main.lastLocation.put(p.getUniqueId(), p.getLocation());
                p.teleport(p.getWorld().getSpawnLocation());
            }, plugin.getConfig().getInt("coreCommands.tpaWarmup") * 20);
        }else{
            sender.sendMessage("Console cannot run this command!");
        }
        return false;
    }
}
