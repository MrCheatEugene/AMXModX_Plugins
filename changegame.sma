#include <amxmodx>
#include <amxmisc>
#include <fakemeta>

#define PLUGIN "Game name change"
#define VERSION "1.0"
#define AUTHOR "BOYSplayCS"

new ct_score, terrorist_score;
new gamename;

public plugin_init() {
	ct_score = 0;
	terrorist_score =0;
    register_plugin(PLUGIN, VERSION, AUTHOR)
	register_event("TeamScore", "team_score", "a");
    register_forward(FM_GetGameDescription, "change_gamename");
}

public team_score()

{

  new team[32];

  read_data(1,team,31);

  if (equal(team,"CT"))

  {

    ct_score = read_data(2);

  }

  else if (equal(team,"TERRORIST"))

  {

    terrorist_score = read_data(2);

  }

}

public change_gamename()
{ 
	console_print(0, "dacb")
	new game[32];
	if(get_cvar_num("mp_warmup") == 1){
		game = "Разминка";
	}else{
		format(game, 31, "CT %d | %d:%d | TR %d", ct_score, ct_score, terrorist_score, terrorist_score);
	}
	forward_return(FMV_STRING, game);
	
	return FMRES_SUPERCEDE;
} 