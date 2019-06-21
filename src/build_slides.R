library(pagedown)
library(tools)

input_dir  <- "."
output_dir <- "./slides"

# 1. Take all .Rmd files from `input_dir`
# 2. Convert them to PDF using `chrome_print()`
# 3. Move them to `output_dir`
for (file in list.files(path = input_dir, pattern = ".Rmd", recursive = TRUE)) {
  input  <- file.path(input_dir, file)
  output <- paste0(file_path_sans_ext(input), ".pdf")
  target <- file.path(output_dir, paste0(file_path_sans_ext(basename(file)), ".pdf"))
  
  if (!file.exists(target)) {
    pagedown::chrome_print(input)
    file.copy(output, output_dir)
    file.remove(output)
  }
}