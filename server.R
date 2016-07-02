library(shiny)
library(ggplot2)
library(dplyr)

shinyServer(function(input, output) {
    output$table <- renderDataTable({
        carat_seq <- seq(from = input$Carat[1], to = input$Carat[2], by = 0.01)
        length_seq <- seq(from = input$Length[1], to = input$Length[2], by = 0.01)
        width_seq <- seq(from = input$Width[1], to = input$Width[2], by = 0.01)
        depth_seq <- seq(from = input$Depth[1], to = input$Depth[2], by = 0.01)
        data <- transmute(diamonds, Price = price, Carat = carat, Quality = cut, Length = x, Width = y, Depth=z)
        data <- filter(data, Price <= input$Budget, Carat %in% carat_seq, Length %in% length_seq, Width %in% width_seq, Depth %in% depth_seq)
    data <- arrange(data, Price)
    data
    }, options=list(lengthMenu = c(25, 50, 100), pageLength = 25))
})