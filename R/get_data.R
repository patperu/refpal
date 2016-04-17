# get results
#
#' @export

get_data <- function(url) {
  # url <- "http://referendum2016.comune.palermo.it/AFFLSEZ_1_82053_R1.xml"
  x <- read_xml(url) %>%
    xml_nodes('SV') %>%
    html_attrs()

  x <- data.frame(do.call("rbind", x), stringsAsFactors = FALSE)
  x$TOTVOT <- as.numeric(x$TOTVOT)
  x$ELETTORI <- as.numeric(x$ELETTORI)
  x$pct_vot <- x$TOTVOT / x$ELETTORI * 100
  x
}
