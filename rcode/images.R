library(tidyverse)
library(palmerpenguins)

p <- ggplot(penguins, aes(x = flipper_length_mm, fill = species)) +
  geom_density(alpha = 0.5) +
  theme_bw() +
  theme(legend.position = "none") +
  labs(
    x = "Flipper Length",
    alt = "A density plot showing the distribution of flipper length by different species."
  )

ggsave(p, filename = "posts/img/num.png", height = 2, width = 3)

p <- ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar() +
  theme_bw() +
  labs(
    x = "Island",
    alt = "A stacked bar plot showing the count by island and species of penguins."
  ) +
  theme(legend.position = "none")

ggsave(p, filename = "posts/img/cat.png", height = 2, width = 3)


p <- ggplot(
  penguins,
  aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point() +
  stat_smooth(method = "lm") +
  theme_bw() +
  xlab("FLipper Length") +
  ylab("Body Mass") +
  labs(
    alt = "A scatter plot between Flipper Length and Body Mass. 
              The scatter plot is color coded by species and displays a trend line for each group. 
              There is a positive trend for each group."
  ) +
  theme(legend.position = "none")

ggsave(filename = "posts/img/linear.png", height = 2, width = 3)

library(MASS)
Melanoma$dead <- ifelse(Melanoma$status == 1, 1, 0)

p <- ggplot(Melanoma, aes(thickness, dead)) +
  geom_point(alpha = 0.7) +
  labs(
    x = "Tumor thickness (mm)",
    y = "Dead (1=yes, 0=no)",
    alt = "A scatter plot showing between Tumor thickness and Death Status. A logistic line is overlayed in the plot."
  ) +
  stat_smooth(
    method = "glm",
    se = F,
    method.args = list(family = "binomial"),
    color = "blue"
  ) +
  theme_bw()
ggsave(filename = "posts/img/logistic.png", height = 2, width = 3)
