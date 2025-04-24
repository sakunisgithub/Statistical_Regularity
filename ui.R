library(shiny)
library(shinythemes)

shinyUI(fluidPage(theme = shinytheme("cerulean"),
                  
                  tags$head(
                    tags$style(HTML("
                      .recalculating {
                        opacity: 1 !important;
                        background-color: black !important;
                      }
                    "))
                  ),
                  
                  navbarPage(title = "Statistical Regularity",
                             
                  tabPanel("Concept Overview",
                           withMathJax(
                             h1("Statistical Regularity"),
                             div(style = "font-size: 16px;",
                               p("\\( \\bullet \\) Statistics deals with random experiments. The outcome of a random experiment may not be known for sure in advance, unlike deterministic mathematics."),
                               p("Thus, we may think of randomness as \\( \\textit{irregularity} \\)."),
                               p("However, in certain situations, even outcomes of random experiments show a regularity that is similar to deterministic behaviour. This phenomenon is called \\( \\underline{\\textbf{Statistical Regularity}} \\)."),
                               p("\\( \\bullet \\) If the same random experiment is repeated independently for a large number of times, then certain aggregate behaviours of the outcomes often converge to a deterministic number."),
                               p("\\( \\bullet \\) Let us recall the \\( \\underline{\\text{Frequency Definition of Probability}} \\)."),
                               p("Suppose that we have a random experiment with sample space \\( S \\). Let \\( A \\subseteq S \\) be any event. We repeat the random experiment \\( n \\) times independently. Let \\( X_n \\) be the relative frequency of the event during these trials."),
                               p("Then it is seen that as \\( n \\rightarrow \\infty \\) the random variable \\( X_n \\) approaches some fixed number. This limiting fixed number is called the probability of the event \\( A \\). This is the frequency definition of probability."),
                               p("This behaviour is a great example of statistical regularity."),
                               p("\\( \\bullet \\) Stability of relative frequencies for large values of \\( n \\) constitutes the basis of statistical theory. And the frequentist concept of probability is best understood through the lens of statistical regularity.")
                             )
                           ),
                           
                           h1("Barnsley Fern"),
                           div(style = "font-size: 16px;",
                            p("\\( \\bullet \\) The Barnsley fern is a fractal proposed by British mathematician Michael Barnsley in his book \\( \\textit{Fractals Everywhere} \\) and it serves as a brilliant (and beautiful) example to visualize statistical regularity."),
                            p("\\( \\bullet \\) Suppose we are playing a game of Ludo (a mathematical one), our board is \\( \\mathbb{R}^2 \\), we start at \\( (0, 0) \\) and we have 4 possible moves as given below."),
                            div(style = "display: flex; justify-content: center;",
                                HTML('
                                    <table border="1" cellpadding="8" cellspacing="0" 
                                           style="font-size: 16px; border-collapse: collapse;; width: 40%">
                                      <thead>
                                        <tr style="height: 60px;">
                                          <th style="text-align: center; vertical-align: middle;">Move</th>
                                          <th style="text-align: center; vertical-align: middle;">Transformation</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <tr style="height: 50px;">
                                          <td style="text-align: center; vertical-align: middle;">1</td>
                                          <td style="text-align: center; vertical-align: middle;">\\( (0.8x + 0.1,\\ 0.8y + 0.04) \\)</td>
                                        </tr>
                                        <tr style="height: 50px;">
                                          <td style="text-align: center; vertical-align: middle;">2</td>
                                          <td style="text-align: center; vertical-align: middle;">\\( (0.5x + 0.25,\\ 0.5y + 0.4) \\)</td>
                                        </tr>
                                        <tr style="height: 50px;">
                                          <td style="text-align: center; vertical-align: middle;">3</td>
                                          <td style="text-align: center; vertical-align: middle;">\\( (0.355(x - y) + 0.266,\\ 0.355(x + y) + 0.078) \\)</td>
                                        </tr>
                                        <tr style="height: 50px;">
                                          <td style="text-align: center; vertical-align: middle;">4</td>
                                          <td style="text-align: center; vertical-align: middle;">\\( (0.355(x + y) + 0.378,\\ 0.355(y - x) + 0.434) \\)</td>
                                        </tr>
                                      </tbody>
                                    </table>
                                  ')
                                ),
                            p("We make any of these 4 moves with equal probability. We play the game \\( n \\) times, each time we randomly get a point and draw it on \\( \\mathbb{R}^2 \\)."),
                            p("\\( \\bullet \\) Initially for small values of \\( n \\) we get random points of the plane. As we increase \\( n \\) sufficiently, we will be flabbergasted to see a specific pattern - construction of a leaf."),
                            p("If we restart the game, we will get a completely different points (as the points are generated randomly); but again for sufficiently large \\( n \\) we shall get a leaf identical to before."),
                            p("It is really astonishing how completely different random points go on to make an identical deterministic structure and that is what statistical regularity is all about - \\( \\underline{\\text{deterministic from randomness}} \\)."),
                            p("\\( \\bullet \\) \\( \\underline{\\text{Leaves of plants}}, \\underline{\\text{human fingerprints}} \\) are great examples of the phenomenon \\( \\underline{\\text{deterministic from random}} \\) being exhibited in mother nature.")
                           ),
                           
                           h1("Try it out !"),
                           div(style = "font-size: 16px;",
                               p("\\( \\bullet \\) In the subsequent tabs, try out different variants of Barnsley Ferns and experience the process of getting a determininstic structure from completely random points.")
                              )
                           ), # tabpanel 0
                  
                  tabPanel("Leaf",
                           sidebarLayout(
                             sidebarPanel(HTML("Initially take n = 10, 50, 70, 100; then take n = 200, 500, 700... and thus increase n upto 100000 (say).<br><br>"),
                                          numericInput(inputId = "n0", 
                                                       label = "Enter n",
                                                       value = 2,
                                                       min = 2)),
                             
                             mainPanel(
                               plotOutput(outputId = "plot_leaf", width = "750px", height = "650px")
                             )
                           ) # sidebarLayout
                           
                  ), # tabPanel leaf
                  
                  tabPanel("Fern 1",
                    sidebarLayout(
                      sidebarPanel(HTML("Initially take n = 10, 50, 70, 100; then take n = 200, 500, 700... and thus increase n upto 100000 (say).<br><br>"),
                                   numericInput(inputId = "n1", 
                                                label = "Enter n",
                                                value = 2,
                                                min = 2)),
                      
                      mainPanel(
                        plotOutput(outputId = "plot_fern_1", width = "700px", height = "650px")
                      )
                    ) # sidebarLayout
                    
                  ), # tabPanel 1
                  
                  tabPanel("Fern 2",
                    sidebarLayout(
                      sidebarPanel(HTML("Initially take n = 10, 50, 70, 100; then take n = 200, 500, 700... and thus increase n upto 100000 (say).<br><br>"),
                                   numericInput(inputId = "n2", 
                                                label = "Enter n",
                                                value = 2,
                                                min = 2)),
                             
                      mainPanel(
                          plotOutput(outputId = "plot_fern_2", width = "700px", height = "650px")
                      )
                    ) # sidebarLayout
                           
                  ), # tabPanel 2
                  
                  tabPanel("Fern 3",
                    sidebarLayout(
                      sidebarPanel(HTML("Initially take n = 10, 50, 70, 100; then take n = 200, 500, 700... and thus increase n upto 100000 (say).<br><br>"),
                                   numericInput(inputId = "n3", 
                                                label = "Enter n",
                                                value = 2,
                                                min = 2)),
                             
                      mainPanel(
                            plotOutput(outputId = "plot_fern_3", width = "700px", height = "650px")
                      )
                    ) # sidebarLayout
                           
                  ), # tabPanel 3
                  
                  tabPanel("Fern 4",
                    sidebarLayout(
                      sidebarPanel(HTML("Initially take n = 10, 50, 70, 100; then take n = 200, 500, 700... and thus increase n upto 100000 (say).<br><br>"),
                                   numericInput(inputId = "n4", 
                                                label = "Enter n",
                                                value = 2,
                                                min = 2)),
                             
                      mainPanel(
                            plotOutput(outputId = "plot_fern_4", width = "700px", height = "650px")
                      )
                  ) # sidebarLayout
                           
                  ), # tabPanel 4
                  
                  tabPanel("More Ferns ",
                           sidebarLayout(
                             sidebarPanel(HTML("Here n is set to 100000.<br><br> Various shapes of Ferns are displayed in an animation.<br><br> Tau is an important parameter that defines the shape of the fern.<br><br>"),
                                          sliderInput("tau", 
                                                      "Select Tau:",
                                                      min = -0.1, max = 0.1, value = -0.1, step = 0.01, animate = animationOptions(interval = 4500)),
                                          helpText(HTML("Tau values range from -0.1 to 0.1 in steps of 0.01.<br> <br> You can take the slider to any value to see the fern or simply play all the shapes by the clicking on the play button, shapes are shown at intervals of 4.5 seconds. "))),
                             
                             mainPanel(
                               plotOutput(outputId = "more_ferns", width = "700px", height = "650px")
                             )
                           ) # sidebarLayout
                           
                  ) # tabPanel 5
                  
                  ) # navbarPage
                  
                  ) # fluidPage
        
        ) # shinyUI