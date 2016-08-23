# SmallFixes
## Minor changes to vanilla Factorio

 - prevent construction bots from going to the toolbar (default on)
 - prevent construction bots from being mined (default on)
 - prevent logistic bots from being mined (default off)
 - mining construction/logistic bots returns the materials instead (default off)
 - change default request amount for requester chests/slots (default off)
 - change how many items are requested when copying from assembler to requester chest (default off)
 - add radar mk2 with doubled radius and 4x scanning speed/power usage (default off, same graphics as the vanilla one)
 
You can change every setting in the config.lua file (no fancy gui, i want to keep this simple). If changes don't get applied you might have to copy/rename the file located in the migrations folder.
Since this mod doesn't have a control.lua it should work without problems in multiplayer, if every player has the same config.lua
Should also work for construction bots from mods.

Issues: If your inventory is full and you disallowed construction bots going to your toolbar, they won't go there. Even if there are free slots/construction bots.

https://forums.factorio.com/viewtopic.php?f=91&t=16945

***
###Changelog
0.1.22

- added option to make logistic bots unminable (defaults to off)