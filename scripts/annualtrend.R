#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Trends for each year"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            # Title of checkbox
            p("Select each year to include"),
            
            # Creating a checkbox for each year
            checkboxGroupInput(
                "years",
                "Year",
                choices = list("2015" = "2015",
                               "2016" = "2016",
                               "2017" = "2017",
                               "2018" = "2018",
                               "2019" = "2019",
                               "2020" = "2020"),
                selected = "2020")
            ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
       ggplot(data = (df %>% 
                          filter(year %in% input$years)), 
              aes(x = week, y = cases, group = year, colour = year)) +
            geom_line() + geom_point()
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
