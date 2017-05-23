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
    angle_00 = X__2,
    angle_01 = angle,
    angle_10 = X__1,
    velocity_00 = X__4,
    velocity_01 = Vel,
    velocity_10 = X__3
  ) %>%
  mutate(
    row = seq_len(nrow(.))
  ) %>%
  select(row, everything())

use_data(frogs, overwrite = TRUE)
