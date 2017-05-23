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

## Need to create a frog id variable. Does the data look like it comes in
## series of jumps for one frog, i.e. 1-2-3, 1-2-3, 1-2, 1-2-3-4-5, etc.?

frogs %>%
  count(jump_n)

jumps <- frogs %>%
  select(row, jump_n) %>%
  mutate(
    nxt = lead(jump_n),
    diff = nxt - jump_n,
    series_end = nxt == 1,
    huh = diff < 0 & !series_end
  )

jumps %>%
  count(huh)
## good news: there are only 6 places where jump_n goes down and the next
## element is not 1

inspect_me <-
  which(jumps$huh | is.na(jumps$huh)) %>%
  map(~ .x + (-2:2)) %>%
  flatten_int()
jumps %>% slice(inspect_me) %>% print(n = Inf)

## the last one is simply end of the dataset
## so we have 5 jump series that start with something other than 1

