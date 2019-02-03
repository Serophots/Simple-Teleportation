package me.Serophots.SimpleTpa;

import org.bukkit.Bukkit;
import org.bukkit.ChatColor;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ItemMeta;

import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.List;

public class utils {
	public static String chat(String s) {
		return ChatColor.translateAlternateColorCodes('&', s);
	}

	public static List<String> chat(List<String> strings) {
	    List<String> list = new ArrayList();
	    for (String string : strings) {
	      list.add(org.bukkit.ChatColor.translateAlternateColorCodes('&', string));
	    }
	    return list;
	}
}
