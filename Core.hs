module Core where

type Pulse = Float

type Seconds = Float

type Samples = Float

type Hz = Float

type Semitones = Float

type BPM = Float

type Beats = Float

outputFilePath :: FilePath
outputFilePath = "output.bin"

volume :: Float
volume = 0.2

sampleRate :: Samples
sampleRate = 48000.0

pitchStandard :: Hz
pitchStandard = 440.0

beatDuration :: Beats -> Seconds
beatDuration bpm = 60.0 / bpm

freq :: Hz -> Seconds -> [Pulse]
freq hz duration =
  map (* volume) $ zipWith3 (\x y z -> x * y * z) release attack output
  where
    step = (hz * 2 * pi) / sampleRate

    attack :: [Pulse]
    attack = map (min 1.0) [0.0, 0.001 ..]

    release :: [Pulse]
    release = reverse $ take (length output) attack

    sine x = sin (x * step)

    waveForm x = sin (sine x)

    output :: [Pulse]
    output = map waveForm [0.0 .. sampleRate * duration]

genNoteSemitone :: NoteType -> Semitones
genNoteSemitone (N name) = case name of
  A -> 0.0
  B -> 2.0
  C -> 3.0
  D -> 5.0
  E -> 7.0
  F -> 8.0
  G -> 10.0
genNoteSemitone (NN name sign) =
  let base = genNoteSemitone (N name)
   in case sign of
        Sh -> base + 1.0
        Fl -> base - 1.0

type Octave = Float

genNote :: BPM -> NoteType -> Octave -> Beats -> [Pulse]
genNote bpm n octave beats = freq (calcNoteFreq semitone) (beatDuration bpm / beats)
  where
    semitone = genNoteSemitone n + (octave - 4) * 12
    -- NOTE: https://pages.mtu.edu/~suits/NoteFreqCalcs.html
    calcNoteFreq :: Semitones -> Hz
    calcNoteFreq s = pitchStandard * (2 ** (1.0 / 12.0)) ** s

data NoteName = A | B | C | D | E | F | G

data NoteSign = Sh | Fl -- Sh: Sharp, Fl: Flat

data NoteType = N NoteName | NN NoteName NoteSign

a :: NoteType
a = N A

aSh :: NoteType
aSh = NN A Sh

aFl :: NoteType
aFl = NN A Fl

b :: NoteType
b = N B

bSh :: NoteType
bSh = NN B Sh

bFl :: NoteType
bFl = NN B Fl

c :: NoteType
c = N C

cSh :: NoteType
cSh = NN C Sh

cFl :: NoteType
cFl = NN C Fl

d :: NoteType
d = N D

dSh :: NoteType
dSh = NN D Sh

dFl :: NoteType
dFl = NN D Fl

e :: NoteType
e = N E

eSh :: NoteType
eSh = NN E Sh

eFl :: NoteType
eFl = NN E Fl

f :: NoteType
f = N F

fSh :: NoteType
fSh = NN F Sh

fFl :: NoteType
fFl = NN F Fl

g :: NoteType
g = N G

gSh :: NoteType
gSh = NN G Sh

gFl :: NoteType
gFl = NN G Fl