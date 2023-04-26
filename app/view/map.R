box::use(
  shiny[moduleServer, NS, reactive, div, is.reactive, observeEvent, eventReactive],
  leaflet[...],
  htmlwidgets[onRender, JS],
  dplyr[filter, select, left_join, case_when, mutate],
  purrr[map],
  magrittr[`%>%`],
  glue[glue]
)

# box::use(
#   app/logic/update_map[...]
# )

#' @export
ui <- function(id) {
  ns <- NS(id)
  leafletOutput(ns("map"), width = "99%", height = "70%")
}

#' @export
server <- function(id, map_data, medal_data) {

  moduleServer(id, function(input, output, session) {
    
    output$map <- renderLeaflet({
      leaflet(
        data = map_data
      ) %>%
        setView(lng = 10, lat = 25, zoom = 2) %>%
        addProviderTiles(providers$CartoDB.VoyagerNoLabels,
                         options = providerTileOptions(
                           updateWhenZooming = FALSE,
                           updateWhenIdle = FALSE
                         )
        ) %>%
        
        addTiles(group="OSM") %>% # added a base tile "Esri.WorldImagery"
        addProviderTiles("Stamen.Toner", group="Toner") %>%  # added 3rd party provider tiles
        addProviderTiles("Esri.WorldImagery", group="World Imagery") %>%
        addProviderTiles("Stamen.TonerLite", group="Toner Lite") %>%
        addPolygons(
          layerId = ~ISO3c,
          color = "black",
          fillColor = "#e2e2e2",
          dashArray = "3",
          weight = 1,
          group = "Total Water Resources",
          popup = "",
          smoothFactor = 1,
          fillOpacity = 0.5,
          highlightOptions = highlightOptions(
            color = "white",
            weight = 2,
            dashArray = "",
            fillOpacity = 0.1,
            bringToFront = FALSE
          )
        )  %>%
        addLayersControl(
          overlayGroups = c("Total", "Capital", "Population", "GDP", "GDP per"),
          options = layersControlOptions(collapsed = FALSE)
        )  %>%
        addLayersControl(
          baseGroups = c("OSM", "Toner", "Toner Lite", "World Imagery"),
          overlayGroups = c("Markers",  "Circle Markers"),
          options = layersControlOptions(collapsed = TRUE) # control options remains on the map
        )
    })
  })
}
