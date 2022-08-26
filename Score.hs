module Score where

import Core (BPM, Pulse, a, b, c, d, e, f, g, genNote)

bpm :: Core.BPM
bpm = 120.0

note = Core.genNote bpm

simple :: [Core.Pulse]
simple =
  mconcat
    [ note a 4 4,
      note a 4 4,
      note a 4 4,
      note a 4 4,
      note b 4 4,
      note b 4 4,
      note b 4 4,
      note b 4 4,
      note c 4 4,
      note c 4 4,
      note c 4 4,
      note c 4 4,
      note d 4 4,
      note d 4 4,
      note d 4 4,
      note d 4 4,
      note e 4 4,
      note e 4 4,
      note e 4 4,
      note e 4 4,
      note f 4 4,
      note f 4 4,
      note f 4 4,
      note f 4 4,
      note g 4 4,
      note g 4 4,
      note g 4 4,
      note g 4 4,
      note a 5 4,
      note a 5 4,
      note a 5 4,
      note a 5 4,
      note a 3 1
    ]
