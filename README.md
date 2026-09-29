# APM1205 – Formative Assessment 4

## Dummy-Variable Regression Using the `diamonds` Dataset

### Submission files
- `README.md`
- `FA4_Dummy_Regression.R`
- `FA4_Dummy_Regression.pdf`
- `figures/diamond_price_vs_carat_by_cut.png`

### Dataset
The analysis uses the `ggplot2::diamonds` dataset: 53,940 observations and 10 variables.

### Reference category
`Ideal` is the reference category. The `cut` variable is explicitly converted to a regular factor with `Ideal` as the first level so that the fitted model uses treatment/dummy coding required by the assessment.

### Additive model
Ŷ = -2074.546 + 7871.082(carat) - 1800.924D_Fair - 680.592D_Good - 290.789D_VeryGood - 361.847D_Premium

R² = 0.856

### Interaction test
Incremental F-test: F(4, 53930) = 247.735, p = 2.893e-211.

At α = 0.05, the interaction is statistically significant, so the effect of carat on price differs among cut categories.

### Reproducibility
Run `FA4_Dummy_Regression.R` in R/RStudio. The script loads the built-in `ggplot2` dataset, applies the stated reference coding, fits both models, performs the nested-model ANOVA, and saves the required figure.
