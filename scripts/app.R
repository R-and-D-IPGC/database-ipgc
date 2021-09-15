#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
a <- read.csv("C:/Users/IPGC/Desktop/COFRE/SIDRA/TABELA6579_2021_MODIFICADO.csv", sep = ";")
b <- read.csv("C:/Users/IPGC/Desktop/IPGC/FINAL/CIP_FPM_PIP_V4.csv", sep = ";")
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("IPGC - Ficha Municipal"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
        #sliderInput("bins",
         #               "Number of bins:",
          #              min = 1,
           #             max = 50,
            #            value = 30),
            inputestado <- selectInput("UF","Estado:", choices = unique(a$UF), selected = "NONE"),
            inputcidade <- selectInput("MUN", "Município", choices = "", selected = "NONE"),
            numericInput("IBGE",label = "Código do IBGE:",value = "", min = 1000000, max = 9999999)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           #plotOutput("distPlot"),
           h3(strong(textOutput("NOME"))),
           plotOutput("MAPA", width = "80%"),
           strong("População (IBGE 2021): "),
           textOutput("POP"),
           strong("CIP (SICONFI 2020):"),
           textOutput("CIP"),
           strong("FPM (SICONFI 2020):"),
           textOutput("FPM"),
           strong("Pontos de Iluminação Pública (ANEEL 2019):"),
           textOutput("PIP")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {

    
    observe({
        selectedState <- input$UF
        updateSelectInput(session,"MUN",
                          choices=b[which(b[,6] == selectedState),5],
                          selected="NONE")
        #COD <- b[which(input$MUN == b[,4] & input$UF == b[,5]),]
    })

    output$NOME <- renderText(print(a[which(input$MUN == a[,7] & input$UF == a[,8]),7]))
    output$MAPA <- renderPlot(construir_mapa_cidade_destacada(substr(a[which(input$MUN == a[,7] & input$UF == a[,8]),6],1,2),a[which(input$MUN == a[,7] & input$UF == a[,8]),6]))
    output$POP <- renderText(print(b[which(input$MUN == b[,5]), 7]))
    output$CIP <- renderText(print(b[which(input$MUN == b[,5]), 3]))
    output$FPM <- renderText(print(b[which(input$MUN == b[,5]), 2]))
    output$PIP <- renderText(print(b[which(input$MUN == b[,5]), 4]))
    
  
    #output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        #x    <- faithful[, 2]
        #bins <- seq(min(x), max(x), length.out = as.numeric(input$bins) + 1)

        # draw the histogram with the specified number of bins
        #hist(x, breaks = bins, col = 'darkgray', border = 'white')
    #})
}

# Run the application 
shinyApp(ui = ui, server = server)
