package me.Serophots.SimpleTpa;

import me.Serophots.SimpleTpa.commands.teleport.*;
import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.player.AsyncPlayerChatEvent;
import org.bukkit.plugin.java.JavaPlugin;

import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.UUID;

public final class Main extends JavaPlugin implements Listener {
    public static Main plugin;

    public static HashMap<Player, Player> tpa = new HashMap<>();
    public static HashMap<Player, Player> tpaHere = new HashMap<>();
    public static HashMap<UUID, Long> tpaCooldown = new HashMap<>();
    public static HashMap<UUID, Location> tpaLocation = new HashMap<>();
    public static HashMap<UUID, Location> lastLocation = new HashMap<>();

    @Override
    public void onEnable() {
        plugin = this;
        new back(this);
        new setspawn(this);
        new spawn(this);
        new tpa(this);
        new tpaccept(this);
        new tpaHere(this);
        new tpall(this);
        new tpdecline(this);
        new tpo(this);
        new tpohere(this);
    }

    public void sendPacket(Player player, Object packet) {
        try {
            Object handle = player.getClass().getMethod("getHandle").invoke(player);
            Object playerConnection = handle.getClass().getField("playerConnection").get(handle);
            playerConnection.getClass().getMethod("sendPacket", getNMSClass("Packet")).invoke(playerConnection, packet);
        }

        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Class<?> getNMSClass(String name) {
        String version = Bukkit.getServer().getClass().getPackage().getName().split("\\.")[3];
        try {
            return Class.forName("net.minecraft.server." + version + "." + name);
        }

        catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }
}
