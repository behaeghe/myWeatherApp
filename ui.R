
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
# TODO:
#         * Use animation for loop
#         * Configure leaflet to center on Boston and grab snow/cloud coverage from NASA web site
library(shiny)
library(lubridate)
library(magrittr)
library(leaflet)
shinyUI(fluidPage(

  # Application title
  titlePanel("New England Interactive Snowpack and Cloud Coverage"),
  sidebarLayout(
          sidebarPanel(
          sliderInput("inDt",
                      "Dates",
                      min=Sys.Date()-15,
                      max=Sys.Date()-1,
                      value=Sys.Date()-5,
                      timeFormat="%d-%b-%Y")
          ),
          mainPanel(
                leafletOutput('weather'),
                textOutput('whatDate')
               
          )
  )
  # Sidebar with a slider input for number of bins
        # animationOptions(interval = 1000, 
        #                loop = FALSE, playButton = NULL,
        #                pauseButton = NULL
        #         )
        # 

    # Show a plot of the generated distribution
  
  ))

