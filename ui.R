library(shiny)

shinyUI(fluidPage(
    headerPanel("2011 IPPS info for the Top 100 DRGs", windowTitle = '2011 IPPS'),
    
    fluidRow(
        column(width = 8,
            selectInput(inputId = 'drg',
                        label = 'Diagnosis-related Group',
                        width = '100%',
                        choices = c(levels(data$DRG.Definition)),
                        selected = '039 - EXTRACRANIAL PROCEDURES W/O CC/MCC')
        ),
        column(width = 4,
               radioButtons(inputId = 'metric',
                            label = "Metric",
                            choices = c('Charges', 'Payments', 'Medicare Payments'),
                            selected = 'Charges',
                            inline = TRUE)
        )
    ),
    
    hr(),
    
    fluidRow(
        column(width = 4,
            selectInput(inputId = 'state1',
                        label = 'State',
                        choices = c(levels(data$Provider.State)),
                        selected = 'MD')
        ),
        
        column(width = 4, offset = 4,
            selectInput(inputId = 'state2',
                        label = 'State',
                        choices = c(levels(data$Provider.State)),
                        selected = 'PA')
        )
    ),
    
    fluidRow(plotOutput(outputId = 'box_plot', height = '300px')),
    
    hr(),
    
    wellPanel(
        h3('Instructions'),
        p('Select the DRG group and metric you want to compare at the top. 
          Then select the two states you want to compare to each other. The 
          national average is shown in the middle.'),
        p('Data collected is from:',
          a('https://data.cms.gov/Medicare/Inpatient-Prospective-Payment-System-IPPS-Provider/97k6-zzx3'))
    )
))
