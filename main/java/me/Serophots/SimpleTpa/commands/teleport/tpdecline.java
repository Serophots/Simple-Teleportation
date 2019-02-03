package me.Serophots.SimpleTpa.commands.teleport;

import me.Serophots.SimpleTpa.Main;
import me.Serophots.SimpleTpa.utils;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;

public class tpdecline implements CommandExecutor {
	private Main plugin;
	public tpdecline(Main plugin) {
		this.plugin = plugin;
		plugin.getCommand("tpdecline").setExecutor(this);
	}
	@Override
	public boolean onCommand(CommandSender sender, Command cmd, String string, String[] args) {
		if(sender instanceof Player) {
			int length = args.length;
			Player p = (Player) sender;
			if(!p.hasPermission(plugin.getConfig().getString("coreCommands.tpnoPerm"))) {
				p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpNoPerm").replace("{prefix}", plugin.getConfig().getString("prefix"))));
				return false;
			}
			if(length == 0) {
				Main.tpa.remove(p);
				Main.tpaHere.remove(p);
				p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpnoMessage").replace("{prefix}", plugin.getConfig().getString("prefix"))));
			}else {
				p.sendMessage(utils.chat(plugin.getConfig().getString("incorrectArgs")));
			}
		}else {
			sender.sendMessage("Console cannot run this command!");
		}
		return false;
	}
}
