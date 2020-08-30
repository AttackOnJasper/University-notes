# FL Studio

## Music Theory
- Note: a sound with a specific frequency
   - Most songs are made of 12 notes (corresponds to the **octave** in piano keys - 7 white keys & 5 black keys)
   - One octave higher means **double frequency**
- Beat
- Bar (typically 4 beats per bar)
- Tempo (BPM): Beats per minute
- Note
   - Full note takes the whole bar
   - Half note takes 2 beats

### Piano Roll
- 88 keys
- 12 keys (7 white keys and 5 black keys) are grouped together (octave). 
   - White keys range from C,D,E,F,G,A,B. 
   - Black keys range from C# (D b), D#, ... A#
- There are a total of 8 groups of keys. Range from 
   - China: A_2, C_1, C, c, c^1 (center), c^2, c^3, c^4, c^5
   - Other places: c5 is the center
   
#### Major Keys & Minor Keys
- 7 notes in a key
   - Every notes have distinct letters; after assigning a letter we would determine if a note is shape or flat
- Major pattern 
   - whole, whole, half, whole, whole, whole, half (In semitone distances: 2, 2, 1, 2, 2, 2, 1)
   - e.g.
	- **C major**: C, D, E, F, G, A, B (all 7 white keys)
   	- **D major**: D, E, F#, G, A, B, C#
   - Majors with black keys marked as #: G, D, A, E, B, F#, C#
   - Stability order: 1 5 3 6 2 4 7 (e.g. In C major, C is most stable, and B is most unstable)
   	- Unstable notes have the tendency to move to stable notes in a pattern
- - **Trap beat** typically uses **D minor**
    
### Music Interval
- Categories
   - Horizontal, Linear, Melodic
- Semitone
   - smallest distance unit between notes. All distances can be described as x semitones.
   - distance between C and C# is 1 semitone
   - the interval of 2 semitones is called a whole step / whole tone / tone
- Intervals vs. # of semitones:
   - 0 semitone: Perfect unison
   - 1 semitone: Minor second
   - 2 semitones: Major second
   - 3 semitones: Minor third
- **Perfect consonant intervals**: octaves (8th), unison (same alphabetical note), fifths, fourth
- **Imperfect consonant intervals**: major and minor thirds, and major and minor sixths
- **Augmented** vs **Diminished**
   - Check if the upper note is in the key of the lower note (i.e. lower note major)
   	- If it is in the key, then it's major or perfect
   - **Augmented** is used to describe the interval which is one semitone higher than **major / perfect** intervals
   - **Dimished** is used to describe the interval which is one semitone lower than the **perfect** intervals
   - **Minor** is used to describe the interval which is one semitone lower than the **minor** intervals
   - e.g.
      - C to G_b is **diminished fifth** (C major does not contain G_b). 
         - Note that diminished fifth is 'identical' to augmented fourth; however, we should count notes (letters) first to get the interval number before counting half steps to resolve the actual interval
      - C to G# is augmented fifth (C major does not contain G#)
- Inversion rules
   - the number of semitones of original + inversion = 9
   - Inversion of a major interval is a minor interval


### Chord
- Combination of 3 or more notes at the same time
- A chord is built based of a single note called **root**
- A **major chord** is built by adding root with the **major third** and **perfect fifth** e.g. C, F, G 
   - 4 semitones & 3 semitones apart
- A **minor chord** is built by adding root with the **minor third** and **perfect fifth** e.g. Dm, Em, Am
   - 3 semitones & 4 semitones apart
- First 6 triads of the major scale is: M, m, m, M, M, m. (In roman scale, I, ii, iii, IV, V, vi)
   - `B chord` does not belong to either major or minor, so B chord is noted as `Bdim` (`dim` stands for diminished)
- **Trap beat** typically uses triads
   
#### Chord Progression
- Chord progression rules
   - I -> any
   - ii -> V
   - iii -> vi
   - IV -> I or V
   - V -> I
   - vi -> ii
- Chord progression examples
   - 4-chord song: 
      - I, V, vi, IV
      - I -> vi -> ii -> V
      - IV -> V -> iii -> vi (-> ii -> V -> I)
   
#### Melodies
- Melody are usually built on top of chords with higher octave
   - Typically 4th and 7th notes are unstable for melody
   - Melody notes are usually in chords; ending note should be in chord
   

### Circle of Fifths
- Circle: F - C - G - D - A - E - B - G_b - D_b - A_b - E_b - B_b - F
- Interval between 2 notes are always **perfect fifth**
- Can be used for notes, chords, and keys
   - think them as notes 
      - e.g. count the A_b chord: A_b, C, E_b (from circle), G
   - think as chords
      - Fifth chord is the dominant chord (polarized from root chord)
      - sample use case: find the fifth chord
   - think as keys
      - shows what keys are similar to each other, making smoothier to transition into different keys
      - e.g. C major's key arrangement is same as G major's except the last note
      
   

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
