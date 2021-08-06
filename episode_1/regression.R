
library(tidyverse)

police <- read_csv("Data_Scientist_Path/CNAM/semestre_2/sta101_analyse_donnees/projet_final/data/pca_data.csv")

police
glimpse(police)

table(police$regions)

# predict total death using a few predictors

# I want to apply what i learned in my regression courses (STA102 + STAT501 esp)

# are there any differences in total death by region?
  
police %>%
  ggplot(aes(regions, total_death, fill = regions)) +
  geom_boxplot(outlier.colour = "#D62728") +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "black") 

# there seems to be some differences in total death by region
# However we want to know if these differences are statistical significant
# we conduc an anova in order to do so
# anova has to respect some hypotheses
# normality is one of them
police %>%
  filter(regions == "Midwest") %>%
  ggplot(aes(total_death)) +
  geom_bar()
  geom_histogram(bins = 9) 
  scale_x_log10()
# the normality hypothesis doesnt seem to be true. conduct a normality test

# identify outliers
police %>%
  group_by(regions) %>%
  rstatix::identify_outliers(total_death) %>%
  select(regions, state, total_death, is.outlier, is.extreme)


# before doing so, we want to explore the difference between practical significance and statistical significance,
# and also define what an effect size is

lm()


# Magic criteria
# effect size
# easy stats package
# 6.4 practical significance
