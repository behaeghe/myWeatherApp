m %>% addProviderTiles("NASAGIBS.ModisTerraTrueColorCR",
                 options = providerTileOptions(time =Sys.Date()-1, opacity = 0.5)) %>%
        addMarkers(lng=-71.0589, lat=42.3601, popup="The Hub: Boston MA")

