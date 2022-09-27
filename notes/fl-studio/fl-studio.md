# FL Studio Overview
- FL Studio is a full-featured music production environment capable of multi-track audio recording, sequencing and mixing for the creation of professional quality music tracks. 
- DAW (Digital Audio Workstation) 
- UI sections
   - Channel Rack
   - Playlist
   - Piano Roll
   - Mixer
   - Browser

# Terminologies
1. MIDI (Musical Instrument Digital Interface): a technical standard that describes a communications protocol, digital interface, and electrical connectors that connect a wide variety of electronic musical instruments, computers, and related audio devices for playing, editing and recording music.
1. VST (Virtual Studio Technology): an audio plug-in software interface that integrates software synthesizers and effects units into digital audio workstations



# Menu Bar
## Files
### Export
- Modes
   1. Pattern
   1. Full song
   1. Project Bones
- Format
   - Wave: minimal impact to original quality
   - **OGG**: no gap before start & after end
- Bit rate: higher -> better quality

### Import Music
- All music resources can be directly dragged into panels or tracks
- Note for apple music file format m4a, we need to convert it into wav format in the Music app first.

## Edits
- **Undo / Redo** can be done via `EDIT` (`Ctrl + Z`) or History panel on the left
- **Copy / Paste / Move** can be done via holding `shift` and drag the pattern or `Ctrl + b`

## Other
- `Beats per bar` and `Steps per beat` can be edited in `project settings`
- Tempo helper should be on at the beginning of beat making phase

# Playlist
- Zoom
   - Vertically: small dot button on the top right
   - Horizontally: drag the size of the moving bar
- Magnet button: adjust the closest step that a pattern auto attach to after dragging
   - `None` is not recommended
- Knobs value can be changed by dragging up or down
   - Most knobs and sliders can be linked to external/internal controllers
- Slide button: cut a pattern into two

   


# Channel Rack
## Basics
- **Kick**: usually the largest drum in the kit. Its located on the floor in front of you and you use a pedal to strike it
- **Clap**: whether it’s the recorded sound of humans hitting their hands together or a synthetic equivalent, it’s a percussive sound that cracks, sizzles and repeats throughout clubs the world over
- **Snare**: the drum that sits directly in front of you on a stand and has what are called “snares” on the underside or the “resonance” side and can be engaged and disengaged with a throw off. 
- **High hat**: A hi-hat (hihat, high-hat, etc.) is a combination of two cymbals and a pedal, all mounted on a metal stand.
- Channel Panning tune button: left ear or right ear
- Volume tune button: control volume

## Instrument Properties
- In button
- Out button
- Envelope pattern: control when would the sound come out
   - ATT tune button: will postpone the head to make the sound volume lower
- Filter



# Piano Roll
## Basics
- Hold `Command` and drag to select a group of keys 
- Hold `Shift` and copy a group of keys to the next bar
- `Fn` + `delete` to remove all selected notes 

## Ghost channel
If you wanna see how the other instrument was implemented in the same pattern, 'ghost channel' button can be toggled to reflect that

## Control panel
- Velocity: volume of each key
- Pan: If the sound would come from left or right




# Midi settings
## General midi settings
- Options -> Midi settings

## Drum Mapping 
- FPC -> Click drop down arrow -> 'Map notes for entire bank'

## Mixer
- Upon selecting track on a channel rack entry, we can view the status of the track in mixer
- On the right side bar of mixer view, mixers can be inserted
- **Channel Routing** (right-click on a track in mixer): binds multiple channels into one track / following tracks
- Studio separation tune button: make sounds wider or narrower
- Copy mixer effect to another track: right click the mixer, hold and drag 'save presets as ...' to the track

## Automation clip
- In channel rack's channel properties view, we can add automation clip by right clicking the pitch tune button
- Updating a point on automation clip will impact this point and left side 

### Why automation clip
- Can edit properties as a whole for multiple consistent patterns

# Audio Recording
- Playlist -> select a track -> right click -> track mode -> audio track
- In Mixer, select input source and disable the hear back in **Master** track
- Turn on 'Recording' and click 'Play' to start

# Plugins
- Press 'F8' opens 'plugin picker'


# Best Practices
## Audio
