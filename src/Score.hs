module Score where

import Core (BPM, Beats, NoteType, Octave, Pulse, aFl, bFl, cFl, d, dFl, eFl, f, fFl, g, gFl, genNote, genRest)

bpm :: Core.BPM
bpm = 103.0

note :: Core.NoteType -> Core.Octave -> Core.Beats -> [Pulse]
note = Core.genNote bpm

rest :: Beats -> [Pulse]
rest = Core.genRest bpm

riff1 :: [Pulse]
riff1 =
  mconcat
    [ note eFl 3 (1 / 8),
      note eFl 2 (1 / 8 + 1 / 16),
      note eFl 2 (1 / 16 + 1 / 8),
      note eFl 2 (1 / 8),
      note eFl 2 (1 / 16),
      note eFl 2 (1 / 16),
      rest (1 / 8),
      note dFl 3 (1 / 16),
      note fFl 3 (1 / 16),
      note eFl 3 (1 / 8),
      note eFl 2 (1 / 8 + 1 / 16),
      note eFl 2 (1 / 8 + 1 / 16),
      note fFl 2 (1 / 8 + 1 / 16),
      note fFl 3 (1 / 8 + 1 / 16),
      note dFl 2 (1 / 8)
    ]

riff2 :: [Pulse]
riff2 =
  mconcat
    [ note eFl 3 (1 / 8),
      note eFl 2 (1 / 8 + 1 / 16),
      note eFl 2 (1 / 16 + 1 / 8),
      note eFl 2 (1 / 8),
      note eFl 2 (1 / 16),
      note eFl 2 (1 / 16),
      rest (1 / 8),
      note dFl 3 (1 / 16),
      note fFl 3 (1 / 16),
      note eFl 3 (1 / 8),
      note eFl 2 (1 / 8 + 1 / 16),
      note eFl 2 (1 / 16),
      note dFl 3 (1 / 16),
      note eFl 3 (1 / 16),
      note d 3 (1 / 16),
      note d 2 (1 / 16),
      rest (1 / 16),
      note d 2 (1 / 16),
      rest (1 / 8),
      note d 2 (1 / 16),
      rest (1 / 16)
    ]

lead1 :: [Pulse]
lead1 =
  mconcat
    [ note eFl 2 (1 / 4),
      note d 3 (1 / 4),
      note cFl 3 (1 / 4),
      note bFl 3 (1 / 4),
      note eFl 3 (1 / 4),
      note d 3 (1 / 4),
      note cFl 3 (1 / 4),
      note bFl 3 (1 / 4),
      note aFl 3 (1 / 4),
      note g 2 (1 / 2),
      rest (1 / 8),
      note dFl 3 (1 / 16),
      note fFl 3 (1 / 16),
      note eFl 3 (1 / 8),
      note eFl 2 (1 / 8 + 1 / 16),
      note eFl 2 (1 / 16),
      rest (1 / 8),
      note eFl 2 (1 / 16),
      note d 2 (1 / 8 + 1 / 16),
      note eFl 2 (1 / 16),
      note d 2 (1 / 8 + 1 / 16)
    ]

lead2 :: [Pulse]
lead2 =
  mconcat
    [ note eFl 2 (1 / 4),
      note d 3 (1 / 4),
      note cFl 3 (1 / 4),
      note bFl 3 (1 / 4),
      note eFl 3 (1 / 4),
      note d 3 (1 / 4),
      note cFl 3 (1 / 4),
      note fFl 3 (1 / 4),
      note eFl 3 (1 / 2 + 1 / 4)
    ]

doom :: [Core.Pulse]
doom =
  mconcat
    [ riff1,
      riff2,
      riff1,
      riff2,
      lead1,
      lead2
    ]

-- ----- Extras -----

riffEx1 :: [Pulse]
riffEx1 =
  mconcat
    [ note cFl 4 (1 / 8),
      note cFl 3 (1 / 8 + 1 / 16),
      note cFl 3 (1 / 8 + 1 / 16),
      note cFl 3 (1 / 8 + 1 / 16),
      note cFl 3 (1 / 8),
      note cFl 3 (1 / 16),
      note cFl 3 (1 / 8),
      note aFl 3 (1 / 8 + 1 / 16),
      note aFl 3 (1 / 8 + 1 / 16),
      note g 2 (1 / 8 + 1 / 16),
      note fFl 2 (1 / 8 + 1 / 16),
      note fFl 1 (1 / 8)
    ]

riffEx2 :: [Pulse]
riffEx2 =
  mconcat
    [ note eFl 3 (1 / 8),
      note eFl 2 (1 / 8 + 1 / 16),
      note eFl 2 (1 / 8 + 1 / 16),
      note eFl 2 (1 / 8),
      note eFl 2 (1 / 16),
      note eFl 2 (1 / 8 + 1 / 16),
      note dFl 3 (1 / 16),
      note fFl 3 (1 / 16),
      note eFl 3 (1 / 8),
      note eFl 2 (1 / 8 + 1 / 16),
      note eFl 2 (1 / 8 + 1 / 16),
      note fFl 2 (1 / 8 + 1 / 16),
      note fFl 3 (1 / 8 + 1 / 16),
      note dFl 2 (1 / 8)
    ]