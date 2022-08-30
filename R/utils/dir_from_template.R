# file R/utils/dir_from_template.R

# Functions starting with '.' won't show up in the environment window
# but will be available in Global Env
.dir_from_template <- function(new_dir_name, open_editor = TRUE) {
  new_dir <- glue::glue("R/{new_dir_name}")
  if (!dir.exists(new_dir)) {
    dir.create(new_dir)
  } else {
    stop(glue::glue("The directory {new_dir} already exists!"))
  }
  
  # This points to the location of the template files
  files <- list.files("R/templates")
  
  # Write each file to new dir, replacing values in the process
  for (f in files) {
    new_file <- glue::glue("{new_dir}/{f}")
    file.create(new_file)
    readLines(glue::glue("R/templates/{f}")) |> 
      # replace value here 
      gsub("SUBDIR_VAR", new_dir_name, x = _) |> 
      writeLines(text = _, con = new_file)
    
    # This will open a specified file in the editor pane
    if (open_editor) {
      file.edit(new_file)
    }
  }
}

# Test the function with this
# .dir_from_template("test_dir")


# Helpful message to be displayed on project load to notify user
# that this function is available

cat("Use `.dir_from_template()` to create a new directory.\n")
