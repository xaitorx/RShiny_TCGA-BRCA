# Load packages ----
library(shiny)

# Source helpers ----

# User interface ----
ui <- fluidPage(
  titlePanel("TCGA-BRCA corr"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select 2 genes to examine correlation. Data collected from TCGA-BRCA"),
      
      checkboxGroupInput("checkGroup", label = h3("Tissue type"), 
                         choices = list("Primary solid Tumor" = 1, "Solid Tissue Normal" = 2, "Metastatic" = 3),
                         selected = 1),
      
      checkboxGroupInput("checkGroup2", label = h3("BRCA subtype"), 
                         choices = list("Luminal A" = 1, "Luminal B" = 2, "Her2" = 3, "Basal" = 4, "Normal" = 5, "NA" = 6),
                         selected = c(1,2,3,4,5,6)),
      
      textInput("text", label = h3("Gene 1"), value = "Enter text..."),
      
      textInput("text2", label = h3("Gene 2"), value = "Enter text...")
    ),
    
    
    mainPanel(plotOutput("plot"))
  )
)

# Server logic
server <- function(input, output) {
}

# Run the app
shinyApp(ui, server)
