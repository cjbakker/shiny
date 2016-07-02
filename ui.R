shinyUI(fluidPage(
    titlePanel("Finding a Diamond"),
    sidebarPanel( 
        helpText('This app is designed to help you find a diamond that is within budget and meets your criteria, based on data from the diamonds dataset in ggplot2. Just enter your maximum budget and ranges for your desired length, width, and depth in mm. The table will show you all of the diamonds that meet your criteria.'),
        numericInput('Budget', 'What is your maximum budget?', 500, min=326, max=18823), 
        sliderInput('Carat', 'How many carats?', min=0.2, max=5.01, value=c(0.2,5.01), step=0.01),
        sliderInput('Length', 'What length (in mm)?', min=0.00, max=10.74, value=c(0.00,10.74), step=0.01),
        sliderInput('Width', 'What width (in mm)?', min=0.00, max=58.90, value=c(0.00, 58.90), step=0.01),
        sliderInput('Depth', 'What depth (in mm)?', min=0.00, max=31.80, value=c(0.00, 31.80), step=0.01)
    ),
    mainPanel(
        dataTableOutput('table')
    )
)
)

