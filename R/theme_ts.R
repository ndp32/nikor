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
  theme_minimal(base_size = base_size, base_family = base_family) +
    theme(
      line                 = element_line(color = "grey50", lineend = "round"),
      text                 = element_text(family = base_family, color = "grey40"),
      panel.grid.major.x   = element_blank(),
      panel.grid.minor.x   = element_blank(),
      panel.grid.major.y   = element_line(color = "grey90", linetype = 3),
      panel.grid.minor.y   = element_blank(),
      panel.background     = element_rect(fill = "white", color = "grey90"),
      plot.background      = element_rect(fill = "grey90", color = "grey90"),
      plot.margin          = margin(10, 35, 15, 10),
      axis.line.x          = element_line(color = "grey50", lineend = "round"),
      axis.title.x         = element_blank(),
      axis.text.x          = element_text(hjust = 0),
      axis.ticks.x         = element_line(color = "grey50", lineend = "round"),
      legend.position      = "top",
      legend.justification = "center",
      legend.margin        = margin(0, 0, 0, 0),
      legend.box.margin    = margin(-5, -5, -5, -5),
      legend.title         = element_blank()
  )
}
