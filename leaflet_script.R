library(leaflet)

m <- leaflet() |>  
  addTiles() |> 
  setView( lng = -149.49, lat = 64.2008, zoom = 4) |> 
  addProviderTiles(providers$Thunderforest.Pioneer)
m


m <- leaflet() |>  
  addProviderTiles(providers$Thunderforest) |> 
  setView( lng = -149.49, lat = 64.2008, zoom = 4) 
m

m <- leaflet() |>  
  addProviderTiles(providers$Esri.NatGeoWorldMap) |> 
  setView( lng = -149.49, lat = 64.2008, zoom = 4) 
m
