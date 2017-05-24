#' Frog jump data
#'
#' Data from the Calaveras Jumping Frog Jubilee, as collected for this paper by
#' Astley et al (proper citation coming, on an airplane!): Chasing maximal
#' performance: a cautionary tale from the celebrated jumping frogs of Calaveras
#' County
#'

#' * **day** The day of the contest.  Day 3 was divided into morning (labeled 3)
#' and the finals (3.5)

#' * **frog_type** factor. "rental" = fairgoers paid to rent a frog from a
#' common pool to compete, "individual" is a person who brought their own frog,
#' "pro" is a frog run by an organized "professional" team. The type of the
#' remaining frogs is "unknown".

#' * **distance** Jump Distance (cm) - the measured jump distance, as described
#' in the paper. Maybe be zero for jumps 2 and 3 if the frog only jumped once.

#' * **jump_n** The first, second, third etc. jump of a sequence.  Note that
#' jockeys ceased pursuing the frog after the 3rd jump, though frogs sometimes
#' jumped more.

#' * **distance_rel** The distance of each jump divided by the 1st (to examine
#' fatigue effects)

#' * **distance_3** The linear distance from the starting point to the end of
#' the 3rd jump, which is the metric used by the contest, calculated from our
#' data.  Only present if 3 or more jumps in a sequence occurred

#' * **distance_3_off** The 3-jump distance measurement announced by the
#' "stickmen" judging the contest. -1 was not announced or could not be heard
#' clearly on the audio.

#' * **duration** The duration (s) of the jump determined by number of frames
# and camera framerate. Maybe be zero for jumps 2 and 3 if the frog only jumped
# once.

#' * **angle_00, angle_01, angle_11 and velocity_00, velocity_01, velocity_11**
#' Calculated jump angle and velocity as described in the paper.  Because jump
#' duration could only be measured in the integer number of video frames, the
#' variables reflect the angles and velocities for three adjacent frames (JB:
#' I'm not sure I understand the annotation here -- CHECK WITH ASTLEY).
#'
#' @source http://jeb.biologists.org/content/216/21/3947
#' @importFrom tibble tibble
#' @examples
#' str(frogs)
#' head(frogs)
"frogs"
