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
heart_disease |> glimpse()
library(broom)
xglm1 <- glm(disease ~ thal, data = heart_disease, family = binomial())
xlm1 <- lm(body_mass ~ species, data = penguins)
emmeans(xglm1, ~thal, type = "response")
emmeans(xlm1, ~species)

ndf <- data.frame(thal = levels(heart_disease$thal))
predict(xglm1, ndf)
