# use wget for downloading instead of curl
options(download.file.method = "wget");

# install the packages
pkgs <- c(
  "devtools",
  "ggplot2",
  "packrat",
  "optparse",
  "rmarkdown",
  "rsconnect",
  "shiny",
  "testthat",
  "xml2"
);

install.packages(pkgs, repos="http://cran.rstudio.com");

# check that packages load properly
lapply(pkgs, library, character.only=TRUE);
