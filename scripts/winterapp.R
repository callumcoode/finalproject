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
    titlePanel("Trends for winter period"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            # Title of checkbox
            p("Select each period to include"),
            
            # Creating a checkbox for each year
            checkboxGroupInput(
                "per",
                "Period",
                choices = list("2015/2016" = "2015/2016",
                               "2016/2017" = "2016/2017",
                               "2017/2018" = "2017/2018",
                               "2018/2019" = "2018/2019",
                               "2019/2020" = "2019/2020",
                               "2020/2021" = "2020/2021"),
                selected = c("2015/2016", "2017/2018","2019/2020", "2020/2021"))
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("winterPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$winterPlot <- renderPlot({
        ggplot(data = (dfwin %>% 
                           filter(period %in% input$per)), 
               aes(x = week, y = cases, group = period, colour = period)) +
            geom_line() + geom_point()
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
