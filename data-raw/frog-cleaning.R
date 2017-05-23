library(rprojroot)
library(readxl)
library(tidyverse)

frogs <- read_excel(
  find_package_root_file("data-raw", "CalaverasData.xls"),
  range = cell_rows(1:3273)
)
tail(frogs)
View(tail(frogs))

frogs <- frogs %>%
  rename(
    day = Day,
    frog_type = `rent/ind/pro`,
    distance = `jump distance`,
    jump_n = `jump #`,
    distance_rel = `Relative to jump #1`,
    distance_3 = `3-jump dist`,
    distance_3_off = `measured 3-jump`,
    duration = `jump duration`,
    angle_01 = angle,
    angle_00 = X__1,
    angle_10 = X__2,
    velocity_01 = Vel,
    velocity_00 = X__3,
    velocity_10 = X__4
  )

use_data(frogs, overwrite = TRUE)
## `jump distance`
## Jump Distance (cm) - the measured jump distance, as described in the paper.
## Maybe be zero for jumps 2 and 3 if the frog only jumped once.

# `jump duration`
# Jump Duration (s) - the duration of the jump determined by number of frames
# and camera framerate. Maybe be zero for jumps 2 and 3 if the frog only jumped
# once.

# `3-jump dist`
# 3-jump distance - the linear distance from the starting point to the end of
# the 3rd jump, which is the metric used by the contest, calculated from our
# data.  Only present if 3 or more jumps in a sequence occurred

# `jump #`
# Jump Number - the first, second, third etc. jump of a sequence.  Note that
# jockeys ceased pursuing the frog after the 3rd jump, though frogs sometimes
# jumped more.

# `rent/ind/pro`
# Rent/Ind/Pro - 1 denotes a "rental frog" (fairgoers paid to "rent" a frog from
# a common pool to compete), 2 is an individual who brought their own frog, 3 is
# an organized "professional" team, and -1 is unknown.

df %>% head() %>% select(-(1:5))

# `measured 3-jump`
# Measured - the 3-jump distance measurement announced by the "stickmen" judging
# the contest. -1 was not announced or could not be heard clearly on the audio.

# `Relative to jump #1`
# Relative to jump 1 - the distance of each jump divided by the 1st (to examine
# fatigue effects)

# Day
# Day - the day of the contest.  Day 3 was divided into morning (labeled 3) and
# the finals (3.5)

df %>% head() %>% select(-(1:8))
# angle     X__1     X__2
# Vel     X__3     X__4
# Angle & Velocity - calculated jump angle and velocity as described in the
# paper.  Because jump duration could only be measured in the integer number of
# video frames, the following two columns after each are the angles and
# velocities for +1 and -1 frame of the actual duration.
