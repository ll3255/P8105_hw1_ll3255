##############
# Laura Lynch
# p8105_hw1_problem1
# 2019-09-16
##############

library(tidyverse)

#create a data frame#
hw1_df = tibble(
  prob1_samp = rnorm(8),
  prob1_positive = prob1_samp > 0,
  prob1_logic = prob1_positive > 0,
  prob1_char = c("one", "two", "three", "four", "five", "six", "seven", "eight"), 
  prob1_factor = factor(prob1_char, levels = c("low", "moderate", "high")),
)

#take the mean of each variable in the data frame#
mean(pull(hw1_df, prob1_samp))

#coersion code chunk 
coerce_log_num = as.numeric(pull(hw1_df, prob1_logic))
coerce_char_num = as.numeric(pull(hw1_df, prob1_char))
coerce_fac_num = as.numeric(pull(hw1_df, prob1_factor))

#further data manipulations
coerce_log_num*prob1_samp

coerce_log_fac = as.factor(pull(hw1_df, prob1_logic))
coerce_log_fac*prob1_samp

coerce_log_fac_num = as.numeric(pull(hw1_df, coerce_log_fac)) 
coerce_log_fac_num*prob1_samp

#second code chunk
prob2_df = tibble(
  x = rnorm(500),
  y = rnorm(500),
  prob2_logic = x + y > 1,
  log_to_num = as.numeric(pull(prob2_df, prob2_logic)),
  log_to_fac = as.factor(pull(prob2_df, prob2_logic))
)

#create a scatter plot
ggplot(prob2_df, aes(x = x, y = y)) + geom_point(prob2_logic)

rm(list=ls())

