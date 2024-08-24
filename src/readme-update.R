library(glue)
library(magrittr)
library(readr)
library(stringr)
library(yaml)

readme_text <- read_lines("readme-part-1.md")

p0 <- "    -   "
p1 <- "[Data dictionary]"
p2 <- "https://raw.githubusercontent.com"
p3 <- "pmean/datasets/master/"

fn <- list.files()
yaml_files <- str_subset(fn, "yaml$")
	
for (i in 1:length(yaml_files)) {

  yaml_file <- yaml_files[i]
	dd <- read_yaml(yaml_file)
	root <- str_replace(yaml_file, "\\..*", "")
	
	dd$description %>%
	  paste0("") %>%        # This converts NULL to an empty string
	  str_remove_all("\n") -> blurb
	readme_text %<>% append(
	  glue("-   **{root}**: {blurb}"))
	readme_text %<>% append(
	  glue("{p0}{p1}({p2}/{p3}{yaml_file})"))
		
	fn %>%
	  str_subset(root) %>%
	  str_subset("yaml", negate=TRUE) -> root_files
	readme_text %<>% append(
	  glue("{p0}[{root_files}]({p2}/{p3}{root_files})"))
	
}
	
write_lines(readme_text, file="README.md")
