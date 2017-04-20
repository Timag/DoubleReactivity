library(shiny)

# To be called from ui.R
PopupChartOutput <- function(inputId, width="1000px", height="500px") {
  style <- sprintf("width: %s; height: %s;",
    validateCssUnit(width), validateCssUnit(height))
  tagList(
    tags$link(rel = "stylesheet", type = "text/css", href = "StyleDouble.css"),
    tags$script(src = "d3.v3.min.js"),
    includeScript("ChartRendering.js"),
    div(id=inputId, class="DoubleReactive", 
        # style=style,
      tag("svg", list())
    )
  )
}


initialColors <- c("#807dba", "#e08214", "#e03914", "#a02345", "#3366CC", "#DC3912", 
                   "#FF9900", "#109618","#990099", "#109618", "#990099")

# To be called from server.R
renderPopupChart <- function(expr, env = parent.frame(), quoted = FALSE,
                             segmentColors = initialColors,
                             createlegend = TRUE,
                             barcolor = 'steelblue') {
  installExprFunction(expr, "data", env, quoted)
  nRow <- dim(data())[1]
  nCol <- dim(data())[2]  
  if(length(segmentColors) < nRow) segmentColors = c(segmentColors, rep(initialColors, 10))
  #segmentColors = initialColors[1:nCol]
  #segmentcolors = unname(sapply(colors()[2:(nCol+1)], function(color) rgb(c(col2rgb(color))[1], c(col2rgb(color))[2], c(col2rgb(color))[3], maxColorValue=255)))  

  function(){
    userdata = lapply(1:nRow, function(idx) list(State = rownames(data())[idx], freq = as.list(data()[idx,])))
    list(userdata = userdata, barcolor = barcolor, ssnames = colnames(data()), segmentcolors = segmentColors, 
         createlegend = createlegend, barcolor = barcolor)
  }  
  
}