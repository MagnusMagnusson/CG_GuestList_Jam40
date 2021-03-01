title = "Your Display Name";
name = "online_name";

if(global.networking.user != -1){
	text = global.networking.user.name;
	title = "Your Display Name [#" + global.networking.user.salt+"]" ;
}