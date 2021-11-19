# Load packages ----
library(shiny)
library(BiocManager)
options(repos = BiocManager::repositories())


# Source helpers ----
source("helpers/helpers.R")
source("helpers/packages.R")
TCGA <- read.csv( "data/DGAT2_todo_RNAseq.csv", row.names = 1)

# User interface ----
ui <- fluidPage(
  titlePanel("TCGA-BRCA corr"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select 2 genes to examine correlation", p("(use Gene Symbol ID)", style = "color:red"), "Data collected from TCGA-BRCA"),
      
      checkboxGroupInput("checkGroup", label = h3("BRCA subtype"), 
                         choices = list("Luminal A" = "LumA", "Luminal B" = "LumB", "Her2" = "Her2", "Basal" = "Basal", "Normal" = "Normal", "NA" = "NA"),
                         selected = c("LumA", "LumB", "Her2", "Basal", "Normal", "NA")),
      
      textInput("text", label = h3("Gene 1"), value = "DGAT2"),
      
      textInput("text2", label = h3("Gene 2"), value = "CD59")
    ),
    
    mainPanel(plotOutput("plot"))
  )
)

# Server logic
server <- function(input, output) {
  
  sub_fun <- function(subtypes) {
    # sub function to create table
    # this does not have any reactive element inside
    TCGA[TCGA$PAM_50 %in% subtypes, , drop = FALSE]
  }
  
  get_table <- eventReactive({input$checkGroup}, {
    # reactive function to define the configulation
    sub_fun(as.character(input$checkGroup))
  })  
  
  symbol1 <- reactive({
    as.character(input$text)
    })
  
  symbol2 <- reactive({
    as.character(input$text2)
  })
  
  output$plot <- renderPlot({ scaTTerplot(get_table(), symbol1(), symbol2())
    })
}

# Run the app
shinyApp(ui, server)
