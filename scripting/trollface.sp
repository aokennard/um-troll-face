#define UM_STEAMID64 "76561198085447264"
#define T1 "░░░░▄▄▄▄▀▀▀▀▀▀▀▀▄▄▄▄▄▄ "
#define T2 "░░░░█░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░▀▀▄ "
#define T3 "░░░█░░░▒▒▒▒▒▒░░░░░░░░▒▒▒░░█ "
#define T4 "░░█░░░░░░▄██▀▄▄░░░░░▄▄▄░░░█ "
#define T5 "░▀▒▄▄▄▒░█▀▀▀▀▄▄█░░░██▄▄█░░░█ "
#define T6 "█▒█▒▄░▀▄▄▄▀░░░░░░░░█░░░▒▒▒▒▒██ "
#define T7 "░█▀▄░█▄░█▀▄▄░▀░▀▀░▄▄▀░░░░█░░█ "
#define T8 "░░█░░▀▄▀█▄▄░█▀▀▀▄▄▄▄▀▀█▀██░█ "
#define T9 "░░░█░░██░░▀█▄▄▄█▄▄█▄████░█ "
#define T10 "░░░░█░░░▀▀▄░█░░░█░███████░█ " // no say space?
#define T11 "░░░░░▀▄░░░▀▀▄▄▄█▄█▄█▄█▄▀░░█ "
#define T12 "░░░░░░░▀▄▄░▒▒▒▒░░░░░░░░░░█ "
#define T13 "░░░░░░░░░░▀▀▄▄░▒▒▒▒▒▒▒▒▒▒░█ "

public Plugin:myinfo = {
	name        = "trollface command",
	author      = "yosh",
	description = "!troll command to print trollface to server, by request of um",
	version     = "1.0.0",
	url         = "pootis.org"
};

ConVar g_trollSteamID64;

public void OnPluginStart() {
    g_trollSteamID64 = CreateConVar("troll_steamid", UM_STEAMID64, "SteamID64 allowed to use !troll")
    RegConsoleCmd("say", SayHook);
}

public Action SayHook(int client, int args) {
    char arg[128];
    char full[256];
    GetCmdArgString(full, sizeof(full));

    if (client) {
        char steamID[32];
        GetClientAuthId(client, AuthId_SteamID64, steamID, STEAMID_LENGTH);
        char cvSteamID[32];
        GetConVarString(g_trollSteamID64, cvSteamID, 32);
        if (strcmp("!troll", full, true) == 0 && strcmp(steamID, cvSteamID, false) == 0) {
            PrintToChatAll("%s", T1);
            PrintToChatAll("%s", T2);
            PrintToChatAll("%s", T3);
            PrintToChatAll("%s", T4);
            PrintToChatAll("%s", T5);
            PrintToChatAll("%s", T6);
            PrintToChatAll("%s", T7);
            PrintToChatAll("%s", T8);
            PrintToChatAll("%s", T9);
            PrintToChatAll("%s", T10);
            PrintToChatAll("%s", T11);
            PrintToChatAll("%s", T12);
            PrintToChatAll("%s", T13);
            return Plugin_Handled;
        }
    }
    return Plugin_Continue;
}