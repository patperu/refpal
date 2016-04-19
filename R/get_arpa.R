

# get results
#
#' @export

get_arpa <- function(url) {
  # http://88.53.168.210/Bollettino2/MAria_report.xls
  # "http://blog.spaziogis.it/static/ods/data/mariareport/MAria_report.csv"
  x <- read.csv(url, stringsAsFactors = FALSE)

  colnames(x) <- c("date", unlist(lapply(colnames(x), split_names)))

  xm <- melt(x, id = "date")
  xm$variable <- as.character(xm$variable)

  u <- data.frame(do.call("rbind", strsplit(xm$variable, "__")), stringsAsFactors = FALSE)
  colnames(u) <- c("stazione", "inq", "tdm")
  fin <- data.frame(u, date = xm$date, value = xm$value)
  fin
}
