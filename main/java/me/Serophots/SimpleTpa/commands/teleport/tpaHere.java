package me.Serophots.SimpleTpa.commands.teleport;

import me.Serophots.SimpleTpa.Main;
import me.Serophots.SimpleTpa.utils;
import org.bukkit.Bukkit;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;

public class tpaHere implements CommandExecutor {
	private Main plugin;
	public tpaHere(Main plugin) {
		this.plugin = plugin;
		plugin.getCommand("tpahere").setExecutor(this);
	}
	@Override
	public boolean onCommand(CommandSender sender, Command cmd, String string, String[] args) {
		if(sender instanceof Player) {
			int length = args.length;
			Player p = (Player) sender;
			if(!p.hasPermission(plugin.getConfig().getString("coreCommands.tpaPerm"))) {
				p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpNoPerm").replace("{prefix}", plugin.getConfig().getString("prefix"))));
				return false;
			}
			if(Main.tpaCooldown.containsKey(p.getUniqueId())) {
				if(System.currentTimeMillis() - Main.tpaCooldown.get(p.getUniqueId()) <= plugin.getConfig().getInt("coreCommands.tpaCooldown") * 1000){
					p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpaCooldownMessage").replace("{timer}", String.valueOf(plugin.getConfig().getInt("coreCommands.tpaCooldown") - ((System.currentTimeMillis() - Main.tpaCooldown.get(p.getUniqueId()))/1000)) ).replace("{prefix}", plugin.getConfig().getString("prefix"))));
					return false;
				}
			}
			if(length == 1) {
				Player target = Bukkit.getPlayer(args[0]);
				if(target.getName().equals(p.getName())){
					p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.teleportToSelf").replace("{prefix}", plugin.getConfig().getString("prefix"))));
					return false;
				}
				if(target == null) {
					p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpUnknownPlayer").replace("{prefix}", plugin.getConfig().getString("prefix"))));
					return false;
				}
				target.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpaHereMessageToTarget").replace("{prefix}", plugin.getConfig().getString("prefix")).replace("{player}", p.getName())));
				p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpaHereMessage").replace("{prefix}", plugin.getConfig().getString("prefix")).replace("{target}", target.getName()).replace("{timer}", plugin.getConfig().getString("coreCommands.tpaExpiration")))); //Make sure to replace {timer} with something
				Main.tpaHere.put(target, p);
				Main.tpaLocation.put(p.getUniqueId(), p.getLocation());
				Bukkit.getScheduler().scheduleSyncDelayedTask(plugin, () -> {
					Main.tpa.remove(target);
					p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpaExpirationMessage").replace("{prefix}", plugin.getConfig().getString("prefix")).replace("{target}", target.getName())));
				}, plugin.getConfig().getInt("coreCommands.tpaExpiration") * 20);
			}else {
				p.sendMessage(utils.chat(plugin.getConfig().getString("incorrectArgs")));
			}
		}else {
			sender.sendMessage("Console cannot run this command!");
		}
		return false;
	}
}
