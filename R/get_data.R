# get results
#
#' @export

get_data <- function() {

  x <- read_xml("http://referendum2016.comune.palermo.it/AFFLSEZ_1_82053_R1.xml") %>%
    xml_nodes('SV') %>%
    html_attrs()

  x <- data.frame(do.call("rbind", x), stringsAsFactors = FALSE)
  x$TOTVOT <- as.numeric(x$TOTVOT)
  x$ELETTORI <- as.numeric(x$ELETTORI)
  x$pct_vot <- x$TOTVOT / x$ELETTORI * 100
  x
}
