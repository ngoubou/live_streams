

# je souhaite analyser un jeu de données provenant de tidytuesday (https://github.com/rfordatascience/tidytuesday)
# en utilisant les principes du tidyverse


# charger les librairies
library(tidyverse)
library(ggthemes)
getwd()

tuition <- readxl::read_xlsx("tuition.xlsx")

tuition
glimpse(tuition)

# le jeu de données porte (a priori) sur les frais moyens de scolarité aux US par état
summary(tuition)
View(tuition)

# pivoter les données d'un format large à un format long
tuition1 <- tuition %>%
  pivot_longer(!State, names_to = "year", values_to = "tuition")

View(tuition1)


## EXPLORATION DONNÉES

# graphique des 3 états les plus peuplés + Vermont et New Hampshire
# évolution des frais de scolarité
tuition1 %>%
  filter(State == "Texas" | State == "California" | State == "Florida"| State == "Vermont" | State == "New Hampshire") %>%
  ggplot(aes(year, tuition, group = State, color = State)) +
  geom_line() +
  theme_economist() +
  scale_colour_tableau() +
  ggtitle("Évolution des frais de scolarité de 2004 à 2016")

# Vermont et New Hampshire tuitions
tuition1 %>%
  filter(State == "Vermont" | State == "New Hampshire") %>%
  ggplot(aes(year, tuition, group = State, color = State)) +
  geom_line()

# tuition distribution
tuition1 %>%
  group_by(State) %>%
  summarise(mean_tuition = mean(tuition)) %>%
  ggplot(aes(mean_tuition)) +
  geom_histogram(bins = 10)
