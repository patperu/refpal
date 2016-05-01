#' get results
#'
#' @export
#' @param url An URL

get_refdata <- function(url) {
  # url <- "http://referendum2016.comune.palermo.it/AFFLSEZ_1_82053_R1.xml"
  x <- xml2::read_xml(url) %>%
       rvest::xml_nodes('SV') %>%
       rvest::html_attrs()

  x <- data.frame(do.call("rbind", x), stringsAsFactors = FALSE)
  x$TOTVOT <- as.numeric(x$TOTVOT)
  x$ELETTORI <- as.numeric(x$ELETTORI)
  x$pct_vot <- x$TOTVOT / x$ELETTORI * 100
  x
}
