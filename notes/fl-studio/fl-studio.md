# FL Studio

## FL Studio Overview
- FL Studio is a full-featured music production environment capable of multi-track audio recording, sequencing and mixing for the creation of professional quality music tracks. 
- DAW (Digital Audio Workstation) 
- UI sections
   - Channel Rack
   - Playlist
   - Piano Roll
   - Mixer
   - Browser

### Terminologies
- VST (Virtual Studio Technology): an audio plug-in software interface that integrates software synthesizers and effects units into digital audio workstations
- MIDI (Musical Instrument Digital Interface): a technical standard that describes a communications protocol, digital interface, and electrical connectors that connect a wide variety of electronic musical instruments, computers, and related audio devices for playing, editing and recording music.


### Menu Bar
#### Export music
- Mode
   - Pattern
   - Full song
- Format
   - Wave: minimal impact to original quality
   - **OGG**: no gap before start & after end
- Bit rate: higher -> better quality

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
- Knobs value can be changed by dragging up or down
   - Most knobs and sliders can be linked to external/internal controllers
- Slide button: cut a pattern into two





## Music Theory
- Beat
   - beat is the basic unit of time, the pulse (regularly repeating event), of the mensural level
   - Strong / weak beat (i.e. on beat / off beat 强拍 弱拍 up beat / down beat)
      - e.g. In 44 meter, 
         - classical music beat pattern: strong weak strong weak | strong weak strong weak
         - Jazz music beat pattern: WSWS | WSWS
            - typically because of drum set (kick and snare)
- Note (音符): a sound with a specific frequency (pitch)
   - Note length: (assume 4 beats per bar i.e. quadruple meter, Common Time, and each beat is a 4th note)
      - Full (Whole) note ('o'): 4 beats
      - Half note (circle and line): 2 beats 
      - 4th note（4分音符; filled circle and line）: takes 1 beat
      - 8th note: 0.5 beat
      - 16th note: 0.25 beat
      - triplet 8th notes: 1 beat
   - Most songs are made of one **octave** (or 12 notes) 
      - in piano keys - 7 white keys & 5 black keys
      - The octave is not divided by 8 in general, it's divided into 12.
- Bar (小节 typically 4 beats per bar)
   - A group of beats
   - Meter (2 numbers representing the number of beats and beat types in a bar)
      - Numerator specifies number of beats per bar (e.g. duple, triple, quadruple)
      - Denominator specifies the beat type
      - e.g. 44 meter: Each beat is a 4th note, 4 beats per bar
      - e.g. 34 meter: Each beat is a 4th note, 3 beats per bar (pattern: strong weak weak | strong weak weak)
      - Simple vs Compound
         - Simple: Powers of 2
         - Compound: Powers of 3 for numerator. e.g. 68 meter
   - Why 4 is the most common?
      - 4 is the number of completion.
      - Verse usually has 16 bars (4 * 4)
      - Hook usually has 8 bars (4 * 2)
- Octave（八度）
   - The interval between (in including) 2 notes, one having twice or half the frequency of vibration of the other 
   - i.e. One octave higher means double frequency
   - e.g. A B C D E F G A - 440 Hz, 440 * 1.0595 Hz, 440 * 1.0595^2 Hz, 440 * 1.0595^3 Hz
- Beams
   - Groups of notes
- Stave (aka Staff, 五线谱)
   - Introduced in 16th century
   - A is between middle line and the line below it 
   - Clefs
      1. The treble clef (or G clef)
      1. The bass clef (very common)
      1. Alto clef (common for viola or alto)
      1. Tenor clef (common for cello)
   - Middle C: 
      - It's called middle C because it is 
         - one ledger line below the lowest line in treble clef
         - one ledger line above the highest line in bass clef 
   - Memorization
      - On line notes are E G B D F (every good boy deserves food)
      - Off line notes are F A C E (face)
- Tempo (BPM): Beats per minute
- Anacrusis
   - Pickup notes (at the beginning)
   - Analogy to 弱起
- Phrase
   - A group of bars in melody; typically 4 bars
- Structure
   - Motif: short musical statements
   - Notes -> songs
      - Notes -> Beats -> Bars -> Phrases -> Period (Phrase groups) / Melodies -> Sections -> Song / movements
- Forms
   - Binary form: AB
   - Ternary (prime) form: ABA / ABA' (A' is modified A)
      - e.g. Sonata
   - Rondo form: ABACA
   - 12 Bar blue form

### Piano Roll
- 88 keys
- 12 keys (7 white keys and 5 black keys) are grouped together (octave). 
   - White keys range from C,D,E,F,G,A,B. 
   - Black keys range from C# (D b), D#, ... A#
- There are a total of 8 groups of keys. Range from 
   - China: $$ A_2, C_1, C, c, c^1 (center), c^2, c^3, c^4, c^5 $$
   - Other places: c5 is the center

### Music Interval
- Categories
   - Horizontal, Linear, Melodic
- Can be measured from the stave
   - e.g.
      1. G - A: second
      1. C - E: third
      1. C - C: octave
- Semitone
   - smallest distance unit between notes. All distances can be described as x semitones.
   - e.g. the distance between C and C# is 1 semitone
   - the interval of 2 semitones is called a whole step / whole tone / tone
- Intervals vs. # of semitones:
   - 0 semitone: Perfect unison (i.e. 2 notes having the same pitch)
   - 1 semitone: Minor second
   - 2 semitones: Major second
   - 3 semitones: Minor third
   - 4 semitones: Major third

### Scales (Major Keys & Minor Keys)
- Key
   1. refers to the way in which we perceive the hierarchy of notes and chords. It specifies the home note and modality also
- 7 notes in a key
   - Every notes have distinct letters; after assigning a letter we would determine if a note is shape or flat
- Major pattern (major scale)
   - Pattern: whole, whole, half, whole, whole, whole, half (In semitone distances: 2, 2, 1, 2, 2, 2, 1 - i.e. TTSTTTS, where T is for tone, S is for semitone)
   - e.g.
      - **C major**: C, D, E, F, G, A, B (all 7 white keys - semitone between B and C, E and F thus there's no black keys in between)
         - C is the tonic (key - will have the feeling of completeness, returning to base / ground / home)
      - **D major**: D, E, F#, G, A, B, C#
   - Majors with black keys marked as #:
      - e.g. G major: G, D, A, E, B, F#, C#
   - Stability order: 1 5 3 6 2 4 7 (e.g. In C major, C is most stable, and B is most unstable)
   	- Unstable notes have the tendency to move to stable notes in a pattern
- Minor pattern (scale)
   1. natural minor scale (also a diatonic scale)
      - Pattern: 2, 1, 2, 2, 1, 2, 2 (TSTTSTT)
      - e.g. **A minor**
   1. Harmonic minor scale
      - Raise the 6th and 7th degree when ascending, same as natural minor scale in descending
         - i.e. Ascending: TSTTTTS
   1. Melodic minor scale 
      - Raise the 7th degree both ascending and descending
      - Pattern: 2, 1, 2, 2, 1, 3, 1
- **Trap beat** typically uses **D minor**
- Diatonic Scale
   - A musical scale (as a major or minor scale) comprising intervals of 5 whole steps and 2 half steps
- Degrees
   - Tonic (key): 1st degree of the scale 
   - Subdominant: the fourth tonal degree (scale degree 4) of the diatonic scale
   - Dominant: the fifth scale degree of either a major scale or a minor scale
   - Leading note: 7th degree
- Starting from different notes other than C on C major
   1. Starting from the 2nd note D on C major. i.e. DEFGABC
      - Dorian mode
      - Pattern: 2, 1, 2, 2, 2, 1, 2
   1. Starting from the 3rd note E on C major 
      - Phyrgian mode
   1. Starting from F -> Lydian mode
   1. Starting from G -> Mixolydian mode
   1. Startomg from A -> Aeolian mode (Natural Minor scale)
   1. B -> Locrian mode
- Key Signature
   - Tells the tonic or the key
   - Circle of fifths help memorize the specific key signatures

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
      - can help for recognizing key signatures
         - e.g. 1 sharp - F# (G major), 2 sharps - F# C# (D major), 3 sharps - F# C# G# (A major)
         - Reversed order for flat key signatures
            - e.g. 1 flat - B_b (F major / D Minor), 2 flats - B_b, E_b (B_b major / G Minor), 3 flats - B_b, E_b, A_b (E_b major) 

### Consonant intervals (Interval Quality)
- **Perfect consonant intervals**: octaves (8th), unison (same alphabetical note), fifths, fourth
   - Fifths 
      - Perfect fifths: 7 semitone difference
         - e.g. C & G, A & E
- **Imperfect consonant intervals**: major and minor thirds, and major and minor sixths
   - Major thirds: 4 semitones
      - e.g. C & E 
- Pattern of intervals on any major scales (Describes the quality of intervals)
   - Perfect uison, Major 2nd, Major 3rd, Perfect 4th, Perfect 5th, Major 6th, Major 7th, Perfect 8ve
- Pattern of intervals on natural minor scales
   - Perfect uison, Major 2nd, Minor 3rd, Perfect 4th, Perfect 5th, Minor 6th, Minor 7th, Perfect 8ve
- Qualities of intervals other than perfect / major
   - **Augmented** describes the interval which is one semitone higher than **major / perfect** intervals
   - **Diminished** describes the interval which is one semitone lower than the **perfect / minor** intervals
   - **Major** describes the interval which is one semitone higher than the **minor** intervals
   - **Minor** describes the interval which is one semitone lower than the **major** intervals
- To check the quality of the interval, check if the upper note is in the major key of the lower note (i.e. treat the lower note as the tonic of the major scale)
   - If it is in the key, then it's a major or perfect (depending on the numeric interval e.g. 3rd - major; 4th - perfect)
   - Otherwise, check how many semitones between the upper note and the note on the major key
   - e.g.
      - C to G_b is **diminished fifth** (Checked that C major does not contain G_b). 
         - Note that diminished fifth is 'identical' to augmented fourth; however, we should count notes (letters) first to get the interval number before counting half steps to resolve the actual interval
      - C to G# is augmented fifth (C major does not contain G#)
- Inversion rules
   - the number of semitones of original + inversion = 9
   - Inversion of a major interval is a minor interval


### Chord
- Combination of 3 or more notes at the same time
   - Combination of 3 is called a triad
- A chord is built based of a single note called **root**
- A **major chord** is built by adding root with the **major third** and **perfect fifth** e.g. C, F, G 
   - 4 semitones & 3 semitones apart
- A **minor chord** is built by adding root with the **minor third** and **perfect fifth** e.g. Dm, Em, Am
   - 3 semitones & 4 semitones apart
- First 6 triads of the major scale is: M, m, m, M, M, m. (In roman scale, I, ii, iii, IV, V, vi)
   - `B chord` does not belong to either major or minor, so B chord is noted as `Bdim` (`dim` stands for diminished)
- **Trap beat** typically uses triads
   
#### Popular Chords
- C major (tonic triad), F major (Subdominant) G major (Dominant)


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



## Piano Roll
### Basics
- Hold `Command` and drag to select a group of keys 
- Hold `Shift` and copy a group of keys to the next bar
- `Fn` + `delete` to remove all selected notes 

### Ghost channel
If you wanna see how the other instrument was implemented in the same pattern, 'ghost channel' button can be toggled to reflect that

### Control panel
- Velocity: volume of each key
- Pan: If the sound would come from left or right




## Midi settings
### General midi settings
- Options -> Midi settings

### Drum Mapping 
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

## Audio Recording
- Playlist -> select a track -> right click -> track mode -> audio track
- In Mixer, select input source and disable the hear back in **Master** track
- Turn on 'Recording' and click 'Play' to start

## Plugins
- Press 'F8' opens 'plugin picker'


## Best Practices
### Audio
