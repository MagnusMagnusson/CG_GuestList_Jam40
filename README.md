# Crimson Guild's Glamerous Guest List
## A people picking jam game.

This is a Game Maker Studio game that I created over the course of 96 hours in early 2021 for the GMC community game jam #40.
[See result topic on the forum](https://forum.yoyogames.com/index.php?threads/gmc-jam-40-results.84587/). The game ended up in 8th place out of 77.

Eventually I'll find the time to polish it up and add it to my main website.

As with most jam games this project was put together incredibly quickly under stressful circumstances, 
and the code quality reflects that. It's not intended to be good or well written code wise, 
all it needed was to work more often than not once sent out to the world.

The highscore server was taken offline for the time being in preperation for a more permanent rework, and so 
a macro in the macro.gml script has been added to enable and disable networking. If you enable it be prepared you're 
likely to crash the game. 

## structure

For obvious reasons I'd recommend running a Game Maker Studio 2 project in said engine and let *it* work out the structure, but:

/RawAssets/ includes raw assets, sprite files, drawings, and other data that I worked on before adding it to the game itself.

/fonts/ includes fonts

/notes/ simply includes an attribution file

/objects/ includes the .gml data for all the Game Maker Objects used by the game

/rooms/ includes all the rooms used in the game (well, the room)

/scripts/ includes all free-standing .gml scripts that contain the various functions used in the game by other objects

/server/ includes the django python server. This server was later ripped out and reworked in to [the GMC Jam Server](https://github.com/MagnusMagnusson/GMC_Jam_Server) which
is still operational albeit I'm working on replacing it with a more proper online service that doesn't rest on a foundation made in six hours. 

/sounds/ includes sounds and the music track that snuck in to the repo.

/sprites/ includes the sprite files

"CG_GlamorousGuestList_MrMagnus.yyp" is the main GMS 2 file. 
