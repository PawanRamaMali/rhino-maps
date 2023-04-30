library(leaflet)

m <- leaflet() |>  
  addTiles() |> 
  setView( lng = -149.49, lat = 64.2008, zoom = 4) |> 
  addProviderTiles(providers$Thunderforest.Pioneer)
m


m <- leaflet() |>  
  addProviderTiles(providers$Stamen.TerrainBackground) |> 
  setView( lng = -149.49, lat = 64.2008, zoom = 4) 
m

m <- leaflet() |>  
  addProviderTiles(providers$Esri.NatGeoWorldMap) |> 
  setView( lng = -149.49, lat = 64.2008, zoom = 4) 
m


readRenviron(".Renviron")
apikey <- Sys.getenv("THUNDERFOREST_API_KEY")
variant <-  "Landscape"
leaflet() %>%
  addTiles(
    urlTemplate = "https://{s}.tile.thunderforest.com/{variant}/{z}/{x}/{y}.png?apikey={apikey}",
    attribution = "&copy; <a href='http://www.thunderforest.com/'>Thunderforest</a>,  &copy; <a href='http://www.openstreetmap.org/copyright'>OpenStreetMap</a>",
    options = tileOptions(variant='landscape', apikey = apikey)
  )
