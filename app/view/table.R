box::use(
  reactable[reactableOutput, renderReactable],
  shiny[moduleServer, NS],
)
box::use(
  app/logic/rhinos,
)

#' @export
ui <- function(id){
  ns <- NS(id)
  reactableOutput(ns("table"))
}

#' @export
server <- function(id, data){
  moduleServer(id, function(input, output, session){
    output$table <- renderReactable(
      rhinos$table(data())
    )
  })
}