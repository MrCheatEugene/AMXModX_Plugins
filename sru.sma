/* Plugin generated not by AMXX-Studio, but by me:) */
  
#include <amxmodx>
#include <amxmisc>
#include <reapi_vtc>
#define PLUGIN "SoundEffects"
#define VERSION "1.0"
#define AUTHOR "Emil"
  
public plugin_precache(){
    precache_sound("bombplant-sanya.wav")
    precache_sound("yanasrusanya.wav")
    precache_sound("deadsanya.wav")
    precache_sound("truboiob-vitalia-sanya.wav")
    precache_sound("est-probitie-sanya.wav")
    precache_sound("sound/truboiob-vitalia-sanya.wav")
    precache_sound("sound/est-probitie-sanya.wav")
    precache_sound("sound/deadsanya.wav");
    precache_sound("sound/yanasrusanya.wav");
    precache_sound("sound/bombplant-sanya.wav");
}  

public plugin_init() {
    register_plugin(PLUGIN, VERSION, AUTHOR)  
    register_event("SendAudio", "ct_win", "a", "2&%!MRAD_ctwin") 
    register_event("BombDrop", "bombdrop", "a", "4=1")
    register_event("DeathMsg","dead","a")
    register_event("SendAudio","onRadio","a")
    register_event("SendAudio","onRadio","c")
    register_clcmd("say /sru","targetSaved")
    register_clcmd("sru","targetSaved")
}
 
public onRadio(){
    static sound[255]; 
    read_data(2, sound, sizeof(sound)-1)
    if (equal(sound,"%!MRAD_BOMBDEF")){
        emit_sound(0,0,"yanasrusanya.wav",0.35, 1.0, 0, 50)
    }
}

public dead(){
    static sWeapon[255]; 
    read_data(4, sWeapon, sizeof(sWeapon)-1)
    new iHeadShot = read_data(3) 
    if ((equal(sWeapon,"awp") || equal(sWeapon,"knife")) && iHeadShot==1){
        VTC_PlaySound(read_data(1),"sound/truboiob-vitalia-sanya.wav")
    }else if(iHeadShot==1){
        VTC_PlaySound(read_data(1),"sound/est-probitie-sanya.wav")
    }
    emit_sound(read_data(2),0,"deadsanya.wav",0.35, 1.0, 0, 50 )
    VTC_PlaySound(read_data(2),"sound/deadsanya.wav")
}

public bombdrop(){
   emit_sound(0,0,"bombplant-sanya.wav",0.35, 1.0, 0, 50)
}

public ct_win(){
new Players[32], PlayersCount;
get_players( Players, PlayersCount)
if(PlayersCount>2){
    emit_sound(0,0,"yanasrusanya.wav",0.35, 1.0, 0, 50 )
}
}

public targetSaved(id){
    console_print(id,"playing")
//    emit_sound(id,0,"yanasrusanya.wav",0.35, 1.0, 0, 50 )
    VTC_PlaySound(id,"sound/yanasrusanya.wav")
}

