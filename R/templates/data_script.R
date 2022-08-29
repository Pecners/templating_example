library(dplyr)

sub_dir <- "SUBDIR_VAR"

df <- mtcars |> 
  group_by(cyl) |> 
  summarise(avg_disp = mean(disp))

saveRDS(df, paste0(sub_dir, "avg.rda"), collapse = "/")
