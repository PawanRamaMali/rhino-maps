box::use(
  fst[read_fst],
  sf[st_read],
  shiny[bootstrapPage, div, moduleServer, NS, reactive, titlePanel],
)
box::use(
  app/logic/rhinos,
  app/view[chart, map],
)


#' @export
ui <- function(id) {
  ns <- NS(id)
  bootstrapPage(
    titlePanel("World Map"),
    map$ui(ns("map")),
    chart$ui(ns("chart"))
    )
  
}

#' @export
server <- function(id) {
  # moduleServer(id, function(input, output, session) {
  #   data <- reactive(rhinos$fetch_data())
  #   table$server("table", data)
  #   chart$server("chart", data)
  # })
  
  moduleServer(id, function(input, output, session) {
    print("loading dataset")
    medal_data <- read_fst("app/data/medal_data.fst", as.data.table = TRUE)
    map_data <- st_read(dsn = "app/data/map_data.shp", quiet = TRUE)
    map$server("map", map_data, medal_data)
  })
}
