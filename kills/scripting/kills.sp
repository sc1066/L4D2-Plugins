#include <sourcemod>
#include <sdktools>
#include <multicolors>
#pragma semicolon 1
#pragma newdecls required //強制1.7以後的新語法

#define L4D_TEAM_INFECTED 3
#define L4D_TEAM_SURVIVOR 2
#define L4D_TEAM_SPECTATOR 1

int killif[MAXPLAYERS+1];
int killifs[MAXPLAYERS+1];
int damageff[MAXPLAYERS+1];
int iheadshot[MAXPLAYERS+1];
int sheadshot[MAXPLAYERS+1];
//int PouncesEaten[MAXPLAYERS+1];
//int Boomed[MAXPLAYERS+1];
//int Smoked[MAXPLAYERS+1];
bool HasRoundEndedPrinted;

public Plugin myinfo = 
{
	name = "杀特殊感染者统计",
	author = "fenghf,l4d1 modify by Harry Potter",
	description = "杀特殊感染者统计",
	version = "1.3",
	url = "https://steamcommunity.com/id/TIGER_x_DRAGON/"
}
public void OnPluginStart()   
{   
	RegConsoleCmd("kills", Command_kill);
	
	HookEvent("player_death", event_kill_infected);
	HookEvent("infected_death", event_kill_infecteds);
	HookEvent("round_end", event_RoundEnd);
	HookEvent("round_start", event_RoundStart);
	HookEvent("player_hurt", event_PlayerHurt);
	//HookEvent("lunge_pounce", Event_LungePounce);//撲到人
	//HookEvent("tongue_grab", Event_TongueGrab);//拉到人
	//HookEvent("player_now_it", Event_PlayerBoomed);//噴到人
	HookEvent("map_transition", Event_Maptransition, EventHookMode_Pre); //戰役過關到下一關的時候
}
public void OnMapStart() 
{ 
	HasRoundEndedPrinted = false;  
	kill_infected();
}

public Action Event_Maptransition(Event event, const char[] name, bool dontBroadcast) 
{
	if (!HasRoundEndedPrinted)
	{
		displaykillinfected(0);
		HasRoundEndedPrinted = true;
		return;
	}	
}

public Action event_PlayerHurt(Event event, const char[] name, bool dontBroadcast) 
{
	int victimId = event.GetInt("userid");
	int victim = GetClientOfUserId(victimId);
	int attackerId = event.GetInt("attacker");
	int attackersid = GetClientOfUserId(attackerId);
	int damageDone = event.GetInt("dmg_health");
	
	if (attackerId && victimId && IsClientInGame(attackersid) && GetClientTeam(attackersid) == L4D_TEAM_SURVIVOR && GetClientTeam(victim) == L4D_TEAM_SURVIVOR)
    {
        damageff[attackersid] += damageDone;
    }
    
}



public Action event_kill_infecteds(Event event, const char[] name, bool dontBroadcast) 
{
	int killer = GetClientOfUserId(event.GetInt("attacker"));
	
	if (!killer)
        return;

	if(GetClientTeam(killer) == L4D_TEAM_SURVIVOR)
	{
	  bool headshot=GetEventBool(event, "headshot");
	  if(headshot)
	  {
	       iheadshot[killer] += 1;
	  }
	  killifs[killer] += 1;
	}
}



public Action event_kill_infected(Event event, const char[] name, bool dontBroadcast) 
{
	int zombieClass = 0;
	int killer = GetClientOfUserId(event.GetInt("attacker"));
	int deadbody = GetClientOfUserId(event.GetInt("userid"));
	if (0 < killer <= MaxClients && deadbody != 0)
	{
		if(GetClientTeam(deadbody) == L4D_TEAM_SURVIVOR) return;
		
		if(GetClientTeam(killer) == L4D_TEAM_SURVIVOR)
		{
			zombieClass = GetEntProp(deadbody, Prop_Send, "m_zombieClass");
			if(zombieClass == 1 ||zombieClass == 2||zombieClass == 3)
			{
				bool headshot=GetEventBool(event, "headshot");
				if(headshot)
				{
					sheadshot[killer] += 1;
				}	
				killif[killer] += 1;
				
			}
		}
	}
}

public Action event_RoundEnd(Event event, const char[] name, bool dontBroadcast) 
{
	if(!HasRoundEndedPrinted)
	{
		CreateTimer(1.5, KillPinfected_dis);
		HasRoundEndedPrinted = true;
	}
}
public Action KillPinfected_dis(Handle timer)
{
	displaykillinfected(0);
}

public Action event_RoundStart(Event event, const char[] name, bool dontBroadcast) 
{
	HasRoundEndedPrinted = false;
	kill_infected();
}

public Action Command_kill(int client, int args)
{
	int iTeam = GetClientTeam(client);
	displaykillinfected(iTeam);
}

void displaykillinfected(int team)
{	
	int client;
	int players = -1;
	int[] players_clients = new int[MaxClients+1];
	int killss, killsss, killssss,damageffss,killssssss;
	for (client = 1; client <= MaxClients; client++)
	{
		if (!IsClientInGame(client) || GetClientTeam(client) != L4D_TEAM_SURVIVOR) continue;
		players++;
		players_clients[players] = client;
		killss = killif[client];
		killsss = killifs[client];
		killssss = iheadshot[client];
		killssssss = sheadshot[client];
		damageffss = damageff[client];
	}
	SortCustom1D(players_clients, 8, SortByDamageDesc);
	for (int i; i <= players; i++)
	{
		client = players_clients[i];
		killss = killif[client];
		killsss = killifs[client];
		killssss = iheadshot[client];
		killssssss = sheadshot[client];
		damageffss = damageff[client];
		
		if(team == 0){
				C_PrintToChatAll("{default}擊殺特感:{olive}%3d{default}[{green}爆頭{default}:{olive}%3d{default}],殭屍:{olive}%3d{default}[{green}爆頭{default}:{olive}%3d{default}],友傷:{olive}%3d{default} - {olive}%N", killss, killssssss, killsss, killssss, damageffss,client);
				//C_PrintToChatAll("總計被控:{olive}%3d{default}[{lightgreen}被撲{default}:{olive}%3d{default},{lightgreen}被拉{default}:{olive}%3d{default},{lightgreen}被噴{default}:{olive}%3d{default}] - {olive}%N",PouncesEaten[client]+Smoked[client]+Boomed[client],PouncesEaten[client],Smoked[client],Boomed[client],client);
		}
		else
		{
			for (int j = 1; j <= MaxClients; j++)
			{
				if (IsClientConnected(j) && IsClientInGame(j)&& !IsFakeClient(j) && GetClientTeam(j) == team)
				{
				C_PrintToChat(j,"{default}擊殺特感:{olive}%3d{default}[{green}爆頭{default}:{olive}%3d{default}],殭屍:{olive}%3d{default}[{green}爆頭{default}:{olive}%3d{default}],友傷:{olive}%3d{default} - {olive}%N", killss, killssssss, killsss, killssss, damageffss,client);
				//C_PrintToChat(j,"總計被控:{olive}%3d{default}[{lightgreen}被撲{default}:{olive}%3d{default},{lightgreen}被拉{default}:{olive}%3d{default},{lightgreen}被噴{default}:{olive}%3d{default}] - {olive}%N",PouncesEaten[client]+Smoked[client]+Boomed[client],PouncesEaten[client],Smoked[client],Boomed[client],client);
		
				}
			}
		}
		
		//C_PrintToChatAll("丧尸-{red}爆头{default}: {green}%d{default}/{green}%d{default} | 特感-{red}爆头{default}: {green}%d{default}/{green}%d{default} | 友伤: {green}%d{default} | {olive}%N{default}",killsss, killssss, killss, killssssss, damageffss, client);
		
	}
}	
	

public int SortByDamageDesc(int elem1, int elem2, const int[] array, Handle hndl)
{
	if (killif[elem1] > killif[elem2]) return -1;
	else if (killif[elem2] > killif[elem1]) return 1;
	else if (elem1 > elem2) return -1;
	else if (elem2 > elem1) return 1;
	return 0;
}


void kill_infected()
{
	for (int i = 1; i <= MaxClients; i++)
	{ 
		 killif[i] = 0; 
		 killifs[i] = 0; 
		 iheadshot[i] = 0;
		 sheadshot[i] = 0;
		 damageff[i] = 0;
		 //PouncesEaten[i] = 0;
		 //Boomed[i] = 0;
		 //Smoked[i] = 0;
	}
}
/*
public Action Event_LungePounce(Event event, const char[] name, bool dontBroadcast) 
{
	//int attacker = GetClientOfUserId(GetEventInt(event, "userid"));
	int victim = GetClientOfUserId(GetEventInt(event, "victim"));
	PouncesEaten[victim] +=1;
	//C_PrintToChatAll("%N 撲倒 %N",attacker,victim);
}

public Event_TongueGrab(Event event, const char[] name, bool dontBroadcast) 
{
	//int attacker = GetClientOfUserId(GetEventInt(event, "userid"));
	int victim = GetClientOfUserId(GetEventInt(event, "victim"));
	Smoked[victim] +=1;
	//C_PrintToChatAll("%N 拉到 %N",attacker,victim);
}

public Event_PlayerBoomed(Event event, const char[] name, bool dontBroadcast) 
{
	//int attacker = GetClientOfUserId(GetEventInt(event, "attacker"));
	int victim = GetClientOfUserId(GetEventInt(event, "userid"));
	Boomed[victim] +=1;
	//C_PrintToChatAll("%N 噴到 %N",attacker,victim);
}*/