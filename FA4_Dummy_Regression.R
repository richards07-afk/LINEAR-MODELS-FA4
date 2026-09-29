# APM1205 – Applied Regression Analysis
# Formative Assessment 4
# Dummy-Variable Regression Using the diamonds Dataset

# Install once if necessary:
# install.packages("ggplot2")

library(ggplot2)

# -----------------------------
# Part A: Exploring and Preparing the Data
# -----------------------------
data(diamonds)

head(diamonds)
str(diamonds)
summary(diamonds)

# The ggplot2 diamonds dataset stores cut as an ordered factor.
# For this assessment, use treatment/dummy coding and select Ideal
# as the reference category.
diamonds$cut <- factor(
  diamonds$cut,
  levels = c("Ideal", "Fair", "Good", "Very Good", "Premium")
)

# Verify the reference level and treatment contrasts:
levels(diamonds$cut)
contrasts(diamonds$cut)

# -----------------------------
# Part B: Constructing Dummy Variables
# -----------------------------
dummy_table <- data.frame(
  Cut = c("Fair", "Good", "Very Good", "Premium", "Ideal"),
  D_Fair = c(1, 0, 0, 0, 0),
  D_Good = c(0, 1, 0, 0, 0),
  D_VeryGood = c(0, 0, 1, 0, 0),
  D_Premium = c(0, 0, 0, 1, 0)
)
dummy_table

# -----------------------------
# Part C: Additive Dummy-Variable Regression
# -----------------------------
model1 <- lm(price ~ carat + cut, data = diamonds)
summary(model1)

# -----------------------------
# Part D: Interaction Between Carat and Cut
# -----------------------------
model2 <- lm(price ~ carat * cut, data = diamonds)
summary(model2)

# Incremental F-test / nested-model ANOVA
anova(model1, model2)

# -----------------------------
# Part E: Visualization
# -----------------------------
p <- ggplot(diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point(alpha = 0.3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Diamond Price versus Carat by Cut",
    x = "Carat",
    y = "Price (US Dollars)"
  )

p

ggsave(
  filename = "diamond_price_vs_carat_by_cut.png",
  plot = p,
  width = 9,
  height = 6,
  dpi = 300
)
