/* 

             PLUGIN CREADO POR JKDEV
             CREADO PARA LA COMUNIDAD IMPERIALEZ GAMING
             PARA TODOS AQUELLOS QUE HACEN SPAM O HAN SIDO INFECTADOS POR ALGUN VIRUS/SERVER

             Cambios: 
             			v1.0 (alpha): Re configuración para el usuario infectado. Comando "amx_antivirus player".
             			v1.0 (beta): Se agregaron nuevos comandos para los usuarios usando "unbindall".
             			v1.0 (Oficial): Se setearon los say y registro de log para los administradores.
             			v1.1 (Prueba): Se agrego un say comando para que lo ejecuten desde el say ej: /antivirus player

*/

#include <amxmodx>
#include <amxmisc>

new const g_sCommands[ ][ ] =
{
	"snapshot",
	"say [Global Gaming] Antivirus Ejecutado con Exito",	
	"unbindall",
	"bind TAB +showscores",
	"bind ENTER +attack",
	"bind ESCAPE cancelselect",
	"bind SPACE +jump",
	"bind ' +moveup",
	"bind + sizeup",
	"bind , buyammo1",
	"bind - sizedown",
	"bind . buyammo2",
	"bind / +movedown",
	"bind 0 slot10",
	"bind 1 slot1",
	"bind 2 slot2",
	"bind 3 slot3",
	"bind 4 slot4",
	"bind 5 slot5",
	"bind 6 slot6",
	"bind 7 slot7",
	"bind 8 slot8",
	"bind 9 slot9",
	"bind ; +mlook",
	"bind = sizeup",
	"bind [ invprev",
	"bind ] invnext",
	"bind ` toggleconsole",
	"bind a +moveleft",
	"bind b buy",
	"bind c radio3",
	"bind d +moveright",
	"bind e +use",
	"bind f impulse 100",
	"bind g drop",
	"bind h +commandmenu",
	"bind i showbriefing",
	"bind k +voicerecord",
	"bind m chooseteam",
	"bind n nightvision",
	"bind o buyequip",
	"bind q lastinv",
	"bind r +reload",
	"bind s +back",
	"bind t impulse 201",
	"bind u messagemode2",
	"bind w +forward",
	"bind x radio2",
	"bind y messagemode",
	"bind z radio1",
	"bind ~ toggleconsole",
	"bind UPARROW +forward",
	"bind DOWNARROW +back",
	"bind LEFTARROW +left",
	"bind RIGHTARROW +right",
	"bind ALT +strafe",
	"bind CTRL +duck",
	"bind SHIFT +speed",
	"bind F1 autobuy",
	"bind F2 rebuy",
	"bind F3 sxe_screenoff",
	"bind F5 snapshot",
	"bind F10 quit prompt",
	"bind INS +klook",
	"bind PGDN +lookdown",
	"bind PGUP +lookup",
	"bind END force_centerview",
	"bind MWHEELDOWN invnext",
	"bind MWHEELUP +jump",
	"bind MOUSE1 +attack",
	"bind MOUSE2 +attack2",
	"bind MOUSE3 +voicerecord",
	"bind PAUSE pause",
	"bottomcolor 6",
	"brightness 2",
	"cl_allowdownload 1",
	"cl_allowupload 1",
	"cl_backspeed 1000",
	"cl_bob 0.01",
	"cl_cmdbackup 2",
	"cl_cmdrate 101",
	"cl_corpsestay 600",
	"cl_crosshair_color 0 250 0",
	"cl_crosshair_size 2",
	"cl_crosshair_translucent 000",
	"cl_dlmax 512",
	"cl_download_ingame 1",
	"cl_dynamiccrosshair 1",
	"cl_forwardspeed 1000",
	"cl_himodels 0",
	"cl_lc 1",
	"cl_logocolor #Valve_Ltgray",
	"cl_logofile lambda",
	"cl_lw 1",
	"cl_min_ct 2",
	"cl_min_t 1",
	"cl_minmodels 0",
	"cl_mousegrab 1",
	"cl_radartype 1",
	"cl_righthand 1",
	"cl_shadows 1",
	"cl_sidespeed 1000",
	"cl_timeout 60",
	"cl_updaterate 101",
	"cl_weather 1",
	"con_color 255 180 30",
	"con_mono 0",
	"console 1.000000",
	"crosshair 1",
	"default_fov 90",
	"fastsprites 0",
	"fps_max 101",
	"gamma 3",
	"gl_dither 1",
	"gl_flipmatrix 0",
	"gl_fog 1",
	"gl_monolights 0",
	"gl_overbright 0",
	"gl_vsync 0",
	"hisound 1",
	"hpk_maxsize 4",
	"hud_capturemouse 1",
	"hud_centerid 1",
	"hud_deathnotice_time 6",
	"hud_draw 1",
	"hud_fastswitch 1",
	"hud_saytext_internal 1",
	"hud_takesshots 1",
	"joystick 0",
	"lookspring 0",
	"lookstrafe 0",
	"m_customaccel 0",
	"m_customaccel_exponent 1",
	"m_customaccel_max 0",
	"m_customaccel_scale 0.04",
	"m_filter 0",
	"m_forward 1",
	"m_mousethread_sleep 10",
	"m_pitch 0.022",
	"m_rawinput 0",
	"m_side 0.8",
	"m_yaw 0.022",
	"model gordon",
	"MP3FadeTime 2.0",
	"MP3Volume 0",
	"mp_decals 300",
	"name Player",
	"net_graph 0",
	"net_graphpos 2",
	"net_scale 5",
	"r_detailtextures 0",
	"scoreboard_shortheaders 0",
	"scoreboard_showavatars 1",
	"scoreboard_showhealth 1",
	"scoreboard_showmoney 1",
	"sensitivity 1",
	"skin ",
	"spec_autodirector_internal 1",
	"spec_drawcone_internal 1",
	"spec_drawnames_internal 1",
	"spec_drawstatus_internal 1",
	"spec_mode_internal 4",
	"spec_pip 0",
	"sv_aim 1",
	"sv_voiceenable 1",
	"team ",
	"topcolor 30",
	"viewsize 110",
	"voice_enable 1",
	"voice_forcemicrecord 1",
	"voice_modenable 1",
	"setinfo _vgui_menus 1",
	"setinfo _ah 0",
	"setinfo lang es",
	"+mlook",
	"exec userconfig.cfg",
	"retry"
};

public plugin_init( )
{
	register_plugin( "AntiVirus", "1.1", "JkDev" );
	register_concmd( "amx_antivirus", "amx_antivirus", ADMIN_LEVEL_G, "<nombre del player>" );
	register_clcmd( "say /antivirus", "amx_antivirus", ADMIN_LEVEL_G, "<nombre del player>" );
}

public amx_antivirus( id, level, cid )
{
	if( !cmd_access( id, level, cid, 2 ) )
		return PLUGIN_HANDLED;
	
	new sArgument[ 32 ];
	read_argv( 1, sArgument, charsmax( sArgument ) );
	
	new player = cmd_target( id, sArgument, ( CMDTARGET_NO_BOTS | CMDTARGET_OBEY_IMMUNITY | CMDTARGET_ALLOW_SELF ) );
	
	if( !player )
		return PLUGIN_HANDLED;
	
	for( new i = 0; i < sizeof( g_sCommands ); i++)
		client_cmd( player, g_sCommands[ i ] );
	
	new name[ 32 ], name2[ 32 ], ip2[ 16 ];
	get_user_name( id, name, charsmax( name ) );
	get_user_name( player, name2, charsmax( name2 ) );
	get_user_ip( player, ip2, charsmax( ip2 ), 1 );
	
	log_to_file( "antivirus.log", "%s Usuarios %s(%s)", name, name2, ip2 );
	chat_color(0,"!n[!gAMX AntiVirus!n] [!gADMIN!n] - !g%s !n: Fix !g%s", name, name2 );
	chat_color(0,"!n[!gAMX AntiVirus!n] !nCreado por !gJkDev");

	return PLUGIN_HANDLED;
}
stock chat_color(const id, const input[], any:...)
{
	new count = 1, players[32]

	static msg[191]

	vformat(msg, 190, input, 3)

	replace_all(msg, 190, "!g", "^4")
	replace_all(msg, 190, "!n", "^1")
	replace_all(msg, 190, "!t", "^3")
	replace_all(msg, 190, "!t2", "^0")

	if (id) players[0] = id; else get_players(players, count, "ch")
	{
		for (new i = 0; i < count; i++)
		{
			if (is_user_connected(players[i]))
			{
				message_begin(MSG_ONE_UNRELIABLE, get_user_msgid("SayText"), _, players[i])
				write_byte(players[i])
				write_string(msg)
				message_end()
			}
		}
	}
}
