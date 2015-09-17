library(shiny)
require(markdown)
shinyUI(
      navbarPage("Mtcars Dataset Visualizer",
                 tabPanel("Application",
      headerPanel("Let's plot the parameter you are interested in"),
      sidebarPanel(
            radioButtons("choice","Item to compare:",
                         c("mpg"="mpg",
                           "cyl"="cyl",
                           "disp"="disp",
                           "hp"="hp",
                           "wt"="wt")
                         ),
            radioButtons("check","Group by AT and MT?:",
                         c("YES"="y",
                           "NO"="n")
            )
            ),
      mainPanel(
            h3('Plot is here:'),
            plotOutput("pic"),
            h3('Numeric result is here:'),
            verbatimTextOutput("mean")
            )),
      tabPanel("About",
               mainPanel(
                     includeMarkdown("about.MD")
               )
      )
      ))