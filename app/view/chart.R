box::use(
  reactable[reactableOutput, renderReactable],
  echarts4r[echarts4rOutput, renderEcharts4r],
  shiny[moduleServer, NS],
)
box::use(
  app/logic/rhinos,
)

#' @export
ui <- function(id){
  ns <- NS(id)
  echarts4rOutput(ns("chart"))
}

#' @export
server <- function(id, data){
  moduleServer(id, function(input, output, session){
    output$chart <- renderEcharts4r(
      rhinos$chart(data())
    )
  })
}