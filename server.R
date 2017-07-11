
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
                dateSelected =Sys.Date() -1
                map <- leaflet() %>%    
                        setView(lng=-71.0589, lat=42.3601, zoom = 8) %>%
                        addProviderTiles("Stamen.Toner") 
                output$weather <- renderLeaflet(map)        
                observe({dateSelected <- format(input$inDt,"%F")
                leafletProxy("weather",data=dateSelected) %>% 
                                                clearTiles() %>%
                                                addProviderTiles("Stamen.Toner") %>%
                                                addProviderTiles("Stamen.TonerLabels") %>%
                                                addProviderTiles("Stamen.TonerLines") %>%
                                                      addProviderTiles("NASAGIBS.ModisTerraTrueColorCR",
                                                                        options = providerTileOptions(time =dateSelected, opacity = 0.5)) %>%
                        addMarkers(lng=-71.0589, lat=42.3601, popup="The Hub: Boston MA")
                        })
      
         output$whatDate = renderText(format(input$inDt,"%F"))
  
  })

