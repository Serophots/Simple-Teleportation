package me.Serophots.SimpleTpa.commands.teleport;

import me.Serophots.SimpleTpa.Main;
import me.Serophots.SimpleTpa.databases.TpLog;
import me.Serophots.SimpleTpa.utils;
import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;

public class tpaccept implements CommandExecutor {
	private Main plugin;
	public tpaccept(Main plugin) {
		this.plugin = plugin;
		plugin.getCommand("tpaccept").setExecutor(this);
	}
	@Override
	public boolean onCommand(CommandSender sender, Command cmd, String string, String[] args) {
		if(sender instanceof Player) {
			int length = args.length;
			Player p = (Player) sender;
			if(!p.hasPermission(plugin.getConfig().getString("coreCommands.tpyesPerm"))) {
				p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpNoPerm").replace("{prefix}", plugin.getConfig().getString("prefix"))));
				return false;
			}
			if(length == 0) {
				if(Main.tpa.get(p) != null) {
					Player target = Main.tpa.get(p);
					target.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpyesMessageToTarget").replace("{prefix}", plugin.getConfig().getString("prefix")).replace("{player}", p.getName()).replace("{timer}", plugin.getConfig().getString("coreCommands.tpaWarmup"))));
					p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpyesMessage").replace("{prefix}", plugin.getConfig().getString("prefix")).replace("{target}", target.getName()).replace("{timer}", plugin.getConfig().getString("coreCommands.tpaWarmup"))));
					
					Bukkit.getScheduler().scheduleSyncDelayedTask(plugin, () -> {
						Location targetLocation = Main.tpaLocation.get(target.getUniqueId());
						if(targetLocation.getBlockX() == target.getLocation().getBlockX() && targetLocation.getBlockY() == target.getLocation().getBlockY() && targetLocation.getBlockZ() == target.getLocation().getBlockZ()){
							Main.lastLocation.put(target.getUniqueId(), target.getLocation());
							target.teleport(p);
							Main.tpa.remove(p);
							Main.tpaCooldown.put(target.getUniqueId(), System.currentTimeMillis());
							TpLog.addLog(target.getName() + " teleported to " + p.getName() + " DETAILS: /tpa");
						}else{
							p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpaMoved").replace("{prefix}", plugin.getConfig().getString("prefix")).replace("{player}", target.getName())));
							target.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpaMoved").replace("{prefix}", plugin.getConfig().getString("prefix")).replace("{player}", target.getName())));
							Main.tpa.remove(p);
						}
					}, plugin.getConfig().getInt("coreCommands.tpaWarmup") * 20);
				}else if(Main.tpaHere.get(p) != null){
					Player target = Main.tpaHere.get(p);
					target.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpyesMessageToTarget").replace("{prefix}", plugin.getConfig().getString("prefix")).replace("{player}", p.getName()).replace("{timer}", plugin.getConfig().getString("coreCommands.tpaWarmup"))));
					p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpyesMessage").replace("{prefix}", plugin.getConfig().getString("prefix")).replace("{target}", target.getName()).replace("{timer}", plugin.getConfig().getString("coreCommands.tpaWarmup"))));
					Main.tpaLocation.put(p.getUniqueId(), p.getLocation());
					Bukkit.getScheduler().scheduleSyncDelayedTask(plugin, () -> {
						Location targetLocation = Main.tpaLocation.get(p.getUniqueId());
						if(targetLocation.getBlockX() == p.getLocation().getBlockX() && targetLocation.getBlockY() == p.getLocation().getBlockY() && targetLocation.getBlockZ() == p.getLocation().getBlockZ()){
							Main.lastLocation.put(p.getUniqueId(), p.getLocation());
							p.teleport(target);
							Main.tpa.remove(p);
							Main.tpaCooldown.put(target.getUniqueId(), System.currentTimeMillis());
							TpLog.addLog(p.getName() + " teleported to " + target.getName() + " DETAILS: /tpahere");
						}else{
							p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpaMoved").replace("{prefix}", plugin.getConfig().getString("prefix")).replace("{player}", target.getName())));
							target.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpaMoved").replace("{prefix}", plugin.getConfig().getString("prefix")).replace("{player}", target.getName())));
							Main.tpaHere.remove(p);
						}
					}, plugin.getConfig().getInt("coreCommands.tpaWarmup") * 20);
				}else{
					p.sendMessage(utils.chat(plugin.getConfig().getString("coreCommands.tpyesNotValid").replace("{prefix}", plugin.getConfig().getString("prefix"))));
				}
			}else {
				p.sendMessage(utils.chat(plugin.getConfig().getString("incorrectArgs")));
			}
		}else {
			sender.sendMessage("Console cannot run this command!");
		}
		return false;
	}
}
