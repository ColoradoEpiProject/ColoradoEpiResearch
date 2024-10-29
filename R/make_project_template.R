make_project_template <- function(path, ...) {

  dots <- list(...)

  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # create directories
  dir.create(file.path(path, "data_clean"), recursive = TRUE, showWarnings = FALSE)
  dir.create(file.path(path, "R"), recursive = TRUE, showWarnings = FALSE)
  dir.create(file.path(path, "reports_script"), recursive = TRUE, showWarnings = FALSE)
  dir.create(file.path(path, "reports_rendered"), recursive = TRUE, showWarnings = FALSE)
  dir.create(file.path(path, "z_old"), recursive = TRUE, showWarnings = FALSE)
  dir.create(file.path(path, "z_other"), recursive = TRUE, showWarnings = FALSE)

  if(dots[["createRawDataFolder"]]) {
    dir.create(file.path(path, "data_raw"), recursive = TRUE, showWarnings = FALSE)
  }

  if(dots[["git"]]) {
    git2r::init(path)
  }

  script_source <- system.file("rstudio/templates", "README.Rmd", package = "ColoradoEpiResearch")
  script_dest <- file.path(path, "README.Rmd")
  file.copy(script_source, script_dest, overwrite = TRUE)

}
