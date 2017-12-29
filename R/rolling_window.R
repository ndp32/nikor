#' Make rolling windows
#' @description Computes rolling mean, median, min, max over a specified window, over a vector.
#' @param x A numeric vector.
#' @param l An integer specifying how far away the lower bound should be.
#' @param u An integer specifying how far away the upper bound should be.
#' @return A Data frame with the rolling window values of the mean, median, min, and max.
#' @importFrom tibble tibble
#' @importFrom magrittr %>%
#' @importFrom lubridate date_decimal
#' @importFrom dplyr lag
#' @importFrom dplyr lead
#' @importFrom dplyr mutate
#' @importFrom dplyr filter
#' @importFrom dplyr select
#' @importFrom dplyr full_join
#' @importFrom dplyr contains
#' @importFrom dplyr if_else
#' @importFrom purrr map2_dbl
#' @export
rolling_window <- function(x, l, u) {

  na_replacemnet <- as.integer(0)

  t1 <- tibble(
    vec = x,
    pos = seq_along(x),
    lwr = lag(pos, l),
    upr = lead(pos, u)
  )

  t2 <- t1 %>%
    mutate(
      lwr         = if_else(is.na(lwr), na_replacemnet, lwr),
      upr         = if_else(is.na(upr), na_replacemnet, upr),
      roll_mean   = map2_dbl(lwr, upr, ~ mean(vec[.x:.y])),
      roll_median = map2_dbl(lwr, upr, ~ median(vec[.x:.y])),
      roll_min    = map2_dbl(lwr, upr, ~ min(vec[.x:.y])),
      roll_max    = map2_dbl(lwr, upr, ~ max(vec[.x:.y]))
    ) %>%
    filter(lwr != na_replacemnet & upr != na_replacemnet) %>%
    select(-c(vec, lwr, upr))

  t3 <- full_join(t1, t2, by = "pos") %>%
    select(index = pos, input_vector = vec, contains("roll"), -c(lwr, upr))

  return(t3)
}


