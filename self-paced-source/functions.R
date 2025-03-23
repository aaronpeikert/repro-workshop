library(whisker)

# for additional info box
generate_additionalinfo <- function(links, title, text, direction) {
  template <- '
<div class="infobox" onclick="window.open(\'{{links}}\', \'_blank\')">
  <h2 class="infobox-title">{{title}}</h2>
  <p class="infobox-content">{{text}}</p>
</div>
  '
  
  values <- list(links = links, title = title, text = text)
  
  html <- whisker.render(template, values)
  
  return(html)
}

generate_reprodudes <- function(links, title, text) {
  template <- '
<div class="infoboxgpt" onclick="window.open(\'{{links}}\', \'_blank\')">
  <h2 class="infobox-titlegpt">{{title}}</h2>
  <p class="infobox-contentgpt">{{text}}</p>
</div>
  '
  
  values <- list(links = links, title = title, text = text)
  
  html <- whisker.render(template, values)
  
  return(html)
}


library(whisker)

# Generate a full width additional info box
generate_fullwidthinfo <- function(links, title, text) {
  template <- '
<div class="infobox-full" onclick="window.open(\'{{links}}\', \'_blank\')">
  <h2 class="infobox-title">{{title}}</h2>
  <p class="infobox-content">{{text}}</p>
</div>
  '
  
  values <- list(links = links, title = title, text = text)
  
  html <- whisker.render(template, values)
  
  return(html)
}


