library(tidyverse)

heart_disease <- kmed::heart
heart_disease$disease <- factor(ifelse(heart_disease$class == 0, "no", "yes")) 
heart_disease$sex <- ifelse(heart_disease$sex == T, "Male", "Female") |> factor()
heart_disease$cp <- ifelse(heart_disease$cp == 1, "Typical Angina",
                           ifelse(heart_disease$cp == 2, "Atypical Angina", 
                                  ifelse(heart_disease$cp == 3, "Non-anginal Pain", "Asymptomatic"))) |> factor()
heart_disease$fbs <- ifelse(heart_disease$fbs == T, "Fasting Blood Sugar >120" , "Fasting Blood Sugar <= 120") |> factor()
heart_disease$restecg <- ifelse(heart_disease$restecg == 0, "Normal",
                                ifelse(heart_disease$restecg == 1, "ST-T wave Abnormality", "Left Ventricular Hypertrophy")) |> 
                          factor()
heart_disease$slope <- ifelse(heart_disease$slope == 1, "Positive Slope",
                              ifelse(heart_disease$slope == 2, "Zero Slope", "Negative Slope")) |> 
                              factor()
heart_disease$thal <- ifelse(heart_disease$thal==3, "Normal",
                             ifelse(heart_disease$thal == 6, "Fixed Defect", "Reversible Defect")) |> factor()

heart_disease |> 
  ggplot(aes(age, chol, color = cp)) +
    geom_line()



heartdf = tibble(
  t = seq(0, 4*pi, pi/60),
  x = (16*sin(t)^3)/3,
  y = 13*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t)
)





p1 <- heart_disease |> 
  ggplot() +
    geom_line(aes(x = age, y =  chol, color = cp)) +
    geom_polygon(data = heartdf, aes(5*x+55, 8*y+275, group = 1), fill = "red", alpha = 0.2) +
    theme_bw() +
    ylab("Cholesterol") +
    ylim(c(100,400)) +
    xlab("Year") +
    theme(
      legend.position="none",
      legend.title = element_blank(),
      panel.background = element_rect(fill='transparent'), #transparent panel bg
      plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
      panel.grid.major = element_blank(), #remove major gridlines
      panel.grid.minor = element_blank(), #remove minor gridlines
      legend.background = element_rect(fill='transparent'), #transparent legend bg
      legend.box.background = element_rect(fill='transparent') #transparent legend panel
    )

ggsave('lectures/img/heart_df.png', p1, bg='transparent')
#+
#    scale_x_continuous(breaks = c(2010, 2014, 2018, 2022))

