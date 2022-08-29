library(ggplot2)

# SUBDIR_VAR will be replaced
data <- readRDS("SUBDIR_VAR/avg.rda")

data |> 
  ggplot(aes(cyl, avg_disp)) +
  geom_col()
