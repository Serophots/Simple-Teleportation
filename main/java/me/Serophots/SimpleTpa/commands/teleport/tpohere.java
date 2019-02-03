package me.Serophots.SimpleTpa.commands.teleport;

import me.Serophots.SimpleTpa.Main;
import me.Serophots.SimpleTpa.utils;
import org.bukkit.Bukkit;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;

public class tpohere implements CommandExecutor {
	private Main plugin;
	public tpohere(Main plugin) {
		this.plugin = plugin;
		plugin.getCommand("tpohere").setExecutor(this);
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
			if(length == 1) {
				Player target = Bukkit.getPlayer(args[0]);
				if(target == null) {
					p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpUnknownPlayer").replace("{prefix}", plugin.getConfig().getString("prefix"))));
					return false;
				}
				Main.lastLocation.put(target.getUniqueId(), target.getLocation());
				target.teleport(p);
				p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpohereMessage").replace("{prefix}", plugin.getConfig().getString("prefix")).replace("{target}", target.getName())));
			}else {
				p.sendMessage(utils.chat(plugin.getConfig().getString("incorrectArgs")));
			}
		}else {
			sender.sendMessage("Console cannot run this command!");
		}
		return false;
	}
}
