# FL Studio

## Music Theories
- Beat
- Bar (typically 4 beats per bar)
- Tempo (BPM): Beats per minute
- Note
   - Full note takes the whole bar
   - Half note takes 2 beats

### Piano Roll
- 88 keys
- 12 keys (7 white keys and 5 black keys) are grouped together. 
   - White keys range from C,D,E,F,G,A,B. 
   - Black keys range from C# (D b), D#, ... A#
- There are a total of 8 groups of keys. Range from 
   - China: A_2, C_1, C, c, c^1 (center), c^2, c^3, c^4, c^5
   - Other places: c5 is the center
   
#### Major & minor
- Major pattern
   - full, full, half, full, full, full, half 
   - e.g.
	- **C major**: C, D, E, F, G, A, B (all 7 white keys)
   	- **D major**: D, E, F#, G, A, B, C#
   - Majors with black keys marked as #: G, D, A, E, B, F#, C#
   - Stability order: 1 5 3 6 2 4 7 (e.g. In C major, C is most stable, and B is most unstable)
   	- Unstable notes have the tendency to move to stable notes in a pattern
    
### Music Interval
- Categories
   - Horizontal, Linear, Melodic
- Semitone
- Intervals vs. # of semitones e.g.
   - 0 semitone: Perfect unison
   - 1 semitone: Minor second
   - 2 semitones: Major second
- Inversion rules
   - # of semitones of original + inversion = 9
   - Inversion of a major interval is a minor interval
- **Perfect consonant intervals**: octaves, unison, fifths, fourth
- **Imperfect consonant intervals**: major and minor thirds, and major and minor sixths

## FL Studio Overview
### Menu Bar
#### Export music
- Mode
	- Pattern
	- Full song
- Format
	- Wave: minimal impact to original quality
	- **OGG**: no gap before start & after end
- Bitrate: higher -> better quality

#### Import Music
- All music resources can be directly dragged into panels or tracks

#### Edits
- **Undo / Redo** can be done via `EDIT` (`Ctrl + Z`) or History panel on the left
- **Copy / Paste / Move** can be done via holding `shift` and drag the pattern or `Ctrl + b`

#### Other
- `Beats per bar` and `Steps per beat` can be edited in `project settings`
- Tempo helper should be on at the beginning of beat making phase

## Playlist
- Zoom
   - Vertically: small dot button on the top right
   - Horizontally: drag the size of the moving bar
- Magnet button: adjust the closest step that a pattern auto attach to after dragging
   - `None` is not recommended
- Slide button: cut a pattern into two

## Channel Rack
### Basics
- **Kick**: usually the largest drum in the kit. Its located on the floor in front of you and you use a pedal to strike it
- **Clap**: whether it’s the recorded sound of humans hitting their hands together or a synthetic equivalent, it’s a percussive sound that cracks, sizzles and repeats throughout clubs the world over
- **Snare**: the drum that sits directly in front of you on a stand and has what are called “snares” on the underside or the “resonance” side and can be engaged and disengaged with a throw off. 
- **High hat**: A hi-hat (hihat, high-hat, etc.) is a combination of two cymbals and a pedal, all mounted on a metal stand.
- Channel Panning tune button: left ear or right ear
- Volume tune button: control volume

### Instrument Properties
- In button
- Out button
- Envelope pattern: control when would the sound come out
   - ATT tune button: will postpone the head to make the sound volume lower
- Filter
- 

## Piano Roll
### Basics
- Hold `Command` and drag to select a group of keys 
- Hold `Shift` and copy a group of keys to the next bar

### Ghost channel
If you wanna see how the other instrument was implemented in the same pattern, 'ghost channel' button can be toggled to reflect that

### Control panel
- Velocity: volume of each key
- Pan: If the sound would come from left or right

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



## Best Practices
