
#  ------------------------------------------------------------------------
#
# Title : .Rprofile - Jimmy Briggs
#    By : Jimmy Briggs
#  Date : 2021-04-13
#
#  ------------------------------------------------------------------------

r_config_dir <- function(...) {
  normalizePath(
    file.path(
      Sys.getenv("R_CONFIG_DIR", unset = normalizePath("~/.config/R")),
      ...
    )
  )
}

# Ensure Library is set:
.libPaths(Sys.getenv("R_LIBS", unset = r_config_dir("lib/4.1")))

# Set Default Options:
options(
  repos = c(CRAN = "https://cran.rstudio.com"),
  editor = "notepad",
  pager = "internal",
  useFancyQuotes = FALSE,
  tab.width = 2,
  browserNLdisabled = TRUE,
  max.print = 200,
  shiny.launch.browser = TRUE,
  Ncpus = 4L, # parallel package installations (Sys.getenv("NUMBER_OF_PROCESSORS")` or parallel::detectCores())
  scipen = 999, # Remove Scientific Notation
  languageserver.snippet_support = FALSE, # vscode language server
  vsc.use_httpgd = TRUE,
  languageserver.server_capabilities = list(documentHighlightProvider = FALSE),
  remotes.install.args = "--no-multiarch", # avoid i386 arch installations/compilations:
  devtools.install.args = "--no-multiarch",
  usethis.full_name = "Jimmy Briggs", # usethis
  usethis.protocol = "ssh",
  usethis.description = list(
    `Authors@R` = 'person("Jimmy", "Briggs",
                         email = "jimmy.briggs@jimbrig.com",
                         role = c("aut", "cre"),
                         comment = c(ORCID = "0000-0002-7489-8787"))',
    License = "MIT + file LICENSE",
    Language =  "en-US"
  ),
  orcid = "0000-0002-7489-8787",
  blogdown.author = "Jimmy Briggs", # blogdown - https://bookdown.org/yihui/blogdown/global-options.html
  blogdown.ext = ".Rmd",
  blogdown.insertimage.usebaseurl = TRUE,
  shrtcts.path = r_config_dir("config/.shrtcts.yml"),
  gargle_oauth_email = "jimmy.briggs@jimbrig.com",
  gargle_oauth_cache = r_config_dir("secrets/gargle/gargle-oauth"),
  distilltools.templates.path = r_config_dir("templates/Rmd")
)

# turn on completion of installed package names
utils::rc.settings(ipck = TRUE)

# addinit options
source(r_config_dir("scripts/addinit_options.R"))

# history
Sys.setenv("R_HISTFILE" = r_config_dir(".Rhistory"))
.Last <- function() if (interactive()) try(savehistory(file = r_config_dir(".Rhistory")))

# error tracing
if ('rlang' %in% loadedNamespaces()) options(error = rlang::entrace)

# package installation error callback from 'pak'
if (interactive() && getRversion() >= "4.0.0") {
  globalCallingHandlers(
    packageNotFoundError = function(err) {
      try(pak::handle_package_not_found(err))
    }
  )
}

# prompt
setHook("rstudio.sessionInit", function(newSession) {
  if (newSession)
    message("RStudio Version: ", rstudioapi::getVersion())
}, action = "append")

if (interactive() && curl::has_internet()) invisible(installr::check.for.updates.R(GUI = FALSE))

# r-cli
if (nzchar(Sys.getenv("R_CMD")) && require("rcli", quietly = TRUE)) rcli::r_cmd_call()

readRenviron(r_config_dir("secrets/secrets.Renviron"))

# attach extra helper functions
.rprofile <- new.env()
sys.source(r_config_dir("scripts/rprofile_extras.R"), .rprofile)
attach(.rprofile)

# detach
detach_all_attached()

# clear env
rm(list = setdiff(ls(), "r_config_dir"))

# autoload magrittr PIPE
autoload("%>%", "magrittr")

# unload



# deprecated --------------------------------------------------------------
# shortcuts
# if (interactive() && requireNamespace("shrtcts", quietly = TRUE)) {
#   shrtcts::add_rstudio_shortcuts(
#     path = getOption("shrtcts.path"),
#     set_keyboard_shortcuts = TRUE
#   )
# }

# load secret environment variables/tokens
# local({
#   if (!file.exists(fs::path_home(".config/R/secrets/secrets.Renviron"))) {
#     secrets <- config::get("secrets", file = fs::path_home(".config/R/config.yml"))
#     if (!require(gistr)) {
#       if (file.exists(secrets$local_path)) {
#         file.rename(secrets$local_path, paste0(secrets$local_path, ".bak"))
#       }
#       suppressMessages(
#         utils::download.file(secrets$url, secrets$local_path, quiet = TRUE)
#       )
#     }
#   }
# })

# if (requireNamespace("jetpack", quietly = TRUE)) {
#   jetpack::load()
# } else {
#   message("Install Jetpack to use a virtual environment for this project")
# }

# Set GH PAT
# local({
#   require("credentials")
#   credentials::set_github_pat()
# })

# set locale
# invisible(Sys.setlocale("LC_ALL", "English_United States.1252"))

# parallel::detectCores()
# benchmarkme::get_ram()
# benchmarkme::get_cpu()

# default to launching shiny apps in external browser
# if (requireNamespace("rstudioapi", quietly = TRUE) && rstudioapi::hasFun("viewer")) {
#   options(shiny.launch.browser = .rs.invokeShinyWindowExternal)
# }

# shrtcts::list_shortcuts()
# if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager") BiocManager::install(version = "3.12")

# else {
# gistr::gist_save(secrets$local_path, secrets$ _gist_path)
# }

# prompt::set_prompt(function(...){
#   paste0(
#     "[", prompt::git_branch(), prompt::git_dirty(), prompt::git_arrows(), "] ",
#     prompt::prompt_memuse()
#   )
# })

# options(
#   kickstarteR.setup = list(
#     packages = c('dplyr', 'purrr', 'lubridate', 'stringr', 'rstudioapi', 'pak', 'pacman', 'devtools'),
#     sets = list(
#       shiny = c('shiny', 'shinydashboard', 'shinyWidgets', 'DT', 'highcharter', 'shinyjs'),
#       tidy = c('dplyr', 'reshape2'),
#       excel = c('readxl', 'writexl')
#     )
#   )
# )

# Specify R_CONFIG_DIR access helper function:
# .rconfigdir <-

#' r_config_dir
#'
#' Enables quick access to user specified `R_CONFIG_DIR`.
#'
#' @param append character - string to append to `R_CONFIG_DIR`'s path
#' @param ls logical - `TRUE` to return file listing (i.e. `ls`);
#'   `FALSE` returns path string object (default)
#'
#' @return either a single character string representing the `R_CONFIG_DIR` path
#'   or a vector of specified directory's files and folders (see `ls` argument).
#' @export
#'
#' @examples
#' .rconfigdir <- Sys.getenv("R_CONFIG_DIR", unset = "~/.config/R")
#' r_config_dir("secrets/)
# r_config_dir <- function(append = NULL, prompt = TRUE, ls = FALSE) {
#   if (!exists(".rconfigdir")) { .rconfigdir <<- Sys.getenv("R_CONFIG_DIR", unset = "~/.config/R") }
#   path <- file.path(.rconfigdir, ifelse(is.null(append), "", append))
#   if (prompt) {
#     response <- utils::menu(dir(path), title = "Select a an object:")
#     if (response != 0) { path <- file.path(.rconfigdir, dir(path)[[response]]) }
#     if (file.info(path)[["isdir"]]) {
#       if (ls) { return(dir(path)) } else { path <- dir(path)[[utils::menu(dir(path))]] }
#     }
#   }
#   if (is.null(append) && ls) { dir(path) }
#   path <- file.path(path, append)
# }
