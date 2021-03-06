#define PLUGIN_VERSION		"1.5"

/*
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	Plugin Info:

*	Name	:	[L4D2] Gifts Drop & Spawn
*	Author	:	Aceleraci�n
*	Descrp	:	Drop gifts when a special infected died and win points & special weapon
*	Link	:	https://forums.alliedmods.net/showthread.php?t=302731

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	Change Log:
1.4.1 (15-5-2020)
	- Only special and special2 gift

1.4.0 (14-5-2020)
	- Add Convar: "l4d2_gifts_chance2", "100",	"Chance (%) of tank and witch drop gift."

1.3.8 (21-4-2020)
	- Witch will also drop gift
	
1.3.7 (18-4-2020)
	- Ptimize probability drop.
	- Add 46 gifts: all melees, weapons, items, ammo and health.
	- Remove database.
	- Remove pointsv collected.
	
1.3.6.1 (19-November-2017)
	- Fixed the problem that you can not collect special gifts in version 1.3.6
	- Fixed the problem that the first aid kit was not spawned.
	- Fixed the problem that some weapons specified by the "sm_gift" command were not spawned.

1.3.6 (17-November-2017)
	- The value of the DATABASE_CONFIG definition was changed to "l4d2gifts". 
	  Now the plugin has its own named configuration that you must add to the databases.cfg file.
	- Added the automatic creation of the table "players" of the database you have configured 
	  (CREATE TABLE IF NOT EXISTS `players`).
	- The following fields were added to the table "players":
		+ collected_gift: Save the total of collected gifts per player.
		+ collected_gift_standard: Save the total of standard gifts collected per player.
		+ collected_gift_special: Save the total of special gifts collected per player.
	- Added the dimensional array "TotalGifts" to save the number of collected gifts of each type throughout the 
	  game by the player (since he first connected to the server).
	- Added array "AllGifts" to save the total of gifts collected throughout the game by the player (since he first 
	  connected to the server).
	- Added the use of OnClientPostAdminCheck forward to get from the database how many gifts of each type and in 
	  general has the player.
	- The "sm_giftcollect" alias "sm_giftc" command was updated to display the gifts collected throughout the game 
	  (since it was first connected to the server).
	- Added the dimensional array "g_sGifSWeapon" to store the weapon of special gifts generated by the administrator.
	- The "sm_gift" command was updated so that administrators with the ADMFLAG_CHEATS flag can spawn the gift they want.
	  It can be a random gift, a standard gift and a special gift with the weapon they wish (It must be valid weapons).
	- The library "l4d_weapon_stocks" was updated so that it recognizes the classname of the weapons and melee weapons 
	  compatible with left 4 dead 2.
	- The "DropGift" function was modified to return the entity index of the gift that was spawned.
	- The "sm_reloadgifts" command flag was modified to ADMFLAG_CONFIG.
	- Added cvar "l4d2_gifts_maxcollectMap" for the maximum number of gifts that all survivors can collect per map. 
	  The value of 0 disables this functionality.
	- Added cvar "l4d2_gifts_maxcollectRound" for the maximum number of gifts that all survivors can collect per round. 
	  The value of 0 disables this functionality.
	- Added definition MAX_SPECIALWEAPONS to set the maximum of special weapons.
	- Added the "first aid kit" to the special weapons that the player wins for a special gift.
	- The "NotifyGift" function was modified by adding the "gift" parameter that corresponds to the entity index of a gift.
	
1.3.5 (15-November-2017)
	- Added definition USE_DATABASE to you want to use the database. Default is true.
	
1.3.4 (13-November-2017)
	- The dependency on the database was removed. The plugin can work without the need for database.
	- The translations were updated to show the ads for the gifts without points when there is not database.
	- The points earned by gifts and the command "sm_giftpoints" is activated if the plugin is working with a database.

1.3.3 (09-November-2017)
	- Added function "PrecacheModelGifts" and "PrecacheSoundGifts"
	- Fixed the problem of gifts that did not spawn when reloading the configuration file with the command "sm_reloadgifts"
	- Changed PrintToChat to Client_PrintToChat and PrintToChatAll to Client_PrintToChatAll (except when printing points)
	- Fixed the color lightgreen of translations.

1.3.2 (05-November-2017)
	- Added array for player gift points (CurrentPointsForMap & CurrentPointsForRound)
	- Added dimensional arrays for the number of gifts of the player (CurrentGiftsForMap && CurrentGiftsForRound)
	- Added array for the player's total gift points (CurrentGiftsTotalForMap & CurrentGiftsTotalForRound)
	- Added command "sm_giftpoints" alias "sm_giftp" for players to view points for gifts collected in the current map and
	  current round.
	- Added command "sm_giftcollect" alias "sm_giftc" for players to view the number for gifts collected in the current map and
	  current round specific for type the gift.

1.3.1 (04-October-2017)
	- Added translations, required for the spawn gifts
	- Fixed the name of weapons for print to chat when spawn gifts

1.3 (03-October-2017)
	- Added a config file for the gifts "l4d2_gifts" replacing the definitions. 
	  Here you specify the path and model type, and the type of gift whether standard or special.
	- Changed cvar l4d2_gifts_pointsA for l4d2_gifts_pointsE
	- Fixed the gifts with models not physic that did not show up
	- Added OnPlayerRunCmd forward when a survivor presses +USE on gifts static.
	- Added command "sm_reloadgifts" for reloads the settings from the config file "l4d2_gifts"
	- Added cvar "l4d2_gifts_probabilityE" to the probability for gifts standard (animals and other objects) 
	  with respect to chance of infected drop gift. (Chance of infected drop gift represents 100% of these).
	- Added cvar "l4d2_gifts_probabilityS" to the probability for gift special with respect to chance of infected drop gift.
	- Added definition MAX_GIFTS to set the maximum of gifts.

1.2.1 (19-July-2017)
	- Added weapons to the gifts square for give to the player when he catches the gifts

1.2 (01-June-2017)
	- Added cvar "l4d2_gifts_pointsA" to the points for take a gift (animals and other objects).
	- Added cvar "l4d2_gifts_pointsS" to the points for take a gift square.
	- Added sound for gifts animals and gifts square when these are caught
	- Added the config file that should be executed after plugin load.
	- Added the databases config to the points of the gifts
	- Added a hook for when the console variables values is changed.

1.1 (15-March-2017)
	- Added command "sm_gift" for admins to spawn gifts. Used for the developer.
	- Added cvar "l4d2_gifts_enabled" to toggle to turn on or off the gifts.
	- Added cvar "l4d2_gifts_giflife" to the time that the gift stay on ground in seconds.
	- Added cvar "l4d2_gifts_chance" to the chance (%) of infected drop gift.
	- Added TAG CHAT for PrintChatToAll to the gifts spawned

1.0 (20-January-2017)
	- Initial release.

======================================================================================*/

#pragma semicolon 1
#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <smlib>
#include <l4d_stocks>
#pragma newdecls required

#define DATABASE_CONFIG 	"l4d2gifts"
#define TAG_GIFT			"{G}[{L}GIFTS{G}]\x01"
#define PLUGIN_FCVAR		0 //FCVAR_PLUGIN
#define	MAX_GIFTS			20
#define MAX_STRING_WIDTH	64
#define MAX_TYPEGIFTS		3
#define TYPE_SPECIAL		2
#define TYPE_SPECIAL2		1
#define MAX_SPECIALITEMS	46
#define MAX_SPECIALITEMS2	7

#define TEAM_SURVIVOR		2
#define TEAM_INFECTED		3

#define COLOR_CYAN  		"0 255 255 255"
#define COLOR_LIGHT_GREEN 	"144 238 144 255"
#define COLOR_PURPLE 		"128 0 128 255"
#define COLOR_PINK 			"250 88 130 255"
#define COLOR_RED 			"255 0 0 255"
#define COLOR_ORANGE 		"254 100 46 255"
#define COLOR_YELLOW 		"255 255 0 255"

#define AURA_CYAN  			"0 255 255"
#define AURA_BLUE  			"0 0 255"
#define AURA_GREEN 			"144 238 144"
#define AURA_PINK 			"250 88 130"
#define AURA_RED 			"255 0 0"
#define AURA_ORANGE 		"254 100 46"
#define AURA_YELLOW 		"255 255 0"

#define SND_REWARD1			"level/loud/climber.wav"
#define SND_REWARD2			"level/gnomeftw.wav"

ConVar cvar_gift_enable;
ConVar cvar_gift_life;
ConVar cvar_gift_chance;
ConVar cvar_gift_chance2;
ConVar cvar_gift_maxcollectMap;
ConVar cvar_gift_maxcollectRound;

char weapons_name2[MAX_SPECIALITEMS2][2][50] = 
{
	{"rifle_m60", "M60機關槍"},
	{"first_aid_kit","治療包"},
	{"pain_pills", "止痛藥丸"},
	{"adrenaline", "腎上腺素"},
	{"health", "滿血生命值"},
	{"vomitjar", "膽汁"},
	{"grenade_launcher","榴彈發射器"}
};

char weapons_name[MAX_SPECIALITEMS][2][50] = 
{
	{"grenade_launcher","榴彈發射器"},
	{"rifle_m60", "M60機關槍"},
	{"defibrillator","電擊器"},
	{"first_aid_kit","治療包"},
	{"pain_pills", "止痛藥丸"},
	{"adrenaline", "腎上腺素"},
	{"ammo", "補給彈藥"},
	{"health", "滿血生命值"},
	{"weapon_upgradepack_incendiary", "火焰包"},
	{"weapon_upgradepack_explosive","高爆彈"},
	{"molotov", "火瓶"},
	{"pipe_bomb", "土製炸彈"},
	{"vomitjar", "膽汁"},
	{"gascan","汽油"},
	{"propanetank", "瓦斯桶"},
	{"oxygentank", "氧氣罐"},
	{"pistol","手槍"},
	{"pistol_magnum", "沙漠之鷹"},
	{"pumpshotgun", "木製霰彈槍"},
	{"shotgun_chrome", "鐵製霰彈槍"},
	{"smg", "機槍"},
	{"smg_silenced", "消音機槍"},
	{"smg_mp5","MP5衝鋒槍"},
	{"rifle", "步槍"},
	{"rifle_sg552", "SG552步槍"},
	{"rifle_ak47", "AK47"},
	{"rifle_desert","三連發步槍"},
	{"shotgun_spas","戰鬥霰彈槍"},
	{"autoshotgun", "連發霰彈槍"},
	{"hunting_rifle", "狙擊槍"},
	{"sniper_military", "軍用狙擊槍"},
	{"sniper_scout", "SCOUT狙擊槍"},
	{"sniper_awp", "AWP"},
	{"baseball_bat", "球棒"},
	{"chainsaw", "奪魂鋸"},
	{"cricket_bat", "板球拍"},
	{"crowbar", "鐵撬"},
	{"electric_guitar", "電吉他"},
	{"fireaxe", "斧頭"},
	{"frying_pan", "平底鍋"},
	{"katana", "武士刀"},
	{"machete", "開山刀"},
	{"tonfa", "警棍"},
	{"knife", "小刀"},
	{"golfclub", "高爾夫球棒"},
	{"", "空(謝謝惠顧)"}
};
int CurrentPointsForMap[MAXPLAYERS+1];
int CurrentPointsForRound[MAXPLAYERS+1];
int CurrentGiftsForMap[MAXPLAYERS+1][MAX_TYPEGIFTS];
int CurrentGiftsForRound[MAXPLAYERS+1][MAX_TYPEGIFTS];
int CurrentGiftsTotalForMap[MAXPLAYERS+1];
int CurrentGiftsTotalForRound[MAXPLAYERS+1];

char g_sModel[MAX_GIFTS][MAX_STRING_WIDTH];
char g_sTypeModel[MAX_GIFTS][10];
char g_sTypeGift[MAX_GIFTS][10];
float g_fScale[MAX_GIFTS];

int g_GifLife[2000];
char g_sGifType[2000][10];
int g_GifEntIndex[2000];
float g_GiftMov[2000];

bool bGiftEnable;
int iGiftLife;
int iGiftChance;
int iGiftChance2;
int iGiftMaxMap;
int iGiftMaxRound;
bool g_RoundEnd;

int gifts_collected_map;
int gifts_collected_round;

char sPath_gifts[PLATFORM_MAX_PATH];
int g_iCountGifts;

public Plugin myinfo = 
{
	name = "[L4D2] Gifts Drop & Spawn",
	author = "Aceleraci�n & Harry Potter",
	description = "Drop gifts (press E or touch to earn reward) when a special infected or a witch killed by survivor.",
	version = PLUGIN_VERSION,
	url = "https://forums.alliedmods.net/showthread.php?t=302731"
}

public void OnPluginStart()
{
	LoadTranslations("l4d2_gifts.phrases");
	
	CreateConVar("l4d2_gifts", PLUGIN_VERSION, "Plugin version", 0 );
	cvar_gift_enable = CreateConVar("l4d2_gifts_enabled",	"1", "Enable gifts 0: Disable, 1: Enable", PLUGIN_FCVAR, true, 0.0, true, 1.0);
	cvar_gift_life = CreateConVar("l4d2_gifts_giflife",	"30",	"How long the gift stay on ground (seconds)", PLUGIN_FCVAR, true, 0.0);
	cvar_gift_chance = CreateConVar("l4d2_gifts_chance", "50",	"Chance (%) of infected drop special gift.", PLUGIN_FCVAR, true, 1.0, true, 100.0);
	cvar_gift_chance2 = CreateConVar("l4d2_gifts_chance2", "100",	"Chance (%) of tank and witch drop second special gift.", PLUGIN_FCVAR, true, 1.0, true, 100.0);
	cvar_gift_maxcollectMap = CreateConVar("l4d2_gifts_maxcollectMap", "0", "Maximum of gifts that all survivors can pick up per map [0 = Disabled]", PLUGIN_FCVAR, true, 0.0);
	cvar_gift_maxcollectRound = CreateConVar("l4d2_gifts_maxcollectRound", "0", "Maximum of gifts that all survivors can pick up per round [0 = Disabled]", PLUGIN_FCVAR, true, 0.0);

	AutoExecConfig(true, "l4d2_gifts");
	
	BuildPath(Path_SM, sPath_gifts, PLATFORM_MAX_PATH, "data/l4d2_gifts.cfg");
	
	if(!FileExists(sPath_gifts))
	{
		SetFailState("Cannot find the file 'data/l4d2_gifts.cfg'");
	}
	
	if(!LoadConfigGifts(false))
	{
		SetFailState("Cannot load the file 'data/l4d2_gifts.cfg'");
	}
	
	if(g_iCountGifts == 0 )
	{
		SetFailState("Do not have models in 'data/l4d2_gifts.cfg'");
	}
	
	HookEvent("round_start", Event_RoundStart);
	HookEvent("round_end", Event_RoundEnd);
	HookEvent("player_death", Event_PlayerDeath);
	HookEvent("player_use", Event_PlayerUse);
	HookEvent("witch_killed", OnWitchKilled);
	
	HookConVarChange(cvar_gift_enable, Cvar_Changed1);
	HookConVarChange(cvar_gift_life,	Cvar_Changed2);
	HookConVarChange(cvar_gift_chance, Cvar_Changed3);
	HookConVarChange(cvar_gift_chance2, Cvar_Changed4);
	HookConVarChange(cvar_gift_maxcollectMap, Cvar_Changed7);
	HookConVarChange(cvar_gift_maxcollectRound, Cvar_Changed7);
	
	RegConsoleCmd("sm_giftcollect", Command_GiftCollected, "View number of gifts collected");
	RegConsoleCmd("sm_giftc", Command_GiftCollected, "View number of gifts collected");
	
	RegAdminCmd("sm_gift", Command_Gift, ADMFLAG_CHEATS, "Spawn a gift in your position");
	RegAdminCmd("sm_reloadgifts", Command_ReloadGift, ADMFLAG_CONFIG, " Reload the config file of gifts (data/l4d2_gifts.cfg)");
}

public void OnMapStart()
{
	PrecacheModelGifts();
	PrecacheSoundGifts();
	
	for (int i = 1; i <= MaxClients; i++)
	{
		if(IsClientConnected(i) && IsClientInGame(i) && !IsFakeClient(i) && GetClientTeam(i) == TEAM_SURVIVOR)
		{
			CurrentPointsForMap[i] = 0;
			for (int j=0; j < MAX_TYPEGIFTS; j++)
			{
				CurrentGiftsForMap[i][j] = 0;
			}
			CurrentGiftsTotalForMap[i] = 0;
		}
	}

	gifts_collected_map = 0;
}

public void PrecacheModelGifts()
{
	for( int i = 0; i < g_iCountGifts; i++ )
	{
		CheckPrecacheModel(g_sModel[i]);
	}
}

public void PrecacheSoundGifts()
{
	PrecacheSound(SND_REWARD1, true);
	PrecacheSound(SND_REWARD2, true);
}

public void CheckPrecacheModel(char[] Model)
{
	if (!IsModelPrecached(Model))
	{
		PrecacheModel(Model, false);
	}
}

public void OnConfigsExecuted()
{
	GetCvars();
}

public void Cvar_Changed1(ConVar convar, const char[] oldValue, const char[] newValue)
{
	int value = StringToInt(newValue);
	if(value == 0 || value == 1)
	{
		SetConVarInt(cvar_gift_enable, value, false, false);
	}
	else
	{
		SetConVarInt(cvar_gift_enable, GetConVarInt(cvar_gift_enable), false, false);
	}
	
	GetCvars();
}

public void Cvar_Changed2(ConVar convar, const char[] oldValue, const char[] newValue)
{
	int value = StringToInt(newValue);
	if(value > 0.0)
	{
		SetConVarInt(cvar_gift_life, value, false, false);
	}
	else
	{
		SetConVarInt(cvar_gift_life, GetConVarInt(cvar_gift_life), false, false);
	}
	
	GetCvars();
}

public void Cvar_Changed3(ConVar convar, const char[] oldValue, const char[] newValue)
{
	int value = StringToInt(newValue);
	if(value > 0 && value <= 100)
	{
		SetConVarInt(cvar_gift_chance, value, false, false);
	}
	else
	{
		SetConVarInt(cvar_gift_chance, GetConVarInt(cvar_gift_chance), false, false);
	}
	
	GetCvars();
}

public void Cvar_Changed4(ConVar convar, const char[] oldValue, const char[] newValue)
{
	int value = StringToInt(newValue);
	if(value > 0 && value <= 100)
	{
		SetConVarInt(cvar_gift_chance2, value, false, false);
	}
	else
	{
		SetConVarInt(cvar_gift_chance2, GetConVarInt(cvar_gift_chance2), false, false);
	}
	
	GetCvars();
}

public void Cvar_Changed6(ConVar convar, const char[] oldValue, const char[] newValue)
{
	int value = StringToInt(newValue);
	if(value > 0 && value <= 100)
	{
		GetCvars();
	}
}

public void Cvar_Changed7(ConVar convar, const char[] oldValue, const char[] newValue)
{
	int value = StringToInt(newValue);
	if(value > 0)
	{
		GetCvars();
	}
}

void GetCvars()
{
	//Values of cvars
	bGiftEnable = GetConVarBool(cvar_gift_enable);
	iGiftLife = GetConVarInt(cvar_gift_life);
	iGiftChance = GetConVarInt(cvar_gift_chance);
	iGiftChance2 = GetConVarInt(cvar_gift_chance2);
	iGiftMaxMap = GetConVarInt(cvar_gift_maxcollectMap);
	iGiftMaxRound = GetConVarInt(cvar_gift_maxcollectRound);
}

public Action Command_Gift(int client, int args)
{
	if (!bGiftEnable)
		return Plugin_Handled;
	
	if(!IsValidClient(client))
		return Plugin_Handled;
	
	if(GetClientTeam(client) != 2 || IsFakeClient(client))
		return Plugin_Handled;
	
	if(args < 1)
	{
		DropGift(client, "special");
	}
	else
	{
		char arg1[10];
		GetCmdArg(1, arg1, sizeof(arg1));
		
		if(StrEqual(arg1, "special", false))
		{
			DropGift(client, "special");
		}
		else if(StrEqual(arg1, "special2", false))
		{
			DropGift(client, "special2");
		}
		else
		{
			ReplyToCommand(client, "[SM] Usage: sm_gift <special or special2>");
		}
	}
	return Plugin_Handled;
}

//==========================================
// CONSOLE COMMANDS
//==========================================

public Action Command_GiftCollected(int client, int args)
{
	if (!bGiftEnable)
		return Plugin_Handled;
	
	if(!IsValidClient(client))
		return Plugin_Handled;
	
	if(GetClientTeam(client) != 2 || IsFakeClient(client))
		return Plugin_Handled;
	

	Client_PrintToChat(client, false, "%s %t", TAG_GIFT, "Number of gifts collected");
	Client_PrintToChat(client, false, "{B}Special: %t", "In current map: %d | In current round: %d", CurrentGiftsForMap[client][TYPE_SPECIAL], CurrentGiftsForRound[client][TYPE_SPECIAL]);
	Client_PrintToChat(client, false, "{B}Total: %t", "In current map: %d | In current round: %d", CurrentGiftsTotalForMap[client], CurrentGiftsTotalForRound[client]);

	return Plugin_Handled;
}

//==========================================
// ADMINS COMMANDS
//==========================================

public Action Command_ReloadGift(int client, int args)
{
	if(!LoadConfigGifts(true))
	{
		LogError("Cannot load the file 'data/l4d2_gifts.cfg'");
		SetConVarInt(cvar_gift_enable, 0 , false, false);
		GetCvars();
	}
	
	if(g_iCountGifts == 0 )
	{
		LogError("���Do not have models!!!");
		SetConVarInt(cvar_gift_enable, 0 , false, false);
		GetCvars();
	}
	
	return Plugin_Handled;
}

public bool LoadConfigGifts(bool precache)
{
	KeyValues hFile = CreateKeyValues("Gifts");
	
	if(!FileToKeyValues(hFile, sPath_gifts) )
	{
		CloseHandle(hFile);
		return false;
	}
	
	KvGotoFirstSubKey(hFile);
	
	g_iCountGifts = 0;
	char sTemp[MAX_STRING_WIDTH];
	int i = 0;
	do
	{
		char sNum[8];
		KvGetSectionName(hFile, sNum, sizeof(sNum));
		int num = StringToInt(sNum);
		
		if(num > MAX_GIFTS || i >= MAX_GIFTS)
			break;
		
		KvGetString(hFile, "model", sTemp, MAX_STRING_WIDTH);
			
		if(strlen(sTemp) == 0)
			continue;
		
		if(FileExists(sTemp, true))
		{
			strcopy(g_sModel[i], MAX_STRING_WIDTH, sTemp);
			KvGetString(hFile, "type", g_sTypeModel[i], sizeof(g_sTypeModel[]), "static");
			KvGetString(hFile, "gift", g_sTypeGift[i], sizeof(g_sTypeGift[]));
			g_fScale[i] = KvGetFloat(hFile, "scale", 1.0);
			g_iCountGifts++;
			i++;
		}
	} 
	while (KvGotoNextKey(hFile));
	
	CloseHandle(hFile);

	if(precache)
	{
		PrecacheModelGifts();
	}
	return true;
}

public Action Event_RoundStart(Event event, const char[] name, bool dontBroadcast)
{
	if (!bGiftEnable) 
		return;
	
	g_RoundEnd = false;
	gifts_collected_round = 0;
	
	for (int i = 1; i <= MaxClients; i++)
	{
		if(IsClientConnected(i) && IsClientInGame(i) && !IsFakeClient(i) && GetClientTeam(i) == TEAM_SURVIVOR)
		{
			CurrentPointsForRound[i] = 0;
			for (int j=0; j < MAX_TYPEGIFTS; j++)
			{
				CurrentGiftsForRound[i][j] = 0;
			}
			CurrentGiftsTotalForRound[i] = 0;
		}
	}
}

public Action Event_RoundEnd(Event event, const char[] name, bool dontBroadcast)
{
	if (!bGiftEnable) 
		return;
	
	g_RoundEnd = true;
	gifts_collected_round = 0;
}

public Action Event_PlayerDeath(Event event, const char[] name, bool dontBroadcast)
{
	if (!bGiftEnable)
		return;

	if (iGiftMaxRound != 0 && gifts_collected_round > iGiftMaxRound)
		return;
	
	if (iGiftMaxMap != 0 && gifts_collected_map > iGiftMaxMap)
		return;
	
	int victim = GetClientOfUserId(GetEventInt(event, "userid"));
	int attacker = GetClientOfUserId(GetEventInt(event, "attacker"));
	
	if (attacker != victim && IsValidClient(victim) && GetClientTeam(victim) == 3)
	{
		if(Infected_Admitted(victim) == 8)
		{
			if (GetRandomInt(1, 100) < iGiftChance2)
			{
				DropGift(victim, "special2");
			}
		}
		else
		{
			if (GetRandomInt(1, 100) < iGiftChance)
			{
				DropGift(victim);
			}
		}
		
		
	}
}

public Action OnWitchKilled(Event event, const char[] name, bool dontBroadcast)
{
   //int attacker = GetClientOfUserId(GetEventInt(event, "userid"));
	int witch = GetEventInt(event, "witchid");
	if (GetRandomInt(1, 100) < iGiftChance2)
	{
		DropGift(witch, "special2");
	}
}

// When a Survivor presses +USE on gifts physics
public Action Event_PlayerUse(Event event, const char[] name, bool dontBroadcast)
{
	if (!bGiftEnable)
		return;
	
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	int gift = EntRefToEntIndex(GetEventInt(event, "targetid"));
	
	if(!IsValidClient(client) || IsFakeClient(client))
		return;
	
	if (IsValidEntity(gift))
	{
		char classname[30];
		GetEntityClassname(gift, classname, sizeof(classname));
		
		if(StrContains(classname, "physics") != -1)
		{
			if(g_GifEntIndex[gift] == EntIndexToEntRef(gift))
			{
				if (StrEqual(g_sGifType[gift], "special"))
				{
					//Points for Gifts Special
					NotifyGift(client, TYPE_SPECIAL, gift);
				}
				else if (StrEqual(g_sGifType[gift], "special2"))
				{
					//PoiNotifyGift(nts for Gifts Special
					NotifyGift(client, TYPE_SPECIAL2, gift);
				}
				
				AcceptEntityInput(gift, "kill");
				gifts_collected_map += 1;
				gifts_collected_round += 1;
			}
		}
	}
}

// When a Survivor presses +USE on gifts static
public Action OnPlayerRunCmd(int client, int &buttons, int &impulse, float vel[3], float angles[3])
{
	if (!bGiftEnable)
		return Plugin_Continue;
	
	//Check if its a valid player
	if (!IsValidClient(client) || IsFakeClient(client)) 
	{
		return Plugin_Continue;
	}
	if (buttons & IN_USE)
	{
		int gift = GetClientAimTarget(client, false);
		
		if (IsValidEntity(gift))
		{
			char classname[30];
			float myPos[3];
			float gfPos[3];
			GetEntPropVector(gift, Prop_Send, "m_vecOrigin", gfPos);
			
			if (IsPlayerAlive(client) && !IsFakeClient(client) && GetClientTeam(client) == 2)
			{
				GetEntPropVector(client, Prop_Send, "m_vecOrigin", myPos);
				//PrintToChatAll("%f", GetVectorDistance(myPos, gfPos));
				if (GetVectorDistance(myPos, gfPos) < 70.0)
				{
					GetEntityClassname(gift, classname, sizeof(classname));
					if(StrContains(classname, "dynamic") != -1)
					{
						if(g_GifEntIndex[gift] == EntIndexToEntRef(gift))
						{
							if (StrEqual(g_sGifType[gift], "special"))
							{
								//Points for Gifts Special
								NotifyGift(client, TYPE_SPECIAL, gift);
							}
							else if (StrEqual(g_sGifType[gift], "special2"))
							{
								//PoiNotifyGift(nts for Gifts Special
								NotifyGift(client, TYPE_SPECIAL2, gift);
							}

							AcceptEntityInput(gift, "kill");
							gifts_collected_map += 1;
							gifts_collected_round += 1;
						}
					}
				}
			}
		}
	}
	return Plugin_Continue;
}

void NotifyGift(int client, int type, int gift = -1)
{
	if(type == TYPE_SPECIAL)
	{
		if(gift == -1 || !IsValidEntity(gift))
		{
			return;
		}

		int index = GetURandomIntRange(0,MAX_SPECIALITEMS-1);
		
		
		if(index >= 0 && index < MAX_SPECIALITEMS)
		{
			GiveWeapon(client, weapons_name[index][0]);
			Client_PrintToChatAll(false, "%s %t", TAG_GIFT, "Spawn Gift Special Not Points", client, weapons_name[index][1]);
		}
		PlaySound(client,SND_REWARD2);
		AddCollect(client, type);
	}
	else if(type == TYPE_SPECIAL2)
	{
		if(gift == -1 || !IsValidEntity(gift))
		{
			return;
		}

		int index = GetURandomIntRange(0, MAX_SPECIALITEMS2-1);
		
		if(index >= 0 && index < MAX_SPECIALITEMS2)
		{
			GiveWeapon(client, weapons_name2[index][0]);
			Client_PrintToChatAll(false, "%s %t", TAG_GIFT, "Spawn Gift Special Not Points", client, weapons_name2[index][1]);
		}
		PlaySound(client,SND_REWARD1);
		AddCollect(client, type);
	}

}

void GiveWeapon(int client, const char[] weapon)
{
	int flagsgive = GetCommandFlags("give");
	SetCommandFlags("give", flagsgive & ~FCVAR_CHEAT);
	FakeClientCommand(client, "give %s", weapon);
	SetCommandFlags("give", flagsgive);
}

int GetRandomIndexGift(const char[] sType)
{
	int[] GiftsIndex = new int[g_iCountGifts];
	int count = 0;
	
	for(int i=0; i < g_iCountGifts; i++)
	{
		if(StrEqual(g_sTypeGift[i], sType))
		{
			GiftsIndex[count] = i;
			count++;
		}
	}
	
	int random = GetRandomInt(0, count-1);
	return GiftsIndex[random];
}

int DropGift(int client, char[] type = "special")
{	
	float gifPos[3];
	GetEntPropVector(client, Prop_Send, "m_vecOrigin", gifPos);
	gifPos[2] += 10.0;
	
	int gift = -1; //prop_physics_override
	int random = GetRandomIndexGift(type);
	
	if(StrEqual(g_sTypeModel[random], "physics"))
	{
		gift = CreateEntityByName("prop_physics_override");
	}
	else if(StrEqual(g_sTypeModel[random], "static"))
	{
		gift = CreateEntityByName("prop_dynamic_override");
	}
	
	if(gift != -1)
	{
		DispatchKeyValue(gift, "model", g_sModel[random]);
		
		if(StrEqual(g_sTypeGift[random], "special")/* || StrEqual(g_sTypeGift[random], "special2")*/)
		{
			int color = GetRandomInt(1, 7);
			switch(color)
			{
				case 1:
					DispatchKeyValue(gift, "rendercolor", COLOR_CYAN);
				case 2:
					DispatchKeyValue(gift, "rendercolor", COLOR_LIGHT_GREEN);
				case 3:
					DispatchKeyValue(gift, "rendercolor", COLOR_PURPLE);
				case 4:
					DispatchKeyValue(gift, "rendercolor", COLOR_PINK);
				case 5:
					DispatchKeyValue(gift, "rendercolor", COLOR_RED);
				case 6:
					DispatchKeyValue(gift, "rendercolor", COLOR_ORANGE);
				case 7:
					DispatchKeyValue(gift, "rendercolor", COLOR_YELLOW);
			}
		}
		
		Format(g_sGifType[gift], sizeof(g_sGifType[]), "%s", g_sTypeGift[random]);
		DispatchKeyValueVector(gift, "origin", gifPos);
		SetEntProp(gift, Prop_Send, "m_nSolidType", 6);
		DispatchSpawn(gift);
		
		SetEntPropFloat(gift, Prop_Send, "m_flModelScale", g_fScale[random]);
		
		int rmdAura = GetRandomInt(1, 7);
		int color[3];
		switch(rmdAura)
		{
			case 1:
			{
				GetColor(AURA_CYAN, color);
				L4D2_SetEntityGlow(gift, L4D2Glow_Constant, 0, 0, color, false);
			}
			case 2:
			{
				GetColor(AURA_BLUE, color);
				L4D2_SetEntityGlow(gift, L4D2Glow_Constant, 0, 0, color, false);
			}
			case 3:
			{
				GetColor(AURA_GREEN, color);
				L4D2_SetEntityGlow(gift, L4D2Glow_Constant, 0, 0, color, false);
			}
			case 4:
			{
				GetColor(AURA_PINK, color);
				L4D2_SetEntityGlow(gift, L4D2Glow_Constant, 0, 0, color, false);
			}
			case 5:
			{
				GetColor(AURA_RED, color);
				L4D2_SetEntityGlow(gift, L4D2Glow_Constant, 0, 0, color, false);
			}
			case 6:
			{
				GetColor(AURA_ORANGE, color);
				L4D2_SetEntityGlow(gift, L4D2Glow_Constant, 0, 0, color, false);
			}
			case 7:
			{
				GetColor(AURA_YELLOW, color);
				L4D2_SetEntityGlow(gift, L4D2Glow_Constant, 0, 0, color, false);
			}
		}
		g_GifLife[gift] = 0;
		g_GifEntIndex[gift] = EntIndexToEntRef(gift);
		CreateTimer(1.0, Timer_GiftLife, EntIndexToEntRef(gift), TIMER_REPEAT|TIMER_FLAG_NO_MAPCHANGE);
		CreateTimer(1.0, ColdDown, EntIndexToEntRef(gift),TIMER_FLAG_NO_MAPCHANGE);
	}

	return gift;
}
public Action ColdDown( Handle timer, any ref)
{
	int gift = EntRefToEntIndex(ref);
	if (IsValidEntity(gift))
	{
		SDKHook(gift, SDKHook_Touch, OnTouch);
	}
}

public void OnTouch(int gift, int other)
{
	if (IsValidClient(other) && !IsFakeClient(other) &&
	GetClientTeam(other) == 2 && IsPlayerAlive(other) &&
	!GetEntProp(other, Prop_Send, "m_isHangingFromLedge") &&
	!GetEntProp(other, Prop_Send, "m_isIncapacitated"))
	{
		if (StrEqual(g_sGifType[gift], "special"))
		{
			//Points for Gifts Special
			NotifyGift(other, TYPE_SPECIAL, gift);
		}
		else if (StrEqual(g_sGifType[gift], "special2"))
		{
			//PoiNotifyGift(nts for Gifts Special
			NotifyGift(other, TYPE_SPECIAL2, gift);
		}

		AcceptEntityInput(gift, "kill");
		gifts_collected_map += 1;
		gifts_collected_round += 1;
		SDKUnhook(gift, SDKHook_Touch, OnTouch);
	}
} 

bool IsValidClient(int client)
{
	if (client < 1 || client > MaxClients) 
		return false;
	
	if (!IsClientConnected(client)) 
		return false;
	
	if (!IsClientInGame(client)) 
		return false;
	
	return true;
}

int Infected_Admitted(int client)
{
	int class = GetEntProp(client, Prop_Send, "m_zombieClass");
	
	if(class == 1 || class == 2 || class == 3 || class == 4 || class == 5 || class == 6 || class == 7 || class == 8)
	{
		return class;
	}
	
	return -1;
}

public Action Timer_GiftLife( Handle timer, any ref)
{
	int gift = EntRefToEntIndex(ref);
	if (IsValidEntity(gift))
	{
		g_GifLife[gift] += 1;
		if( g_RoundEnd || g_GifLife[gift] > iGiftLife)
		{
			g_GifLife[gift] = 0;
			AcceptEntityInput(gift, "kill");
			return Plugin_Stop;
		}
		g_GiftMov[gift] = 0.0;
		CreateTimer(0.1, Timer_RotationGift, ref, TIMER_REPEAT|TIMER_FLAG_NO_MAPCHANGE);
		
		return Plugin_Continue;
	}
	
	return Plugin_Stop;
}

public Action Timer_RotationGift( Handle timer, any ref)
{
	int gift = EntRefToEntIndex(ref);
	if (IsValidEntity(gift))
	{
		g_GiftMov[gift] += 0.1;
		if( g_RoundEnd || g_GiftMov[gift] >= 1.0)
		{
			g_GiftMov[gift] = 0.0;
			return Plugin_Stop;
		}
		RotateAdvance(gift, 15.0, 1);
		return Plugin_Continue;
	}
	return Plugin_Stop;
}

void RotateAdvance(int index, float value, int axis)
{
	if (IsValidEntity(index))
	{
		float rotate_[3];
		GetEntPropVector(index, Prop_Data, "m_angRotation", rotate_);
		rotate_[axis] += value;
		TeleportEntity( index, NULL_VECTOR, rotate_, NULL_VECTOR);
	}
}

public void AddCollect(int client, int type)
{
	CurrentGiftsForRound[client][type] += 1;
	CurrentGiftsForMap[client][type] += 1;
	CurrentGiftsTotalForRound[client] += 1;
	CurrentGiftsTotalForMap[client] += 1;
}

void GetColor(const char[] str_color, int color[3])
{
	char sColors[3][4];
	ExplodeString(str_color, " ", sColors, 3, 4);

	color[0] = StringToInt(sColors[0]);
	color[1] = StringToInt(sColors[1]);
	color[2] = StringToInt(sColors[2]);
}

stock int GetURandomIntRange(int min, int max)
{
	return (GetURandomInt() % (max-min+1)) + min;
}

void PlaySound(int client,char[] sSoundName)
{
	EmitSoundToAll(sSoundName, client, SNDCHAN_AUTO, SNDLEVEL_AIRCRAFT, SND_NOFLAGS, SNDVOL_NORMAL, SNDPITCH_NORMAL, -1, NULL_VECTOR, NULL_VECTOR, true, 0.0);
}