if (!require(devtools))
  install.packages("devtools")
devtools::install_github("rstudio/leaflet")
shiny::runGitHub("rstudio/shiny-examples", subdir="063-superzip-example")