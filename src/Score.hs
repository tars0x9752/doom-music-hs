module Score where

-- E-flat Phrygian mode: aFl, bFl, cFl, dFl, eFl, fFl, gFl
-- d is temporal note
import Core (BPM, Pulse, aFl, bFl, cFl, d, dFl, eFl, fFl, gFl, genNote)

bpm :: Core.BPM
bpm = 103.0

note = Core.genNote bpm

riff1 :: [Pulse]
riff1 =
  mconcat
    [ note eFl 4 (1 / 8),
      note eFl 3 (1 / 8 + 1 / 16),
      note eFl 3 (1 / 8 + 1 / 16),
      note eFl 3 (1 / 8),
      note eFl 3 (1 / 16),
      note eFl 3 (1 / 8 + 1 / 16),
      note dFl 4 (1 / 16),
      note fFl 4 (1 / 16),
      note eFl 4 (1 / 8),
      note eFl 3 (1 / 8 + 1 / 16),
      note eFl 3 (1 / 8 + 1 / 16),
      note fFl 3 (1 / 8 + 1 / 16),
      note fFl 4 (1 / 8 + 1 / 16),
      note dFl 3 (1 / 8)
    ]

riff2 :: [Pulse]
riff2 =
  mconcat
    [ note eFl 4 (1 / 8),
      note eFl 3 (1 / 8 + 1 / 16),
      note eFl 3 (1 / 8 + 1 / 16),
      note eFl 3 (1 / 8),
      note eFl 3 (1 / 16),
      note eFl 3 (1 / 8 + 1 / 16),
      note dFl 4 (1 / 16),
      note fFl 4 (1 / 16),
      note eFl 4 (1 / 8),
      note eFl 3 (1 / 8 + 1 / 16),
      note eFl 3 (1 / 16),
      note dFl 4 (1 / 16),
      note eFl 4 (1 / 16),
      note d 4 (1 / 16),
      note d 3 (1 / 8),
      note d 3 (1 / 16),
      note d 3 (1 / 16),
      note d 3 (1 / 8 + 1 / 16)
    ]

doom :: [Core.Pulse]
doom =
  mconcat
    [ riff1,
      riff2
    ]
