#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#

library(shiny)
library(readr)
library(dplyr)
library(ggplot2)

# Define UI for application
ui <- fluidPage(

    # Application title
    titlePanel("Brand Personality Profile"),

    sidebarLayout(
        # Sidebar with a drop-down menu to select a brand
        sidebarPanel(
            shiny::uiOutput("asset_selection"),
            shiny::uiOutput("attribute_selection"),

        ),

        # Personality plot in the main panel
        mainPanel(
            shiny::plotOutput("personalityPlot")
        )
    )
)

# Define server logic required to process the data and draw the plot
server <- function(input, output) {

    # Load data in a reactive variable
    data <- reactive({
        readr::read_csv("data/reviews.csv")
    })

    # Prepare dynamic drop-down menu for asset selection
    output$asset_selection <- renderUI({
        all_report_ids <- unique(data$ReportId)
        shiny::selectInput("selected_report_id",
                           label = "Select asset",
                           choices = all_report_ids)
    })


    # Prepare dynamic drop-down menu for attribute selection
    output$attribute_selection <- renderUI({
        all_attributes <- c("Bold", "Pure", "Defiant", "Fun-loving",
                            "Intense", "Joyful", "Majestic", "Peaceful",
                            "Confident", "Simple", "Sophisticated",
                            "Spontaneous", "Technical", "Warm")
        shiny::selectInput("selected_attribute",
                           label = "Select attribute",
                           choices = all_attributes)
    })


    selected_data <- reactive({
        req(input$selected_report_id)

        data() %>%
            filter(ReportId %in% !! input$selected_report_id)
    })

    # Prepare a basic histogram
    output$personalityPlot <- renderPlot({

        plot_data <- selected_data() %>%
            tidyr::pivot_longer(Bold:Warm,
                                names_to = "Attribute",
                                values_to = "Score")

        ggplot(plot_data) +
            geom_histogram(aes(x = Score)) +
            labs(title = "Ratings distribution")

    })
}

# Run the application
shinyApp(ui = ui, server = server)
