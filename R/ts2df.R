#' For those of us who loathe time-series objects.
#' @description Converts a tis object into a data frame.
#' @param ts A time-series object.
#' @return A Data frame with two columns: date and value.
#' @importFrom tibble tibble
#' @importFrom magrittr %>%
#' @importFrom lubridate date_decimal
#' @importFrom lubridate date
#' @export
ts2df <- function(ts) {
  tibble(
    date  = ts %>% time() %>% as.numeric() %>% date_decimal() %>% date(),
    value = ts %>% as.numeric()
  )
}
