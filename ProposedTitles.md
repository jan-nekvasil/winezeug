This page is now out of date, see http://code.google.com/p/winetricks/wiki/UpcomingTitles

Don't add titles here that you're already looking at - this is
a reminder list for things we want to look at in the near future.

When you add a title, please include links to appdb if possible.

## Criteria ##

We like games that are very popular/good/recent.

I usually check Wikipedia for release dates (ancient games unlikely to interest people unless they're great and/or are free downloads),
Gamerankings.com for a measure of "good" (70% or higher is ok, 90% is "do it now!")
and amazon to see if it's selling (if it's in the top 100 in some category,
that's a good sign).

But even if it doesn't meet those criteria, and you love the game, go ahead.

## GOG titles ##

http://www.gog.com/en/forum/general/gog_games_that_are_working_fine_with_linux_wine
has a list of the ones that work.  We removed GOG support when they shut down
recently (see http://code.google.com/p/winezeug/source/detail?r=1600 ), but now that they're back, we should revert [r1600](https://code.google.com/p/winezeug/source/detail?r=1600) and update it to work with the new GOG.com.

## Demo/release lists ##
Sometimes you can find fresh game demos at these sites...
the earlier we can QA them and file bugs, the sooner wine can support them.

http://www.demonews.de/demos.php

http://www.bigdownload.com/downloads?fileId=1&orderType=update&genreId=0

http://www.ign.com/index/release.html

## Youtube Channels about Wine and Games ##
(Hey, if it runs well enough to make a video about, we should probably support it!)

http://www.youtube.com/user/Jakejw93#g/u

http://www.youtube.com/user/2m42hy#g/u

## Blogs about Wine and Games ##

http://www.steamgamesonlinux.com/category/playable-steam-games/
(assuming we ever get steam reliably scripted, that is)

## Other Wine Frontends ##
(PlayOnLinux supports about 250 games.  If it works for them, we can probably script it.)

http://www.playonlinux.com/repository/?cat=1

They have statistics of which are their most popular apps; see
http://www.aplu.fr/polistats/stats_2010.html

A few ideas from there, but pick any that look popular:

Google Chrome (old version, current is broken)
http://appdb.winehq.org/objectManager.php?sClass=version&iId=20397
http://www.playonlinux.com/repository/?script=326

Halo Combat Evolved
http://appdb.winehq.org/objectManager.php?sClass=version&iId=2720&iTestingId=57341
http://www.playonlinux.com/repository/?script=236

Microsoft Office 2007
http://appdb.winehq.org/objectManager.php?sClass=version&iId=4992

Spotify
http://appdb.winehq.org/objectManager.php?sClass=application&iId=8514
http://www.playonlinux.com/repository/?script=386
Supposedly platinum, and quite popular

Windows live messenger 2008
http://appdb.winehq.org/objectManager.php?sClass=version&iId=8146
http://www.playonlinux.com/repository/?script=391 refers to "wlm85.msi".
That's no longer available from microsoft.com, but there is a copy from
supposedly an MS MVP at
http://www.tech-archive.net/Archive/WinXP/microsoft.public.windowsxp.messenger/2007-12/msg00023.html
which has the same sha1sum (77eec15c8453d20260d8bf6977eeb6581bd8902f) as
the one playonlinux points at




Wine-Doors supports a dozen or so games, might be worth looking at, even though
the project is shut down.

http://en.wikipedia.org/wiki/Wine-Doors

Likewise, WineBot supported a dozen or so titles, and even used Autohotkey to do it:
http://winebot.sandbox.cz/tracker/browser/repositories

http://portingteam.com is something like winebottler for games,
and they have about 32 so far?  (found via random google image search for winetricks)  They highlight one per week.

## Proposed free titles ##

http://www.amibroker.com/download.html
It runs in wine, but some guy has a site at amibroker.org with a
preinstalled bundle of ie6, mfc42, riched20, and some registry changes.
Maybe if we script it he'll drop that.
Noticed this because of http://forum.winehq.org/viewtopic.php?t=11230

Free Mega Games Pack Vol 1
http://www.ubuntugamer.com/2010/09/211-free-wine-compatible-games-in-one-download/
but see
http://forum.winehq.org/viewtopic.php?t=10643
http://bugs.winehq.org/show_bug.cgi?id=25549
He needs someone to do a regression for him, it looks like.
(Can we automate the regression by sensing a log entry or a pixel color?)

Joerg requests that we add one or more of the titles in
http://bugs.winehq.org/show_bug.cgi?id=15030
since that exposes an installer hang.

Alien Swarm
http://news.bigdownload.com/2010/07/16/alien-swarm-to-be-released-by-valve-as-free-game-on-monday/
82%: http://www.gamerankings.com/pc/999022-alien-swarm/index.html
http://bugs.winehq.org/show_bug.cgi?id=23842

Burnout Paradise demo
http://download.nvidia.com/downloads/nZone/demos/nzd_BurnoutParadiseOB_PC.zip

City of Heroes
http://www.cityofheroes.com
http://appdb.winehq.org/objectManager.php?sClass=version&iId=2980

Darkfall (14 day trial) (Kalypso)
http://appdb.winehq.org/objectManager.php?sClass=version&iId=20849&iTestingId=56341

Deadspace 2 demo (EA)
http://www.funload.de/s/dead-space-2-demo
(might be a better url out there)

DeathSpank (EA) (Steam)
http://appdb.winehq.org/objectManager.php?sClass=application&iId=12280

Football Manager 2011 demo
http://www.bigdownload.com/games/football-manager-2011/pc/football-manager-2011-vanilla-demo/

His gf says these are her favorite five games from bigfish:
> World Mosaics (1, 2 and 3)
> Grimms Hatchery
> Life Quest
> Farmers Market
> Santa's Super Friends
Only the last one doesn't work in Wine.  If bigfish's installer is too annoying,
try looking for them at sandlotgames, perhaps.

Hawx 2 benchmark (Ubisoft.  Beware DRM.)
http://www.bigdownload.com/games/tom-clancys-hawx-2/pc/hawx-2-pc-benchmark/

Heat Online
http://heat-online.net/
http://appdb.winehq.org/objectManager.php?sClass=application&iId=11955 (bronze; download using torrent, winetricks dotnet20 first)
(see also http://en.wikipedia.org/wiki/Project_Torque, http://bugs.winehq.org/show_bug.cgi?id=22152 )

Land of Chaos Online Open beta starts aug 3.
http://pc.ign.com/articles/110/1109105p1.html
http://www.massively.com/2010/03/11/gdc10-land-of-chaos-online-interview/

Legions Overdrive
http://appdb.winehq.org/objectManager.php?sClass=version&iId=22630
http://forum.winehq.org/viewtopic.php?p=56532&sid=b2462ad9a5c63ee611924ab772d0f306
http://www.legionsoverdrive.com/download/

Lego Universe (closed beta, ask Dan for key)
http://universe.lego.com/

Lugaru demo (now open source, supports linux and mac, but still it'd be nice to show off the windows version in wine
http://appdb.winehq.org/objectManager.php?sClass=version&iId=20420
http://www.gamerankings.com/pc/929329-lugaru-hd/index.html
http://www.wolfire.com/lugaru

Mafia II Demo (Steam)
http://appdb.winehq.org/objectManager.php?sClass=version&iId=21257
(There's also http://www.bigdownload.com/games/mafia-ii/pc/mafia-2-demo/ but that installs steam.)

Magicka (Scott on this)
http://www.gamerankings.com/pc/988764-magicka/index.html

Momento Mori demo (french/german/spanish, choose one, no english available)
http://www.gamershell.com/download_37478.shtml
http://www.strategyinformer.com/pc/demos/mementomori/demo.html
Caught my eye because of a more recent release of theirs,
http://www.ubuntugamer.com/2010/12/wine-how-to-and-review-of-alternativa

NVidia DirectX9 samples
http://developer.download.nvidia.com/SDK/9.5/Samples/3dgraphics_samples.html

Ongaku Demo
http://www.ongakugame.com/demotry.html
Seems to need directx9 to play well, haven't figured out exactly what it wants
It's really freaky,

Perpetuum Online closed beta (I got in, can't be too hard; client seems to work with just winetricks d3dx9\_36)
http://www.perpetuum-online.com

Rayman 2 (**really** highly ranked platform game, free demo, but released in 1999)
http://bugs.winehq.org/show_bug.cgi?id=21159

Risen Demo (Deep Silver, 2009, got 78%).  Don't script unless it works for you,
but do file bugs.
http://www.gamerankings.com/pc/952152-risen/index.html
http://news.bigdownload.com/2009/10/01/download-risen-demo
http://appdb.winehq.org/objectManager.php?sClass=version&iId=17988


The new no-battlenet-no-internet-connection-needed demo for Starcraft 2
http://us.battle.net/sc2/en/blog/1797995

Warhammer Online Trial
http://mythicmktg.fileburst.com/war/us/home/other/WarhammerOnlineInstaller.exe
http://appdb.winehq.org/objectManager.php?sClass=version&iId=13139
http://www.warhammeronline.com/trial/
(Wait, this is hard because of http://bugs.winehq.org/show_bug.cgi?id=6955 )

Worms Reloaded (steam)
http://appdb.winehq.org/objectManager.php?sClass=version&iId=21222
http://www.gamerankings.com/pc/990077-worms-reloaded/index.html

## Proposed paid titles ##

Arma II: Operation Arrowhead  (EG said he'd take this?)
http://www.gamerankings.com/pc/971387-/

Back to the Future (release Dec 22)
http://www.telltalegames.com/store/backtothefuture

Borderlands (Scott on this)
http://appdb.winehq.org/objectManager.php?sClass=version&iId=18686

Deathspank (Steam)
http://store.steampowered.com/app/18040/
http://appdb.winehq.org/objectManager.php?sClass=version&iId=21793

Dead Rising 2
http://appdb.winehq.org/objectManager.php?sClass=version&iId=21516
Was one of the top 5 games of the year on Zero Punctuation: http://www.escapistmagazine.com/videos/view/zero-punctuation/2607-Top-5-of-2010

Far Cry 2
http://appdb.winehq.org/objectManager.php?sClass=application&iId=8522

Final Fantasy XIV (we did the beta, but haven't done retail version yet)
EG had trouble, he couldn't get past the login screen even with ie6

Poker Night at the Inventory (cheap)
http://www.telltalegames.com/pokernight

Sims 3 Late Night (or other expansion pack)

Super Meat Boy (non-steam version)
http://en.wikipedia.org/wiki/Super_Meat_Boy
http://www.gamerankings.com/pc/604976-super-meat-boy/index.html  91%!
http://appdb.winehq.org/objectManager.php?sClass=application&iId=12449

Team Fortress 2 (via steam; in timedemo mode, so yagmark, too? )
http://appdb.winehq.org/objectManager.php?sClass=application&iId=5823

Unreal Tournament 3 (I have the copy Travis bought)
http://appdb.winehq.org/objectManager.php?sClass=application&iId=5937

## Upcoming Betas ##

ncsoft:
> Guild Wars 2
> Blade and Soul

## Other titles (not sure if free demo available) ##

## Non-GPU-intensive free titles ##

Opera
http://www.opera.com/browser/download/?os=windows&ver=10.63&local=y

Irfanview
http://www.irfanview.com/

## Already done by someone (though not committed yet - FIXME) ##

Call of Duty 5: World at War
http://appdb.winehq.org/objectManager.php?sClass=version&iId=14475

Draftsight
http://www.3ds.com/products/draftsight/

Supreme Commander 2 - Square Enix
http://bugs.winehq.org/show_bug.cgi?id=23593

GTA IV (Scott on this)
http://appdb.winehq.org/objectManager.php?sClass=application&iId=8757

## Probably too painful ##

Moonbase Alpha
http://appdb.winehq.org/objectManager.php?sClass=version&iId=20752&iTestingId=54989
Downloaded via steam, but doesn't use Steam once downloaded, just like America's Army.  Copy how we did AA.

## Game development IDEs ##

http://www.gamestart3d.com  (said to work quite well in wine)

## Codecs ##

(for winetricks)

http://www.cccp-project.net looks like a reasonable nearly open source codec distribution?
http://www.cccp-project.net/beta/ has archives of the patches they apply.
Not sure whether they publish the source for their installer, etc.