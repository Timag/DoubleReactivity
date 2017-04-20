#runApp("C:/Users/d91115/Dropbox/Github/DoubleReactivity/", launch.browser = TRUE)
library(shiny)

shinyServer( function(input, output, session) {
  
  output$mychart <- renderPopupChart({
    data.frame(low = c(2500, 3000, 1500),
               middle = c(3400, 7000, 4000),
               high = c(2500, 500, 3000),
               superb = c(2500, 500, 3000),
               row.names = c("Employee 1", "Employee 2", "Employee 3"))
  })
  
})


# Usecase:
# You are the leader of a sales team with three employees, who sell four products. 
# For you as the teamleader important key figures are the overall earnings as well
# as the earnings per product. 

# The plot can answer four questions: 

# Question 1: What are the overall earnings per person? (bar chart)

# Question 2: How high (absolute/relative) are the overall earnings aggregated per category? (circle and table)

# Question 3: How high (absolute/relative) are the overall earnings per category for each person? (Mouseover on the bar charts)

# Question 4: How high are the absolute earnings  per person related to each other given a category? (Mouseover on the circle)
