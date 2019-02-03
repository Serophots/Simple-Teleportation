package me.Serophots.SimpleTpa.commands.teleport;

import me.Serophots.SimpleTpa.Main;
import me.Serophots.SimpleTpa.utils;
import org.bukkit.Bukkit;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;

public class tpall implements CommandExecutor {
	private Main plugin;
	public tpall(Main plugin) {
		this.plugin = plugin;
		plugin.getCommand("tpall").setExecutor(this);
	}
	@Override
	public boolean onCommand(CommandSender sender, Command cmd, String string, String[] args) {
		if(sender instanceof Player) {
			int length = args.length;
			Player p = (Player) sender;
			if(!p.hasPermission(plugin.getConfig().getString("coreCommands.tpoherePerm"))) {
				p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpNoPerm").replace("{prefix}", plugin.getConfig().getString("prefix"))));
				return false;
			}
			if(length == 0) {
				for(Player target : Bukkit.getOnlinePlayers()) {
					Main.lastLocation.put(target.getUniqueId(), target.getLocation());
					target.teleport(p);
				}
				p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpohereMessage").replace("{prefix}", plugin.getConfig().getString("prefix")).replace("{target}", "&4EVERYONE&a")));
			}else {
				p.sendMessage(utils.chat(plugin.getConfig().getString("incorrectArgs")));
			}
		}else {
			sender.sendMessage("Console cannot run this command!");
		}
		return false;
	}
}
