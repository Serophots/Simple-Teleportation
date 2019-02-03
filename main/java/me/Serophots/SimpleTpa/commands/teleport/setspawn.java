package me.Serophots.SimpleTpa.commands.teleport;

import me.Serophots.SimpleTpa.Main;
import me.Serophots.SimpleTpa.utils;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;

public class setspawn implements CommandExecutor {
    private Main plugin;
    public setspawn(Main plugin){
        this.plugin = plugin;
        plugin.getCommand("setspawn").setExecutor(this);
    }

    @Override
    public boolean onCommand(CommandSender sender, Command cmd, String string, String[] args) {
        if(sender instanceof Player){
            Player p = (Player) sender;
            p.getWorld().setSpawnLocation(p.getLocation().getBlockX(), p.getLocation().getBlockY() + 1, p.getLocation().getBlockZ());
            p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.setspawnMessage").replace("{prefix}", plugin.getConfig().getString("prefix")).replace("{location}", p.getLocation().getBlockX() + " " + (p.getLocation().getBlockY() + 1) + " " + p.getLocation().getBlockZ())));
        }
        return false;
    }
}
