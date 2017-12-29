#' A theme for time-series
#' @description I think this looks good for time-series.
#' @importFrom ggplot2 theme_minimal
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 %+replace%
#' @importFrom ggplot2 element_line
#' @importFrom ggplot2 element_text
#' @importFrom ggplot2 element_blank
#' @importFrom ggplot2 element_rect
#' @importFrom ggplot2 margin
#' @importFrom ggplot2 element_blank
#' @export
theme_ts <- function(base_size = 12, base_family = "serif") {
  theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    theme(
      line                 = element_line(color = "grey40", lineend = "round"),
      text                 = element_text(family = "serif", color = "grey40"),
      panel.grid.major.x   = element_blank(),
      panel.grid.minor.x   = element_blank(),
      panel.grid.minor.y   = element_blank(),
      panel.background     = element_rect(fill = "white", color = "grey80"),
      plot.background      = element_rect(fill = "grey80", color = "grey80"),
      plot.margin          = margin(10, 35, 15, 10),
      axis.line.x          = element_line(color = "grey60", lineend = "round"),
      axis.title.x         = element_blank(),
      axis.text.x          = element_text(hjust = 0),
      axis.ticks.x         = element_line(color = "grey60", lineend = "round"),
      legend.position      = "right",
      legend.justification = "center",
      legend.margin        = margin(0, 0, 0, 0),
      legend.box.margin    = margin(-5, -5, -5, -5),
      legend.title         = element_blank()
  )
}
