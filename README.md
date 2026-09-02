# Scarlet Beats Charting Guide

**Scarlet Beats** is mainly based off of games such as DDR, osu!mania, SDVX, and Chunithm. The design philosophy is mostly based off of Chunithm charts as one main mechanic Scarlet Beats has is **hold notes do not need to be let go at perfect timing.**

# Getting started
For this guide we will use the following:
- [ArrowVortex](https://arrowvortex.ddrnl.com/)
- [RoBeats Converter](https://spotco.github.io/RobeatsWebConvert2/)
- [osu!](https://osu.ppy.sh/home/download) (stable, not lazer)
- Discord (submitting the chart)
- Roblox asset ID of the song

> If you prefer to chart directly in osu! editor you can skip to [Converting to Robeats](#Converting-to-RoBeats)


## Guidelines
1. **One difficulty** per song
2. **Touhou related is a big plus**
3. Keep the chart under 3 minutes
> Try to find arcade ver of a song if possible (they are usually around 2 minutes long)

# Charting in ArrowVortex
Let’s begin with opening up ArrowVortex and creating a chart there, this guide will not cover how ArrowVortex charting works, but here are some recommendations:
- Use **Reverse Scroll** (View > Reverse Scroll)
- Make sure the tempo is correct, ArrowVortex is pretty good at guessing the BPM
- Play through the chart with hitsounds and just playing along to get a feel (Audio > Note Tick)

Before you start, **create a new folder** for the chart you want to create, in the folder add your audio and call it “audio.mp3”. 

Open this audio file in ArrowVortex:
<img width="790" height="820" alt="image" src="https://github.com/user-attachments/assets/4b6f7e91-46bd-44e1-b762-39353ee7644e" />


After you’re happy with the chart, save it as an **osu!mania file** (File > Save As) into the same folder as your audio.
<img width="386" height="165" alt="image" src="https://github.com/user-attachments/assets/ed81c1b2-de7d-408c-86bd-c1b1a46b7509" />

Your folder should now have the .osu file as well as the audio.mp3 file, there might also be .sm files from saving the chart in ArrowVortex, which we can ignore.

<img width="401" height="189" alt="image" src="https://github.com/user-attachments/assets/b899d548-d4f1-44d4-8caa-72c22b443bd6" />

# Importing to osu!
Next let’s open up osu! and import the song, the easiest way to do this is find your osu! songs folder, usually in `%USERPROFILE%\AppData\Local\osu!\Songs` and copying the folder there.

After that’s added, you should see it in osu!. 
<img width="931" height="476" alt="image" src="https://github.com/user-attachments/assets/89f9c69f-245f-4dfd-93b4-17f4145d632d" />


Open this up in the osu! editor (main menu > edit > select the song)
<img width="593" height="700" alt="image" src="https://github.com/user-attachments/assets/ad3f122a-7f14-4bf5-ba87-f0d5487693ff" />

> For Scarlet Beats, the metadata doesn’t matter so you can skip this by adding whatever text you want. 

From here we have to manually adjust the tempo offset of the chart so that the notes match the music, the reason it’s out of sync is because when exporting from StepMania (ArrowVortex) files to `.osu!` files (when we do Save As), there is a bug that the tempo is offset. This bug has been around for ages and the fix is usually to manually adjust it in osu! Directly. 


<img width="679" height="126" alt="image" src="https://github.com/user-attachments/assets/c5be42ba-bcbd-4abd-8953-d94b8df8126e" />

> If you slow down the playback rate to 25% and play the song in the editor, you can notice that the notes are slightly out of sync

To fix this let’s go to the Timing tab at the top and play around with the Offset value. The offset amount can vary between charts, but the difference is usually lowering around `100ms`, but can vary.
<img width="928" height="386" alt="image" src="https://github.com/user-attachments/assets/c44e8287-ec78-4e73-9aac-867c96820569" />



An easy way to do this initially at first visually is to listen for the beat of the song, pause the song when the beat hits, make the large offset circle match the smaller circle.
<img width="932" height="283" alt="image" src="https://github.com/user-attachments/assets/09fd013f-8e2c-4bb4-9e42-61bca0a6dfdd" />


After this, test out the map in play mode, listen, and make adjustments as needed. In this case we went from `1526` to `1426`, so exactly `100ms`.

Saving the song will update the `.osu` file in the folder we copied over (in osu! directory), let’s open the file in a text editor, it should look something like this:

<img width="491" height="808" alt="image" src="https://github.com/user-attachments/assets/9e4ff3ee-2a3a-4ef6-b0cd-e45ee20e6d4c" />

# Converting to RoBeats
Scarlet Beats uses RoBeats conversion as the basis of importing `.osu` files into Roblox.

Go over to the [Robeats Converter](https://spotco.github.io/RobeatsWebConvert2/) and copy-paste all the contents of the `.osu` file's text into it and hit Convert. 

<img width="825" height="719" alt="image" src="https://github.com/user-attachments/assets/6337ab21-125c-4455-a5f3-52dde070b70c" />

> Keep in mind, after the next step, we will copy the text from the lines ranging from the first and last, so in this case starting from `note(2354, 4)` and ending on `hold(112123,1,3121)`, avoiding any code at the top or bottom of the file.

# Making a Scarlet Beats Chart File
Scarlet Beats uses Roblox ModuleScripts as files so importing them into the actual game is as easy as dragging the file into the songs folder. With this, let’s head over to Roblox Studio and make a ModuleScript (the world you make it in doesn’t matter).
<img width="381" height="277" alt="image" src="https://github.com/user-attachments/assets/be53c137-ce2f-4827-9685-bcde11113ec2" />

Copy the following into the ModuleScript:
```lua=
local module = {}
module.id = 000000000 -- song rbxassetid ID, DONT CHANGE AFTER SONG IS ADDED TO SBF
module.music = 000000000 -- song rbxassetid ID again, separate incase audio needs to be reuploaded
module.offset = 100 -- offset specific for song if needed (default 100)
module.maxcombo = 0 -- note counts as 1, hold counts as 2, need to manually calculate (sorry)
module.artist = "Fumo" -- artist
module.mapper = "Fumo" -- mapper
module.time = "2:00" -- time of the CHART ending (doesn't need to be exact, but close is nice)
module.bpm = 150 -- bpm of the song (doesn't affect gameplay)
module.art = "rbxassetid://" -- art needs to use template
module.fullart = "rbxassetid://" -- art for songcard (256x100 px)
module.new = false

-- difficulty
module.difficulty = 5 -- difficulty, choose one
module.plus = "+" -- shows up as + sign in name
module.sort = 55 -- basically difficulty * 10, for detailed sorting of songs (some + might be more + than others)

-- {ms, note type}
-- note type: 1 = left, 2 = up, 3 = down, 4 = right
module.notes = {

}

return module
```

In here fill out all the fields that make up the charts metadata. The **title** of the song is the Name of the ModuleScript itself. *Calculate the maxcombo in the next step.*

## Converting RoBeats to Scarlet Beats format
Scarlet beats uses a slightly different format than the Robeats Converter gives us, so we need to manually change a few things in the code for this. **It's recommended to make a temporary ModuleScript file for this step.**

1. Paste in the note data from the RoBeats Converter
2. Using the Find and Replace tool (Ctrl + F, press dropdown)
    - Find `note(`, replace with `{`
    - Find `hold(`, replace with `{`
    - Find `)`, replace with `},`
> For metadata purposes, note down the amount of `hold(` and `note(` results shown (ctrl + F) to calculate the max combo of the song, this calculation needs to be correct in order to get a FC.
> `(Total Holds * 2) + Total Notes = Max Combo` 
3. Place this note data should be inside the `module.note = { }` section of the chart file

## Artwork
For the cover of the chart and the artwork in-game, Scarlet Beats requires 2 files for the chart:
1. Art - Thumbnail art (341x341px, kind of triangle shaped) - [Template](https://github.com/tenkovr/Scarlet-Beats-Charting/blob/main/ScarletBeatsArtTemplate.psd)
2. Fullart - In-game art (256x100px, title bar) - [Template](https://github.com/tenkovr/Scarlet-Beats-Charting/blob/main/ScarletBeatsFullArtTemplate.psd)

For these, please use the templates linked above.
> Use a `.psd` editor such as [Photopea](https://www.photopea.com/) to edit the files and export as a `.png` without modifying the dimensions.

<img width="387" height="381" alt="image" src="https://github.com/user-attachments/assets/255c4870-fe6e-4fbd-82a6-e09d821f14e4" />

<img width="512" height="235" alt="image" src="https://github.com/user-attachments/assets/4d22bfb6-9d6e-464d-a202-14af4c59d3d3" />

You can get creative with the thumbnail art and have elements poking out of the top (e.g. characters, objects, text, effects, etc).

### Rules for artwork
- Create your own **fumo version** if possible (can be scuffed)
- No AI

# Submitting a Chart
You can submit your chart similar to any other submission in the [SBF official Discord server](https://discord.gg/86xmzb4j95). In the submission, include:
- The Scarlet Beats chart (ModuleScript)
- The audio file
- Artwork assets (Art + Fullart)

The server has a voting system and if the submission gets enough votes, the devs can approve the submission into the game for the next update. Before the update goes live the chart can be tested in the testing server (more details in Discord).

**Thank you for the hard work! It really means a lot to everyone!**

## Roblox assets
> For submissions, this section can potentially be skipped

You can upload Roblox assets by using the Asset Manager in Roblox, after uploading an asset, right-click it in the manager and Copy Asset ID

<img width="188" height="128" alt="image" src="https://github.com/user-attachments/assets/20267a40-d00a-493f-a45f-c9786d0049a9" />


# Song permissions

> This section is a reference for when the audio file is not included in the submission or in special circumstances

- If the audio is public, it is good to go. 
- If the audio is private (most likely) either:
    1. Add dev as permission for the asset in Roblox
    2. Send audio to devs directly
