library(leaflet)

m <- leaflet() |>  
  addTiles() |> 
  setView( lng = -149.49, lat = 64.2008, zoom = 4)
m
