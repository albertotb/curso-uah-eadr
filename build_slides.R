library(pagedown)
library(tools)

input_dir  <- c("./src", "./ejercicios")
output_dir <- "./pdf"

# 1. Take all .Rmd files from `input_dir`
# 2. Convert them to PDF using `chrome_print()`
# 3. Move them to `output_dir`
for (input in list.files(path = input_dir, pattern = ".Rmd", recursive = TRUE, full.names = TRUE)) {
  output <- paste0(file_path_sans_ext(input), ".pdf")
  target <- file.path(output_dir, paste0(file_path_sans_ext(basename(input)), ".pdf"))
  
  if (!file.exists(target)) {
    pagedown::chrome_print(input)
    file.copy(output, output_dir)
    file.remove(output)
  }
}