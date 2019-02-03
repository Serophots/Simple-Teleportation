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
	
	public static ItemStack createItem(Inventory inv, String material, int amount, int slot, int shortId, String displayName, String... loreString) {
		ItemStack item;
		List<String> lore = new ArrayList();
		
		item = new ItemStack(Material.getMaterial(material), amount, (short) shortId);
		
		ItemMeta meta = item.getItemMeta();
		meta.setDisplayName(utils.chat(displayName));
		
		for(String s : loreString) {
			lore.add(utils.chat(s));
		}
		
		meta.setLore(lore);
		item.setItemMeta(meta);
		
		inv.setItem(slot - 1, item);
		
		return item;
	}
	public static ItemStack createItem(Inventory inv, String material, int amount, int slot, int shortId, String displayName, List<String> loreString) {
		ItemStack item;
		
		item = new ItemStack(Material.getMaterial(material), amount, (short) shortId);
		
		ItemMeta meta = item.getItemMeta();
		meta.setDisplayName(utils.chat(displayName));
		
		meta.setLore(utils.chat(loreString));
		item.setItemMeta(meta);
		
		inv.setItem(slot - 1, item);
		
		return item;
	}
}
