library(carData)
library(tidyverse)
lm(depression ~ simplicity, data = Ginzberg)

ggplot(Ginzberg, aes(simplicity, depression)) +
  geom_point()
