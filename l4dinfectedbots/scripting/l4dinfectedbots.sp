/********************************************************************************************
* Plugin	: L4D/L4D2 InfectedBots (Versus Coop/Coop Versus)
* Version	: 2.3.1
* Game		: Left 4 Dead 1 & 2
* Author	: djromero (SkyDavid, David) and MI 5 and Harry Potter
* Testers	: Myself, MI 5
* Website	: https://forums.alliedmods.net/showpost.php?p=2699220&postcount=1371
* 
* Purpose	: This plugin spawns infected bots in L4D1, and gives greater control of the infected bots in L4D1/L4D2.
* 
* WARNING	: Please use sourcemod's latest 1.7 branch snapshot.
* Version 2.3.1
	   - added reward sound in coop/survival/realism for real infected player.
	   - prevet real infected player from fall damage in coop/survival/realism.
	   - fixes the music glitch, added ClientCommand(client, "music_dynamic_stop_playing) when spawn;

* Version 2.3.0
	   - fixed client console error "Material effects/spawn_sphere has bad reference count 0 when being bound" spam when playing infected in non-versus mode.
	   - special max limit now counts tank in all gamemode.
	   - added PlayerLeftStartTimer.
	   - fixed no infected bots issue when reload/load this plugin during the game.
	   - added new event "round_end", "map_transition", "mission_lost", "finale_vehicle_leaving" as round end.
	   - fixed special max limit not correct when map change or reload/load this plugin during the game .
	   - check infected team max slots limit for players when player changes team to infected team in coop/realism/survival.
	   - deleted TankFrustStop.
	   - added player ghost check when tank player frustrated.
	   - fixed Ghost TankBugFix in coop/realism.
	   - updated gamedata, add signature "NextBotCreatePlayerBot<Tank>"

* Version 2.2.7
	   - fixed bug that wrong respawn timer when playing infected in coop/realism/survival mode.

* Version 2.2.6
	   - adjust special limit and tank health depends on 4+ ALIVE survivor players"
	   - port l4d1
	   - 10 seconds can not suicide after infected player spawn

* Version 2.2.5
	   - Add Convar "l4d_infectedbots_sm_zs_disable_gamemode".
	   - Fixed "l4d_infectedbots_coordination" not working with tank.

* Version 2.2.4
	   - Add Translation.
	   - Fixed "l4d_infectedbots_coordination" not working.
	   - Improve new syntax code.
	   - Add Translation.

* Version 2.2.3
	   - Add Convar "l4d_infectedbots_adjust_tankhealth_enable"

* Version 2.2.2
	   - Fixed l4d_infectedbots_safe_spawn error
	   - Add Convar "l4d_infectedbots_tank_spawn_probability"
	   - Fixed Spawn Witch error

* Version 2.2.1
	   - Infected Player can't suicide if he got survivor
	   - Kill Tank if tank player frustrated in coop/survival
	   - Player will be killed if enter ghost state in coop/survival
	   - Removed Convar "l4d_infectedbots_ghost_spawn"

* Version 2.2.0
	   - Convert all to New Syntax
	   - Add Convar "l4d_infectedbots_reduced_spawn_times_on_player"
	   - Add Convar "l4d_infectedbots_safe_spawn"
	   - Add Convar "l4d_infectedbots_spawn_range_min" 
	   - Add Convar "l4d_infectedbots_spawn_range_max"
	   - Add Convar "l4d_infectedbots_spawn_range_final"
	   - Add Convar "l4d_infectedbots_witch_spawn_time_max",
	   - Add Convar "l4d_infectedbots_witch_spawn_time_min"
	   - Add Convar "l4d_infectedbots_witch_spawn_final"
	   - Add Convar "l4d_infectedbots_witch_lifespan"
	   - Add Convar "l4d_infectedbots_add_specials_scale"
	   - Add Convar "l4d_infectedbots_add_tankhealth_scale"

* Version 2.1.5
	   - Add sm_zlimit - control max special zombies limit (adm only)
	   - Add sm_timer - control special zombies spawn timer (adm only)
	   - Removed TurnNightVisionOn, use Another TurnFlashlightOn Model without signature

* Version 2.1.4
	   - Fixed "l4d_infectedbots_max_specials" and "l4d_infectedbots_add_specials" not working 

* Version 2.1.3
	   - Add Convar "l4d_infectedbots_witch_max_limit", Sets the maximum limit for witches spawned by the plugin (does not affect director witches)
	   - Remove TurnFlashlightOn since TurnFlashlightOn signature is broken and cause server crash
	   - Add TurnNightVisionOn for infected player in coop/survival
	   - Add sm_zs for infected player to suicide if stuck
	   
* Version 2.1.2
	   - Fixed tank spawn bug
	   - Fixed Not enough space on the stack "BotTypeNeeded"

* Version 2.1.1
	   - Defines how many special infected according to current player numbers
	   - Defines Tank Health according to current player numbers

* Version 2.1.0
	   - Remove some Ai improvements cvar
	   
* Version 2.0.0
* 	   - Fixed error that would occur on OnPluginEnd
* 
* Version 1.9.9
* 	   - Fixed bug where the plugin would break under the new DLC
* 
* Version 1.9.8
* 	   
* 	   Cvars Renamed:
*	   - l4d_infectedbots_infected_team_joinable has been renamed to l4d_infectedbots_coop_versus
* 	   - l4d_infectedbots_admins_only has been renamed to l4d_infectedbots_admin_coop_versus
* 	   - l4d_infectedbots_jointeams_announce has been renamed to l4d_infectedbots_coop_versus_announce
* 	   - l4d_infectedbots_human_coop_survival_limit has been renamed to l4d_infectedbots_coop_versus_human_limit
* 	   - l4d_infectedbots_coop_survival_tank_playable has been renamed to l4d_infectedbots_coop_versus_tank_playable
* 	   
* 	   - Added l4d_infectedbots_versus_coop cvar, forces all players onto the infected side in versus against survivor bots
* 	   - Changed the Round Start event trigger
* 	   - l4d_infectedbots_adjust_spawn_times cvar added, if set to 1, it adjusts the spawn timers depending on the gamemode (depends on infected players in versus, survivors in coop)
* 	   - Enhanced Jockey and Spitter AI for versus (Removed delay between jockey jumps, and spitter now attacks the moment she recharges)
* 	   - Director class limits for survival that are changed using an server config  at startup will no longer reset to their defaults
* 	   - l4d_infectedbots_admin_coop_versus and l4d_infectedbots_coop_versus_announce is now defaulted to 0 (off)
* 	   - Fixed bug in scavenge where bots would not spawn
* 
* Version 1.9.7
* 	   - Added compatibilty for Four Swordsmen, Hard Eight, Healthapocalypse and Gib Fest
* 	   - Fixed bug created by Valve that would ghost the tank if there was an infected player in coop/survival
* 	   - Removed l4d_infectedbots_instant_spawns cvar and replaced it with l4d_infectedbots_initial_spawn_timer
* 	   - Changed how the cheat command found valid clients
* 
* Version 1.9.6
* 	   - Fixed bug in L4D 1 where the map would restart after completion
* 	   - Added Tank spawning to the plugin with cvar l4d_infectedbots_tank_limit
* 	   - Added support for Versus Survival
* 	   - Plugin class limits no longer affect director spawn limits due to the director not obeying the limits (ie: l4d_infectedbots_boomer_limit no longer affects z_boomer_limit)
* 
* Version 1.9.5
* 	   - Removed incorrect gamemode message, plugin will assume unknown gamemodes/mutations are based on coop
* 	   - Fixed spitter acid glitch
* 	   - Compatible with "Headshot!" mutation
* 	   - Added cvar l4d_infectedbots_spawns_disabled_tank: disables infected bot spawning when a tank is in play
* 
* Version 1.9.4
* 	   - Compatible with new mutations: Last Man On Earth, Chainsaw Massacre and Room for One
* 
* Version 1.9.3
* 	   - Added support for chainsaws gamemode
* 	   - Changed how the plugin detected dead/alive players
* 	   - Changed code that used GetEntData/SetEntData to GetEntProp/SetEntProp
* 	   - Fixed typo in detecting the game
* 	   - Fixed an error caused by line 4300
* 
* Version 1.9.2
* 	   - Fixed bug with clients joining infected automatically when l4d_infectedbots_admins_only was set to 1
* 	   - Fixed some error messages that pop up from certain events
* 	   - Re-added feature: Bots in versus or scavenger will now ghost before they spawn completely
* 	   - Added cvar: l4d_infectedbots_ghost_time
*	   - Renamed cvar: l4d_infectedbots_idle_time_before_slay to l4d_infectedbots_lifespan 
* 	   - Removed cvar: l4d_infectedbots_timer_hurt_before_slay (it's now apart of l4d_infectedbots_lifespan)
* 	   - l4d_infectedbots_lifespan timer now kicks instead of slaying the infected
* 	   - If an infected sees the survivors when his lifespan timer is up, the timer will be made anew (prevents infected being kicked while they are attacking or nearby)
* 	   - (for coop/survival only) When a tank spawns and then kicked for a player to take over, there is now a check to see if the tank for the player to take over actually spawned successfully
* 	   - Plugin is now compatible with the new mutation gamemode and any further mutations
* 
* Version 1.9.1 V3
* 	   - Fixed bug with bot spawns (especially with 4+ infected bots)
* 	   - Fixed an error that was caused when the plugin was unloaded
* 
* Version 1.9.1 V2
* 	   - Fixed bug with server hibernation that was caused by rewrite of round start code (thanks Lexantis)
* 
* Version 1.9.1
* 	   - Changed Round start code which fixed a bug with survival (and possibly other gamemodes)
* 	   - Changed how the class limit cvars work, they can now be used to alter director spawning cvars (z_smoker_limit, z_hunter_limit, etc.)
* 	   - l4d_infectedbots_hunter_limit cvar added to L4D
* 	   - Added cvar l4d_infectedbots_instant_spawns, allows the plugin to instantly spawn the infected at the start of a map and the start of finales
* 	   - Fixed bug where survivors were slayed for no reason
* 	   - Fixed bug where Valve's bots would still spawn on certain maps
* 	   - Added cvar l4d_infectedbots_human_coop_survival_limit
* 	   - Added cvar l4d_infectedbots_admins_only
* 	   - Changed how the "!js" function worked, no longer uses jointeam (NEW GAMEDATA FILE BECAUSE OF THIS)
* 	   - Class limit cvars by this plugin no longer affect z_versus class player limits (l4d_infectedbots_smoker_limit for example no longer affects z_versus_smoker_limit)
*	   - Altered descriptions of the class limit cvars
* 
* Version 1.9.0
*      - Workaround implemented to get around Coop Limit (L4D2)
* 	   - REALLY fixed the 4+1 bug now
* 	   - REALLY fixed the survivor bots running out of the safe room bug
* 	   - Fixed bug where setting l4d_infectedbots_spawn_time to 5 or below would not spawn bots
* 	   - Removed cvar l4d_infectedbots_spawn_time and added cvars l4d_infectedbots_spawn_max_time and l4dinfectedbots_spawn_min_time
*	   - Changed code on how the game is detected on startup
* 	   - Removed FCVAR_NOTIFY from all cvars except the version cvar
* 	   - If l4d_infectedbots_infected_team_joinable is 0, plugin will not set sb_all_bot_team to 1
* 	   - Infected HUD can now display multiple tanks on fire along with the tank's health
* 	   - Coop tank takeover now supports multiple tanks
* 	   - Fixed bug where some players would not ghost in coop when they first spawn in a map
* 	   - Removed most instances where the plugin would cause a BotType error
* 	   - L4D bot spawning changed, now random like L4D2 instead of prioritized classes
* 	   - Fixed bug where players would be stuck at READY and never spawn
* 
* Version 1.8.9
* 	   - Gamedata file uses Signatures instead of offsets
* 	   - Enabling Director Spawning in Versus will activate Valve's bots
* 	   - Reverted back to original way of joining survivors (jointeam instead of sb_takecontrol)
* 	   - Bots no longer run out of the safe room before a player joins into the game
* 	   - Fixed bug when a tank spawned and its special infected taken over by a bot, would be able to spawn again if it died such as 4+1 bot
* 
* Version 1.8.8
* 	   - Disables Valve's versus bots automatically
* 	   - Based on AtomicStryker's version (fixes z_spawn bug along with gamemode bug)
* 	   - Removed L4D seperate plugin, this one plugin supports both
* 	   - Fixed strange ghost speed bug
* 	   - Added Flashlights and FreeSpawning for both L4D and L4D2 without resorting to changing gamemodes
* 	   - Now efficiently unlocks a versus start door when there are no players on infected (L4D 1 only)
* 
* Version 1.8.7
* 	   - Fixed Infected players not spawning correctly
* 
* Version 1.8.6
* 	   - Added a timer to the Gamemode ConVarHook to ensure compatitbilty with other gamemode changing plugins
* 	   - Fight or die code added by AtomicStryker (kills idle bots, very useful for coordination cvar) along with two new cvars: l4d2_infectedbots_idle_time_before_slay and l4d2_infectedbots_timer_hurt_before_slay
* 	   - Fixed bug where the plugin would return the BotType error even though the sum of the class limits matched that of the cvar max specials
* 	   - When the plugin is unloaded, it resets the convars that it changed
* 	   - Fixed bug where if Free Spawning and Director Spawning were on, it would cause the gamemode to stay on versus
* 
* Version 1.8.5
* 	   - Optimizations by AtomicStryker
* 	   - Removed "Multiple tanks" code from plugin
* 	   - Redone tank kicking code
* 	   - Redone tank health fix (Thanks AtomicStryker!)
* 
* Version 1.8.4
* 	   - Adapted plugin to new gamemode "teamversus" (4x4 versus matchmaking)
*	   - Fixed bug where Survivor bots didn't have their health bonuses count 
* 	   - Added FCVAR_SPONLY to cvars to prevent clients from changing server cvars
* 
* Version 1.8.3
* 	   - Enhanced Hunter AI (Hunter bots pounce farther, versus only)
* 	   - Model detection methods have been replaced with class detections (Compatible with Character Select Menu)
* 	   - Fixed VersusDoorUnlocker not working on the second round
* 	   - Added cvar l4d_infectedbots_coordination (bots will wait until all other bot spawn timers are 0 and then spawn at once)
* 
* Version 1.8.2
* 	   - Added Flashlights to the infected
* 	   - Prevented additional music from playing when spawning as an infected
* 	   - Redid the free spawning system, more robust and effective
* 	   - Fixed bug where human tanks would break z_max_player_zombies (Now prevents players from joining a full infected team in versus when a tank spawns)
* 	   - Redid the VersusDoorUnlocker, now activates without restrictions
* 	   - Fixed bug where tanks would keep spawning over and over
* 	   - Fixed bug where the HUD would display the tank on fire even though it's not
* 	   - Increased default spawn time to 30 seconds
* 
* Version 1.8.1 Fix V1
* 	   - Changed safe room detection (fixes Crash Course and custom maps) (Thanks AtomicStryker!)
* 
* Version 1.8.1
* 	   - Reverted back to the old kicking system
* 	   - Fixed Tank on fire timer for survival
* 	   - Survivor players can no longer join a full infected team in versus when theres a tank in play
* 	   - When a tank spawns in coop, they are not taken over by a player instantly; instead they are stationary until the tank moves, and then a player takes over (Thanks AtomicStryker!)
* 
* Version 1.8.0
* 	   - Fixed bug where the sphere bubbles would come back after the player dies
* 	   - Fixed additional bugs coming from the "mp_gamemode/server.cfg" bug
* 	   - Now checks if the admincheats plugin is installed and adapts
* 	   - Fixed Free spawn bug that prevent players from spawning as ghosts on the third map (or higher) on a campaign
* 	   - Fixed bug with spawn restrictions (was counting dead players as alive)
* 	   - Added ConVarHooks to Infected HUD cvars (will take effect immediately after being changed)
* 	   - Survivor Bots won't move out of the safe room until the player is fully in game
* 	   - Bots will not be shown on the infected HUD when they are not supposed to be (being replaced by a player on director spawn mode, or a tank being kicked for a player tank to take over)
* 
* Version 1.7.9
* 	   - Fixed a rare bug where if a map changed and director spawning is on, it would not allow the infected to be playable
* 	   - Removed Sphere bubbles for infected and spectators
* 	   - Modified Spawn restriction system
* 	   - Fixed bug where changing class limits on the spot would not take effect immediately
* 	   - Removed infected bot ghosts in versus, caused too many bugs
* 	   - Director spawn can now be changed in-game without a restart
* 	   - The Gamemode being changed no longer needs a restart
* 	   - Fixed bug where if admincheats is installed and an admin picked to spawn infected did not have root, would not spawn the infected
* 	   - Fixed bug where players could not spawn as ghosts in versus if the gamemode was set in a server.cfg instead of the l4d dedicated server tool (which still has adverse effects, plugin or not)
* 
* Version 1.7.8
* 	   - Removed The Dedibots, Director and The Spawner, from spec, the bots still spawn and is still compatible with admincheats (fixes 7/8 human limit reached problem)
* 	   - Changed the format of some of the announcements
* 	   - Reduced size of HUD
* 	   - HUD will NOT show infected players unless there are more than 5 infected players on the team (Versus only)
* 	   - KillInfected function now only applies to survival at round start
* 	   - Fixed Tank turning into hunter problem
* 	   - Fixed Special Smoker bug and other ghost related problems
* 	   - Fixed music glitch where certain pieces of music would keep playing over and over
* 	   - Fixed bug when a SI bot dies in versus with director spawning on, it would keep spawning that bot
* 	   - Fixed 1 health point bug in director spawning mode
* 	   - Fixed Ghost spawning bug in director spawning mode where all ghosts would spawn at once
* 	   - Fixed Coop Tank lottery starting for versus
* 	   - Fixed Client 0 error with the Versus door unlocker
* 	   - Added cvar: l4d_infectedbots_jointeams_announce
* 
* Version 1.7.7
* 	   - Support for admincheats (Thanks Whosat for this!)
* 	   - Reduced Versus checkpoint door unlocker timer to 10 seconds (no longer shows the message)
* 	   - Redone Versus door buster, now it simply unlocks the door
* 	   - Fixed Director Spawning bug when free spawn is turned on
* 	   - Added spawn timer to Director Spawning mode to prevent one player from taking all the bots
* 	   - Now shows respawn timers for bots in Versus
* 	   - When a player takes over a tank in coop/survival, the SI no longer disappears
* 	   - Redone Tank Lottery (Thanks AtomicStryker!)
* 	   - There is no limit on player tanks now
* 	   - Entity errors should be fixed, valid checks implemented
* 	   - Cvars that were changed by the plugin can now be changed with a server.cfg
*      - Director Spawning now works correctly when the value is changed from being 0 or 1
* 	   - Infected HUD now shows the health of the infected, rather than saying "ALIVE"
* 	   - Fixed Ghost bug on Survival start after a round (Kills all ghosts)
* 	   - Tank Health now shown properly in infected HUD
* 	   - Changed details of the infected HUD when Director Spawning is on
* 	   - Reduced the chances of the stats board appearing
* 
* Version 1.7.6
* 	   - Finale Glitch is fixed completely, no longer runs on timers
* 	   - Fixed bug with spawning when Director Spawning is on
* 	   - Added cvar: l4d_infectedbots_stats_board, can turn the stats board on or off after an infected dies
* 	   - Optimizations here and there
* 	   - Added a random system where the tank can go to anyone, rather than to the first person on the infected team
* 	   - Fixed bug where 4 specials would spawn when the tank is playable and on the field
* 	   - Fixed Free spawn bug where laggy players would not be ghosted
* 	   - Errors related to "SetEntData" have been fixed
* 	   - MaxSpecials is no longer linked to Director Spawning
* 
* Version 1.7.5
* 	   - Added command to join survivors (!js)
* 	   - Removed cvars: l4d_infectedbots_allow_boomer, l4d_infectedbots_allow_smoker and l4d_infectedbots_allow_hunter (redundent with new cvars)
* 	   - Added cvars: l4d_infectedbots_boomer_limit and l4d_infectedbots_smoker_limit
*	   - Added cvar: l4d_infectedbots_infected_team_joinable, cvar that can either allow or disallow players from joining the infected team on coop/survival
* 	   - Cvars renamed:  l4d_infectedbots_max_player_zombies to l4d_infectedbots_max_specials, l4d_infectedbots_tank_playable to l4d_infectedbots_coop_survival_tank_playable
* 	   - Bug fix with l4d_infectedbots_max_specials and l4d_infectedbots_director_spawn not setting correctly when the server first starts up
* 	   - Improved Boomer AI in versus (no longer sits there for a second when he is seen)
* 	   - Autoconfig (was applied in 1.7.4, just wasn't shown in the changelog) Be sure to delete your old one
* 	   - Reduced the chances of the director misplacing a bot
* 	   - If the tank is playable in coop or survival, a player will be picked as the tank, regardless of the player's status
* 	   - Fixed bug where the plugin may return "[L4D] Infected Bots: CreateFakeClient returned 0 -- Infected bot was not spawned"
* 	   - Removed giving health to infected when they spawn, they no longer need this as Valve fixed this bug
* 	   - Tank_killed game event was not firing due to the tank not being spawned by the director, this has been fixed by setting it in the player_death event and checking to see if it was a tank
* 	   - Fixed human infected players causing problems with infected bot spawning
* 	   - Added cvar: l4d_infectedbots_free_spawn which allows the spawning in coop/survival to be like versus (Thanks AtomicStryker for using some of your code from your infected ghost everywhere plugin!)
*	   - If there is only one survivor player in versus, the safe room door will be UTTERLY DESTROYED.    
* 	   - Open slots will be available to tanks by automatically increasing the max infected limit and decreasing when the tanks are killed
*	   - Bots were not spawning during a finale. This bug has been fixed.
* 	   - Fixed Survivor death finale glitch which would cause all player infected to freeze and not spawn
* 	   - Added a HUD that shows stats about Infected Players of when they spawn (from Durzel's Infected HUD plugin)
* 	   - Priority system added to the spawning in coop/survival, no longer does the first infected player always get the first infected bot that spawns
* 	   - Modified Spawn Restrictions
* 	   - Infected bots in versus now spawn as ghosts, and fully spawn two seconds later
* 	   - Removed commands that kicked with ServerCommand, this was causing crashes
* 	   - Added a check in coop/survival to put players on infected when they first join if the survivor team is full
* 	   - Removed cvar: l4d_infectedbots_hunter_limit
* 
* Version 1.7.4
* 	   - Fixed bots spawning too fast
* 	   - Completely fixed Ghost bug (Ghosts will stay ghosts until the play spawns them)
* 	   - New cvar "l4d_infectedbots_tank_playable" that allows tanks to be playable on coop/survival
* 
* Version 1.7.3
* 	   - Removed timers altogether and implemented the "old" system
* 	   - Fixed server hibernation problem
* 	   - Fixed error messages saying "Could not use ent_fire without cheats"
* 	   - Fixed Ghost spawning infront of survivors
* 	   - Set the spawn time to 25 seconds as default
* 	   - Fixed Checking bot mechanism
* 
* Version 1.7.2a
* 	   - Fixed bots not spawning after a checkpoint
* 	   - Fixed handle error
* 
* Version 1.7.2
*      - Removed autoconfig for plugin (delete your autoconfig for this plugin if you have one)
*      - Reintroduced coop/survival playable spawns
*      - spawns at conistent intervals of 20 seconds
*      - Overhauled coop special infected cvar dectection, use z_versus_boomer_limit, z_versus_smoker_limit, and l4d_infectedbots_versus_hunter_limit to alter amount of SI in coop (DO NOT USE THESE CVARS IF THE DIRECTOR IS SPAWNING THE BOTS! USE THE STANDARD COOP CVARS)
*      - Timers implemented for preventing the SI from spawning right at the start
*      - Fixed bug in 1.7.1 where the improved SI AI would reset to old after a map change
* 	   - Added a check on game start to prevent survivor bots from leaving the safe room too early when a player connects
* 	   - Added cvar to control the spawn time of the infected bots (can change at anytime and will take effect at the moment of change)
* 	   - Added cvar to have the director control the spawns (much better coop experience when max zombie players is set above 4), this however removes the option to play as those spawned infected
*	   - Removed l4d_infectedbots_coop_enabled cvar, l4d_infectedbots_director_spawn now replaces it. You can still use l4d_infectedbots_max_players_zombies
* 	   - New kicking mechanism added, there shouldn't be a problem with bots going over the limit
* 	   - Easier to join infected in coop/survival with the sm command "!ji"
* 	   - Introduced a new kicking mechanism, there shouldn't be more than the max infected unless there is a tank
* 
* Version 1.7.1
*      - Fixed Hunter AI where the hunter would run away and around in circles after getting hit
*      - Fixed Hunter Spawning where the hunter would spawn normally for 5 minutes into the map and then suddenly won't respawn at all
*      - An all Survivor Bot team can now pass the areas where they got stuck in (they can move throughout the map on their own now)     
*      - Changed l4d_versus_hunter_limit to l4d_infectedbots_versus_hunter_limit with a new default of 4
*      - It is now possible to change l4d_infectedbots_versus_hunter_limit and l4d_infectedbots_max_player_zombies in-game, just be sure to restart the map after change
*      - Overhauled the plugin, removed coop/survival infected spawn code, code clean up
* 
* Version 1.7.0
*      - Fixed sb_all_bot_team 1 is now set at all times until there are no players in the server.
*      - Survival/Coop now have playable Special Infected spawns.
*      - l4d_infectedbots_enabled_on_coop cvar created for those who want control over the plugin during coop/survival maps.
*      - Able to spectate AI Special Infected in Coop/Survival.
*      - Better AI (Smoker and Boomer don't sit there for a second and then attack a survivor when its within range).
*      - Set the number of VS team changes to 99 if its survival or coop, 2 for versus
*      - Safe Room timer added to coop/survival
*      - l4d_versus_hunter_limit added to control the amount of hunters in versus
*      - l4d_infectedbots_max_player_zombies added to increase the max special infected on the map (Bots and players)
*      - Autoexec created for this plugin
* 
* Version 1.6.1
* 		- Changed some routines to prevent crash on round end.
* 
* Version 1.6
* 		- Finally fixed issue of server hanging on mapchange or when last player leaves.
* 		  Thx to AcidTester for his help testing this.
* 		- Added cvar to disable infected bots HUD
* 
* Version 1.6
* 		- Fixed issue of HUD's timer not beign killed after each round.
* Version 1.5.8
* 		- Removed the "kickallbots" routine. Used a different method.
* 
* Version 1.5.6
* 		- Rollback on method for detecting if map is VS
* 
* Version 1.5.5
* 		- Fixed some issues with infected boomer bots spawning just after human boomer is killed.
* 		- Changed method of detecting VS maps to allow non-vs maps to use this plugin.
* 
* Version 1.5.4
* 		- Fixed (now) issue when all players leave and server would keep playing with only
* 		  survivor/infected bots.
* 
* Version 1.5.3
* 		- Fixed issue when boomer/smoker bots would spawn just after human boomer/smoker was
* 		  killed. (I had to hook the player_death event as pre, instead of post to be able to
* 		  check for some info).
* 		- Added new cvar to control the way you want infected spawn times handled:
* 			l4d_infectedbots_normalize_spawntime:
* 				0 (default): Human zombies will use default spawn times (min time if less 
* 							 than 3 players in team) (min default is 20)
* 				1		   : Bots and human zombies will have the same spawn time.
* 							 (max default is 30).
* 		- Fixed issue when all players leave and server would keep playing with only
* 	 	  survivor/infected bots.
* 
* Version 1.5.2
* 		- Normalized spawn times for human zombies (min = max).
* 		- Fixed spawn of extra bot when someone dead becomes a tank. If player was alive, his
* 		  bot will still remain if he gets a tank.
* 		- Added 2 new cvars to disallow boomer and/or smoker bots:
* 			l4d_infectedbots_allow_boomer = 1 (allow, default) / 0 (disallow)
* 			l4d_infectedbots_allow_smoker = 1 (allow, default) / 0 (disallow)
* 
* Version 1.5.1
* 		- Major bug fixes that caused server to hang (infite loops and threading problems).
* 
* Version 1.5
* 		- Added HUD panel for infected bots. Original idea from: Durzel's Infected HUD plugin.
* 		- Added validations so that boomers and smokers do not spawn too often. A boomer can
* 		  only spawn (as a bot) after XX seconds have elapsed since the last one died.
* 		- Added/fixed some routines/validations to prevent memory leaks.
* 
* Version 1.4
* 		- Infected bots can spawn when a real player is dead or in ghost mode without forcing
* 		  them (real players) to spawn.
* 		- Since real players won't be forced to spawn, they won't spawn outside the map or
* 		  in places they can't get out (where only bots can get out).
* 
* Version 1.3
* 		- No infected bots are spawned if at least one player is in ghost mode. If a bot is 
* 		  scheduled to spawn but a player is in ghost mode, the bot will spawn no more than
* 		  5 seconds after the player leaves ghost mode (spawns).
* 		- Infected bots won't stay AFK if they spawn far away. They will always search for
* 		  survivors even if they're far from them.
* 		- Allows survivor's team to be all bots, since we can have all bots on infected's team.
* 
* Version 1.2
* 		- Fixed several bugs while counting players.
* 		- Added chat message to inform infected players (only) that a new bot has been spawned
* 
* Version 1.1.2
* 		- Fixed crash when counting 
* 
* Version 1.1.1
* 		- Fixed survivor's quick HUD refresh when spawning infected bots
* 
* Version 1.1
* 		- Implemented "give health" command to fix infected's hud & pounce (hunter) when spawns
* 
* Version 1.0
* 		- Initial release.
* 
* 
**********************************************************************************************/

#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <multicolors>

#pragma semicolon 1
#pragma newdecls required //強制1.7以後的新語法
#define PLUGIN_VERSION "2.3.1"

#define DEBUG 0

#define TEAM_SPECTATOR		1
#define TEAM_SURVIVORS 		2
#define TEAM_INFECTED 		3

#define ZOMBIECLASS_SMOKER	1
#define ZOMBIECLASS_BOOMER	2
#define ZOMBIECLASS_HUNTER	3
#define ZOMBIECLASS_SPITTER	4
#define ZOMBIECLASS_JOCKEY	5
#define ZOMBIECLASS_CHARGER	6
#define MODEL_LIGHT			"models/props_lighting/flashlight_dropped_01.mdl"
#define MAXENTITIES 2048
#define SUICIDE_TIME 10
#define DIRECTORSCRIPT_TYPE			"DirectorScript.MapScript.LocalScript.DirectorOptions"
#define MODEL_TANK "models/infected/hulk.mdl"
#define REWARD_SOUND "ui/littlereward.wav"

// Variables
static int InfectedRealCount; // Holds the amount of real infected players
static int InfectedBotCount; // Holds the amount of infected bots in any gamemode
static int InfectedBotQueue; // Holds the amount of bots that are going to spawn

static int GameMode; // Holds the GameMode, 1 for coop and realism, 2 for versus, teamversus, scavenge and teamscavenge, 3 for survival

static int TanksPlaying; // Holds the amount of tanks on the playing field
static int BoomerLimit; // Sets the Boomer Limit, related to the boomer limit cvar
static int SmokerLimit; // Sets the Smoker Limit, related to the smoker limit cvar
static int HunterLimit; // Sets the Hunter Limit, related to the hunter limit cvar
static int SpitterLimit; // Sets the Spitter Limit, related to the Spitter limit cvar
static int JockeyLimit; // Sets the Jockey Limit, related to the Jockey limit cvar
static int ChargerLimit; // Sets the Charger Limit, related to the Charger limit cvar

static int MaxPlayerZombies; // Holds the amount of the maximum amount of special zombies on the field
static int g_PlayerAddZombies;
static int g_PlayerAddTankHealth;
static int MaxPlayerTank; // Used for setting an additional slot for each tank that spawns
static int BotReady; // Used to determine how many bots are ready, used only for the coordination feature
static int ZOMBIECLASS_TANK; // This value varies depending on which L4D game it is, holds the the tank class value
static int GetSpawnTime[MAXPLAYERS+1]; // Used for the HUD on getting spawn times of players
static int iPlayersInServer;
static int iPlayersInSurvivorTeam = 0;


// Booleans
static bool b_HasRoundStarted; // Used to state if the round started or not
static bool b_HasRoundEnded; // States if the round has ended or not
static bool b_LeftSaveRoom; // States if the survivors have left the safe room
static bool canSpawnBoomer; // States if we can spawn a boomer (releated to spawn restrictions)
static bool canSpawnSmoker; // States if we can spawn a smoker (releated to spawn restrictions)
static bool canSpawnHunter; // States if we can spawn a hunter (releated to spawn restrictions)
static bool canSpawnSpitter; // States if we can spawn a spitter (releated to spawn restrictions)
static bool canSpawnJockey; // States if we can spawn a jockey (releated to spawn restrictions)
static bool canSpawnCharger; // States if we can spawn a charger (releated to spawn restrictions)
static bool DirectorSpawn; // Can allow either the director to spawn the infected (normal l4d behavior), or allow the plugin to spawn them
static bool SpecialHalt; // Loop Breaker, prevents specials spawning, while Director is spawning, from spawning again
static bool FinaleStarted; // States whether the finale has started or not
static bool WillBeTank[MAXPLAYERS+1]; // States whether that player will be the tank
//bool TankHalt; // Loop Breaker, prevents player tanks from spawning over and over
static bool TankWasSeen[MAXPLAYERS+1]; // Used only in coop, prevents the Sound hook event from triggering over and over again
static bool PlayerLifeState[MAXPLAYERS+1]; // States whether that player has the lifestate changed from switching the gamemode
static bool InitialSpawn; // Related to the coordination feature, tells the plugin to let the infected spawn when the survivors leave the safe room
static bool L4D2Version = false; // Holds the version of L4D; false if its L4D, true if its L4D2
static bool TempBotSpawned; // Tells the plugin that the tempbot has spawned
static bool AlreadyGhosted[MAXPLAYERS+1]; // Loop Breaker, prevents a player from spawning into a ghost over and over again
static bool AlreadyGhostedBot[MAXPLAYERS+1]; // Prevents bots taking over a player from ghosting
static bool SurvivalVersus;
static bool DirectorCvarsModified; // Prevents reseting the director class limit cvars if the server or admin modifed them
static bool PlayerHasEnteredStart[MAXPLAYERS+1];


// Handles
ConVar h_BoomerLimit; // Related to the Boomer limit cvar
ConVar h_SmokerLimit; // Related to the Smoker limit cvar
ConVar h_HunterLimit; // Related to the Hunter limit cvar
ConVar h_SpitterLimit; // Related to the Spitter limit cvar
ConVar h_JockeyLimit; // Related to the Jockey limit cvar
ConVar h_ChargerLimit; // Related to the Charger limit cvar
ConVar h_MaxPlayerZombies; // Related to the max specials cvar
ConVar h_PlayerAddZombiesScale;
ConVar h_PlayerAddZombies;
ConVar h_PlayerAddTankHealthScale; 
ConVar h_PlayerAddTankHealth; 
ConVar h_InfectedSpawnTimeMax; // Related to the spawn time cvar
ConVar h_InfectedSpawnTimeMin; // Related to the spawn time cvar
ConVar h_DirectorSpawn; // yeah you're getting the idea
ConVar h_CoopPlayableTank; // yup, same thing again
ConVar h_JoinableTeams; // Can you guess this one?
ConVar h_StatsBoard; // Oops, now we are
ConVar h_JoinableTeamsAnnounce;
ConVar h_Coordination;
ConVar h_idletime_b4slay;
ConVar h_InitialSpawn;
ConVar h_HumanCoopLimit;
ConVar h_AdminJoinInfected;
ConVar h_BotGhostTime;
ConVar h_DisableSpawnsTank;
ConVar h_TankLimit;
ConVar h_WitchLimit;
ConVar h_VersusCoop;
ConVar h_AdjustSpawnTimes;
ConVar h_InfHUD;
ConVar h_Announce ;
ConVar h_TankHealthAdjust;
ConVar h_TankHealth;
ConVar h_GameMode; 
ConVar h_Difficulty; 
ConVar cvarZombieHP[7];				// Array of handles to the 4 cvars we have to hook to monitor HP changes
ConVar h_SafeSpawn;
ConVar h_SpawnDistanceMin;
ConVar h_SpawnDistanceMax;
ConVar h_SpawnDistanceFinal;
ConVar h_WitchPeriodMax;
ConVar h_WitchPeriodMin;
ConVar h_WitchSpawnFinal;
ConVar h_WitchKillTime;
ConVar h_ReducedSpawnTimesOnPlayer;
ConVar h_SpawnTankProbability;
ConVar h_ZSDisableGamemode;

// Stuff related to Durzel's HUD (Panel was redone)
static int respawnDelay[MAXPLAYERS+1]; 			// Used to store individual player respawn delays after death
static int hudDisabled[MAXPLAYERS+1];				// Stores the client preference for whether HUD is shown
static int clientGreeted[MAXPLAYERS+1]; 			// Stores whether or not client has been shown the mod commands/announce
static int zombieHP[7];					// Stores special infected max HP
static bool isTankOnFire[MAXPLAYERS+1]		= false; 		// Used to store whether tank is on fire
static int burningTankTimeLeft[MAXPLAYERS+1]		= 0; 			// Stores number of seconds Tank has left before he dies
static bool roundInProgress 		= false;		// Flag that marks whether or not a round is currently in progress
static Handle PlayerLeftStartTimer = null; //Detect player has left safe area or not
static Handle infHUDTimer 		= null;	// The main HUD refresh timer
static Handle respawnTimer 	= null;	// Respawn countdown timer
static Handle doomedTankTimer 	= null;	// "Tank on Fire" countdown timer
static Handle delayedDmgTimer 	= null;	// Delayed damage update timer
static Panel pInfHUD;
static Handle usrHUDPref 		= null;	// Stores the client HUD preferences persistently
Handle FightOrDieTimer[MAXPLAYERS+1] = null; // kill idle bots
Handle KillWitchTimer[MAXENTITIES] = null;// kill idle witches
Handle hSpawnWitchTimer = null;
static float fPlayerSpawnEngineTime[MAXENTITIES] = 0.0; //time when real infected player spawns

static int i_OriginalMaxPlayerZombies;
int g_iClientColor[MAXPLAYERS+1], g_iClientIndex[MAXPLAYERS+1], g_iLightIndex[MAXPLAYERS+1];
int iPlayerTeam[MAXPLAYERS+1];
bool g_bSafeSpawn;
int iZSDisableGamemode;
char sSpawnCommand[32];
int g_iPlayerSpawn;
static Handle hSpec;
static Handle hSwitch;
static Handle hCreateTank = null;

public Plugin myinfo = 
{
	name = "[L4D/L4D2] Infected Bots (Coop/Versus/Realism/Scavenge/Survival)",
	author = "djromero (SkyDavid), MI 5, Harry Potter",
	description = "Spawns infected bots in versus, allows playable special infected in coop/survival, and changable z_max_player_zombies limit",
	version = PLUGIN_VERSION,
	url = "https://steamcommunity.com/id/TIGER_x_DRAGON/"
}

public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max) 
{
	EngineVersion test = GetEngineVersion();
	
	if( test == Engine_Left4Dead ) L4D2Version = false;
	else if( test == Engine_Left4Dead2 ) L4D2Version = true;
	else
	{
		strcopy(error, err_max, "Plugin only supports Left 4 Dead 1 & 2.");
		return APLRes_SilentFailure;
	}
	
	return APLRes_Success; 
}

public void OnPluginStart()
{
	LoadTranslations("l4dinfectedbots.phrases");

	// Tank Class value is different in L4D2
	if (L4D2Version)
	{
		ZOMBIECLASS_TANK = 8;
		sSpawnCommand = "z_spawn_old";
	}
	else
	{
		ZOMBIECLASS_TANK = 5;
		sSpawnCommand = "z_spawn";
	}
	
	// Notes on the offsets: altough m_isGhost is used to check or set a player's ghost status, for some weird reason this disallowed the player from spawning.
	// So I found and used m_isCulling to allow the player to press use and spawn as a ghost (which in this case, I forced the client to press use)
	
	// m_lifeState is an alternative to the "switching to spectator and back" method when a bot spawns. This was used to prevent players from taking over those bots, but
	// this provided weird movements when a player was spectating on the infected team.
	
	// ScrimmageType is interesting as it was used in the beta. The scrimmage code was abanonded and replaced with versus, but some of it is still left over in the final.
	// In the previous versions of this plugin (or not using this plugin at all), you might have seen giant bubbles or spheres around the map. Those are scrimmage spawn
	// spheres that were used to prevent infected from spawning within there. It was bothering me, and a whole lot of people who saw them. Thanks to AtomicStryker who
	// URGED me to remove the spheres, I began looking for a solution. He told me to use various source handles like m_scrimmageType and others. I experimented with it,
	// and found out that it removed the spheres, and implemented it into the plugin. The spheres are no longer shown, and they were useless anyway as infected still spawn 
	// within it.
	
	
	// Notes on the sourcemod commands:
	// JoinSpectator is actually a DEBUG command I used to see if the bots spawn correctly with and without a player. It was incredibly useful for this purpose, but it
	// will not be in the final versions.
	
	// Add a sourcemod command so players can easily join infected in coop/survival
	RegConsoleCmd("sm_ji", JoinInfected);
	RegConsoleCmd("sm_js", JoinSurvivors);
	RegConsoleCmd("sm_zs", ForceInfectedSuicide,"suicide myself (if infected get stuck or somthing)");
	RegAdminCmd("sm_zlimit", Console_ZLimit, ADMFLAG_SLAY,"control max special zombies limit");
	RegAdminCmd("sm_timer", Console_Timer, ADMFLAG_SLAY,"control special zombies spawn timer");
	#if DEBUG
	RegConsoleCmd("sm_sp", JoinSpectator);
	RegConsoleCmd("sm_gamemode", CheckGameMode);
	RegConsoleCmd("sm_count", CheckQueue);
	#endif
	
	// Hook "say" so clients can toggle HUD on/off for themselves
	RegConsoleCmd("sm_infhud", Command_Say);
	
	// We register the version cvar
	CreateConVar("l4d_infectedbots_version", PLUGIN_VERSION, "Version of L4D Infected Bots", FCVAR_SPONLY|FCVAR_REPLICATED|FCVAR_NOTIFY|FCVAR_DONTRECORD);
	
	h_GameMode = FindConVar("mp_gamemode");
	h_Difficulty = FindConVar("z_difficulty");
	
	// console variables
	h_BoomerLimit = CreateConVar("l4d_infectedbots_boomer_limit", "2", "Sets the limit for boomers spawned by the plugin", FCVAR_SPONLY, true, 0.0);
	h_SmokerLimit = CreateConVar("l4d_infectedbots_smoker_limit", "2", "Sets the limit for smokers spawned by the plugin", FCVAR_SPONLY, true, 0.0);
	h_HunterLimit = CreateConVar("l4d_infectedbots_hunter_limit", "2", "Sets the limit for hunters spawned by the plugin", FCVAR_SPONLY, true, 0.0);
	h_TankLimit = CreateConVar("l4d_infectedbots_tank_limit", "1", "Sets the limit for tanks spawned by the plugin (does not affect director tanks)", FCVAR_SPONLY, true, 0.0);
	h_WitchLimit = CreateConVar("l4d_infectedbots_witch_max_limit", "10", "Sets the limit for witches spawned by the plugin (does not affect director witches)", FCVAR_SPONLY, true, 0.0);
	if (L4D2Version)
	{
		h_SpitterLimit = CreateConVar("l4d_infectedbots_spitter_limit", "2", "Sets the limit for spitters spawned by the plugin", FCVAR_SPONLY, true, 0.0);
		h_JockeyLimit = CreateConVar("l4d_infectedbots_jockey_limit", "2", "Sets the limit for jockeys spawned by the plugin", FCVAR_SPONLY, true, 0.0);
		h_ChargerLimit = CreateConVar("l4d_infectedbots_charger_limit", "2", "Sets the limit for chargers spawned by the plugin", FCVAR_SPONLY, true, 0.0);
	}
	
	h_MaxPlayerZombies = CreateConVar("l4d_infectedbots_max_specials", "2", "Defines how many special infected can be on the map on all gamemodes(does not count witch on all gamemodes, count tank in all gamemode)", FCVAR_SPONLY, true, 0.0); 
	h_PlayerAddZombiesScale = CreateConVar("l4d_infectedbots_add_specials_scale", "2", "If server has more than 4+ alive players, how many special infected = 'max_specials' + [(alive players - 4) ÷ 'add_specials_scale' × 'add_specials'].", FCVAR_SPONLY, true, 1.0); 
	h_PlayerAddZombies = CreateConVar("l4d_infectedbots_add_specials", "2", "If server has more than 4+ alive players, increase the certain value to 'l4d_infectedbots_max_specials' each 'l4d_infectedbots_add_specials_scale' players joins", FCVAR_SPONLY, true, 0.0); 

	h_TankHealthAdjust = CreateConVar("l4d_infectedbots_adjust_tankhealth_enable", "1", "If 1, adjust and overrides tank health by this plugin.", FCVAR_SPONLY, true, 0.0,true, 1.0); 
	h_TankHealth = CreateConVar("l4d_infectedbots_default_tankhealth", "4000", "Sets Default Health for Tank", FCVAR_SPONLY, true, 1.0); 
	h_PlayerAddTankHealthScale = CreateConVar("l4d_infectedbots_add_tankhealth_scale", "1", "If server has more than 4+ alive players, how many Tank Health = 'default_tankhealth' + [(alive players - 4) ÷ 'add_tankhealth_scale' × 'add_tankhealth'].", FCVAR_SPONLY, true, 1.0); 
	h_PlayerAddTankHealth = CreateConVar("l4d_infectedbots_add_tankhealth", "500", "If server has more than 4+ alive players, increase the certain value to 'l4d_infectedbots_default_tankhealth' each 'l4d_infectedbots_add_tankhealth_scale' players joins", FCVAR_SPONLY, true, 0.0); 
	h_InfectedSpawnTimeMax = CreateConVar("l4d_infectedbots_spawn_time_max", "60", "Sets the max spawn time for special infected spawned by the plugin in seconds.", FCVAR_SPONLY, true, 1.0);
	h_InfectedSpawnTimeMin = CreateConVar("l4d_infectedbots_spawn_time_min", "40", "Sets the minimum spawn time for special infected spawned by the plugin in seconds.", FCVAR_SPONLY, true, 1.0);
	h_DirectorSpawn = CreateConVar("l4d_infectedbots_director_spawn", "0", "If 1, the plugin will use the director's timing of the spawns, if the game is L4D2 and versus, it will activate Valve's bots.", FCVAR_SPONLY, true, 0.0, true, 1.0);
	h_CoopPlayableTank = CreateConVar("l4d_infectedbots_coop_versus_tank_playable", "1", "If 1, tank will be playable in coop/survival", FCVAR_NOTIFY|FCVAR_SPONLY, true, 0.0, true, 1.0);
	h_JoinableTeams = CreateConVar("l4d_infectedbots_coop_versus", "1", "If 1, players can join the infected team in coop/survival (!ji in chat to join infected, !js to join survivors)", FCVAR_SPONLY, true, 0.0, true, 1.0);
	if (!L4D2Version)
	{
		h_StatsBoard = CreateConVar("l4d_infectedbots_stats_board", "0", "If 1, the stats board will show up after an infected player dies (L4D1 ONLY)", FCVAR_SPONLY, true, 0.0, true, 1.0);
	}
	h_JoinableTeamsAnnounce = CreateConVar("l4d_infectedbots_coop_versus_announce", "1", "If 1, clients will be announced to on how to join the infected team", FCVAR_SPONLY, true, 0.0, true, 1.0);
	h_Coordination = CreateConVar("l4d_infectedbots_coordination", "0", "If 1, bots will only spawn when all other bot spawn timers are at zero", FCVAR_SPONLY, true, 0.0, true, 1.0);
	h_InfHUD = CreateConVar("l4d_infectedbots_infhud_enable", "1", "Toggle whether Infected HUD is active or not.", FCVAR_SPONLY, true, 0.0, true, 1.0);
	h_Announce = CreateConVar("l4d_infectedbots_infhud_announce", "1", "Toggle whether Infected HUD announces itself to clients.", FCVAR_SPONLY, true, 0.0, true, 1.0);
	h_idletime_b4slay = CreateConVar("l4d_infectedbots_lifespan", "30", "Amount of seconds before a special infected bot is kicked", FCVAR_SPONLY, true, 1.0);
	h_InitialSpawn = CreateConVar("l4d_infectedbots_initial_spawn_timer", "10", "The spawn timer in seconds used when infected bots are spawned for the first time in a map", FCVAR_SPONLY, true, 0.0);
	h_HumanCoopLimit = CreateConVar("l4d_infectedbots_coop_versus_human_limit", "2", "Sets the limit for the amount of humans that can join the infected team in coop/survival", FCVAR_SPONLY, true, 0.0);
	h_AdminJoinInfected = CreateConVar("l4d_infectedbots_admin_coop_versus", "1", "If 1, only admins can join the infected team in coop/survival", FCVAR_SPONLY, true, 0.0, true, 1.0);
	h_BotGhostTime = CreateConVar("l4d_infectedbots_ghost_time", "1", "If higher than zero, the plugin will ghost bots before they fully spawn on versus/scavenge", FCVAR_SPONLY);
	h_DisableSpawnsTank = CreateConVar("l4d_infectedbots_spawns_disabled_tank", "0", "If 1, Plugin will disable spawning infected bot when a tank which has already seen the survivors is on the field.", FCVAR_SPONLY, true, 0.0, true, 1.0);
	h_VersusCoop = CreateConVar("l4d_infectedbots_versus_coop", "0", "If 1, The plugin will force all players to the infected side against the survivor AI for every round and map in versus/scavenge", FCVAR_SPONLY, true, 0.0, true, 1.0);
	h_AdjustSpawnTimes = CreateConVar("l4d_infectedbots_adjust_spawn_times", "1", "If 1, The plugin will adjust spawn timers depending on the gamemode", FCVAR_SPONLY, true, 0.0, true, 1.0);
	h_ReducedSpawnTimesOnPlayer = CreateConVar("l4d_infectedbots_adjust_reduced_spawn_times_on_player", "1", "Reduce certain value to maximum spawn timer based per alive player", FCVAR_SPONLY, true, 0.0);
	h_SafeSpawn = CreateConVar("l4d_infectedbots_safe_spawn", "0", "If 1, spawn special infected before survivors leave starting safe room area.", FCVAR_SPONLY, true, 0.0, true, 1.0);
	h_SpawnDistanceMin = CreateConVar("l4d_infectedbots_spawn_range_min", "550", "The minimum of spawn range for infected", FCVAR_NOTIFY, true, 0.0);
	h_SpawnDistanceMax = CreateConVar("l4d_infectedbots_spawn_range_max", "1500", "The maximum of spawn range for infected", FCVAR_NOTIFY, true, 1.0);
	h_SpawnDistanceFinal = CreateConVar("l4d_infectedbots_spawn_range_final", "300", "The minimum of spawn range for infected in final stage rescue", FCVAR_NOTIFY, true, 0.0);
	h_WitchPeriodMax = CreateConVar("l4d_infectedbots_witch_spawn_time_max", "120.0", "Sets the max spawn time for witch spawned by the plugin in seconds.", FCVAR_NOTIFY, true, 1.0);
	h_WitchPeriodMin = CreateConVar("l4d_infectedbots_witch_spawn_time_min", "90.0", "Sets the mix spawn time for witch spawned by the plugin in seconds.", FCVAR_NOTIFY, true, 1.0);
	h_WitchSpawnFinal = CreateConVar("l4d_infectedbots_witch_spawn_final", "0", "If 1, still spawn witch in final stage rescue", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	h_WitchKillTime = CreateConVar("l4d_infectedbots_witch_lifespan", "200", "Amount of seconds before a witch is kicked", FCVAR_NOTIFY, true, 1.0);
	h_SpawnTankProbability = CreateConVar("l4d_infectedbots_tank_spawn_probability", "5", "When each time spawn S.I., how much percent of chance to spawn tank", FCVAR_NOTIFY, true, 0.0, true, 100.0);
	h_ZSDisableGamemode = CreateConVar("l4d_infectedbots_sm_zs_disable_gamemode", "6", "Disable sm_zs in these gamemode (0: None, 1: coop/realism, 2: versus/scavenge, 4: survival, add numbers together)", FCVAR_NOTIFY, true, 0.0, true, 7.0);

	h_BoomerLimit.AddChangeHook(ConVarBoomerLimit);
	BoomerLimit = h_BoomerLimit.IntValue;
	h_SmokerLimit.AddChangeHook(ConVarSmokerLimit);
	SmokerLimit = h_SmokerLimit.IntValue;
	h_HunterLimit.AddChangeHook(ConVarHunterLimit);
	HunterLimit = h_HunterLimit.IntValue;
	if (L4D2Version)
	{
		h_SpitterLimit.AddChangeHook(ConVarSpitterLimit);
		SpitterLimit = h_SpitterLimit.IntValue;
		h_JockeyLimit.AddChangeHook(ConVarJockeyLimit);
		JockeyLimit = h_JockeyLimit.IntValue;
		h_ChargerLimit.AddChangeHook(ConVarChargerLimit);
		ChargerLimit = h_ChargerLimit.IntValue;
	}
	h_MaxPlayerZombies.AddChangeHook(ConVarMaxPlayerZombies);
	MaxPlayerZombies = h_MaxPlayerZombies.IntValue;
	h_PlayerAddZombies.AddChangeHook(ConVarPlayerAddZombies);
	g_PlayerAddZombies = h_PlayerAddZombies.IntValue;
	h_TankHealthAdjust.AddChangeHook(ConVarTankHealthAdjust);
	h_PlayerAddTankHealth.AddChangeHook(ConVarPlayerAddTankHealth);
	g_PlayerAddTankHealth = h_PlayerAddTankHealth.IntValue;
	h_DirectorSpawn.AddChangeHook(ConVarDirectorSpawn);
	DirectorSpawn = h_DirectorSpawn.BoolValue;
	h_GameMode.AddChangeHook(ConVarGameMode);
	h_Difficulty.AddChangeHook(ConVarDifficulty);
	h_VersusCoop.AddChangeHook(ConVarVersusCoop);
	h_JoinableTeams.AddChangeHook(ConVarCoopVersus);
	h_SpawnDistanceMin.AddChangeHook(ConVarDistanceChanged);
	h_SpawnDistanceMax.AddChangeHook(ConVarDistanceChanged);
	h_SpawnDistanceFinal.AddChangeHook(ConVarDistanceChanged);
	h_ZSDisableGamemode.AddChangeHook(ConVarZSDisableGamemodeChanged);
	h_SafeSpawn.AddChangeHook(hSafeSpawnChanged);

	// If the admin wanted to change the director class limits with director spawning on, the plugin will not reset those cvars to their defaults upon startup.
	
	FindConVar("z_hunter_limit").AddChangeHook(ConVarDirectorCvarChanged);
	if (!L4D2Version)
	{
		FindConVar("z_gas_limit").AddChangeHook(ConVarDirectorCvarChanged);
		FindConVar("z_exploding_limit").AddChangeHook(ConVarDirectorCvarChanged);
		FindConVar("holdout_max_boomers").AddChangeHook(ConVarDirectorCvarChanged);
		FindConVar("holdout_max_smokers").AddChangeHook(ConVarDirectorCvarChanged);
		FindConVar("holdout_max_hunters").AddChangeHook(ConVarDirectorCvarChanged);
		FindConVar("holdout_max_specials").AddChangeHook(ConVarDirectorCvarChanged);
	}
	else
	{
		FindConVar("z_smoker_limit").AddChangeHook(ConVarDirectorCvarChanged);
		FindConVar("z_boomer_limit").AddChangeHook(ConVarDirectorCvarChanged);
		FindConVar("z_jockey_limit").AddChangeHook(ConVarDirectorCvarChanged);
		FindConVar("z_spitter_limit").AddChangeHook(ConVarDirectorCvarChanged);
		FindConVar("z_charger_limit").AddChangeHook(ConVarDirectorCvarChanged);
		FindConVar("survival_max_boomers").AddChangeHook(ConVarDirectorCvarChanged);
		FindConVar("survival_max_smokers").AddChangeHook(ConVarDirectorCvarChanged);
		FindConVar("survival_max_hunters").AddChangeHook(ConVarDirectorCvarChanged);
		FindConVar("survival_max_jockeys").AddChangeHook(ConVarDirectorCvarChanged);
		FindConVar("survival_max_spitters").AddChangeHook(ConVarDirectorCvarChanged);
		FindConVar("survival_max_chargers").AddChangeHook(ConVarDirectorCvarChanged);
		FindConVar("survival_max_specials").AddChangeHook(ConVarDirectorCvarChanged);
	}
	
	// Some of these events are being used multiple times. Although I copied Durzel's code, I felt this would make it more organized as there is a ton of code in events 
	// Such as PlayerDeath, PlayerSpawn and others.
	
	HookEvent("round_start", evtRoundStart);
	HookEvent("round_end", evtRoundEnd);
	HookEvent("map_transition", evtRoundEnd); //戰役過關到下一關的時候 (沒有觸發round_end)
	HookEvent("mission_lost", evtRoundEnd); //戰役滅團重來該關卡的時候 (之後有觸發round_end)
	HookEvent("finale_vehicle_leaving", evtRoundEnd); //救援載具離開之時  (沒有觸發round_end)
	// We hook some events ...
	HookEvent("player_death", evtPlayerDeath, EventHookMode_Pre);
	HookEvent("player_team", evtPlayerTeam);
	HookEvent("player_spawn", evtPlayerSpawn);
	HookEvent("create_panic_event", evtSurvivalStart);
	HookEvent("finale_start", evtFinaleStart);
	HookEvent("player_death", evtInfectedDeath);
	HookEvent("player_spawn", evtInfectedSpawn);
	HookEvent("player_hurt", evtInfectedHurt);
	HookEvent("player_hurt", Player_Hurt);
	HookEvent("player_team", evtTeamSwitch);
	HookEvent("player_death", evtInfectedWaitSpawn);
	HookEvent("ghost_spawn_time", evtInfectedWaitSpawn);
	HookEvent("spawner_give_item", evtUnlockVersusDoor);
	HookEvent("player_bot_replace", evtBotReplacedPlayer);
	HookEvent("player_first_spawn", evtPlayerFirstSpawned);
	HookEvent("player_entered_start_area", evtPlayerFirstSpawned);
	HookEvent("player_entered_checkpoint", evtPlayerFirstSpawned);
	HookEvent("player_transitioned", evtPlayerFirstSpawned);
	HookEvent("player_left_start_area", evtPlayerFirstSpawned);
	HookEvent("player_left_checkpoint", evtPlayerFirstSpawned);
	HookEvent("tank_frustrated",evtTankFrustrated);
	HookEvent("witch_killed", Event_WitchKilled);
	HookEvent("witch_harasser_set", Event_WitchKilled);
	HookEvent("witch_spawn", Event_WitchSpawn);
	
	// Hook a sound
	AddNormalSoundHook(view_as<NormalSHook>(HookSound_Callback));
	
	// We set some variables
	b_HasRoundStarted = false;
	b_HasRoundEnded = false;
	
	
	//----- Zombie HP hooks ---------------------	
	//We store the special infected max HP values in an array and then hook the cvars used to modify them
	//just in case another plugin (or an admin) decides to modify them.  Whilst unlikely if we don't do
	//this then the HP percentages on the HUD will end up screwy, and since it's a one-time initialisation
	//when the plugin loads there's a trivial overhead.
	cvarZombieHP[0] = FindConVar("z_hunter_health");
	cvarZombieHP[1] = FindConVar("z_gas_health");
	cvarZombieHP[2] = FindConVar("z_exploding_health");
	if (L4D2Version)
	{
		cvarZombieHP[3] = FindConVar("z_spitter_health");
		cvarZombieHP[4] = FindConVar("z_jockey_health");
		cvarZombieHP[5] = FindConVar("z_charger_health");
	}
	cvarZombieHP[6] = FindConVar("z_tank_health");
	zombieHP[0] = 250;	// Hunter default HP
	if (cvarZombieHP[0] != null)
	{
		zombieHP[0] = cvarZombieHP[0].IntValue; 
		cvarZombieHP[0].AddChangeHook(cvarZombieHPChanged);
	}
	zombieHP[1] = 250;	// Smoker default HP
	if (cvarZombieHP[1] != null)
	{
		zombieHP[1] = cvarZombieHP[1].IntValue; 
		cvarZombieHP[1].AddChangeHook(cvarZombieHPChanged);
	}
	zombieHP[2] = 50;	// Boomer default HP
	if (cvarZombieHP[2] != null)
	{
		zombieHP[2] = cvarZombieHP[2].IntValue;
		cvarZombieHP[2].AddChangeHook(cvarZombieHPChanged);
	}
	if (L4D2Version)
	{
		zombieHP[3] = 100;	// Spitter default HP
		if (cvarZombieHP[3] != null) 
		{
			zombieHP[3] = cvarZombieHP[3].IntValue;
			cvarZombieHP[3].AddChangeHook(cvarZombieHPChanged);
		}
		zombieHP[4] = 325;	// Jockey default HP
		if (cvarZombieHP[4] != null) 
		{
			zombieHP[4] = cvarZombieHP[4].IntValue;
			cvarZombieHP[4].AddChangeHook(cvarZombieHPChanged);
		}
		zombieHP[5] = 600;	// Charger default HP
		if (cvarZombieHP[5] != null) 
		{
			zombieHP[5] = cvarZombieHP[5].IntValue;
			cvarZombieHP[5].AddChangeHook(cvarZombieHPChanged);
		}
	}
	
	// Create persistent storage for client HUD preferences 
	usrHUDPref = CreateTrie();
	
	i_OriginalMaxPlayerZombies = h_MaxPlayerZombies.IntValue;

	Handle hGameConf = LoadGameConfigFile("l4dinfectedbots");
	if( hGameConf != null )
	{
		StartPrepSDKCall(SDKCall_Player);
		PrepSDKCall_SetFromConf(hGameConf, SDKConf_Signature, "SetHumanSpec");
		PrepSDKCall_AddParameter(SDKType_CBasePlayer, SDKPass_Pointer);
		hSpec = EndPrepSDKCall();
		if( hSpec == null)
			SetFailState("Could not prep the \"SetHumanSpec\" function.");

		StartPrepSDKCall(SDKCall_Player);
		PrepSDKCall_SetFromConf(hGameConf, SDKConf_Signature, "TakeOverBot");
		PrepSDKCall_AddParameter(SDKType_Bool, SDKPass_Plain);
		hSwitch = EndPrepSDKCall();
		if( hSwitch == null)
			SetFailState("Could not prep the \"TakeOverBot\" function.");

		StartPrepSDKCall(SDKCall_Static);
		if (!PrepSDKCall_SetFromConf(hGameConf, SDKConf_Signature, "NextBotCreatePlayerBot<Tank>"))
			SetFailState("Unable to find NextBotCreatePlayerBot<Tank> signature in gamedata file.");
		PrepSDKCall_AddParameter(SDKType_String, SDKPass_Pointer);
		PrepSDKCall_SetReturnInfo(SDKType_CBasePlayer, SDKPass_Pointer);
		hCreateTank = EndPrepSDKCall();
		if (hCreateTank == null)
			SetFailState("Cannot initialize NextBotCreatePlayerBot<Tank> SDKCall, signature is broken.") ;
	}
	else
	{
		SetFailState("Unable to find l4dinfectedbots.txt gamedata file.");
	}
	delete hGameConf;

	// Removes the boundaries for z_max_player_zombies and notify flag
	int flags = FindConVar("z_max_player_zombies").Flags;
	SetConVarBounds(FindConVar("z_max_player_zombies"), ConVarBound_Upper, false);
	SetConVarFlags(FindConVar("z_max_player_zombies"), flags & ~FCVAR_NOTIFY);

	CreateTimer(0.5, HUDReset);
	CreateTimer(1.0, PluginStart);

	//Autoconfig for plugin
	AutoExecConfig(true, "l4dinfectedbots");
}

public void OnConfigsExecuted()
{
	i_OriginalMaxPlayerZombies = h_MaxPlayerZombies.IntValue;
	CreateTimer(1.0,ColdDown_Timer,_,TIMER_FLAG_NO_MAPCHANGE);
}

public void ConVarBoomerLimit(ConVar convar, const char[] oldValue, const char[] newValue)
{
	BoomerLimit = h_BoomerLimit.IntValue;
}
public void ConVarSmokerLimit(ConVar convar, const char[] oldValue, const char[] newValue)
{
	SmokerLimit = h_SmokerLimit.IntValue;
}

public void ConVarHunterLimit(ConVar convar, const char[] oldValue, const char[] newValue)
{
	HunterLimit = h_HunterLimit.IntValue;
}

public void ConVarSpitterLimit(ConVar convar, const char[] oldValue, const char[] newValue)
{
	SpitterLimit = h_SpitterLimit.IntValue;
}

public void ConVarJockeyLimit(ConVar convar, const char[] oldValue, const char[] newValue)
{
	JockeyLimit = h_JockeyLimit.IntValue;
}

public void ConVarChargerLimit(ConVar convar, const char[] oldValue, const char[] newValue)
{
	ChargerLimit = h_ChargerLimit.IntValue;
}

public void ConVarDirectorCvarChanged(ConVar convar, const char[] oldValue, const char[] newValue)
{
	DirectorCvarsModified = true;
}

public void ConVarMaxPlayerZombies(ConVar convar, const char[] oldValue, const char[] newValue)
{
	MaxPlayerZombies = h_MaxPlayerZombies.IntValue;
	CreateTimer(0.1, MaxSpecialsSet);
}

public void ConVarPlayerAddZombies(ConVar convar, const char[] oldValue, const char[] newValue)
{
	g_PlayerAddZombies = h_PlayerAddZombies.IntValue;
}

public void ConVarTankHealthAdjust(ConVar convar, const char[] oldValue, const char[] newValue)
{
	if(h_TankHealthAdjust.BoolValue) SetConVarInt(FindConVar("z_tank_health"), h_TankHealth.IntValue);
}

public void ConVarPlayerAddTankHealth(ConVar convar, const char[] oldValue, const char[] newValue)
{
	g_PlayerAddTankHealth = h_PlayerAddTankHealth.IntValue;
}

public void ConVarDirectorSpawn(ConVar convar, const char[] oldValue, const char[] newValue)
{
	DirectorSpawn = h_DirectorSpawn.BoolValue;
	if (!DirectorSpawn)
	{
		//ResetCvars();
		TweakSettings();
		CheckIfBotsNeeded(true, false);
	}
	else
	{
		//ResetCvarsDirector();
		DirectorStuff();
	}
}

public void ConVarGameMode(ConVar convar, const char[] oldValue, const char[] newValue)
{
	GameModeCheck();
	
	if (!DirectorSpawn)
	{
		//ResetCvars();
		TweakSettings();
	}
	else
	{
		//ResetCvarsDirector();
		DirectorStuff();
	}
}

public void ConVarDifficulty(ConVar convar, const char[] oldValue, const char[] newValue)
{
	TankHealthCheck();
}

public void ConVarVersusCoop(ConVar convar, const char[] oldValue, const char[] newValue)
{
	if (h_VersusCoop.BoolValue)
	{
		SetConVarInt(FindConVar("vs_max_team_switches"), 0);
		if (L4D2Version)
		{
			SetConVarInt(FindConVar("sb_all_bot_game"), 1);
			SetConVarInt(FindConVar("allow_all_bot_survivor_team"), 1);
		}
		else
		SetConVarInt(FindConVar("sb_all_bot_team"), 1);
	}
	else
	{
		SetConVarInt(FindConVar("vs_max_team_switches"), 1);
		if (L4D2Version)
		{
			SetConVarInt(FindConVar("sb_all_bot_game"), 0);
			SetConVarInt(FindConVar("allow_all_bot_survivor_team"), 0);
		}
		else
		SetConVarInt(FindConVar("sb_all_bot_team"), 0);
	}
}

public void hSafeSpawnChanged(ConVar convar, const char[] oldValue, const char[] newValue)
{
	g_bSafeSpawn = h_SafeSpawn.BoolValue;
}

public void ConVarZSDisableGamemodeChanged(ConVar convar, const char[] oldValue, const char[] newValue)
{
	iZSDisableGamemode = h_ZSDisableGamemode.IntValue;
}

public void ConVarDistanceChanged(ConVar convar, const char[] oldValue, const char[] newValue)
{	
	GetSpawnDisConvars();
}

public void ConVarCoopVersus(ConVar convar, const char[] oldValue, const char[] newValue)
{
	if (h_JoinableTeams)
	{
		if (L4D2Version)
		{
			SetConVarInt(FindConVar("sb_all_bot_game"), 1);
			SetConVarInt(FindConVar("allow_all_bot_survivor_team"), 1);
		}
		else
		SetConVarInt(FindConVar("sb_all_bot_team"), 1);
	}
	else
	{
		if (L4D2Version)
		{
			SetConVarInt(FindConVar("sb_all_bot_game"), 0);
			SetConVarInt(FindConVar("allow_all_bot_survivor_team"), 0);
		}
		else
		SetConVarInt(FindConVar("sb_all_bot_team"), 0);
	}
}

void TweakSettings()
{
	// We tweak some settings ...
	
	// Some interesting things about this. There was a bug I discovered that in versions 1.7.8 and below, infected players would not spawn as ghosts in VERSUS. This was
	// due to the fact that the coop class limits were not being reset (I didn't think they were linked at all, but I should have known better). This bug has been fixed
	// with the coop class limits being reset on every gamemode except coop of course.
	
	// Reset the cvars
	ResetCvars();
	
	switch (GameMode)
	{
		case 1: // Coop, We turn off the ability for the director to spawn the bots, and have the plugin do it while allowing the director to spawn tanks and witches, 
		// MI 5
		{
			// If the game is L4D 2...
			if (L4D2Version)
			{
				SetConVarInt(FindConVar("z_smoker_limit"), 0);
				SetConVarInt(FindConVar("z_boomer_limit"), 0);
				SetConVarInt(FindConVar("z_hunter_limit"), 0);
				SetConVarInt(FindConVar("z_spitter_limit"), 0);
				SetConVarInt(FindConVar("z_jockey_limit"), 0);
				SetConVarInt(FindConVar("z_charger_limit"), 0);
			}
			else
			{
				SetConVarInt(FindConVar("z_gas_limit"), 0);
				SetConVarInt(FindConVar("z_exploding_limit"), 0);
				SetConVarInt(FindConVar("z_hunter_limit"), 0);
			}
			SetConVarFloat(FindConVar("tank_ground_pound_duration"), 0.1);
			SetConVarInt(FindConVar("z_scrimmage_sphere"), 0);
		}
		case 2: // Versus, Better Versus Infected AI
		{
			// If the game is L4D 2...
			if (L4D2Version)
			{
				SetConVarInt(FindConVar("z_smoker_limit"), 0);
				SetConVarInt(FindConVar("z_boomer_limit"), 0);
				SetConVarInt(FindConVar("z_hunter_limit"), 0);
				SetConVarInt(FindConVar("z_spitter_limit"), 0);
				SetConVarInt(FindConVar("z_jockey_limit"), 0);
				SetConVarInt(FindConVar("z_charger_limit"), 0);
				SetConVarInt(FindConVar("z_jockey_leap_time"), 0);
				SetConVarInt(FindConVar("z_spitter_max_wait_time"), 0);
			}
			else
			{
				SetConVarInt(FindConVar("z_gas_limit"), 999);
				SetConVarInt(FindConVar("z_exploding_limit"), 999);
				SetConVarInt(FindConVar("z_hunter_limit"), 999);
			}
			// Enhance Special Infected AI
			SetConVarInt(FindConVar("hunter_leap_away_give_up_range"), 0);
			SetConVarInt(FindConVar("z_hunter_lunge_distance"), 5000);
			SetConVarInt(FindConVar("hunter_pounce_ready_range"), 1500);
			SetConVarFloat(FindConVar("hunter_pounce_loft_rate"), 0.055);
			SetConVarFloat(FindConVar("tank_ground_pound_duration"), 0.1);
			if (h_VersusCoop.BoolValue)
				SetConVarInt(FindConVar("vs_max_team_switches"), 0);
		}
		case 3: // Survival, Turns off the ability for the director to spawn infected bots in survival, MI 5
		{
			if (L4D2Version)
			{
				SetConVarInt(FindConVar("survival_max_smokers"), 0);
				SetConVarInt(FindConVar("survival_max_boomers"), 0);
				SetConVarInt(FindConVar("survival_max_hunters"), 0);
				SetConVarInt(FindConVar("survival_max_spitters"), 0);
				SetConVarInt(FindConVar("survival_max_jockeys"), 0);
				SetConVarInt(FindConVar("survival_max_chargers"), 0);
				SetConVarInt(FindConVar("survival_max_specials"), MaxPlayerZombies);
				SetConVarInt(FindConVar("z_smoker_limit"), 0);
				SetConVarInt(FindConVar("z_boomer_limit"), 0);
				SetConVarInt(FindConVar("z_hunter_limit"), 0);
				SetConVarInt(FindConVar("z_spitter_limit"), 0);
				SetConVarInt(FindConVar("z_jockey_limit"), 0);
				SetConVarInt(FindConVar("z_charger_limit"), 0);
			}
			else
			{
				SetConVarInt(FindConVar("holdout_max_smokers"), 0);
				SetConVarInt(FindConVar("holdout_max_boomers"), 0);
				SetConVarInt(FindConVar("holdout_max_hunters"), 0);
				SetConVarInt(FindConVar("holdout_max_specials"), MaxPlayerZombies);
				SetConVarInt(FindConVar("z_gas_limit"), 0);
				SetConVarInt(FindConVar("z_exploding_limit"), 0);
				SetConVarInt(FindConVar("z_hunter_limit"), 0);
			}
			SetConVarFloat(FindConVar("tank_ground_pound_duration"), 0.1);
			SetConVarInt(FindConVar("z_scrimmage_sphere"), 0);
		}
	}
	
	//Some cvar tweaks
	SetConVarInt(FindConVar("z_attack_flow_range"), 50000);
	SetConVarInt(FindConVar("director_spectate_specials"), 1);
	SetConVarInt(FindConVar("z_spawn_flow_limit"), 50000);
	DirectorCvarsModified = false;
	if (L4D2Version)
	{
		SetConVarInt(FindConVar("versus_special_respawn_interval"), 99999999);
	}
	#if DEBUG
	LogMessage("Tweaking Settings");
	#endif
	
}

void ResetCvars()
{
	#if DEBUG
	LogMessage("Plugin Cvars Reset");
	#endif

	if (GameMode == 1)
	{
		ResetConVar(FindConVar("tank_ground_pound_duration"), true, true);
		ResetConVar(FindConVar("z_scrimmage_sphere"), true, true);
		if (L4D2Version)
		{
			ResetConVar(FindConVar("survival_max_smokers"), true, true);
			ResetConVar(FindConVar("survival_max_boomers"), true, true);
			ResetConVar(FindConVar("survival_max_hunters"), true, true);
			ResetConVar(FindConVar("survival_max_spitters"), true, true);
			ResetConVar(FindConVar("survival_max_jockeys"), true, true);
			ResetConVar(FindConVar("survival_max_chargers"), true, true);
			ResetConVar(FindConVar("survival_max_specials"), true, true);
		}
		else
		{
			ResetConVar(FindConVar("holdout_max_smokers"), true, true);
			ResetConVar(FindConVar("holdout_max_boomers"), true, true);
			ResetConVar(FindConVar("holdout_max_hunters"), true, true);
			ResetConVar(FindConVar("holdout_max_specials"), true, true);
		}
	}
	else if (GameMode == 2)
	{
		if (L4D2Version)
		{
			ResetConVar(FindConVar("survival_max_smokers"), true, true);
			ResetConVar(FindConVar("survival_max_boomers"), true, true);
			ResetConVar(FindConVar("survival_max_hunters"), true, true);
			ResetConVar(FindConVar("survival_max_spitters"), true, true);
			ResetConVar(FindConVar("survival_max_jockeys"), true, true);
			ResetConVar(FindConVar("survival_max_chargers"), true, true);
			ResetConVar(FindConVar("survival_max_specials"), true, true);
		}
		else
		{
			ResetConVar(FindConVar("holdout_max_smokers"), true, true);
			ResetConVar(FindConVar("holdout_max_boomers"), true, true);
			ResetConVar(FindConVar("holdout_max_hunters"), true, true);
			ResetConVar(FindConVar("holdout_max_specials"), true, true);
		}
	}
	else if (GameMode == 3)
	{
		if (L4D2Version)
		{
			ResetConVar(FindConVar("z_smoker_limit"), true, true);
			ResetConVar(FindConVar("z_boomer_limit"), true, true);
			ResetConVar(FindConVar("z_hunter_limit"), true, true);
			ResetConVar(FindConVar("z_spitter_limit"), true, true);
			ResetConVar(FindConVar("z_jockey_limit"), true, true);
			ResetConVar(FindConVar("z_charger_limit"), true, true);
			ResetConVar(FindConVar("z_jockey_leap_time"), true, true);
			ResetConVar(FindConVar("z_spitter_max_wait_time"), true, true);
		}
		else
		{
			ResetConVar(FindConVar("z_gas_limit"), true, true);
			ResetConVar(FindConVar("z_exploding_limit"), true, true);
			ResetConVar(FindConVar("z_hunter_limit"), true, true);
		}
		ResetConVar(FindConVar("hunter_leap_away_give_up_range"), true, true);
		ResetConVar(FindConVar("z_hunter_lunge_distance"), true, true);
		ResetConVar(FindConVar("hunter_pounce_ready_range"), true, true);
		ResetConVar(FindConVar("hunter_pounce_loft_rate"), true, true);
		ResetConVar(FindConVar("tank_ground_pound_duration"), true, true);
		ResetConVar(FindConVar("z_scrimmage_sphere"), true, true);
	}
}


void ResetCvarsDirector()
{
	#if DEBUG
	LogMessage("Director Cvars Reset");
	#endif
	if (GameMode != 2)
	{
		if (L4D2Version)
		{
			ResetConVar(FindConVar("z_smoker_limit"), true, true);
			ResetConVar(FindConVar("z_boomer_limit"), true, true);
			ResetConVar(FindConVar("z_hunter_limit"), true, true);
			ResetConVar(FindConVar("z_spitter_limit"), true, true);
			ResetConVar(FindConVar("z_jockey_limit"), true, true);
			ResetConVar(FindConVar("z_charger_limit"), true, true);
			ResetConVar(FindConVar("survival_max_smokers"), true, true);
			ResetConVar(FindConVar("survival_max_boomers"), true, true);
			ResetConVar(FindConVar("survival_max_hunters"), true, true);
			ResetConVar(FindConVar("survival_max_spitters"), true, true);
			ResetConVar(FindConVar("survival_max_jockeys"), true, true);
			ResetConVar(FindConVar("survival_max_chargers"), true, true);
			ResetConVar(FindConVar("survival_max_specials"), true, true);
		}
		else
		{
			ResetConVar(FindConVar("z_hunter_limit"), true, true);
			ResetConVar(FindConVar("z_exploding_limit"), true, true);
			ResetConVar(FindConVar("z_gas_limit"), true, true);
			ResetConVar(FindConVar("holdout_max_smokers"), true, true);
			ResetConVar(FindConVar("holdout_max_boomers"), true, true);
			ResetConVar(FindConVar("holdout_max_hunters"), true, true);
			ResetConVar(FindConVar("holdout_max_specials"), true, true);
		}
	}
	else
	{
		if (L4D2Version)
		{
			//ResetConVar(FindConVar("z_smoker_limit"), true, true);
			SetConVarInt(FindConVar("z_smoker_limit"), 2);
			ResetConVar(FindConVar("z_boomer_limit"), true, true);
			//ResetConVar(FindConVar("z_hunter_limit"), true, true);
			SetConVarInt(FindConVar("z_hunter_limit"), 2);
			ResetConVar(FindConVar("z_spitter_limit"), true, true);
			ResetConVar(FindConVar("z_jockey_limit"), true, true);
			ResetConVar(FindConVar("z_charger_limit"), true, true);
		}
		else
		{
			ResetConVar(FindConVar("z_hunter_limit"), true, true);
			ResetConVar(FindConVar("z_exploding_limit"), true, true);
			ResetConVar(FindConVar("z_gas_limit"), true, true);
		}
	}
}

public Action evtRoundStart(Event event, const char[] name, bool dontBroadcast) 
{
	// If round has started ...
	if (b_HasRoundStarted)
		return;

	b_LeftSaveRoom = false;
	b_HasRoundEnded = false;

	if(!b_HasRoundStarted && g_iPlayerSpawn == 1)
	{
		CreateTimer(0.5, PluginStart);
	}

	b_HasRoundStarted = true;
}

public Action PluginStart(Handle timer)
{
	//Check the GameMode
	GameModeCheck();
	
	if (GameMode == 0)
		return;

	for (int i = 1; i <= MaxClients; i++)
	{
		respawnDelay[i] = 0;
		PlayerLifeState[i] = false;
		isTankOnFire[i] = false;
		burningTankTimeLeft[i] = 0;
		TankWasSeen[i] = false;
		AlreadyGhosted[i] = false;
	}

	//reset some variables
	InfectedBotQueue = 0;
	TanksPlaying = 0;
	BotReady = 0;
	FinaleStarted = false;
	SpecialHalt = false;
	InitialSpawn = false;
	TempBotSpawned = false;
	SurvivalVersus = false;

	// Added a delay to setting MaxSpecials so that it would set correctly when the server first starts up
	CreateTimer(0.4, MaxSpecialsSet);
	
	// This little part is needed because some events just can't execute when another round starts.
	if (GameMode == 2 && h_VersusCoop.BoolValue)
	{
		for (int i=1; i<=MaxClients; i++)
		{
			// We check if player is in game
			if (!IsClientInGame(i)) continue;
			// Check if client is survivor ...
			if (GetClientTeam(i)==TEAM_SURVIVORS)
			{
				// If player is a real player ... 
				if (!IsFakeClient(i))
				{
					ChangeClientTeam(i, TEAM_INFECTED);
				}
			}
		}
		
	}
	// Kill the player if they are infected and its not versus (prevents survival finale bug and player ghosts when there shouldn't be)
	if (GameMode != 2)
	{
		for (int i=1; i<=MaxClients; i++)
		{
			// We check if player is in game
			if (!IsClientInGame(i)) continue;
			// Check if client is infected ...
			if (GetClientTeam(i)==TEAM_INFECTED)
			{
				// If player is a real player ... 
				if (!IsFakeClient(i))
				{
					if (GameMode != 2 && h_JoinableTeams.BoolValue && h_JoinableTeamsAnnounce.BoolValue)
					{
						CreateTimer(10.0, AnnounceJoinInfected, i, TIMER_FLAG_NO_MAPCHANGE);
					}
					if (IsPlayerGhost(i))
					{
						CreateTimer(0.1, Timer_InfectedKillSelf, i, TIMER_FLAG_NO_MAPCHANGE);
					}
				}
			}
		}
	}
	
	// Check the Tank's health to properly display it in the HUD
	TankHealthCheck();
	// Start up TweakSettings or Director Stuff
	if (!DirectorSpawn)
		TweakSettings();
	else
		DirectorStuff();

	roundInProgress = true;
	if(infHUDTimer == null) infHUDTimer = CreateTimer(5.0, showInfHUD, _, TIMER_REPEAT);
	if (GameMode != 3)
	{
		#if DEBUG
			PrintToChatAll("PluginStart()!");
		#endif
		if(PlayerLeftStartTimer == null) PlayerLeftStartTimer = CreateTimer(5.0, PlayerLeftStart, _, TIMER_REPEAT);
	}

	if (h_JoinableTeams.BoolValue && GameMode != 2 || h_VersusCoop.BoolValue && GameMode == 2)
	{
		if (L4D2Version)
		{
			SetConVarInt(FindConVar("sb_all_bot_game"), 1);
			SetConVarInt(FindConVar("allow_all_bot_survivor_team"), 1);
		}
		else
			SetConVarInt(FindConVar("sb_all_bot_team"), 1);
	}

}

public Action evtPlayerFirstSpawned(Event event, const char[] name, bool dontBroadcast) 
{
	// This event's purpose is to execute when a player first enters the server. This eliminates a lot of problems when changing variables setting timers on clients, among fixing many sb_all_bot_team
	// issues.
	int client = GetClientOfUserId(event.GetInt("userid"));

	if (!client || IsFakeClient(client) || PlayerHasEnteredStart[client])
		return;
	
	#if DEBUG
		PrintToChatAll("Player has spawned for the first time");
	#endif

	// Versus Coop code, puts all players on infected at start, delay is added to prevent a weird glitch
	
	if (GameMode == 2 && h_VersusCoop.BoolValue)
		CreateTimer(0.1, Timer_VersusCoopTeamChanger, client, TIMER_FLAG_NO_MAPCHANGE);
	
	// Kill the player if they are infected and its not versus (prevents survival finale bug and player ghosts when there shouldn't be)
	if (GameMode != 2)
	{
		if (GetClientTeam(client)==TEAM_INFECTED)
		{
			if (IsPlayerGhost(client))
			{
				CreateTimer(0.1, Timer_InfectedKillSelf, client, TIMER_FLAG_NO_MAPCHANGE);
			}
		}
		if(h_JoinableTeams.BoolValue && h_JoinableTeamsAnnounce.BoolValue)
		{
			CreateTimer(10.0, AnnounceJoinInfected, client, TIMER_FLAG_NO_MAPCHANGE);
		}
	}
	
	PlayerHasEnteredStart[client] = true;
}

public Action Timer_VersusCoopTeamChanger(Handle Timer, int client)
{
	ChangeClientTeam(client, TEAM_INFECTED);
}

public Action Timer_InfectedKillSelf(Handle Timer, int client)
{
	ForcePlayerSuicide(client);
}

void GameModeCheck()
{
	#if DEBUG
	LogMessage("Checking Gamemode");
	#endif
	// We determine what the gamemode is
	char GameName[16];
	h_GameMode.GetString(GameName, sizeof(GameName));
	if (StrEqual(GameName, "survival", false))
		GameMode = 3;
	else if (StrEqual(GameName, "versus", false) || StrEqual(GameName, "teamversus", false) || StrEqual(GameName, "scavenge", false) || StrEqual(GameName, "teamscavenge", false) || StrEqual(GameName, "mutation12", false) || StrEqual(GameName, "mutation13", false) || StrEqual(GameName, "mutation15", false) || StrEqual(GameName, "mutation11", false))
		GameMode = 2;
	else if (StrEqual(GameName, "coop", false) || StrEqual(GameName, "realism", false) || StrEqual(GameName, "mutation3", false) || StrEqual(GameName, "mutation9", false) || StrEqual(GameName, "mutation1", false) || StrEqual(GameName, "mutation7", false) || StrEqual(GameName, "mutation10", false) || StrEqual(GameName, "mutation2", false) || StrEqual(GameName, "mutation4", false) || StrEqual(GameName, "mutation5", false) || StrEqual(GameName, "mutation14", false))
		GameMode = 1;
	else
	GameMode = 1;
	
	TankHealthCheck();
}

void TankHealthCheck()
{
	char difficulty[100];
	h_Difficulty.GetString(difficulty, sizeof(difficulty));
	
	if (GameMode == 2)
	{
		zombieHP[6] = 4000;	// Tank default HP
		if (cvarZombieHP[6] != null)
		{
			zombieHP[6] = RoundToFloor(cvarZombieHP[6].IntValue * 1.5);	// Tank health is multiplied by 1.5x in VS	
			cvarZombieHP[6].AddChangeHook(cvarZombieHPChanged);
		}
	}
	else if (StrContains(difficulty, "Easy", false) != -1)  
	{
		zombieHP[6] = 4000;	// Tank default HP
		if (cvarZombieHP[6] != null)
		{
			zombieHP[6] = RoundToFloor(cvarZombieHP[6].IntValue * 0.75);
			cvarZombieHP[6].AddChangeHook(cvarZombieHPChanged);
		}
	}
	else if (StrContains(difficulty, "Normal", false) != -1)
	{
		zombieHP[6] = 4000;	// Tank default HP
		if (cvarZombieHP[6] != null)
		{
			zombieHP[6] = cvarZombieHP[6].IntValue;
			cvarZombieHP[6].AddChangeHook(cvarZombieHPChanged);
		}
	}
	else if (StrContains(difficulty, "Hard", false) != -1 || StrContains(difficulty, "Impossible", false) != -1)
	{
		zombieHP[6] = 4000;	// Tank default HP
		if (cvarZombieHP[6] != null)
		{
			zombieHP[6] = RoundToFloor(cvarZombieHP[6].IntValue * 2.0);
			cvarZombieHP[6].AddChangeHook(cvarZombieHPChanged);
		}
	}
}

public Action MaxSpecialsSet(Handle Timer)
{
	SetConVarInt(FindConVar("z_max_player_zombies"), MaxPlayerZombies);
	#if DEBUG
	LogMessage("Max Player Zombies Set");
	#endif
}

void DirectorStuff()
{	
	SpecialHalt = false;
	SetConVarInt(FindConVar("director_spectate_specials"), 1);
	ResetConVar(FindConVar("versus_special_respawn_interval"), true, true);
	
	// if the server changes the director spawn limits in any way, don't reset the cvars
	if (!DirectorCvarsModified)
		ResetCvarsDirector();
	
	#if DEBUG
	LogMessage("Director Stuff has been executed");
	#endif
	
}

public Action evtRoundEnd (Event event, const char[] name, bool dontBroadcast) 
{
	// If round has not been reported as ended ..
	if (!b_HasRoundEnded)
	{
		for( int i = 1; i <= MaxClients; i++ )
			DeleteLight(i);
			
		// we mark the round as ended
		b_HasRoundEnded = true;
		b_HasRoundStarted = false;
		b_LeftSaveRoom = false;
		roundInProgress = false;
		g_iPlayerSpawn = 0;

		// This I set in because the panel was never originally designed for multiple gamemodes.
		CreateTimer(5.0, HUDReset);
		
		// This spawns a Survivor Bot so that the health bonus for the bots count (L4D only)
		if (!L4D2Version && GameMode == 2 && !RealPlayersOnSurvivors() && !AllSurvivorsDeadOrIncapacitated())
		{
			int bot = CreateFakeClient("Fake Survivor");
			ChangeClientTeam(bot,TEAM_SURVIVORS);
			DispatchKeyValue(bot,"classname","SurvivorBot");
			DispatchSpawn(bot);
			
			CreateTimer(0.1,kickbot,bot);
		}
		ResetTimer();
	}
	
}

public void OnMapStart()
{
	if (!IsModelPrecached(MODEL_TANK))
	{
		PrecacheModel(MODEL_TANK, true);
	}
	PrefetchSound(REWARD_SOUND);
	PrecacheSound(REWARD_SOUND, true);

	GetSpawnDisConvars();
	iPlayersInServer = 0;
	hSpawnWitchTimer = null;

	CreateTimer(5.0, HUDReset);
}

public void OnMapEnd()
{
	#if DEBUG
	LogMessage("Map has ended");
	#endif
	
	b_HasRoundStarted = false;
	b_HasRoundEnded = true;
	b_LeftSaveRoom = false;
	g_iPlayerSpawn = 0;
	roundInProgress = false;
	
	ResetTimer();
}

public Action PlayerLeftStart(Handle Timer)
{
	if (LeftStartArea() || g_bSafeSpawn)
	{	
		// We don't care who left, just that at least one did
		if (!b_LeftSaveRoom)
		{
			char GameName[16];
			h_GameMode.GetString(GameName, sizeof(GameName));
			if (StrEqual(GameName, "mutation15", false))
			{
				SurvivalVersus = true;
				SetConVarInt(FindConVar("survival_max_smokers"), 0);
				SetConVarInt(FindConVar("survival_max_boomers"), 0);
				SetConVarInt(FindConVar("survival_max_hunters"), 0);
				SetConVarInt(FindConVar("survival_max_jockeys"), 0);
				SetConVarInt(FindConVar("survival_max_spitters"), 0);
				SetConVarInt(FindConVar("survival_max_chargers"), 0);
				return Plugin_Continue; 
			}
			
			b_LeftSaveRoom = true;
			
			// We reset some settings
			canSpawnBoomer = true;
			canSpawnSmoker = true;
			canSpawnHunter = true;
			if (L4D2Version)
			{
				canSpawnSpitter = true;
				canSpawnJockey = true;
				canSpawnCharger = true;
			}
			InitialSpawn = true;
			
			// We check if we need to spawn bots
			CheckIfBotsNeeded(false, true);
			#if DEBUG
			LogMessage("Checking to see if we need bots");
			#endif
			CreateTimer(3.0, InitialSpawnReset, _, TIMER_FLAG_NO_MAPCHANGE);
			if(hSpawnWitchTimer != null) KillTimer(hSpawnWitchTimer);
			hSpawnWitchTimer = CreateTimer(float(GetURandomIntRange(h_WitchPeriodMin.IntValue, h_WitchPeriodMax.IntValue)), SpawnWitchAuto);
		}
		PlayerLeftStartTimer = null;
		return Plugin_Stop;
	}
	return Plugin_Continue;
}



// This is hooked to the panic event, but only starts if its survival. This is what starts up the bots in survival.

public Action evtSurvivalStart(Event event, const char[] name, bool dontBroadcast) 
{
	if (GameMode == 3 || SurvivalVersus)
	{  
		// We don't care who left, just that at least one did
		if (!b_LeftSaveRoom)
		{
			#if DEBUG
			PrintToChatAll("A player triggered the survival event, spawning bots");
			#endif
			b_LeftSaveRoom = true;
			
			// We reset some settings
			canSpawnBoomer = true;
			canSpawnSmoker = true;
			canSpawnHunter = true;
			if (L4D2Version)
			{
				canSpawnSpitter = true;
				canSpawnJockey = true;
				canSpawnCharger = true;
			}
			InitialSpawn = true;
			
			// We check if we need to spawn bots
			CheckIfBotsNeeded(false, true);
			#if DEBUG
			LogMessage("Checking to see if we need bots");
			#endif
			CreateTimer(3.0, InitialSpawnReset, _, TIMER_FLAG_NO_MAPCHANGE);
		}
	}
	return Plugin_Continue;
}

public Action InitialSpawnReset(Handle Timer)
{
	InitialSpawn = false;
}

public Action BotReadyReset(Handle Timer)
{
	BotReady = 0;
}

public Action evtUnlockVersusDoor(Event event, const char[] name, bool dontBroadcast) 
{
	if (L4D2Version || b_LeftSaveRoom || GameMode != 2 || RealPlayersOnInfected() || TempBotSpawned)
		return Plugin_Continue;
	
	#if DEBUG
	PrintToChatAll("Attempting to spawn tempbot");
	#endif
	int bot = CreateFakeClient("tempbot");
	if (bot != 0)
	{
		ChangeClientTeam(bot,TEAM_INFECTED);
		CreateTimer(0.1,kickbot,bot);
		TempBotSpawned = true;
	}
	else
	{
		LogError("Temperory Infected Bot was not spawned for the Versus Door Unlocker!");
	}
	
	return Plugin_Continue;
}

public Action InfectedBotBooterVersus(Handle Timer)
{
	//This is to check if there are any extra bots and boot them if necessary, excluding tanks, versus only
	if (GameMode == 2)
	{
		// current count ...
		int total;
		
		for (int i=1; i<=MaxClients; i++)
		{
			// if player is ingame ...
			if (IsClientInGame(i))
			{
				// if player is on infected's team
				if (GetClientTeam(i) == TEAM_INFECTED)
				{
					// We count depending on class ...
					if (!IsPlayerTank(i) || (IsPlayerTank(i) && !PlayerIsAlive(i)))
					{
						total++;
					}
				}
			}
		}
		if (total + InfectedBotQueue > MaxPlayerZombies)
		{
			int kick = total + InfectedBotQueue - MaxPlayerZombies; 
			int kicked = 0;
			
			// We kick any extra bots ....
			for (int i=1;(i<=MaxClients)&&(kicked < kick);i++)
			{
				// If player is infected and is a bot ...
				if (IsClientInGame(i) && IsFakeClient(i))
				{
					//  If bot is on infected ...
					if (GetClientTeam(i) == TEAM_INFECTED)
					{
						// If player is not a tank
						if (!IsPlayerTank(i) || ((IsPlayerTank(i) && !PlayerIsAlive(i))))
						{
							// timer to kick bot
							CreateTimer(0.1,kickbot,i);
							
							// increment kicked count ..
							kicked++;
							#if DEBUG
							LogMessage("Kicked a Bot");
							#endif
						}
					}
				}
			}
		}
	}
}

// This code, combined with Durzel's code, announce certain messages to clients when they first enter the server

public void OnClientPutInServer(int client)
{
	SDKHook(client, SDKHook_OnTakeDamage, OnTakeDamage);

	// If is a bot, skip this function
	if (IsFakeClient(client))
		return;

	iPlayerTeam[client] = 1;
	
	// Durzel's code ***********************************************************************************
	char clientSteamID[32];
	int doHideHUD;
	
//	GetClientAuthString(client, clientSteamID, 32);
	
	// Try and find their HUD visibility preference
	int foundKey = GetTrieValue(usrHUDPref, clientSteamID, doHideHUD);
	if (foundKey)
	{
		if (doHideHUD)
		{
			// This user chose not to view the HUD at some point in the game
			hudDisabled[client] = 1;
		}
	}
	//else hudDisabled[client] = 1;
	// End Durzel's code **********************************************************************************
	
	//CreateTimer(1.0,ColdDown_Timer,_,TIMER_FLAG_NO_MAPCHANGE);
}

public Action CheckGameMode(int client, int args)
{
	if (client)
	{
		PrintToChat(client, "GameMode = %i", GameMode);
	}
}

public Action CheckQueue(int client, int args)
{
	if (client)
	{
		if (GameMode == 2)
			CountInfected();
		else
		CountInfected_Coop();
		
		PrintToChat(client, "InfectedBotQueue = %i, InfectedBotCount = %i, InfectedRealCount = %i", InfectedBotQueue, InfectedBotCount, InfectedRealCount);
	}
}

public Action JoinInfected(int client, int args)
{	
	if (client && (GameMode == 1 || GameMode == 3) && h_JoinableTeams.BoolValue)
	{
		if ((h_AdminJoinInfected.BoolValue && IsPlayerGenericAdmin(client)) || !h_AdminJoinInfected.BoolValue)
		{
			if (HumansOnInfected() < h_HumanCoopLimit.IntValue)
			{
				ChangeClientTeam(client, TEAM_INFECTED);
				iPlayerTeam[client] = TEAM_INFECTED;
			}
			else
				PrintHintText(client, "The Infected Team is full.");
		}
	}
}

public Action JoinSurvivors(int client, int args)
{
	if (client && (GameMode == 1 || GameMode == 3))
	{
		SwitchToSurvivors(client);
	}
}

public Action ForceInfectedSuicide(int client, int args)
{
	if (client && GetClientTeam(client) == 3 && !IsFakeClient(client) && IsPlayerAlive(client) && !IsPlayerGhost(client))
	{
		int bGameMode = GameMode;
		if(bGameMode == 3) bGameMode = 4;
		if(bGameMode & iZSDisableGamemode)
		{
			PrintHintText(client,"[TS] %T","Not allowed to suicide during current mode",client);
			return Plugin_Handled;
		}

		if(GetEngineTime() - fPlayerSpawnEngineTime[client] < SUICIDE_TIME)
		{
			PrintHintText(client,"[TS] %T","Not allowed to suicide so quickly",client);
			return Plugin_Handled;
		}

		if( L4D2_GetSurvivorVictim(client) != -1 )
		{
			PrintHintText(client,"[TS] %T","Not allowed to suicide",client);
			return Plugin_Handled;
		}
		
		ForcePlayerSuicide(client);
	}

	return Plugin_Handled;
}

public Action Console_ZLimit(int client, int args)
{
	if (client == 0)
	{
		PrintToServer("[TS] sm_zlimit cannot be used by server.");
		return Plugin_Handled;
	}
	if(args > 1)
	{
		ReplyToCommand(client, "[TS] %T","Usage: sm_zlimit",client);		
		return Plugin_Handled;
	}
	if(args < 1) 
	{
		ReplyToCommand(client, "[TS] %T\n%T","Current Special Infected Limit",client, MaxPlayerZombies,"Usage: sm_zlimit",client);	
		return Plugin_Handled;
	}
	
	char arg1[64];
	GetCmdArg(1, arg1, 64);
	if(IsInteger(arg1))
	{
		int newlimit = StringToInt(arg1);
		if(newlimit>30)
		{
			ReplyToCommand(client, "[TS] %T","why you need so many special infected?",client);
		}
		else if (newlimit<0)
		{
			ReplyToCommand(client, "[TS] %T","Usage: sm_zlimit",client);
		}
		else if(newlimit!=MaxPlayerZombies)
		{
			SetConVarInt(FindConVar("l4d_infectedbots_max_specials"), newlimit);
			i_OriginalMaxPlayerZombies = newlimit;
			C_PrintToChatAll("[{olive}TS{default}] {lightgreen}%N{default}: %t", client, "Special Infected Limit has been changed",newlimit);	
		}
		else
		{
			ReplyToCommand(client, "[TS] %T","Special Infected Limit is already",client, MaxPlayerZombies);	
		}
		return Plugin_Handled;
	}
	else
	{
		ReplyToCommand(client, "[TS] %T","Usage: sm_zlimit",client);		
		return Plugin_Handled;
	}	
}

public Action Console_Timer(int client, int args)
{
	if (client == 0)
	{
		PrintToServer("[TS] sm_timer cannot be used by server.");
		return Plugin_Handled;
	}
	
	if(args > 2)
	{
		ReplyToCommand(client, "[TS] %T","Usage: sm_timer",client);		
		return Plugin_Handled;
	}
	if(args < 1) 
	{
		ReplyToCommand(client, "[TS] %T\n%T","Current Spawn Timer",client,h_InfectedSpawnTimeMax.IntValue,h_InfectedSpawnTimeMin.IntValue,"Usage: sm_timer",client );	
		return Plugin_Handled;
	}
	
	if(args == 1)
	{
		char arg1[64];
		GetCmdArg(1, arg1, 64);
		if(IsInteger(arg1))
		{
			int DD = StringToInt(arg1);
			
			if(DD<=0)
			{
				ReplyToCommand(client, "[TS] %T","Failed to set timer!",client);
			}
			else if (DD > 180)
			{
				ReplyToCommand(client, "[TS] %T","why so long?",client);
			}
			else
			{
				SetConVarInt(FindConVar("l4d_infectedbots_adjust_spawn_times"), 0);
				SetConVarInt(FindConVar("l4d_infectedbots_spawn_time_max"), DD);
				SetConVarInt(FindConVar("l4d_infectedbots_spawn_time_min"), DD);
				C_PrintToChatAll("[{olive}TS{default}] {lightgreen}%N{default}: %t",client,"Bot Spawn Timer has been changed",DD,DD);	
			}
			return Plugin_Handled;
		}
		else
		{
			ReplyToCommand(client, "[TS] %T","Usage: sm_timer",client);		
			return Plugin_Handled;
		}	
	}
	else
	{
		char arg1[64];
		GetCmdArg(1, arg1, 64);
		char arg2[64];
		GetCmdArg(2, arg2, 64);
		if(IsInteger(arg1) && IsInteger(arg2))
		{
			int Max = StringToInt(arg2);
			int Min = StringToInt(arg1);
			if(Min>Max)
			{
				int temp = Max;
				Max = Min;
				Min = temp;
			}
			
			if(Max>180)
			{
				ReplyToCommand(client, "[TS] %T","why so long?",client);
			}
			else
			{
				SetConVarInt(FindConVar("l4d_infectedbots_adjust_spawn_times"), 0);
				SetConVarInt(FindConVar("l4d_infectedbots_spawn_time_max"), Max);
				SetConVarInt(FindConVar("l4d_infectedbots_spawn_time_min"), Min);
				C_PrintToChatAll("[{olive}TS{green}] {lightgreen}%N{default}: %t",client,"Bot Spawn Timer has been changed",Min,Max);	
			}
			return Plugin_Handled;
		}
		else
		{
			ReplyToCommand(client, "[TS] %T","Usage: sm_timer",client);		
			return Plugin_Handled;
		}
	}
}

// Joining spectators is for developers only, commented in the final

public Action JoinSpectator(int client, int args)
{
	if ((client) && (h_JoinableTeams.BoolValue))
	{
		ChangeClientTeam(client, TEAM_SPECTATOR);
	}
}

public Action AnnounceJoinInfected(Handle timer, int client)
{
	if (IsClientInGame(client) && (!IsFakeClient(client)))
	{
		if ((h_JoinableTeamsAnnounce.BoolValue) && (h_JoinableTeams.BoolValue) && ((GameMode == 1) || (GameMode == 3)))
		{
			if(h_AdminJoinInfected.BoolValue)
				C_PrintToChat(client,"[{olive}TS{default}] %T","Join infected team in coop/survival/realism(adm only)",client);
			else
				C_PrintToChat(client,"[{olive}TS{default}] %T","Join infected team in coop/survival/realism",client);
			C_PrintToChat(client,"%T","Join survivor team",client);
		}
	}
}

public Action evtPlayerSpawn(Event event, const char[] name, bool dontBroadcast) 
{
	// We get the client id and time
	int client = GetClientOfUserId(event.GetInt("userid"));
	// If client is valid
	if (!client || !IsClientInGame(client)) return Plugin_Continue;
	
	if(GetClientTeam(client) == TEAM_SURVIVORS) CreateTimer(1.0,ColdDown_Timer,_,TIMER_FLAG_NO_MAPCHANGE);

	if (GetClientTeam(client) != TEAM_INFECTED)
		return Plugin_Continue;
	
	if (DirectorSpawn && GameMode != 2)
	{
		if (IsPlayerSmoker(client))
		{
			if (IsFakeClient(client))
			{
				if (!SpecialHalt)
				{
					CreateTimer(0.1, kickbot, client);
					
					#if DEBUG
					LogMessage("Smoker kicked");
					#endif
					
					int BotNeeded = 1;
					
					CreateTimer(0.2, Spawn_InfectedBot_Director, BotNeeded);
					
					
					#if DEBUG
					LogMessage("Spawned Smoker");
					#endif
				}
			}
		}
		else if (IsPlayerBoomer(client))
		{
			if (IsFakeClient(client))
			{
				if (!SpecialHalt)
				{
					CreateTimer(0.1, kickbot, client);
					
					#if DEBUG
					LogMessage("Boomer kicked");
					#endif
					
					int BotNeeded = 2;
					CreateTimer(0.2, Spawn_InfectedBot_Director, BotNeeded);
					
					
					#if DEBUG
					LogMessage("Spawned Booomer");
					#endif
				}
			}
		}
		else if (IsPlayerHunter(client))
		{
			if (IsFakeClient(client))
			{
				if (!SpecialHalt)
				{
					CreateTimer(0.1, kickbot, client);
					
					#if DEBUG
					LogMessage("Hunter Kicked");
					#endif
					
					int BotNeeded = 3;
					
					CreateTimer(0.2, Spawn_InfectedBot_Director, BotNeeded);
					
					
					#if DEBUG
					LogMessage("Hunter Spawned");
					#endif
				}
			}
		}
		else if (IsPlayerSpitter(client) && L4D2Version)
		{
			if (IsFakeClient(client))
			{
				if (!SpecialHalt)
				{
					CreateTimer(0.1, kickbot, client);
					
					#if DEBUG
					LogMessage("Spitter Kicked");
					#endif
					
					int BotNeeded = 4;
					
					CreateTimer(0.2, Spawn_InfectedBot_Director, BotNeeded);
					
					
					#if DEBUG
					LogMessage("Spitter Spawned");
					#endif
				}
			}
		}
		else if (IsPlayerJockey(client) && L4D2Version)
		{
			if (IsFakeClient(client))
			{
				if (!SpecialHalt)
				{
					CreateTimer(0.1, kickbot, client);
					
					#if DEBUG
					LogMessage("Jockey Kicked");
					#endif
					
					int BotNeeded = 5;
					
					CreateTimer(0.2, Spawn_InfectedBot_Director, BotNeeded);
					
					
					#if DEBUG
					LogMessage("Jockey Spawned");
					#endif
				}
			}
		}
		else if (IsPlayerCharger(client) && L4D2Version)
		{
			if (IsFakeClient(client))
			{
				if (!SpecialHalt)
				{
					CreateTimer(0.1, kickbot, client);
					
					#if DEBUG
					LogMessage("Charger Kicked");
					#endif
					
					int BotNeeded = 6;
					
					CreateTimer(0.2, Spawn_InfectedBot_Director, BotNeeded);
					
					
					#if DEBUG
					LogMessage("Charger Spawned");
					#endif
				}
			}
		}
	}
	
	if (IsPlayerTank(client))
	{
		char clientname[256];
		GetClientName(client, clientname, sizeof(clientname));
		if (L4D2Version && GameMode == 1 && IsFakeClient(client) && RealPlayersOnInfected() && StrContains(clientname, "Bot", false) == -1)
		{
			//PrintToChatAll("tank clientname: %s",clientname);
			CreateTimer(0.1, TankBugFix, client);
		}
		if (b_LeftSaveRoom)
		{	
			#if DEBUG
			LogMessage("Tank Event Triggered");
			#endif

			TanksPlaying = 0;
			MaxPlayerTank = 0;
			for (int i=1;i<=MaxClients;i++)
			{
				// We check if player is in game
				if (!IsClientInGame(i)) continue;
				
				// Check if client is infected ...
				if (GetClientTeam(i)==TEAM_INFECTED)
				{
					// If player is a tank
					if (IsPlayerTank(i) && PlayerIsAlive(i))
					{
						TanksPlaying++;
						MaxPlayerTank++;
					}
				}
			}
			
			MaxPlayerTank = MaxPlayerTank + MaxPlayerZombies;
			SetConVarInt(FindConVar("z_max_player_zombies"), MaxPlayerTank);
			#if DEBUG
			LogMessage("Incremented Max Zombies from Tank Spawn EVENT");
			#endif
			
			if (GameMode == 3)
			{
				if (IsFakeClient(client) && RealPlayersOnInfected())
				{
					if (L4D2Version && !AreTherePlayersWhoAreNotTanks() && h_CoopPlayableTank.BoolValue && StrContains(clientname, "Bot", false) == -1 || L4D2Version && !h_CoopPlayableTank.BoolValue && StrContains(clientname, "Bot", false) == -1)
					{
						CreateTimer(0.1, TankBugFix, client);
					}
					else if (h_CoopPlayableTank.BoolValue && AreTherePlayersWhoAreNotTanks())
					{
						CreateTimer(0.5, TankSpawner, client);
						CreateTimer(0.6, kickbot, client);
					}
				}
			}
			else
			{
				MaxPlayerTank = MaxPlayerZombies;
				SetConVarInt(FindConVar("z_max_player_zombies"), MaxPlayerZombies);
			}
		}
	}
	else if (IsFakeClient(client))
	{
		if (FightOrDieTimer[client] != null)
		{
			KillTimer(FightOrDieTimer[client]);
			FightOrDieTimer[client] = null;
		}
		FightOrDieTimer[client] = CreateTimer(h_idletime_b4slay.FloatValue, DisposeOfCowards, client);
	}

	// Turn on Flashlight for Infected player
	TurnFlashlightOn(client);
	
	// If its Versus and the bot is not a tank, make the bot into a ghost
	if (IsFakeClient(client) && GameMode == 2 && !IsPlayerTank(client))
		CreateTimer(0.1, Timer_SetUpBotGhost, client, TIMER_FLAG_NO_MAPCHANGE);
	
	// This fixes the music glitch thats been bothering me and many players for a long time. The music keeps playing over and over when it shouldn't. Doesn't execute
	// on versus.
	if (!L4D2Version && GameMode != 2 && !IsFakeClient(client))
	{
		ClientCommand(client, "music_dynamic_stop_playing Event.MissionStart_BaseLoop_Hospital");
		ClientCommand(client, "music_dynamic_stop_playing Event.MissionStart_BaseLoop_Airport");
		ClientCommand(client, "music_dynamic_stop_playing Event.MissionStart_BaseLoop_Farm");
		ClientCommand(client, "music_dynamic_stop_playing Event.MissionStart_BaseLoop_Small_Town");
		ClientCommand(client, "music_dynamic_stop_playing Event.MissionStart_BaseLoop_Garage");
		ClientCommand(client, "music_dynamic_stop_playing Event.CheckPointBaseLoop_Hospital");
		ClientCommand(client, "music_dynamic_stop_playing Event.CheckPointBaseLoop_Airport");
		ClientCommand(client, "music_dynamic_stop_playing Event.CheckPointBaseLoop_Small_Town");
		ClientCommand(client, "music_dynamic_stop_playing Event.CheckPointBaseLoop_Farm");
		ClientCommand(client, "music_dynamic_stop_playing Event.CheckPointBaseLoop_Garage");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_A2");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_A3");
		ClientCommand(client, "music_dynamic_stop_playing Event.Tank");
		ClientCommand(client, "music_dynamic_stop_playing Event.TankMidpoint");
		ClientCommand(client, "music_dynamic_stop_playing Event.TankBrothers");
		ClientCommand(client, "music_dynamic_stop_playing Event.WitchAttack");
		ClientCommand(client, "music_dynamic_stop_playing Event.WitchBurning");
		ClientCommand(client, "music_dynamic_stop_playing Event.WitchRage");
		ClientCommand(client, "music_dynamic_stop_playing Event.HunterPounce");
		ClientCommand(client, "music_dynamic_stop_playing Event.SmokerChoke");
		ClientCommand(client, "music_dynamic_stop_playing Event.SmokerDrag");
		ClientCommand(client, "music_dynamic_stop_playing Event.VomitInTheFace");
		ClientCommand(client, "music_dynamic_stop_playing Event.LedgeHangTwoHands");
		ClientCommand(client, "music_dynamic_stop_playing Event.LedgeHangOneHand");
		ClientCommand(client, "music_dynamic_stop_playing Event.LedgeHangFingers");
		ClientCommand(client, "music_dynamic_stop_playing Event.LedgeHangAboutToFall");
		ClientCommand(client, "music_dynamic_stop_playing Event.LedgeHangFalling");
		ClientCommand(client, "music_dynamic_stop_playing Event.Down");
		ClientCommand(client, "music_dynamic_stop_playing Event.BleedingOut");
		ClientCommand(client, "music_dynamic_stop_playing Event.Down");
	}
	else if (L4D2Version && GameMode != 2 && !IsFakeClient(client))
	{
		// Music when Mission Starts
		ClientCommand(client, "music_dynamic_stop_playing Event.MissionStart_BaseLoop_Mall");
		ClientCommand(client, "music_dynamic_stop_playing Event.MissionStart_BaseLoop_Fairgrounds");
		ClientCommand(client, "music_dynamic_stop_playing Event.MissionStart_BaseLoop_Plankcountry");
		ClientCommand(client, "music_dynamic_stop_playing Event.MissionStart_BaseLoop_Milltown");
		ClientCommand(client, "music_dynamic_stop_playing Event.MissionStart_BaseLoop_BigEasy");
		
		// Checkpoints
		ClientCommand(client, "music_dynamic_stop_playing Event.CheckPointBaseLoop_Mall");
		ClientCommand(client, "music_dynamic_stop_playing Event.CheckPointBaseLoop_Fairgrounds");
		ClientCommand(client, "music_dynamic_stop_playing Event.CheckPointBaseLoop_Plankcountry");
		ClientCommand(client, "music_dynamic_stop_playing Event.CheckPointBaseLoop_Milltown");
		ClientCommand(client, "music_dynamic_stop_playing Event.CheckPointBaseLoop_BigEasy");
		
		// Zombat
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_1");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_A_1");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_B_1");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_2");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_A_2");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_B_2");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_3");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_A_3");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_B_3");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_4");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_A_4");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_B_4");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_5");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_A_5");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_B_5");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_6");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_A_6");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_B_6");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_7");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_A_7");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_B_7");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_8");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_A_8");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_B_8");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_9");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_A_9");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_B_9");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_10");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_A_10");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_B_10");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_11");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_A_11");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_B_11");
		
		// Zombat specific maps
		
		// C1 Mall
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat2_Intro_Mall");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat3_Intro_Mall");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat3_A_Mall");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat3_B_Mall");
		
		// A2 Fairgrounds
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_Intro_Fairgrounds");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_Fairgrounds");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_A_Fairgrounds");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_B_Fairgrounds");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_B_Fairgrounds");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat2_Intro_Fairgrounds");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat3_Intro_Fairgrounds");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat3_A_Fairgrounds");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat3_B_Fairgrounds");
		
		// C3 Plankcountry
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_PlankCountry");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_A_PlankCountry");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat_B_PlankCountry");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat2_Intro_Plankcountry");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat3_Intro_Plankcountry");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat3_A_Plankcountry");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat3_B_Plankcountry");
		
		// A2 Milltown
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat2_Intro_Milltown");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat3_Intro_Milltown");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat3_A_Milltown");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat3_B_Milltown");
		
		// C5 BigEasy
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat2_Intro_BigEasy");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat3_Intro_BigEasy");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat3_A_BigEasy");
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat3_B_BigEasy");
		
		// A2 Clown
		ClientCommand(client, "music_dynamic_stop_playing Event.Zombat3_Intro_Clown");
		
		// Death
		
		// ledge hang
		ClientCommand(client, "music_dynamic_stop_playing Event.LedgeHangTwoHands");
		ClientCommand(client, "music_dynamic_stop_playing Event.LedgeHangOneHand");
		ClientCommand(client, "music_dynamic_stop_playing Event.LedgeHangFingers");
		ClientCommand(client, "music_dynamic_stop_playing Event.LedgeHangAboutToFall");
		ClientCommand(client, "music_dynamic_stop_playing Event.LedgeHangFalling");
		
		// Down
		// Survivor is down and being beaten by infected
		
		ClientCommand(client, "music_dynamic_stop_playing Event.Down");
		ClientCommand(client, "music_dynamic_stop_playing Event.BleedingOut");
		
		// Survivor death
		// This is for the death of an individual survivor to be played after the health meter has reached zero
		
		ClientCommand(client, "music_dynamic_stop_playing Event.SurvivorDeath");
		ClientCommand(client, "music_dynamic_stop_playing Event.ScenarioLose");
		
		// Bosses
		
		// Tank
		ClientCommand(client, "music_dynamic_stop_playing Event.Tank");
		ClientCommand(client, "music_dynamic_stop_playing Event.TankMidpoint");
		ClientCommand(client, "music_dynamic_stop_playing Event.TankBrothers");
		ClientCommand(client, "music_dynamic_stop_playing C2M5.RidinTank1");
		ClientCommand(client, "music_dynamic_stop_playing C2M5.RidinTank2");
		ClientCommand(client, "music_dynamic_stop_playing C2M5.BadManTank1");
		ClientCommand(client, "music_dynamic_stop_playing C2M5.BadManTank2");
		
		// Witch
		ClientCommand(client, "music_dynamic_stop_playing Event.WitchAttack");
		ClientCommand(client, "music_dynamic_stop_playing Event.WitchBurning");
		ClientCommand(client, "music_dynamic_stop_playing Event.WitchRage");
		ClientCommand(client, "music_dynamic_stop_playing Event.WitchDead");
		
		// mobbed
		ClientCommand(client, "music_dynamic_stop_playing Event.Mobbed");
		
		// Hunter
		ClientCommand(client, "music_dynamic_stop_playing Event.HunterPounce");
		
		// Smoker
		ClientCommand(client, "music_dynamic_stop_playing Event.SmokerChoke");
		ClientCommand(client, "music_dynamic_stop_playing Event.SmokerDrag");
		
		// Boomer
		ClientCommand(client, "music_dynamic_stop_playing Event.VomitInTheFace");
		
		// Charger
		ClientCommand(client, "music_dynamic_stop_playing Event.ChargerSlam");
		
		// Jockey
		ClientCommand(client, "music_dynamic_stop_playing Event.JockeyRide");
		
		// Spitter
		ClientCommand(client, "music_dynamic_stop_playing Event.SpitterSpit");
		ClientCommand(client, "music_dynamic_stop_playing Event.SpitterBurn");
	}	

	return Plugin_Continue;
}

public Action evtBotReplacedPlayer(Event event, const char[] name, bool dontBroadcast) 
{
	// The purpose of using this event, is to prevent a bot from ghosting after the player leaves or joins another team
	
	int bot = GetClientOfUserId(event.GetInt("bot"));
	AlreadyGhostedBot[bot] = true;
}

public Action DisposeOfCowards(Handle timer, int coward)
{
	if (IsClientInGame(coward) && IsFakeClient(coward) && GetClientTeam(coward) == TEAM_INFECTED && !IsPlayerTank(coward) && PlayerIsAlive(coward))
	{
		// Check to see if the infected thats about to be slain sees the survivors. If so, kill the timer and make a int one.
		int threats = GetEntProp(coward, Prop_Send, "m_hasVisibleThreats");
		
		if (threats)
		{
			FightOrDieTimer[coward] = null;
			FightOrDieTimer[coward] = CreateTimer(h_idletime_b4slay.FloatValue, DisposeOfCowards, coward);
			#if DEBUG
			PrintToChatAll("%N saw survivors after timer is up, creating int timer", coward);
			#endif
			return;
		}
		else
		{
			CreateTimer(0.1, kickbot, coward);
			if (!DirectorSpawn)
			{
				int SpawnTime = GetURandomIntRange(h_InfectedSpawnTimeMin.IntValue, h_InfectedSpawnTimeMax.IntValue);
				
				if (h_AdjustSpawnTimes.BoolValue)
					SpawnTime = SpawnTime - (TrueNumberOfAliveSurvivors() * h_ReducedSpawnTimesOnPlayer.IntValue);
				
				if(SpawnTime<=0)
					SpawnTime = 1;
				CreateTimer(float(SpawnTime), Spawn_InfectedBot, _, 0);
				InfectedBotQueue++;
				
				#if DEBUG
				PrintToChatAll("Kicked bot %N for not attacking", coward);
				PrintToChatAll("An infected bot has been added to the spawn queue due to lifespan timer expiring");
				#endif
			}
		}
	}
	FightOrDieTimer[coward] = null;
}

public Action Timer_SetUpBotGhost(Handle timer, int client)
{
	// This will set the bot a ghost, stop the bot's movement, and waits until it can spawn
	if (IsValidEntity(client))
	{
		if (!AlreadyGhostedBot[client])
		{
			SetGhostStatus(client, true);
			SetEntityMoveType(client, MOVETYPE_NONE);
			CreateTimer(h_BotGhostTime.FloatValue, Timer_RestoreBotGhost, client, TIMER_FLAG_NO_MAPCHANGE);
		}
		else
			AlreadyGhostedBot[client] = false;
	}
}

public Action Timer_RestoreBotGhost(Handle timer, int client)
{
	if (IsValidEntity(client))
	{
		SetGhostStatus(client, false);
		SetEntityMoveType(client, MOVETYPE_WALK);
	}
}

// The FreeSpawn ensure actions make sure that players spawn into ghosts (L4D 1 only)

public Action FreeSpawnEnsure(Handle timer, int client)
{
	ClientCommand(client, "+use");
	ClientCommand(client, "-use");
	
	if (!IsPlayerGhost(client))
		CreateTimer(0.1, FreeSpawnEnsure2, client, TIMER_FLAG_NO_MAPCHANGE);
	
}

public Action FreeSpawnEnsure2(Handle timer, int client)
{
	if (IsValidEntity(client))
	{
		SetEntProp(client,Prop_Send,"m_isCulling",1);
		ClientCommand(client, "+use");
		
		CreateTimer(0.1, FreeSpawnEnsure, client, TIMER_FLAG_NO_MAPCHANGE);
	}
}

public Action evtPlayerDeath(Event event, const char[] name, bool dontBroadcast) 
{
	// We get the client id and time
	int client = GetClientOfUserId(event.GetInt("userid"));
	if(client) DeleteLight(client); // Delete attached flashlight

	if(client && IsClientInGame(client) && GetClientTeam(client) == TEAM_SURVIVORS) CreateTimer(1.0,ColdDown_Timer,_,TIMER_FLAG_NO_MAPCHANGE);

	// If round has ended .. we ignore this
	if (b_HasRoundEnded || !b_LeftSaveRoom) return Plugin_Continue;
	
	if (FightOrDieTimer[client] != null)
	{
		KillTimer(FightOrDieTimer[client]);
		FightOrDieTimer[client] = null;
	}
	
	
	if (!client || !IsClientInGame(client)) return Plugin_Continue;
	
	if (GetClientTeam(client) !=TEAM_INFECTED) return Plugin_Continue;
	
	if (IsPlayerTank(client))
	{
		TankWasSeen[client] = false;
	}
	
	// if victim was a bot, we setup a timer to spawn a int bot ...
	if (GetEventBool(event, "victimisbot") && (GameMode == 2) && (!DirectorSpawn))
	{
		if (!IsPlayerTank(client))
		{
			int SpawnTime = GetURandomIntRange(h_InfectedSpawnTimeMin.IntValue, h_InfectedSpawnTimeMax.IntValue);
			if (h_AdjustSpawnTimes.BoolValue && MaxPlayerZombies != HumansOnInfected())
				SpawnTime = SpawnTime  - (TrueNumberOfAliveSurvivors() * h_ReducedSpawnTimesOnPlayer.IntValue);
			
			if(SpawnTime < 0)
				SpawnTime = 1;

			CreateTimer(float(SpawnTime), Spawn_InfectedBot, _, 0);
			InfectedBotQueue++;
		}
		
		#if DEBUG
		PrintToChatAll("An infected bot has been added to the spawn queue...");
		#endif
	}
	// This spawns a bot in coop/survival regardless if the special that died was controlled by a player, MI 5
	else if ((GameMode != 2) && (!DirectorSpawn))
	{
		if (!h_CoopPlayableTank.BoolValue && !IsPlayerTank(client) || h_CoopPlayableTank.BoolValue)
		{
			int SpawnTime = GetURandomIntRange(h_InfectedSpawnTimeMin.IntValue, h_InfectedSpawnTimeMax.IntValue);
			if (GameMode == 1 && h_AdjustSpawnTimes.BoolValue)
				SpawnTime = SpawnTime - (TrueNumberOfAliveSurvivors() * h_ReducedSpawnTimesOnPlayer.IntValue);
				
			if(!IsFakeClient(client)) 
			{
				SpawnTime = h_InfectedSpawnTimeMin.IntValue - TrueNumberOfAliveSurvivors() * h_ReducedSpawnTimesOnPlayer.IntValue + (HumansOnInfected() - 1) * 3;
				if(SpawnTime <= 10)
					SpawnTime = 10;
			}

			if(SpawnTime <= 0)
				SpawnTime = 1;

			CreateTimer(float(SpawnTime), Spawn_InfectedBot, _, 0);
			GetSpawnTime[client] = SpawnTime;
			InfectedBotQueue++;
		}
		
		if (IsPlayerTank(client))
			CheckIfBotsNeeded(false, false);
		
		#if DEBUG
		PrintToChatAll("An infected bot has been added to the spawn queue...");
		#endif
	}
	else if (GameMode != 2 && DirectorSpawn)
	{
		int SpawnTime = GetURandomIntRange(h_InfectedSpawnTimeMin.IntValue, h_InfectedSpawnTimeMax.IntValue);
		if(!IsFakeClient(client)) 
		{
			SpawnTime = h_InfectedSpawnTimeMin.IntValue - TrueNumberOfAliveSurvivors() * h_ReducedSpawnTimesOnPlayer.IntValue + (HumansOnInfected() - 1) * 3;
			if(SpawnTime <= 8)
				SpawnTime = 8;
		}
		GetSpawnTime[client] = SpawnTime;
	}
	
	//This will prevent the stats board from coming up if the cvar was set to 1 (L4D 1 only)
	if (!L4D2Version && !IsFakeClient(client) && !h_StatsBoard.BoolValue && GameMode != 2)
	{
		CreateTimer(1.0, ZombieClassTimer, client, TIMER_FLAG_NO_MAPCHANGE);
	}
	
	// Removes Sphere bubbles in the map when a player dies
	if (GameMode != 2)
	{
		CreateTimer(0.1, ScrimmageTimer, client, TIMER_FLAG_NO_MAPCHANGE);
	}
	
	// This fixes the spawns when the spawn timer is set to 5 or below and fixes the spitter spit glitch
	if (IsFakeClient(client) && !IsPlayerSpitter(client))
		CreateTimer(0.1, kickbot, client);
	
	return Plugin_Continue;
}

public Action Spawn_InfectedBot_Director(Handle timer, int BotNeeded)
{
	bool resetGhost[MAXPLAYERS+1];
	bool resetLife[MAXPLAYERS+1];
	
	for (int i=1;i<=MaxClients;i++)
	{
		if (IsClientInGame(i) && (!IsFakeClient(i))) // player is connected and is not fake and it's in game ...
		{
			// If player is on infected's team and is dead ..
			if (GetClientTeam(i)==TEAM_INFECTED)
			{
				// If player is a ghost ....
				if (IsPlayerGhost(i))
				{
					resetGhost[i] = true;
					SetGhostStatus(i, false);
				}
				else if (!PlayerIsAlive(i) && respawnDelay[i] > 0 && GameMode != 2)
				{
					resetLife[i] = true;
					SetLifeState(i, false);
					#if DEBUG
					LogMessage("Detected a dead player with a respawn timer, setting restrictions to prevent player from taking a bot");
					#endif
				}
				else if (!PlayerIsAlive(i) && respawnDelay[i] <= 0)
				{
					AlreadyGhosted[i] = false;
					SetLifeState(i, true);
				}
			}
		}
	}
	
	int anyclient = GetAnyClient();
	
	SpecialHalt = true;
	
	switch (BotNeeded)
	{
		case 1: // Smoker
		CheatCommand(anyclient, sSpawnCommand, "smoker auto");
		case 2: // Boomer
		CheatCommand(anyclient, sSpawnCommand, "boomer auto");
		case 3: // Hunter
		CheatCommand(anyclient, sSpawnCommand, "hunter auto");
		case 4: // Spitter
		CheatCommand(anyclient, sSpawnCommand, "spitter auto");
		case 5: // Jockey
		CheatCommand(anyclient, sSpawnCommand, "jockey auto");
		case 6: // Charger
		CheatCommand(anyclient, sSpawnCommand, "charger auto");
	}
	
	SpecialHalt = false;
	
	// We restore the player's status
	for (int i=1;i<=MaxClients;i++)
	{
		if (resetGhost[i])
			SetGhostStatus(i, true);
		if (resetLife[i])
			SetLifeState(i, true);
	}
	// If client was temp, we setup a timer to kick the fake player
}

public Action ZombieClassTimer(Handle timer, int client)
{
	if (client)
	{
		SetEntProp(client, Prop_Send, "m_zombieClass", 0);
	}
}

public Action evtPlayerTeam(Event event, const char[] name, bool dontBroadcast) 
{
	int client = GetClientOfUserId(event.GetInt("userid"));
	CreateTimer(1.0,PlayerChangeTeamCheck,client);//延遲一秒檢查

	// If player is a bot, we ignore this ...
	if (GetEventBool(event, "isbot")) return Plugin_Continue;
	
	// We get some data needed ...
	int newteam = event.GetInt("team");
	int oldteam = event.GetInt("oldteam");
	
	// We get the client id and time
	if(client) DeleteLight(client);

	// If player's new/old team is infected, we recount the infected and add bots if needed ...
	if (!b_HasRoundEnded && b_LeftSaveRoom && GameMode == 2)
	{
		if (oldteam == 3||newteam == 3)
		{
			CheckIfBotsNeeded(false, false);
		}
		if (newteam == 3)
		{
			//Kick Timer
			CreateTimer(1.0, InfectedBotBooterVersus, _, TIMER_FLAG_NO_MAPCHANGE);
			#if DEBUG
			LogMessage("A player switched to infected, attempting to boot a bot");
			#endif
		}
	}
	else if ((newteam == 3 || newteam == 1) && GameMode != 2)
	{
		// Removes Sphere bubbles in the map when a player joins the infected team, or spectator team
		
		CreateTimer(0.1, ScrimmageTimer, client, TIMER_FLAG_NO_MAPCHANGE);
	}
	return Plugin_Continue;
}

public Action PlayerChangeTeamCheck(Handle timer,int client)
{
	if (client && IsClientInGame(client) && !IsFakeClient(client))
	{
		CreateTimer(1.0,ColdDown_Timer,_,TIMER_FLAG_NO_MAPCHANGE);

		int iTeam = GetClientTeam(client);
		if(iTeam == TEAM_INFECTED && (GameMode == 1 || GameMode == 3))
		{
			if(iPlayerTeam[client] != TEAM_INFECTED) 
			{
				ChangeClientTeam(client,TEAM_SPECTATOR);
				FakeClientCommand(client,"sm_js");
				return Plugin_Continue;
			}

			if(h_JoinableTeams.BoolValue)
			{
				if((h_AdminJoinInfected.BoolValue && IsPlayerGenericAdmin(client)) || !h_AdminJoinInfected.BoolValue)
				{
					if (HumansOnInfected() <= h_HumanCoopLimit.IntValue)
						return Plugin_Continue;
				}
			}
			else
			{
				PrintHintText(client, "Can't Join The Infected Team during current mode.");
			}
			ChangeClientTeam(client,TEAM_SPECTATOR);
		}
		iPlayerTeam[client] = iTeam;
	}
	return Plugin_Continue;
}
public Action ColdDown_Timer(Handle timer)
{
	int iAliveSurplayers = CheckAliveSurvivorPlayers_InSV();

	if(iAliveSurplayers >= 4 && iAliveSurplayers != iPlayersInSurvivorTeam)
	{
		int addition = iAliveSurplayers - 4;
		SetConVarInt(h_MaxPlayerZombies, i_OriginalMaxPlayerZombies + g_PlayerAddZombies * (addition/h_PlayerAddZombiesScale.IntValue));
		if(h_TankHealthAdjust.BoolValue) SetConVarInt(cvarZombieHP[6], h_TankHealth.IntValue + g_PlayerAddTankHealth * (addition/h_PlayerAddTankHealthScale.IntValue));
		MaxPlayerZombies = h_MaxPlayerZombies.IntValue;
		SetConVarInt(FindConVar("z_max_player_zombies"), MaxPlayerZombies);
		iPlayersInSurvivorTeam = iAliveSurplayers;
		C_PrintToChatAll("[{olive}TS{default}] %t","Current status",iAliveSurplayers,MaxPlayerZombies,cvarZombieHP[6].IntValue);
	}
}

public void OnClientDisconnect(int client)
{
	iPlayerTeam[client] = 1;

	CreateTimer(1.0,ColdDown_Timer,_,TIMER_FLAG_NO_MAPCHANGE);

	// If is a bot, skip this function
	if (IsFakeClient(client))
		return;
	
	// When a client disconnects we need to restore their HUD preferences to default for when 
	// a int client joins and fill the space.
	hudDisabled[client] = 0;
	clientGreeted[client] = 0;
	
	// Reset all other arrays
	respawnDelay[client] = 0;
	WillBeTank[client] = false;
	PlayerLifeState[client] = false;
	GetSpawnTime[client] = 0;
	isTankOnFire[client] = false;
	burningTankTimeLeft[client] = 0;
	TankWasSeen[client] = false;
	AlreadyGhosted[client] = false;
	PlayerHasEnteredStart[client] = false;
	CheckPlayers_InSV();
	
	
	// If no real players are left in game ... MI 5
	if (iPlayersInServer == 0)
	{
		#if DEBUG
		LogMessage("All Players have left the Server");
		#endif
		
		b_LeftSaveRoom = false;
		b_HasRoundEnded = true;
		b_HasRoundStarted = false;
		roundInProgress = false;
		DirectorCvarsModified = false;
		
		
		// Zero all respawn times ready for the next round
		for (int i = 1; i <= MaxClients; i++)
		{
			respawnDelay[i] = 0;
			isTankOnFire[i] = false;
			burningTankTimeLeft[i] = 0;
			TankWasSeen[i] = false;
			AlreadyGhosted[i] = false;
			PlayerHasEnteredStart[i] = false;
			WillBeTank[i] = false;
		}
		
		for (int i = 1; i <= MaxClients; i++)
		{
			if (FightOrDieTimer[i] != null)
			{
				KillTimer(FightOrDieTimer[i]);
				FightOrDieTimer[i] = null;
			}
		}
		// Set sb_all_bot_team to 0
		
		if (L4D2Version)
		{
			SetConVarInt(FindConVar("sb_all_bot_game"), 0);
			SetConVarInt(FindConVar("allow_all_bot_survivor_team"), 0);
		}
		else
		SetConVarInt(FindConVar("sb_all_bot_team"), 0);
		
		// This I set in because the panel was never originally designed for multiple gamemodes.
		CreateTimer(5.0, HUDReset);
	}
}

public Action ScrimmageTimer (Handle timer, int client)
{
	if (client && IsValidEntity(client))
	{
		SetEntProp(client, Prop_Send, "m_scrimmageType", 0);
	}
}

public Action CheckIfBotsNeededLater (Handle timer, bool spawn_immediately)
{
	CheckIfBotsNeeded(spawn_immediately, false);
}

void CheckIfBotsNeeded(bool spawn_immediately, bool initial_spawn)
{
	if (!DirectorSpawn)
	{
		if (b_HasRoundEnded || !b_LeftSaveRoom ) return;

		#if DEBUG
			PrintToChatAll("Checking bots");
		#endif 

		// First, we count the infected
		if (GameMode == 2)
		{
			CountInfected();
		}
		else
		{
			CountInfected_Coop();
		}
		
		int diff = MaxPlayerZombies - (InfectedBotCount + InfectedRealCount + InfectedBotQueue);
		
		// If we need more infected bots
		if (diff > 0)
		{
			for (int i;i<diff;i++)
			{
				// If we need them right away ...
				if (spawn_immediately)
				{
					InfectedBotQueue++;
					CreateTimer(0.5, Spawn_InfectedBot, _, 0);
					#if DEBUG
					LogMessage("Setting up the bot now");
					#endif
				}
				else if (initial_spawn)
				{
					InfectedBotQueue++;
					CreateTimer(float(h_InitialSpawn.IntValue), Spawn_InfectedBot, _, 0);
					#if DEBUG
						PrintToChatAll("Setting up the initial bot now");
					#endif
				}
				else // We use the normal time ..
				{
					InfectedBotQueue++;
					if (GameMode == 2 && h_AdjustSpawnTimes.BoolValue)
						CreateTimer(float(h_InfectedSpawnTimeMax.IntValue - (TrueNumberOfAliveSurvivors() * h_ReducedSpawnTimesOnPlayer.IntValue) ), Spawn_InfectedBot, _, 0);
					else if (GameMode == 1 && h_AdjustSpawnTimes.BoolValue)
						CreateTimer(float(h_InfectedSpawnTimeMax.IntValue - (TrueNumberOfAliveSurvivors() * h_ReducedSpawnTimesOnPlayer.IntValue) ), Spawn_InfectedBot, _, 0);
					else
						CreateTimer(float(h_InfectedSpawnTimeMax.IntValue), Spawn_InfectedBot, _, 0);
				}
			}
		}
		
		if (GameMode == 2)
		{
			CountInfected();
		}
	}
}

void CountInfected()
{
	// reset counters
	InfectedBotCount = 0;
	InfectedRealCount = 0;
	
	// First we count the ammount of infected real players and bots
	for (int i=1;i<=MaxClients;i++)
	{
		// We check if player is in game
		if (!IsClientInGame(i)) continue;
		
		// Check if client is infected ...
		if (GetClientTeam(i) == TEAM_INFECTED)
		{
			// If player is a bot ...
			if (IsFakeClient(i))
				InfectedBotCount++;
			else
			InfectedRealCount++;
		}
	}
	
}

// Note: This function is also used for coop/survival.
void CountInfected_Coop()
{
	#if DEBUG
	LogMessage("Counting Bots for Coop");
	#endif
	
	// reset counters
	InfectedBotCount = 0;
	InfectedRealCount = 0;
	
	// First we count the ammount of infected real players and bots
	
	for (int i=1;i<=MaxClients;i++)
	{
		// We check if player is in game
		if (!IsClientInGame(i)) continue;
		
		// Check if client is infected ...
		if (GetClientTeam(i) == TEAM_INFECTED)
		{
			char name[MAX_NAME_LENGTH];
			
			GetClientName(i, name, sizeof(name));
			
			if (StrEqual(name, "Infected Bot", true) && IsFakeClient(i))
				continue;
			
			// If someone is a tank and the tank is playable...count him in play
			if (IsPlayerTank(i) && PlayerIsAlive(i) && h_CoopPlayableTank.BoolValue && !IsFakeClient(i))
			{
				InfectedRealCount++;
			}
			
			// If player is a bot ...
			if (IsFakeClient(i))
			{
				InfectedBotCount++;
				#if DEBUG
				LogMessage("Found a bot");
				#endif
			}
			else if (PlayerIsAlive(i) || (IsPlayerGhost(i)))
			{
				InfectedRealCount++;
				#if DEBUG
				LogMessage("Found a player");
				#endif
			}
		}
	}
}

// This code here is to prevent a loop when the tank gets frustrated. Apparently the game counts a tank being frustrated as a spawned tank, and triggers the tank spawn
// event. That may be why the rescue vehicle sometimes arrives earlier than expected

public Action evtTankFrustrated(Event event, const char[] name, bool dontBroadcast) 
{
	#if DEBUG
	LogMessage("Tank is frustrated!");
	#endif
	int client = GetClientOfUserId(event.GetInt("userid"));
	if(client && IsClientInGame(client) && GetClientTeam(client) == TEAM_INFECTED && !IsFakeClient(client) && GameMode != 2)
	{
		ForcePlayerSuicide(client);
		CreateTimer(1.5,OnEnterGhostState_Timer,client);
	}
}

public Action Event_WitchKilled(Event event, const char[] name, bool dontBroadcast)
{
	int witch = event.GetInt("witchid");
	if(KillWitchTimer[witch] != null)
	{
		KillTimer(KillWitchTimer[witch]);
		KillWitchTimer[witch] = null;
	}
}

public Action Event_WitchSpawn(Event event, const char[] name, bool dontBroadcast)
{
	int witch = event.GetInt("witchid");
	if(KillWitchTimer[witch] != null)
	{
		KillTimer(KillWitchTimer[witch]);
		KillWitchTimer[witch] = null;
	}
	KillWitchTimer[witch] = CreateTimer(h_WitchKillTime.FloatValue,KickWitch_Timer,EntIndexToEntRef(witch));
}

public Action KickWitch_Timer(Handle timer, int ref)
{
	if(IsValidEntRef(ref))
	{
		int entity = EntRefToEntIndex(ref);
		if(IsWitch(entity))
		{
			bool bKill = true;
			float clientOrigin[3];
			float witchOrigin[3];
			GetEntPropVector(entity, Prop_Send, "m_vecOrigin", witchOrigin);
			for (int i = 1; i <= MaxClients; i++)
			{
				if(IsClientInGame(i) && GetClientTeam(i) == TEAM_SURVIVORS && IsPlayerAlive(i))
				{
					GetClientAbsOrigin(i, clientOrigin);
					if (GetVectorDistance(clientOrigin, witchOrigin, true) < Pow(h_SpawnDistanceMax.FloatValue,2.0))
					{
						bKill = false;
						break;
					}
				}
			}

			if(bKill)
			{
				AcceptEntityInput(entity, "kill");
				KillWitchTimer[entity] = null;
			}
			else KillWitchTimer[entity] = CreateTimer(h_WitchKillTime.FloatValue,KickWitch_Timer,EntIndexToEntRef(entity));
		}
	}
}
// The main Tank code, it allows a player to take over the tank when if allowed, and adds additional tanks if the tanks per spawn cvar was set.
public Action TankSpawner(Handle timer, int client)
{
	#if DEBUG
	LogMessage("Tank Spawner Triggred");
	#endif
	int Index[8];
	int IndexCount = 0;
	float position[3];
	int tankhealth;
	bool tankonfire;
	
	if (client && IsClientInGame(client))
	{
		tankhealth = GetClientHealth(client);
		GetClientAbsOrigin(client, position);
		if (GetEntProp(client, Prop_Data, "m_fFlags") & FL_ONFIRE && PlayerIsAlive(client))
			tankonfire = true;
	}
	
	if (h_CoopPlayableTank.BoolValue)
	{
		for (int t=1;t<=MaxClients;t++)
		{
			// We check if player is in game
			if (!IsClientInGame(t)) continue;
			
			// Check if client is infected ...
			if (GetClientTeam(t)!=TEAM_INFECTED) continue;
			
			if (!IsFakeClient(t))
			{
				// If player is not a tank, or a dead one
				if (!IsPlayerTank(t) || (IsPlayerTank(t) && !PlayerIsAlive(t)))
				{
					IndexCount++; // increase count of valid targets
					Index[IndexCount] = t; //save target to index
					#if DEBUG
					PrintToChatAll("Client %i found to be valid Tank Choice", Index[IndexCount]);
					#endif
				}
			}	
		}
	}
	
	#if DEBUG
	if (h_CoopPlayableTank.BoolValue)
	{
		
		PrintToChatAll("Valid Tank Candidates found: %i", IndexCount);
		
	}
	#endif
	
	if (h_CoopPlayableTank.BoolValue && IndexCount != 0 )
	{
		MaxPlayerTank--;
		#if DEBUG
		PrintToChatAll("Tank Kicked");
		#endif
		
		int tank = GetURandomIntRange(1, IndexCount);  // pick someone from the valid targets
		WillBeTank[Index[tank]] = true;
		
		#if DEBUG
		PrintToChatAll("Random Number pulled: %i, from %i", tank, IndexCount);
		PrintToChatAll("Client chosen to be Tank: %i", Index[tank]);
		#endif
		
		if (L4D2Version && IsPlayerJockey(Index[tank]))
		{
			// WE NEED TO DISMOUNT THE JOCKEY OR ELSE BAAAAAAAAAAAAAAAD THINGS WILL HAPPEN
			
			CheatCommand(Index[tank], "dismount");
		}
		
		ChangeClientTeam(Index[tank], TEAM_SPECTATOR);
		ChangeClientTeam(Index[tank], TEAM_INFECTED);
	}
	
	bool resetGhost[MAXPLAYERS+1];
	bool resetLife[MAXPLAYERS+1];
	
	if (h_CoopPlayableTank.BoolValue && IndexCount != 0)
	{
		for (int i=1;i<=MaxClients;i++)
		{
			if ( IsClientInGame(i) && !IsFakeClient(i)) // player is connected and is not fake and it's in game ...
			{
				// If player is on infected's team and is dead ..
				if ((GetClientTeam(i)==TEAM_INFECTED) && WillBeTank[i] == false)
				{
					// If player is a ghost ....
					if (IsPlayerGhost(i))
					{
						resetGhost[i] = true;
						SetGhostStatus(i, false);
						#if DEBUG
						LogMessage("Player is a ghost, taking preventive measures to prevent the player from taking over the tank");
						#endif
					}
					else if (!PlayerIsAlive(i))
					{
						resetLife[i] = true;
						SetLifeState(i, false);
						#if DEBUG
						LogMessage("Dead player found, setting restrictions to prevent the player from taking over the tank");
						#endif
					}
				}
			}
		}
		
		// Find any human client and give client admin rights
		int anyclient = GetAnyClient();
		
		CheatCommand(anyclient, sSpawnCommand, "tank auto");
		
		// We restore the player's status
		for (int i=1;i<=MaxClients;i++)
		{
			if (resetGhost[i] == true)
				SetGhostStatus(i, true);
			if (resetLife[i] == true)
				SetLifeState(i, true);
			if (WillBeTank[i] == true)
			{
				if (client && IsClientInGame(i))
				{
					TeleportEntity(i, position, NULL_VECTOR, NULL_VECTOR);
					SetEntityHealth(i, tankhealth);
					if (tankonfire)
						CreateTimer(0.1, PutTankOnFireTimer, i, TIMER_FLAG_NO_MAPCHANGE);
					if (h_CoopPlayableTank.BoolValue)
						TankWasSeen[i] = true;
				}
				WillBeTank[i] = false;
				Handle datapack = CreateDataPack();
				WritePackCell(datapack, tankhealth);
				WritePackCell(datapack, tankonfire);
				WritePackCell(datapack, i);
				CreateTimer(1.0, TankRespawner, datapack);
			}
		}
		
		
		#if DEBUG
		if (IsPlayerTank(client) && IsFakeClient(client))
		{
			PrintToChatAll("Bot Tank Spawn Event Triggered");
		}
		else if (IsPlayerTank(client) && !IsFakeClient(client))
		{
			PrintToChatAll("Human Tank Spawn Event Triggered");
		}
		#endif
	}
	
	MaxPlayerTank = MaxPlayerZombies;
	SetConVarInt(FindConVar("z_max_player_zombies"), MaxPlayerZombies);
}


public Action TankRespawner(Handle timer, Handle datapack)
{
	// This function is used to check if the tank successfully spawned, and if not, respawn him
	
	// Reset the data pack
	ResetPack(datapack);
	
	int tankhealth = ReadPackCell(datapack);
	int tankonfire = ReadPackCell(datapack);
	int client = ReadPackCell(datapack);
	
	if (IsClientInGame(client) && IsFakeClient(client) && IsPlayerTank(client) && PlayerIsAlive(client))
	{
		CreateTimer(0.1, kickbot, client);
		return;
	}
	
	if (IsClientInGame(client) && IsPlayerTank(client) && PlayerIsAlive(client))
		return;
	
	WillBeTank[client] = true;
	
	bool resetGhost[MAXPLAYERS+1];
	bool resetLife[MAXPLAYERS+1];
	
	for (int i=1;i<=MaxClients;i++)
	{
		if ( IsClientInGame(i) && !IsFakeClient(i)) // player is connected and is not fake and it's in game ...
		{
			// If player is on infected's team and is dead ..
			if ((GetClientTeam(i)==TEAM_INFECTED) && WillBeTank[i] == false)
			{
				// If player is a ghost ....
				if (IsPlayerGhost(i))
				{
					resetGhost[i] = true;
					SetGhostStatus(i, false);
					#if DEBUG
					LogMessage("Player is a ghost, taking preventive measures to prevent the player from taking over the tank");
					#endif
				}
				else if (!PlayerIsAlive(i))
				{
					resetLife[i] = true;
					SetLifeState(i, false);
					#if DEBUG
					LogMessage("Dead player found, setting restrictions to prevent the player from taking over the tank");
					#endif
				}
			}
		}
	}
	
	// Find any human client and give client admin rights
	int anyclient = GetAnyClient();

	CheatCommand(anyclient, sSpawnCommand, "tank auto");

	
	// We restore the player's status
	for (int i=1;i<=MaxClients;i++)
	{
		if (resetGhost[i] == true)
			SetGhostStatus(i, true);
		if (resetLife[i] == true)
			SetLifeState(i, true);
		if (WillBeTank[i] == true && IsClientInGame(i))
		{
			if (client && IsClientInGame(i))
			{
				SetEntityHealth(i, tankhealth);
				if (tankonfire)
					CreateTimer(0.1, PutTankOnFireTimer, i, TIMER_FLAG_NO_MAPCHANGE);
				if (h_CoopPlayableTank.BoolValue)
					TankWasSeen[i] = true;
			}
			WillBeTank[i] = false;
			datapack = CreateDataPack();
			WritePackCell(datapack, tankhealth);
			WritePackCell(datapack, tankonfire);
			WritePackCell(datapack, i);
			CreateTimer(1.0, TankRespawner, datapack);
		}
	}
}

public Action TankBugFix(Handle timer, int client)
{
	#if DEBUG
	LogMessage("Tank BugFix Triggred");
	#endif
	
	if (IsClientInGame(client) && IsFakeClient(client) && GetClientTeam(client) == 3)
	{
		int lifestate = GetEntData(client, FindSendPropInfo("CTerrorPlayer", "m_lifeState"));
		if (lifestate == 0)
		{
			int bot = SDKCall(hCreateTank, "Infected Bot Tank"); //召喚坦克
			if (bot > 0 && IsValidClient(bot))
			{
				#if DEBUG
					PrintToChatAll("Ghost BugFix");
				#endif
				SetEntityModel(bot, MODEL_TANK);
				ChangeClientTeam(bot, TEAM_INFECTED);
				//SDKCall(hRoundRespawn, bot);
				SetEntProp(bot, Prop_Send, "m_usSolidFlags", 16);
				SetEntProp(bot, Prop_Send, "movetype", 2);
				SetEntProp(bot, Prop_Send, "deadflag", 0);
				SetEntProp(bot, Prop_Send, "m_lifeState", 0);
				//SetEntProp(bot, Prop_Send, "m_fFlags", 129);
				SetEntProp(bot, Prop_Send, "m_iObserverMode", 0);
				SetEntProp(bot, Prop_Send, "m_iPlayerState", 0);
				SetEntProp(bot, Prop_Send, "m_zombieState", 0);
				DispatchSpawn(bot);
				ActivateEntity(bot);

				float Origin[3], Angles[3];
				GetClientAbsOrigin(client, Origin);
				GetClientAbsAngles(client, Angles);
				KickClient(client);
				TeleportEntity(bot, Origin, Angles, NULL_VECTOR); //移動到相同位置
			}
		}	
	}
}

public Action PutTankOnFireTimer(Handle Timer, int client)
{
	if(client && IsClientInGame(client) && GetClientTeam(client) == TEAM_INFECTED)
		IgniteEntity(client, 9999.0);
}

public Action HookSound_Callback(int Clients[64], int &NumClients, char StrSample[PLATFORM_MAX_PATH], int &Entity)
{
	if (GameMode != 1 || !h_CoopPlayableTank.BoolValue)
		return Plugin_Continue;
	
	//to work only on tank steps, its Tank_walk
	if (StrContains(StrSample, "Tank_walk", false) == -1) return Plugin_Continue;
	
	for (int i=1;i<=MaxClients;i++)
	{
		// We check if player is in game
		if (!IsClientInGame(i)) continue;
		
		// Check if client is infected ...
		if (GetClientTeam(i)==TEAM_INFECTED)
		{
			// If player is a tank
			if (IsPlayerTank(i) && PlayerIsAlive(i) && TankWasSeen[i] == false)
			{
				if (RealPlayersOnInfected() && AreTherePlayersWhoAreNotTanks())
				{
					CreateTimer(0.2, kickbot, i);
					CreateTimer(0.1, TankSpawner, i);
				}
			}
		}
	}
	return Plugin_Continue;
}


// This event serves to make sure the bots spawn at the start of the finale event. The director disallows spawning until the survivors have started the event, so this was
// definitely needed.
public Action evtFinaleStart(Event event, const char[] name, bool dontBroadcast) 
{
	FinaleStarted = true;
	CreateTimer(1.0, CheckIfBotsNeededLater, true);
}

int BotTypeNeeded()
{
	#if DEBUG
	LogMessage("Determining Bot type now");
	#endif
	#if DEBUG
	PrintToChatAll("Determining Bot type now");
	#endif
	
	// current count ...
	int boomers=0;
	int smokers=0;
	int hunters=0;
	int spitters=0;
	int jockeys=0;
	int chargers=0;
	int tanks=0;
	
	for (int i=1;i<=MaxClients;i++)
	{
		// if player is connected and ingame ...
		if (IsClientInGame(i))
		{
			// if player is on infected's team
			if (GetClientTeam(i) == TEAM_INFECTED && PlayerIsAlive(i))
			{
				// We count depending on class ...
				if (IsPlayerSmoker(i))
					smokers++;
				else if (IsPlayerBoomer(i))
					boomers++;	
				else if (IsPlayerHunter(i))
					hunters++;	
				else if (IsPlayerTank(i))
					tanks++;	
				else if (L4D2Version && IsPlayerSpitter(i))
					spitters++;	
				else if (L4D2Version && IsPlayerJockey(i))
					jockeys++;	
				else if (L4D2Version && IsPlayerCharger(i))
					chargers++;	
			}
		}
	}

	if  (L4D2Version)
	{
		int randompercent = GetURandomIntRange(1, 100);
		if (tanks < h_TankLimit.IntValue && randompercent < h_SpawnTankProbability.FloatValue)
		{
			#if DEBUG
			LogMessage("Bot type returned Tank");
			#endif
			return 7;
		}
		else //spawn other S.I.
		{
			int random = GetURandomIntRange(1, 6);
			
			int i=0;
			while(i++<10)
			{
				if (random == 1)
				{
					if ((hunters < HunterLimit) && (canSpawnHunter))
					{
						#if DEBUG
						LogMessage("Bot type returned Hunter");
						#endif
						return 1;
					}
					random++;
				}
				if (random == 2)
				{
					if ((smokers < SmokerLimit) && (canSpawnSmoker))
					{
						#if DEBUG
						LogMessage("Bot type returned Smoker");
						#endif
						return 2;
					}
					random++;
				}
				if (random == 3)
				{
					if ((boomers < BoomerLimit) && (canSpawnBoomer))
					{
						#if DEBUG
						LogMessage("Bot type returned Boomer");
						#endif
						return 3;
					}
					random++;
				}
				if (random == 4)
				{
					if ((spitters < SpitterLimit) && (canSpawnSpitter))
					{
						#if DEBUG
						LogMessage("Bot type returned Spitter");
						#endif
						return 4;
					}
					random++;
				}
				if (random == 5)
				{
					if ((jockeys < JockeyLimit) && (canSpawnJockey))
					{
						#if DEBUG
						LogMessage("Bot type returned Jockey");
						#endif
						return 5;
					}
					random++;
				}
				if (random == 6)
				{
					if ((chargers < ChargerLimit) && (canSpawnCharger))
					{
						#if DEBUG
						LogMessage("Bot type returned Charger");
						#endif
						return 6;
					}
					random = 1;
				}
			}
		}
	}
	else
	{
		int randompercent = GetURandomIntRange(1, 100);
		if (tanks < h_TankLimit.IntValue && randompercent < h_SpawnTankProbability.FloatValue)
		{
			#if DEBUG
			LogMessage("Bot type returned Tank");
			#endif
			return 7;
		}
		else
		{
			int random = GetURandomIntRange(1, 3);
			
			int i=0;
			while(i++<10)
			{
				if (random == 1)
				{
					if (hunters < HunterLimit && canSpawnHunter)
					{
						#if DEBUG
						LogMessage("Returning Hunter");
						#endif
						return 1;
					}
					random++;
				}
				if (random == 2)
				{
					if ((smokers < SmokerLimit) && (canSpawnSmoker)) // we need a smoker ???? can we spawn a smoker ??? is smoker bot allowed ??
					{
						#if DEBUG
						LogMessage("Returning Smoker");
						#endif
						return 2;
					}
					random++;
				}
				if (random == 3)
				{
					if ((boomers < BoomerLimit) && (canSpawnBoomer))
					{
						#if DEBUG
						LogMessage("Returning Boomer");
						#endif
						return 3;
					}
					random=1;
				}
			}
		}
	}
	
	return 0;
	
}


public Action Spawn_InfectedBot(Handle timer)
{
	// If round has ended, we ignore this request ...
	if (b_HasRoundEnded || !b_LeftSaveRoom ) return;
	
	int Infected = MaxPlayerZombies;
	
	if (h_Coordination.BoolValue && !DirectorSpawn && !InitialSpawn && !PlayerReady())
	{
		BotReady++;
		
		for (int i=1;i<=MaxClients;i++)
		{
			// We check if player is in game
			if (!IsClientInGame(i)) continue;
			
			// Check if client is infected ...
			if (GetClientTeam(i)==TEAM_INFECTED)
			{
				// If player is a real player 
				if (!IsFakeClient(i))
					Infected--;
			}
		}
		//PrintToChatAll("BotReady: %d, Infected,: %d, InfectedBotQueue: %d",BotReady,Infected,InfectedBotQueue);
		if (BotReady >= Infected)
		{
			CreateTimer(3.0, BotReadyReset, _, TIMER_FLAG_NO_MAPCHANGE);
		}
		else
		{
			if(InfectedBotQueue > 0) InfectedBotQueue--;
			if(ThereAreNoInfectedBotsRespawnDelay() && InfectedBotQueue >= 0)
			{
				//PrintToChatAll("try to spawn bot");
				CreateTimer(0.2, Spawn_InfectedBot, _, TIMER_FLAG_NO_MAPCHANGE);
			}
			return;
		}
	}
	
	// First we get the infected count
	if (GameMode == 2)
	{
		CountInfected();
	}
	else
	{
		CountInfected_Coop();
	}
	// If infected's team is already full ... we ignore this request (a real player connected after timer started ) ..
	if ((InfectedRealCount + InfectedBotCount) >= MaxPlayerZombies || (InfectedRealCount + InfectedBotCount + InfectedBotQueue) > MaxPlayerZombies) 	
	{
		#if DEBUG
		LogMessage("We found a player, don't spawn a bot");
		#endif
		if(InfectedBotQueue>0) InfectedBotQueue--;
		return;
	}
	
	// If there is a tank on the field and l4d_infectedbots_spawns_disable_tank is set to 1, the plugin will check for
	// any tanks on the field
	
	if (h_DisableSpawnsTank.BoolValue)
	{
		for (int i=1;i<=MaxClients;i++)
		{
			// We check if player is in game
			if (!IsClientInGame(i)) continue;
			
			// Check if client is infected ...
			if (GetClientTeam(i)==TEAM_INFECTED)
			{
				// If player is a tank
				if (IsPlayerTank(i) && IsPlayerAlive(i) && GetEntProp(i, Prop_Send, "m_hasVisibleThreats"))
				{
					if(InfectedBotQueue>0) InfectedBotQueue--;
					return;
				}
			}
		}
		
	}
	
	// Before spawning the bot, we determine if an real infected player is dead, since the int infected bot will be controlled by this player
	bool resetGhost[MAXPLAYERS+1];
	bool resetLife[MAXPLAYERS+1];
	bool binfectedfreeplayer = false;
	for (int i=1;i<=MaxClients;i++)
	{
		if (IsClientInGame(i) && !IsFakeClient(i)) // player is connected and is not fake and it's in game ...
		{
			// If player is on infected's team and is dead ..
			if (GetClientTeam(i) == TEAM_INFECTED)
			{
				// If player is a ghost ....
				if (IsPlayerGhost(i))
				{
					resetGhost[i] = true;
					SetGhostStatus(i, false);
					#if DEBUG
					LogMessage("Player is a ghost, taking preventive measures for spawning an infected bot");
					#endif
				}
				else if (!PlayerIsAlive(i) && GameMode == 2) // if player is just dead
				{
					resetLife[i] = true;
					SetLifeState(i, false);
				}
				else if (!PlayerIsAlive(i) && respawnDelay[i] > 0)
				{
					resetLife[i] = true;
					SetLifeState(i, false);
					#if DEBUG
					LogMessage("Found a dead player, spawn time has not reached zero, delaying player to Spawn an infected bot");
					#endif
				}
				else if (!PlayerIsAlive(i) && respawnDelay[i] <= 0)
				{
					AlreadyGhosted[i] = false;
					SetLifeState(i, true);
					binfectedfreeplayer = true;
				}
				
			}
		}
	}
	
	// We get any client ....
	int anyclient = GetAnyClient();
	
	if (GameMode != 2 && !binfectedfreeplayer)
	{
		int bot = CreateFakeClient("Infected Bot");
		if (bot != 0)
		{
			ChangeClientTeam(bot,TEAM_INFECTED);
			CreateTimer(0.1,kickbot,bot);
		}
	}
	
	// Determine the bot class needed ...
	int bot_type = BotTypeNeeded();
	
	// We spawn the bot ...
	switch (bot_type)
	{
		case 0: // Nothing
		{
			#if DEBUG
			LogMessage("Bot_type returned NOTHING!");
			#endif
		}
		case 1: // Hunter
		{
			#if DEBUG
			LogMessage("Spawning Hunter");
			#endif
			#if DEBUG
			PrintToChatAll("Spawning Hunter");
			#endif
			CheatCommand(anyclient, sSpawnCommand, "hunter auto");
		}
		case 2: // Smoker
		{	
			#if DEBUG
			LogMessage("Spawning Smoker");
			#endif
			#if DEBUG
			PrintToChatAll("Spawning Smoker");
			#endif
			CheatCommand(anyclient, sSpawnCommand, "smoker auto");
		}
		case 3: // Boomer
		{
			#if DEBUG
			LogMessage("Spawning Boomer");
			#endif
			#if DEBUG
			PrintToChatAll("Spawning Boomer");
			#endif
			CheatCommand(anyclient, sSpawnCommand, "boomer auto");
		}
		case 4: // Spitter
		{
			#if DEBUG
			LogMessage("Spawning Spitter");
			#endif
			#if DEBUG
			PrintToChatAll("Spawning Spitter");
			#endif
			CheatCommand(anyclient, sSpawnCommand, "spitter auto");
		}
		case 5: // Jockey
		{
			#if DEBUG
			LogMessage("Spawning Jockey");
			#endif
			#if DEBUG
			PrintToChatAll("Spawning Jockey");
			#endif
			CheatCommand(anyclient, sSpawnCommand, "jockey auto");
		}
		case 6: // Charger
		{
			#if DEBUG
			LogMessage("Spawning Charger");
			#endif
			#if DEBUG
			PrintToChatAll("Spawning Charger");
			#endif
			CheatCommand(anyclient, sSpawnCommand, "charger auto");
		}
		case 7: // Tank
		{
			#if DEBUG
			LogMessage("Spawning Tank");
			#endif
			#if DEBUG
			PrintToChatAll("Spawning Tank");
			#endif
			CheatCommand(anyclient, sSpawnCommand, "tank auto");
		}
	}
	
	// We restore the player's status
	for (int i=1;i<=MaxClients;i++)
	{
		if (resetGhost[i] == true)
			SetGhostStatus(i, true);
		if (resetLife[i] == true)
			SetLifeState(i, true);
	}
	
	// Debug print
	#if DEBUG
	PrintToChatAll("Spawning an infected bot. Type = %i ", bot_type);
	#endif
	
	// We decrement the infected queue
	if(InfectedBotQueue>0) InfectedBotQueue--;
	
	CreateTimer(1.0, CheckIfBotsNeededLater, true);
}

stock int GetAnyClient() 
{ 
	for (int target = 1; target <= MaxClients; target++) 
	{ 
		if (IsClientInGame(target)) return target; 
	} 
	return -1; 
}

public Action kickbot(Handle timer, int client)
{
	if (IsClientInGame(client) && (!IsClientInKickQueue(client)))
	{
		if (IsFakeClient(client)) KickClient(client);
	}
}

bool IsPlayerGhost (int client)
{
	if (GetEntProp(client, Prop_Send, "m_isGhost"))
		return true;
	return false;
}

bool PlayerIsAlive (int client)
{
	if (!GetEntProp(client,Prop_Send, "m_lifeState"))
		return true;
	return false;
}

bool IsPlayerSmoker (int client)
{
	if(GetEntProp(client,Prop_Send,"m_zombieClass") == ZOMBIECLASS_SMOKER)
		return true;
	return false;
}

bool IsPlayerBoomer (int client)
{
	if(GetEntProp(client,Prop_Send,"m_zombieClass") == ZOMBIECLASS_BOOMER)
		return true;
	return false;
}

bool IsPlayerHunter (int client)
{
	if(GetEntProp(client,Prop_Send,"m_zombieClass") == ZOMBIECLASS_HUNTER)
		return true;
	return false;
}

bool IsPlayerSpitter (int client)
{
	if(GetEntProp(client,Prop_Send,"m_zombieClass") == ZOMBIECLASS_SPITTER)
		return true;
	return false;
}

bool IsPlayerJockey (int client)
{
	if(GetEntProp(client,Prop_Send,"m_zombieClass") == ZOMBIECLASS_JOCKEY)
		return true;
	return false;
}

bool IsPlayerCharger (int client)
{
	if(GetEntProp(client,Prop_Send,"m_zombieClass") == ZOMBIECLASS_CHARGER)
		return true;
	return false;
}

bool IsPlayerTank (int client)
{
	if(GetEntProp(client,Prop_Send,"m_zombieClass") == ZOMBIECLASS_TANK)
		return true;
	return false;
}

void SetGhostStatus (int client, bool ghost)
{
	if (ghost)
		SetEntProp(client, Prop_Send, "m_isGhost", 1, 1);
	else
		SetEntProp(client, Prop_Send, "m_isGhost", 0, 1);
}

void SetLifeState (int client, bool ready)
{
	if (ready)
		SetEntProp(client, Prop_Send,  "m_lifeState", 1, 1);
	else
		SetEntProp(client, Prop_Send, "m_lifeState", 0, 1);
}

bool RealPlayersOnSurvivors ()
{
	for (int i=1;i<=MaxClients;i++)
	{
		if (IsClientInGame(i) && !IsFakeClient(i))
			if (GetClientTeam(i) == TEAM_SURVIVORS)
				return true;
		}
	return false;
}

int TrueNumberOfSurvivors ()
{
	int TotalSurvivors;
	for (int i=1;i<=MaxClients;i++)
	{
		if (IsClientInGame(i) && GetClientTeam(i) == TEAM_SURVIVORS)
				TotalSurvivors++;
	}
	return TotalSurvivors;
}

int TrueNumberOfAliveSurvivors ()
{
	int TotalSurvivors;
	for (int i=1;i<=MaxClients;i++)
	{
		if (IsClientInGame(i) && GetClientTeam(i) == TEAM_SURVIVORS && IsPlayerAlive(i))
				TotalSurvivors++;
	}
	return TotalSurvivors;
}

int HumansOnInfected ()
{
	int TotalHumans;
	for (int i=1;i<=MaxClients;i++)
	{
		if (IsClientInGame(i) && GetClientTeam(i) == TEAM_INFECTED && !IsFakeClient(i))
			TotalHumans++;
	}
	return TotalHumans;
}

bool AllSurvivorsDeadOrIncapacitated ()
{
	int PlayerIncap;
	int PlayerDead;
	
	for (int i=1;i<=MaxClients;i++)
	{
		if (IsClientInGame(i) && IsFakeClient(i))
			if (GetClientTeam(i) == TEAM_SURVIVORS)
		{
			if (GetEntProp(i, Prop_Send, "m_isIncapacitated"))
			{
				PlayerIncap++;
			}
			else if (!PlayerIsAlive(i))
			{
				PlayerDead++;
			}
		}
	}
	
	if (PlayerIncap + PlayerDead == TrueNumberOfSurvivors())
	{
		return true;
	}
	return false;
}

bool RealPlayersOnInfected ()
{
	for (int i=1;i<=MaxClients;i++)
	{
		if (IsClientInGame(i) && !IsFakeClient(i))
			if (GetClientTeam(i) == TEAM_INFECTED)
				return true;
		}
	return false;
}

bool AreTherePlayersWhoAreNotTanks ()
{
	for (int i=1;i<=MaxClients;i++)
	{	
		if (IsClientInGame(i) && !IsFakeClient(i))
		{
			if (GetClientTeam(i) == TEAM_INFECTED)
			{
				if (!IsPlayerTank(i) || IsPlayerTank(i) && !PlayerIsAlive(i))
					return true;
			}
		}
	}
	return false;
}

bool BotsAlive ()
{
	for (int i=1;i<=MaxClients;i++)
	{
		if (IsClientInGame(i) && IsFakeClient(i))
			if (GetClientTeam(i) == TEAM_INFECTED)
				return true;
		}
	return false;
}

bool PlayerReady()
{
	// First we count the ammount of infected real players
	for (int i=1;i<=MaxClients;i++)
	{
		// We check if player is in game
		if (!IsClientInGame(i)) continue;
		
		// Check if client is infected ...
		if (GetClientTeam(i) == TEAM_INFECTED)
		{
			// If player is a real player and is dead...
			if (!IsFakeClient(i) && !PlayerIsAlive(i))
			{
				if (!respawnDelay[i])
				{
					return true;
				}
			}
		}
	}
	return false;
}

int  FindBotToTakeOver()
{
	// First we find a survivor bot
	for (int i=1;i<=MaxClients;i++)
	{
		// We check if player is in game
		if (!IsClientInGame(i)) continue;
		
		// Check if client is survivor ...
		if (GetClientTeam(i) == TEAM_SURVIVORS)
		{
			// If player is a bot and is alive...
			if (IsFakeClient(i) && PlayerIsAlive(i))
			{
				return i;
			}
		}
	}
	return 0;
}

bool LeftStartArea()
{
	int ent = -1, maxents = GetMaxEntities();
	for (int i = MaxClients+1; i <= maxents; i++)
	{
		if (IsValidEntity(i))
		{
			char netclass[64];
			GetEntityNetClass(i, netclass, sizeof(netclass));
			
			if (StrEqual(netclass, "CTerrorPlayerResource"))
			{
				ent = i;
				break;
			}
		}
	}
	
	if (ent > -1)
	{
		if (GetEntProp(ent, Prop_Send, "m_hasAnySurvivorLeftSafeArea"))
		{
			return true;
		}
	}
	return false;
}

//---------------------------------------------Durzel's HUD------------------------------------------

public void OnPluginEnd()
{
	ResetTimer();

	g_iPlayerSpawn = 0;

	for( int i = 1; i <= MaxClients; i++ )
		DeleteLight(i);

	if (L4D2Version)
	{
		ResetConVar(FindConVar("survival_max_smokers"), true, true);
		ResetConVar(FindConVar("survival_max_boomers"), true, true);
		ResetConVar(FindConVar("survival_max_hunters"), true, true);
		ResetConVar(FindConVar("survival_max_spitters"), true, true);
		ResetConVar(FindConVar("survival_max_jockeys"), true, true);
		ResetConVar(FindConVar("survival_max_chargers"), true, true);
		ResetConVar(FindConVar("survival_max_specials"), true, true);
		ResetConVar(FindConVar("z_smoker_limit"), true, true);
		ResetConVar(FindConVar("z_boomer_limit"), true, true);
		ResetConVar(FindConVar("z_hunter_limit"), true, true);
		ResetConVar(FindConVar("z_spitter_limit"), true, true);
		ResetConVar(FindConVar("z_jockey_limit"), true, true);
		ResetConVar(FindConVar("z_charger_limit"), true, true);
		ResetConVar(FindConVar("z_jockey_leap_time"), true, true);
		ResetConVar(FindConVar("z_spitter_max_wait_time"), true, true);
	}
	else
	{
		ResetConVar(FindConVar("holdout_max_smokers"), true, true);
		ResetConVar(FindConVar("holdout_max_boomers"), true, true);
		ResetConVar(FindConVar("holdout_max_hunters"), true, true);
		ResetConVar(FindConVar("holdout_max_specials"), true, true);
		ResetConVar(FindConVar("z_gas_limit"), true, true);
		ResetConVar(FindConVar("z_exploding_limit"), true, true);
		ResetConVar(FindConVar("z_hunter_limit"), true, true);
	}
	ResetConVar(FindConVar("director_no_specials"), true, true);
	ResetConVar(FindConVar("hunter_leap_away_give_up_range"), true, true);
	ResetConVar(FindConVar("z_hunter_lunge_distance"), true, true);
	ResetConVar(FindConVar("hunter_pounce_ready_range"), true, true);
	ResetConVar(FindConVar("hunter_pounce_loft_rate"), true, true);
	ResetConVar(FindConVar("z_attack_flow_range"), true, true);
	ResetConVar(FindConVar("director_spectate_specials"), true, true);
	ResetConVar(FindConVar("z_spawn_safety_range"), true, true);
	ResetConVar(FindConVar("z_spawn_range"), true, true);
	ResetConVar(FindConVar("z_finale_spawn_safety_range"), true, true);
	ResetConVar(FindConVar("z_finale_spawn_tank_safety_range"), true, true);
	ResetConVar(FindConVar("z_spawn_flow_limit"), true, true);
	ResetConVar(h_MaxPlayerZombies, true, true);
	ResetConVar(FindConVar("z_tank_health"), true, true);
	ResetConVar(FindConVar("tank_ground_pound_duration"), true, true);
	ResetConVar(FindConVar("z_scrimmage_sphere"), true, true);
	ResetConVar(FindConVar("vs_max_team_switches"), true, true);
	if (!L4D2Version)
		ResetConVar(FindConVar("sb_all_bot_team"), true, true);
	else
	{
		ResetConVar(FindConVar("sb_all_bot_game"), true, true);
		ResetConVar(FindConVar("allow_all_bot_survivor_team"), true, true);
	}
	
	// Destroy the persistent storage for client HUD preferences
	if (usrHUDPref != null)
	{
		CloseHandle(usrHUDPref);
	}
	
	#if DEBUG
	PrintToChatAll("\x01\x04[infhud]\x01 [%f] \x03Infected HUD\x01 stopped.", GetGameTime());
	#endif
}

public int Menu_InfHUDPanel(Menu menu, MenuAction action, int param1, int param2) { return; }

public Action TimerAnnounce(Handle timer, int client)
{
	if (IsClientInGame(client))
	{
		if (GetClientTeam(client) == TEAM_INFECTED)
		{
			// Show welcoming instruction message to client
			PrintHintText(client, "This server runs \x03Infected Bots v%s\x01 - say !infhud to toggle HUD on/off", PLUGIN_VERSION);
			
			// This client now knows about the mod, don't tell them again for the rest of the game.
			clientGreeted[client] = 1;
		}
	}
}

public Action TimerAnnounce2(Handle timer, int client)
{
	if (IsClientInGame(client))
	{
		if (GetClientTeam(client) == TEAM_INFECTED && IsPlayerAlive(client))
		{
			C_PrintToChat(client, "[{olive}TS{default}] %T","sm_zs",client);
		}
	}
}


public void cvarZombieHPChanged(ConVar convar, const char[] oldValue, const char[] newValue)
{
	// Handle a sysadmin modifying the special infected max HP cvars
	char cvarStr[255],difficulty[100];
	convar.GetName(cvarStr, sizeof(cvarStr));
	h_Difficulty.GetString(difficulty, sizeof(difficulty));
	
	#if DEBUG
	PrintToChatAll("\x01\x04[infhud]\x01 [%f] cvarZombieHPChanged(): Infected HP cvar '%s' changed from '%s' to '%s'", GetGameTime(), cvarStr, oldValue, newValue);
	#endif
	
	if (StrEqual(cvarStr, "z_hunter_health", false))
	{
		zombieHP[0] = StringToInt(newValue);
	}
	else if (StrEqual(cvarStr, "z_smoker_health", false))
	{
		zombieHP[1] = StringToInt(newValue);
	}
	else if (StrEqual(cvarStr, "z_boomer_health", false))
	{
		zombieHP[2] = StringToInt(newValue);
	}
	else if (L4D2Version && StrEqual(cvarStr, "z_spitter_health", false))
	{
		zombieHP[3] = StringToInt(newValue);
	}
	else if (L4D2Version && StrEqual(cvarStr, "z_jockey_health", false))
	{
		zombieHP[4] = StringToInt(newValue);
	}
	else if (L4D2Version && StrEqual(cvarStr, "z_charger_health", false))
	{
		zombieHP[5] = StringToInt(newValue);
	}
	else if (StrEqual(cvarStr, "z_tank_health", false) && GameMode == 2)
	{
		zombieHP[6] = RoundToFloor(StringToInt(newValue) * 1.5);	// Tank health is multiplied by 1.5x in VS
	}
	else if (StrEqual(cvarStr, "z_tank_health", false) && GameMode != 2 && StrContains(difficulty, "Easy", false) != -1)
	{
		zombieHP[6] = RoundToFloor(StringToInt(newValue) * 0.75);
	}
	else if (StrEqual(cvarStr, "z_tank_health", false) && GameMode != 2 && StrContains(difficulty, "Normal", false) != -1)
	{
		zombieHP[6] = RoundToFloor(StringToInt(newValue) * 1.0);
	}
	else if (StrEqual(cvarStr, "z_tank_health", false) && GameMode != 2 && StrContains(difficulty, "Hard", false) != -1)
	{
		zombieHP[6] = RoundToFloor(StringToInt(newValue) * 2.0);
	}
	else if (StrEqual(cvarStr, "z_tank_health", false) && GameMode != 2 && StrContains(difficulty, "Impossible", false) != -1)
	{
		zombieHP[6] = RoundToFloor(StringToInt(newValue) * 2.0);
	}
}

public Action monitorRespawn(Handle timer)
{
	// Counts down any active respawn timers
	int foundActiveRTmr = false;
	
	// If round has ended then end timer gracefully
	if (!roundInProgress)
	{
		respawnTimer = null;
		return Plugin_Stop;
	}
	
	for (int i = 1; i <= MaxClients; i++)
	{
		if (respawnDelay[i] > 0)
		{
			//PrintToChatAll("respawnDelay[i]--");
			respawnDelay[i]--;
			foundActiveRTmr = true;
		}
	}
	
	if (!foundActiveRTmr && (respawnTimer != null))
	{
		// Being a ghost doesn't trigger an event which we can hook (player_spawn fires when player actually spawns),
		// so as a nasty kludge after the respawn timer expires for at least one player we set a timer for 1 second 
		// to update the HUD so it says "SPAWNING"
		if (delayedDmgTimer == null)
		{
			delayedDmgTimer = CreateTimer(1.0, delayedDmgUpdate, _, TIMER_FLAG_NO_MAPCHANGE);
		}
		
		// We didn't decrement any of the player respawn times, therefore we don't 
		// need to run this timer anymore.
		respawnTimer = null;
		return Plugin_Stop;
	}
	else
	{
		if (doomedTankTimer == null) ShowInfectedHUD(2);
	}
	return Plugin_Continue;
}

public Action doomedTankCountdown(Handle timer)
{
	// If round has ended then end timer gracefully
	if (!roundInProgress)
	{
		doomedTankTimer = null;
		return Plugin_Stop;
	}
	
	for (int i = 1; i <= MaxClients; i++)
	{
		if (!IsClientInGame(i) || GetClientTeam(i)!=3 || !IsPlayerTank(i))
			continue;
		
		// Counts down the number of seconds before the Tank will die automatically
		// from fire damage (if not before from gun damage)
		if (isTankOnFire[i] == true)
		{
			if (--burningTankTimeLeft[i] < 1)
			{
				// Tank is dead :(
				#if DEBUG
				PrintToChatAll("\x01\x04[infhud]\x01 [%f] Tank died automatically from fire timer expiry.", GetGameTime());
				#endif
				isTankOnFire[i] = false;
				if (!CheckForTanksOnFire())
				{
					doomedTankTimer = null;
					return Plugin_Stop;
				}
			}
			else
			{
				// This is almost the same as the respawnTimer code (which only updates the HUD in one of the two 1-second update
				// timer functions, however there may well be an instance in the game where both the Tank is on fire, and people are
				// respawning - therefore we need to make sure *at least one* of the 1-second timers updates the HUD, so we choose this
				// one (as it's rarer in game and therefore more optimal to do two extra code checks to achieve the same result).
				if (respawnTimer == null || (doomedTankTimer != null && respawnTimer != null))
				{
					ShowInfectedHUD(4);
				}
			}
		}
	}
	
	return Plugin_Continue;
}

public Action delayedDmgUpdate(Handle timer) 
{
	delayedDmgTimer = null;
	ShowInfectedHUD(3);
	return Plugin_Handled;
}

public void queueHUDUpdate(int src)
{
	// queueHUDUpdate basically ensures that we're not constantly refreshing the HUD when there are one or more
	// timers active.  For example, if we have a respawn countdown timer (which is likely at any given time) then
	// there is no need to refresh 
	
	// Don't bother with infected HUD updates if the round has ended.
	if (!roundInProgress) return;
	
	if (respawnTimer == null && doomedTankTimer == null)
	{
		ShowInfectedHUD(src);
		#if DEBUG
	}
	else
	{
		PrintToChatAll("\x01\x04[infhud]\x01 [%f] queueHUDUpdate(): Instant HUD update ignored, 1-sec timer active.", GetGameTime());
		#endif
	}	
}

public Action showInfHUD(Handle timer) 
{
	if (roundInProgress)
	{
		ShowInfectedHUD(1);
		return Plugin_Continue;
	}
	else
	{
		infHUDTimer = null;
		return Plugin_Stop;
	}		
}

public Action Command_Say(int client, int args)
{
	char clientSteamID[32];
	//GetClientAuthString(client, clientSteamID, 32);
	
	if (h_InfHUD.BoolValue)
	{
		if (!hudDisabled[client])
		{
			PrintToChat(client, "\x01\x04[infhud]\x01 %T","Hud Disable",client);
			SetTrieValue(usrHUDPref, clientSteamID, 1);
			hudDisabled[client] = 1;
		}
		else
		{
			PrintToChat(client, "\x01\x04[infhud]\x01 %T","Hud Enable",client);
			RemoveFromTrie(usrHUDPref, clientSteamID);
			hudDisabled[client] = 0;
		}
	}
	else
	{
		// Server admin has disabled Infected HUD server-wide
		PrintToChat(client, "\x01\x04[infhud]\x01 %T","Infected HUD is currently DISABLED",client);
	}	
	return Plugin_Handled;
}

public void ShowInfectedHUD(int src)
{
	if ((!h_InfHUD.BoolValue) || IsVoteInProgress())
	{
		return;
	}
	
	// If no bots are alive, no point in showing the HUD
	if (GameMode == 2 && !BotsAlive())
	{
		return;
	}
	
	#if DEBUG
	char calledFunc[255];
	switch (src)
	{
		case 1: strcopy(calledFunc, sizeof(calledFunc), "showInfHUD");
		case 2: strcopy(calledFunc, sizeof(calledFunc), "monitorRespawn");
		case 3: strcopy(calledFunc, sizeof(calledFunc), "delayedDmgUpdate");
		case 4: strcopy(calledFunc, sizeof(calledFunc), "doomedTankCountdown");
		case 10: strcopy(calledFunc, sizeof(calledFunc), "queueHUDUpdate - client join");
		case 11: strcopy(calledFunc, sizeof(calledFunc), "queueHUDUpdate - team switch");
		case 12: strcopy(calledFunc, sizeof(calledFunc), "queueHUDUpdate - spawn");
		case 13: strcopy(calledFunc, sizeof(calledFunc), "queueHUDUpdate - death");
		case 14: strcopy(calledFunc, sizeof(calledFunc), "queueHUDUpdate - menu closed");
		case 15: strcopy(calledFunc, sizeof(calledFunc), "queueHUDUpdate - player kicked");
		case 16: strcopy(calledFunc, sizeof(calledFunc), "evtRoundEnd");
		default: strcopy(calledFunc, sizeof(calledFunc), "UNKNOWN");
	}
	
	PrintToChatAll("\x01\x04[infhud]\x01 [%f] ShowInfectedHUD() called by [\x04%i\x01] '\x03%s\x01'", GetGameTime(), src, calledFunc);
	#endif 
	
	int i, iHP;
	char iClass[100],lineBuf[100],iStatus[15];
	
	// Display information panel to infected clients
	pInfHUD = new Panel(GetMenuStyleHandle(MenuStyle_Radio));
	char information[32];
	if (GameMode == 2)
		Format(information, sizeof(information), "INFECTED BOTS(%s):", PLUGIN_VERSION);
	else
		Format(information, sizeof(information), "INFECTED TEAM(%s):", PLUGIN_VERSION);

	pInfHUD.SetTitle(information);
	pInfHUD.DrawItem(" ",ITEMDRAW_SPACER|ITEMDRAW_RAWLINE);
	
	if (roundInProgress)
	{
		// Loop through infected players and show their status
		for (i = 1; i <= MaxClients; i++)
		{
			if (!IsClientInGame(i)) continue;
			if (GetClientMenu(i) == MenuSource_RawPanel || GetClientMenu(i) == MenuSource_None)
			{
				if (GetClientTeam(i) == TEAM_INFECTED)
				{
					// Work out what they're playing as
					if (IsPlayerHunter(i))
					{
						strcopy(iClass, sizeof(iClass), "Hunter");
						iHP = RoundFloat((float(GetClientHealth(i)) / zombieHP[0]) * 100);
					}
					else if (IsPlayerSmoker(i))
					{
						strcopy(iClass, sizeof(iClass), "Smoker");
						iHP = RoundFloat((float(GetClientHealth(i)) / zombieHP[1]) * 100);
					}
					else if (IsPlayerBoomer(i))
					{
						strcopy(iClass, sizeof(iClass), "Boomer");
						iHP = RoundFloat((float(GetClientHealth(i)) / zombieHP[2]) * 100);
					}
					else if (L4D2Version && IsPlayerSpitter(i)) 
					{
						strcopy(iClass, sizeof(iClass), "Spitter");
						iHP = RoundFloat((float(GetClientHealth(i)) / zombieHP[3]) * 100);	
					}
					else if (L4D2Version && IsPlayerJockey(i)) 
					{
						strcopy(iClass, sizeof(iClass), "Jockey");
						iHP = RoundFloat((float(GetClientHealth(i)) / zombieHP[4]) * 100);	
					} 
					else if (L4D2Version && IsPlayerCharger(i)) 
					{
						strcopy(iClass, sizeof(iClass), "Charger");
						iHP = RoundFloat((float(GetClientHealth(i)) / zombieHP[5]) * 100);	
					} 
					else if (IsPlayerTank(i))
					{
						strcopy(iClass, sizeof(iClass), "Tank");
						iHP = RoundFloat((float(GetClientHealth(i)) / zombieHP[6]) * 100);	
					}
					
					if (PlayerIsAlive(i))
					{
						// Check to see if they are a ghost or not
						if (IsPlayerGhost(i))
						{
							strcopy(iStatus, sizeof(iStatus), "GHOST");
						}
						else Format(iStatus, sizeof(iStatus), "%i%%", iHP);
					}
					else
					{
						if (respawnDelay[i] > 0 && !DirectorSpawn)
						{
							Format(iStatus, sizeof(iStatus), "DEAD (%i)", respawnDelay[i]);
							strcopy(iClass, sizeof(iClass), "");
							// As a failsafe if they're dead/waiting set HP to 0
							iHP = 0;
						} 
						else if (respawnDelay[i] == 0 && GameMode != 2 && !DirectorSpawn)
						{
							Format(iStatus, sizeof(iStatus), "READY");
							strcopy(iClass, sizeof(iClass), "");
							// As a failsafe if they're dead/waiting set HP to 0
							iHP = 0;
						}
						else if (respawnDelay[i] > 0 && DirectorSpawn && GameMode != 2)
						{
							Format(iStatus, sizeof(iStatus), "DELAY (%i)", respawnDelay[i]);
							strcopy(iClass, sizeof(iClass), "");
							// As a failsafe if they're dead/waiting set HP to 0
							iHP = 0;
						} 
						else if (respawnDelay[i] == 0 && DirectorSpawn && GameMode != 2)
						{
							Format(iStatus, sizeof(iStatus), "WAITING");
							strcopy(iClass, sizeof(iClass), "");
							// As a failsafe if they're dead/waiting set HP to 0
							iHP = 0;
						}
						else
						{
							Format(iStatus, sizeof(iStatus), "DEAD");
							strcopy(iClass, sizeof(iClass), "");
							// As a failsafe if they're dead/waiting set HP to 0
							iHP = 0;
						}
					}
					
					// Special case - if player is Tank and on fire, show the countdown
					if (StrContains(iClass, "Tank", false) != -1 && isTankOnFire[i] && PlayerIsAlive(i))
					{
						Format(iStatus, sizeof(iStatus), "%s-FIRE(%i)", iStatus, burningTankTimeLeft[i]);
					}
					
					if (IsFakeClient(i))
					{
						Format(lineBuf, sizeof(lineBuf), "%N-%s", i, iStatus);
						pInfHUD.DrawItem(lineBuf);
					}
					else
					{
						Format(lineBuf, sizeof(lineBuf), "%N-%s-%s", i, iClass, iStatus);
						pInfHUD.DrawItem(lineBuf);
					}
				}
			}
			else
			{
				#if DEBUG
				PrintToChat(i, "x01\x04[infhud]\x01 [%f] Not showing infected HUD as vote/menu (%i) is active", GetClientMenu(i), GetGameTime());
				#endif
			}
		}
	}
	
	// Output the current team status to all infected clients
	// Technically the below is a bit of a kludge but we can't be 100% sure that a client status doesn't change
	// between building the panel and displaying it.
	for (i = 1; i <= MaxClients; i++)
	{
		if (IsClientInGame(i) && !IsFakeClient(i))
		{
			if ((GetClientTeam(i) == TEAM_INFECTED || GetClientTeam(i) == TEAM_SPECTATOR) && (hudDisabled[i] == 0) && (GetClientMenu(i) == MenuSource_RawPanel || GetClientMenu(i) == MenuSource_None))
			{	
				pInfHUD.Send(i, Menu_InfHUDPanel, 5);
			}
		}
	}
	CloseHandle(pInfHUD);
}

public Action evtTeamSwitch(Event event, const char[] name, bool dontBroadcast) 
{
	// Check to see if player joined infected team and if so refresh the HUD
	int client = GetClientOfUserId(event.GetInt("userid"));
	if (client)
	{
		if (GetClientTeam(client) == TEAM_INFECTED)
		{
			queueHUDUpdate(11);
		}
		else
		{
			// If player teamswitched to survivor, remove the HUD from their screen
			// immediately to stop them getting an advantage
			if (GetClientMenu(client) == MenuSource_RawPanel)
			{
				CancelClientMenu(client);
			}
		} 
	}
}

public Action evtInfectedSpawn(Event event, const char[] name, bool dontBroadcast) 
{
	if(b_HasRoundStarted && g_iPlayerSpawn == 0)
	{
		CreateTimer(0.5, PluginStart);
	}
	g_iPlayerSpawn = 1;
	// Infected player spawned, so refresh the HUD
	int client = GetClientOfUserId(event.GetInt("userid"));
	if (client && IsClientInGame(client))
	{
		if (GetClientTeam(client) == TEAM_INFECTED)
		{
			queueHUDUpdate(12); 
			// If player joins server and doesn't have to wait to spawn they might not see the announce
			// until they next die (and have to wait).  As a fallback we check when they spawn if they've 
			// already seen it or not.
			if (!clientGreeted[client] && h_Announce.BoolValue)
			{		
				CreateTimer(3.0, TimerAnnounce, client);	
			}
			if(!IsFakeClient(client) && IsPlayerAlive(client))
			{
				CreateTimer(5.0, TimerAnnounce2, client);	
				fPlayerSpawnEngineTime[client] = GetEngineTime();
			}
		}
	}
}

public Action evtInfectedDeath(Event event, const char[] name, bool dontBroadcast) 
{
	// Infected player died, so refresh the HUD
	int client = GetClientOfUserId(event.GetInt("userid"));
	if (client && IsClientConnected(client) && IsClientInGame(client))
	{
		if (GetClientTeam(client) == TEAM_INFECTED)
		{
			// If player is tank and dies before the fire would've killed them, kill the fire timer
			if (IsPlayerTank(client) && isTankOnFire[client] && (doomedTankTimer != null))
			{
				#if DEBUG
				PrintToChatAll("\x01\x04[infhud]\x01 [%f] Tank died naturally before fire timer expired.", GetGameTime());
				#endif
				isTankOnFire[client] = false;
				if (!CheckForTanksOnFire())
				{
					KillTimer(doomedTankTimer);
					doomedTankTimer = null;  
				}
			}
			queueHUDUpdate(13);
		}
	}
}

public Action Player_Hurt(Event event, const char[] name, bool dontBroadcast) 
{
	int client = GetClientOfUserId(event.GetInt("userid"));
	int attacker = GetClientOfUserId(event.GetInt("attacker"));
	int dmg = event.GetInt("dmg_health");
	if(GameMode == 2 || dmg == 0 || client <= 0 || client > MaxClients || !IsClientInGame(client) || GetClientTeam(client) != TEAM_SURVIVORS) return;
	if(attacker <= 0 || attacker > MaxClients || !IsClientInGame(attacker) || IsFakeClient(attacker) || GetClientTeam(attacker) != TEAM_INFECTED) return;

	EmitSoundToClient(attacker, REWARD_SOUND);
}

public Action evtInfectedHurt(Event event, const char[] name, bool dontBroadcast) 
{
	// The life of a regular special infected is pretty transient, they won't take many shots before they 
	// are dead (unlike the survivors) so we can afford to refresh the HUD reasonably quickly when they take damage.
	// The exception to this is the Tank - with 5000 health the survivors could be shooting constantly at it 
	// resulting in constant HUD refreshes which is not efficient.  So, we check to see if the entity being 
	// shot is a Tank or not and adjust the non-repeating timer accordingly.
	
	// Don't bother with infected HUD update if the round has ended
	if (!roundInProgress) return;
	
	int client = GetClientOfUserId(event.GetInt("userid"));
	int attacker = GetClientOfUserId(event.GetInt("attacker"));

	if (FightOrDieTimer[client] != null)
	{
		KillTimer(FightOrDieTimer[client]);
		FightOrDieTimer[client] = null;
		FightOrDieTimer[client] = CreateTimer(h_idletime_b4slay.FloatValue, DisposeOfCowards, client);
	}
	
	if (FightOrDieTimer[attacker] != null)
	{
		KillTimer(FightOrDieTimer[attacker]);
		FightOrDieTimer[attacker] = null;
		FightOrDieTimer[attacker] = CreateTimer(h_idletime_b4slay.FloatValue, DisposeOfCowards, attacker);
	}
	
	if (client)
	{
		ConVar fireTankExpiry;
		char difficulty[100];
		h_Difficulty.GetString(difficulty, sizeof(difficulty));
		
		if (GetClientTeam(client) == TEAM_INFECTED)
		{
			if (IsPlayerTank(client) && isTankOnFire[client] == false)
			{
				// If player is a tank and is on fire, we start the 
				// 30-second guaranteed death timer and let his fellow Infected guys know.
				
				if ((GetEntProp(client, Prop_Data, "m_fFlags") & FL_ONFIRE) && PlayerIsAlive(client))
				{
					isTankOnFire[client] = true;
					if ((StrContains(difficulty, "Easy", false) != -1) && (GameMode == 1))
					{
						if (L4D2Version)
							fireTankExpiry = FindConVar("tank_burn_duration");
						else
						fireTankExpiry = FindConVar("tank_burn_duration_normal");
					}
					else if ((StrContains(difficulty, "Normal", false) != -1) && (GameMode == 1))
					{
						if (L4D2Version)
							fireTankExpiry = FindConVar("tank_burn_duration");
						else
						fireTankExpiry = FindConVar("tank_burn_duration_normal");
					}
					else if ((StrContains(difficulty, "Hard", false) != -1) && (GameMode == 1))
					{
						fireTankExpiry = FindConVar("tank_burn_duration_hard");
					}
					else if ((StrContains(difficulty, "Impossible", false) != -1) && (GameMode == 1))
					{
						fireTankExpiry = FindConVar("tank_burn_duration_expert");
					}
					else if (GameMode == 2 || GameMode == 3)
					{
						if (L4D2Version)
							fireTankExpiry = FindConVar("tank_burn_duration");
						else
						fireTankExpiry = FindConVar("tank_burn_duration_normal");
					}
					burningTankTimeLeft[client] = (fireTankExpiry != null) ? fireTankExpiry.IntValue : 30;
					if (doomedTankTimer == null)
						doomedTankTimer = CreateTimer(1.0, doomedTankCountdown, _, TIMER_REPEAT | TIMER_FLAG_NO_MAPCHANGE);										
				}		
			}
			// If we only have the 5 second timer running then we do a delayed damage update
			// (in reality with 4 players playing it's unlikely all of them will be alive at the same time
			// so we will probably have at least one faster timer running)
			if (delayedDmgTimer == null && respawnTimer == null && doomedTankTimer == null)
			{
				delayedDmgTimer = CreateTimer(2.0, delayedDmgUpdate, _, TIMER_FLAG_NO_MAPCHANGE);
			} 
		}
	}
}

bool CheckForTanksOnFire ()
{
	for (int i=1;i<=MaxClients;i++)
	{
		if (!IsClientInGame(i) || GetClientTeam(i)!=3 || !IsPlayerTank(i))
			continue;
		
		if (isTankOnFire[i] == true)
			return true;
	}
	return false;
}

public Action evtInfectedWaitSpawn(Event event, const char[] name, bool dontBroadcast) 
{
	// Don't bother with infected HUD update if the round has ended
	if (!roundInProgress) return;
	
	// Store this players respawn time in an array so we can present it to other clients
	int client = GetClientOfUserId(event.GetInt("userid"));
	if (client)
	{
		int timetowait;
		if (GameMode == 2 && !IsFakeClient(client))
		{	
			timetowait = event.GetInt("spawntime");
		}
		else if (GameMode != 2 && !IsFakeClient(client))
		{	
			//timetowait = GetSpawnTime[client];
			timetowait = h_InfectedSpawnTimeMin.IntValue - TrueNumberOfAliveSurvivors() * h_ReducedSpawnTimesOnPlayer.IntValue + (HumansOnInfected() - 1) * 3;
			if(timetowait <= 8)
				timetowait = 8;

			//PrintToChatAll("evtInfectedWaitSpawn: %N - %d秒",client,timetowait);
		}
		else
		{	
			timetowait = GetSpawnTime[client];
		}
		
		respawnDelay[client] = timetowait;
		// Only start timer if we don't have one already going.
		if (respawnTimer == null) {
			// Note: If we have to start a int timer then there will be a 1 second delay before it starts, so 
			// subtract 1 from the pending spawn time
			respawnDelay[client] = (timetowait-1);
			//PrintToChatAll("Start respawnTimer");
			respawnTimer = CreateTimer(1.0, monitorRespawn, _, TIMER_REPEAT | TIMER_FLAG_NO_MAPCHANGE);
		}
		// Send mod details/commands to the client, unless they have seen the announce already.
		// Note: We can't do this in OnClientPutInGame because the client may not be on the infected team
		// when they connect, and we can't put it in evtTeamSwitch because it won't register if the client
		// joins the server already on the Infected team.
		if (!clientGreeted[client] && h_Announce.BoolValue)
		{
			CreateTimer(8.0, TimerAnnounce, client);	
		}
	}
}

public Action HUDReset(Handle timer)
{
	respawnTimer 	= null;	// Respawn countdown timer
	doomedTankTimer 	= null;	// "Tank on Fire" countdown timer
	delayedDmgTimer 	= null;	// Delayed damage update timer
	pInfHUD 		= null;	// The panel shown to all infected users
}

stock int GetURandomIntRange(int min, int max)
{
	return (GetURandomInt() % (max-min+1)) + min;
}

stock void CheatCommand(int client,  char[] command, char[] arguments = "")
{
	int userFlags = GetUserFlagBits(client);
	SetUserFlagBits(client, ADMFLAG_ROOT);
	int flags = GetCommandFlags(command);
	SetCommandFlags(command, flags & ~FCVAR_CHEAT);
	FakeClientCommand(client, "%s %s", command, arguments);
	SetCommandFlags(command, flags);
	SetUserFlagBits(client, userFlags);
}


stock void TurnFlashlightOn(int client)
{
	if (GameMode == 2) return;
	if (!IsClientInGame(client)) return;
	if (GetClientTeam(client) != TEAM_INFECTED) return;
	if (!PlayerIsAlive(client)) return;
	if (IsFakeClient(client)) return;

	DeleteLight(client);

	// Declares
	int entity;
	float vOrigin[3], vAngles[3];

	// Position light
	vOrigin = view_as<float>(  { 0.5, -1.5, 50.0 });
	vAngles = view_as<float>(  { -45.0, -45.0, 90.0 });

	// Light_Dynamic
	entity = MakeLightDynamic(vOrigin, vAngles, client);
	g_iLightIndex[client] = EntIndexToEntRef(entity);

	if( g_iClientIndex[client] == GetClientUserId(client) )
	{
		SetEntProp(entity, Prop_Send, "m_clrRender", g_iClientColor[client]);
		AcceptEntityInput(entity, "TurnOff");
	}
	else
	{
		g_iClientIndex[client] = GetClientUserId(client);
		g_iClientColor[client] = GetEntProp(entity, Prop_Send, "m_clrRender");
		AcceptEntityInput(entity, "TurnOff");
	}

	entity = g_iLightIndex[client];
	if( !IsValidEntRef(entity) )
		return;

	// Specified colors
	char sTempL[12];
	Format(sTempL, sizeof(sTempL), "255 51 51");

	SetVariantEntity(entity);
	SetVariantString(sTempL);
	AcceptEntityInput(entity, "color");
	AcceptEntityInput(entity, "toggle");

	int color = GetEntProp(entity, Prop_Send, "m_clrRender");
	if( color != g_iClientColor[client] )
		AcceptEntityInput(entity, "turnon");
	g_iClientColor[client] = color;
}

void DeleteLight(int client)
{
	int entity = g_iLightIndex[client];
	g_iLightIndex[client] = 0;
	DeleteEntity(entity);
}

void DeleteEntity(int entity)
{
	if( IsValidEntRef(entity) )
		AcceptEntityInput(entity, "Kill");
}

int MakeLightDynamic(const float vOrigin[3], const float vAngles[3], int client)
{
	int entity = CreateEntityByName("light_dynamic");
	if( entity == -1)
	{
		LogError("Failed to create 'light_dynamic'");
		return 0;
	}

	char sTemp[16];
	Format(sTemp, sizeof(sTemp), "255 51 51 100");
	DispatchKeyValue(entity, "_light", sTemp);
	DispatchKeyValue(entity, "brightness", "1");
	DispatchKeyValueFloat(entity, "spotlight_radius", 0.0);
	DispatchKeyValueFloat(entity, "distance", 300.0);
	DispatchKeyValue(entity, "style", "0");
	DispatchSpawn(entity);
	AcceptEntityInput(entity, "TurnOn");

	// Attach to survivor
	SetVariantString("!activator");
	AcceptEntityInput(entity, "SetParent", client);

	TeleportEntity(entity, vOrigin, vAngles, NULL_VECTOR);
	return entity;
}

stock void SwitchToSurvivors(int client)
{
	if (GameMode == 2) return;
	if (!IsClientInGame(client)) return;
	if (GetClientTeam(client) == 2) return;
	if (IsFakeClient(client)) return;
	
	int bot = FindBotToTakeOver();
	
	if (bot == 0)
	{
		PrintHintText(client, "No alive survivor bots to take over.");
		return;
	}
	SDKCall(hSpec, bot, client);
	SDKCall(hSwitch, client, true);
	return;
}

public bool IsInteger(char[] buffer)
{
    int len = strlen(buffer);
    for (int i = 0; i < len; i++)
    {
        if ( !IsCharNumeric(buffer[i]) )
            return false;
    }

    return true;    
}

bool IsValidEntRef(int entity)
{
	if( entity && EntRefToEntIndex(entity) != INVALID_ENT_REFERENCE )
		return true;
	return false;
}

bool IsPlayerGenericAdmin(int client)
{
    if (CheckCommandAccess(client, "generic_admin", ADMFLAG_GENERIC, false))
    {
        return true;
    }

    return false;
}  

int CheckAliveSurvivorPlayers_InSV()
{
	int iPlayersInAliveSurvivors=0;
	for (int i = 1; i < MaxClients+1; i++)
		if(IsClientConnected(i)&&IsClientInGame(i)&&GetClientTeam(i) == TEAM_SURVIVORS && IsPlayerAlive(i))
			iPlayersInAliveSurvivors++;
	return iPlayersInAliveSurvivors;
}

void CheckPlayers_InSV()
{
	iPlayersInServer = 0;
	for (int i = 1; i < MaxClients+1; i++)
		if(IsClientConnected(i)&&IsClientInGame(i)&&!IsFakeClient(i))
			iPlayersInServer++;
}


bool IsWitch(int entity)
{
    if (entity > 0 && IsValidEntity(entity) && IsValidEdict(entity))
    {
        char strClassName[64];
        GetEdictClassname(entity, strClassName, sizeof(strClassName));
        return StrEqual(strClassName, "witch");
    }
    return false;
}
// ====================================================================================================
//					SDKHOOKS TRANSMIT
// ====================================================================================================

void GetSpawnDisConvars()
{
	if(IsFinalMap())
	{	
		// Removes the boundaries for z_finale_spawn_safety_range and notify flag
		int flags = (FindConVar("z_finale_spawn_safety_range")).Flags;
		SetConVarBounds(FindConVar("z_finale_spawn_safety_range"), ConVarBound_Upper, false);
		SetConVarFlags(FindConVar("z_finale_spawn_safety_range"), flags & ~FCVAR_NOTIFY);
		
		// Removes the boundaries for z_finale_spawn_tank_safety_range and notify flag
		int flags2 = FindConVar("z_finale_spawn_tank_safety_range").Flags;
		SetConVarBounds(FindConVar("z_finale_spawn_tank_safety_range"), ConVarBound_Upper, false);
		SetConVarFlags(FindConVar("z_finale_spawn_tank_safety_range"), flags2 & ~FCVAR_NOTIFY);
		
		SetConVarInt(FindConVar("z_finale_spawn_safety_range"),h_SpawnDistanceFinal.IntValue);
		SetConVarInt(FindConVar("z_finale_spawn_tank_safety_range"),h_SpawnDistanceFinal.IntValue);
	}
	
	// Removes the boundaries for z_spawn_range and notify flag
	int flags3 = (FindConVar("z_spawn_range")).Flags;
	SetConVarBounds(FindConVar("z_spawn_range"), ConVarBound_Upper, false);
	SetConVarFlags(FindConVar("z_spawn_range"), flags3 & ~FCVAR_NOTIFY);
	
	// Removes the boundaries for z_spawn_safety_range and notify flag
	int flags4 = FindConVar("z_spawn_safety_range").Flags;
	SetConVarBounds(FindConVar("z_spawn_safety_range"), ConVarBound_Upper, false);
	SetConVarFlags(FindConVar("z_spawn_safety_range"), flags4 & ~FCVAR_NOTIFY);
	
	SetConVarInt(FindConVar("z_spawn_safety_range"),h_SpawnDistanceMin.IntValue);
	SetConVarInt(FindConVar("z_spawn_range"),h_SpawnDistanceMax.IntValue);
}

public Action SpawnWitchAuto(Handle timer)
{
	if( (FinaleStarted && !h_WitchSpawnFinal.BoolValue) || b_HasRoundEnded || !b_LeftSaveRoom) 
	{
		hSpawnWitchTimer = null;
		return Plugin_Handled;
	}
	
	char sMap[64];
	GetCurrentMap(sMap, sizeof(sMap));
	if( StrContains("c6m1_riverbank", sMap, false) != -1 ) return Plugin_Handled; //spawning witch in this stage cause server crash

	int witches=0;
	
	int entity = -1;
	while ( ((entity = FindEntityByClassname(entity, "witch")) != -1) )
	{
		witches++;
	}

	int anyclient = GetAnyClient();

	if (witches < h_WitchLimit.IntValue)
	{
		if (anyclient) CheatCommand(anyclient, sSpawnCommand, "witch auto");
	}

	int SpawnTime = GetURandomIntRange(h_WitchPeriodMin.IntValue, h_WitchPeriodMax.IntValue);

	hSpawnWitchTimer = CreateTimer(float(SpawnTime), SpawnWitchAuto);

	return Plugin_Handled;
}

bool IsFinalMap()
{
	return FindEntityByClassname(-1, "info_changelevel") == INVALID_ENT_REFERENCE;
}

stock int L4D2_GetSurvivorVictim(int client)
{
	int victim;

	if(L4D2Version)
	{
		/* Charger */
		victim = GetEntPropEnt(client, Prop_Send, "m_pummelVictim");
		if (victim > 0)
		{
			return victim;
		}

		victim = GetEntPropEnt(client, Prop_Send, "m_carryVictim");
		if (victim > 0)
		{
			return victim;
		}

		/* Jockey */
		victim = GetEntPropEnt(client, Prop_Send, "m_jockeyVictim");
		if (victim > 0)
		{
			return victim;
		}
	}

    /* Hunter */
	victim = GetEntPropEnt(client, Prop_Send, "m_pounceVictim");
	if (victim > 0)
	{
		return victim;
 	}

    /* Smoker */
 	victim = GetEntPropEnt(client, Prop_Send, "m_tongueVictim");
	if (victim > 0)
	{
		return victim;	
	}

	return -1;
}

public Action OnPlayerRunCmd(int client, int &buttons, int &impulse, float vel[3], float angles[3], int &weapon)
{
	if(GameMode != 2 && buttons & IN_USE && IsClientInGame(client) && !IsFakeClient(client) && GetClientTeam(client) == TEAM_INFECTED && IsPlayerAlive(client))
	{
		CreateTimer(0.1,OnEnterGhostState_Timer,client);
	}

}

public Action OnEnterGhostState_Timer(Handle Timer, int client)
{
	if(client && IsClientInGame(client) && !IsFakeClient(client) && GetClientTeam(client) == TEAM_INFECTED && IsPlayerGhost(client))
	{
		PrintHintText(client,"[TS] %T","Not allowed to respawn",client);
		ForcePlayerSuicide(client);
		CreateTimer(0.5,OnEnterGhostState_Timer,client);
	}
}

public bool ThereAreNoInfectedBotsRespawnDelay()
{
	for (int i = 1; i <= MaxClients; i++)
	{
		if(IsClientInGame(i) && IsFakeClient(i) && GetClientTeam(i) == TEAM_INFECTED && IsPlayerAlive(i)) 
		{
			if(GetEntProp(i,Prop_Send,"m_zombieClass") == ZOMBIECLASS_TANK && h_DisableSpawnsTank.BoolValue && GetEntProp(i, Prop_Send, "m_hasVisibleThreats"))
				return false;
			else
				return false;
		}
		if(respawnDelay[i] > 0)
			return false;
	}
	return true;
}

bool IsValidClient(int client, bool replaycheck = true)
{
	if (client <= 0 || client > MaxClients) return false;
	if (!IsClientInGame(client)) return false;
	//if (GetEntProp(client, Prop_Send, "m_bIsCoaching")) return false;
	if (replaycheck)
	{
		if (IsClientSourceTV(client) || IsClientReplay(client)) return false;
	}
	return true;
}

void ResetTimer()
{
	for (int i = 1; i <= MaxClients; i++)
	{
		PlayerHasEnteredStart[i] = false;
		if (FightOrDieTimer[i] != null)
		{
			KillTimer(FightOrDieTimer[i]);
			FightOrDieTimer[i] = null;
		}
	}
	
	for (int entity = MaxClients; entity < MAXENTITIES;entity++)
	{
		if (IsWitch(entity) && KillWitchTimer[entity] != null)
		{
			KillTimer(KillWitchTimer[entity]);
			KillWitchTimer[entity] = null;
		}
	}

	if(hSpawnWitchTimer != null) 
	{
		KillTimer(hSpawnWitchTimer);
		hSpawnWitchTimer = null;
	}

	if(PlayerLeftStartTimer != null)
	{
		KillTimer(PlayerLeftStartTimer);
		PlayerLeftStartTimer = null;	
	}

	if(infHUDTimer != null)
	{
		KillTimer(infHUDTimer);
		infHUDTimer = null;		
	}
}

public Action OnTakeDamage(int victim, int &attacker, int &inflictor, float &damage, int &damageType)
{
	if(GameMode == 2 || victim <= 0 || victim > MaxClients || !IsClientInGame(victim) || IsFakeClient(victim)) return Plugin_Continue;
	if(attacker <= 0 || attacker > MaxClients || !IsClientInGame(attacker) || IsFakeClient(attacker)) return Plugin_Continue;

	if(attacker == victim && GetClientTeam(attacker) == TEAM_INFECTED && GetEntProp(attacker,Prop_Send,"m_zombieClass") != ZOMBIECLASS_TANK) 
	{
		return Plugin_Handled;
	}
	return Plugin_Continue;
}
///////////////////////////////////////////////////////////////////////////