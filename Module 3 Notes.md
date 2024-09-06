---
aliases:
  - Productivity R Workflow - Module 3
tags:
  - type/notes
  - R
  - workflow
  - quarto
  - interactivity
  - tables
  - graphs
number headings: first-level 1, max 3, start-at 1, 1.1
---
# 1 Clean Tables
## 1.1 Interactive tables with `DT`
- This feature is incredibly handy to **display your input dataset** if it isn't too big. It offers readers the convenience of accessing the data directly **within** your report.
- The magic behind this functionality lies in the `DT` library. DT stands for `DataTables`: the JavaScript library behind it.
## 1.2 Static tables with `kable()`
- Quarto uses a package called `knitr` that comes with the function `kable()`. It offers a simple and efficient solution for generating clean, straightforward tables.
```r
# Load the knitr library
library(knitr)

# Compute some result
bill_length_per_specie <- data %>% group_by(species) %>% 
  summarise(average_bill_length = mean(bill_length_mm, na.rm = TRUE))

# Display in the Quarto report
kable(bill_length_per_specie)
```
# 2 Interactive Graphs
An interactive chart allows the user to **perform actions**: **zooming**, **hovering** a marker to get a tooltip, **choosing** a variable to display and more.

R offers a set of packages called the [html widgets](https://www.htmlwidgets.org/).

They allow to build interactive charts **directly from R**. 🔥
## 2.1 `Plotly` and `ggplotly()`
Conveniently create interactive `ggplot` graphs by wrapping your plot object (example `p`) into the `ggplotly()`.
```r
library(ggplot2)
library(gapminder)
library(ggplotly)

p <- gapminder %>%
  filter(year==1977) %>%
  ggplot( aes(gdpPercap, lifeExp, size = pop, color=continent)) +
  geom_point() +
  theme_bw()

ggplotly(p)
```
## 2.2 Going further
`Plotly` is **not always the ideal choice**

Consider these packages for different contexts:
- `Leaflet` is better suited for mapping.
- `Dygraph` excels in handling time series data.
# 3 Report header
## 3.1 Content
In Quarto, you have the flexibility to include extensive information in the document header.

Key fields to consider include:
- `title`, `subtitle`, and `description`, which provide immediate insight into the document's content
- `author` details such as `name`, `affiliation`, and `email` ensures transparency and accessibility, especially if the document is shared among multiple individuals
- date using the `today` keyword which ensures that each version is properly timestamped for reference.

Sample header:
```r
title: "Exploring the Simpson's Paradox..."
subtitle: "And simultaneously demonstrating ..." 
description: "This document is..."

author: 
name: "Yan Holtz"
affiliation: "Independant 😀"
email: yan.holtz.data@gmail.com

keywords: "Quarto, Paradox, Data Analysis"
date: today

...Other items not related with the header
```
## 3.2 Appearance
With our informative header in place, let's enhance its **visual appeal**.

One effective method is to utilize the `title-block-banner` option to introduce a **background color**, adding depth to the header. It subtly **elevates its presence**.

Avoid overly bright colors, which can be jarring. Instead, I suggest to opt for a subdued shade like light grey. Also, you can adjust the text color using the `title-block-banner-color` option for a cohesive look.

```r
---
...
title-block-banner: "#f0f3f5"
title-block-banner-color: "black"
...
---
```
## 3.3 Going further
Quarto opens up **endless possibilities** for customization.
- The [Front Matter](https://quarto.org/docs/authoring/front-matter.html) and [Title blocks](https://quarto.org/docs/authoring/title-blocks.html) sections provide a comprehensive list of out-of-the-box options, covering licenses, copyrights, citations, multiple authors, metadata labels, and more.
- Later in the course, we'll explore **CSS techniques** to customize any element within the report.
- For advanced users, [template partials](https://quarto.org/docs/journals/templates.html#template-partials) offer the ability to build the header structure from scratch, although this is a more advanced feature.

# 4 Apply your style with CSS
Quarto interprets your `.qmd` file, which includes Markdown text and R code.

With this input, it generates an HTML document. This document comes equipped with **numerous HTML tags** and **pre-defined CSS styles**, resulting in an aesthetically pleasing appearance right from the start.

It is possible to pass a CSS stylesheet (called `style.css` in the example below) to enforce our own style on top of the preset thanks to the `css` argument of the YAML header:
```r
---
title: "A doc with custom CSS"
format: html
css: style.css
---
```
> [!CAUTION] Where should I save the CSS file?
> Note that the `style.css` file must be saved in the same folder as the `.qmd` file.

# 5 Create your dataviz theme
## 5.1 A set of predefined theme


Within the `ggplot2` library alone, [eight distinct themes](https://ggplot2.tidyverse.org/reference/ggtheme.html) are readily available, with `theme_grey()` serving as the default and `theme_minimal` emerging as a popular alternative.

Furthermore, beyond ggplot2's native themes, numerous [external packages](https://r-graph-gallery.com/192-ggplot-themes.html) offer additional thematic options. Among them, one that I love is the `theme_ipsum()` theme from the `hrbrthemes` package.
## 5.2 Make your own theme
`ggplot2` offers a versatile `theme()` function that empowers users to tailer their visualizations to their exact specifications.

Customizing a theme can feel **overwhelming**, with numerous options available to tweak and adjust.

To elevate your visualizations to the next level of refinement, creating your **own theme** based on one of the predefined themes is the optimal strategy.

You can do so by defining your custom theme as a **function**, for example:
```r
yan_holtz_theme <- function() {
  theme_ipsum() +
    theme(
      plot.title = element_text(color = "#69b3a2", size = 18, face = "bold"),
      axis.text.x = element_text(size = 7),
      axis.text.y = element_text(size = 7)
    )
}
```
> [!TIP] Set theme for the whole documents
> You can also set the theme at the beginning of your Quarto doc and stop worrying about style for the whole study.
> ```r
> theme_set(yan_holtz_theme())
> ```

# 6 Going further
This lesson has covered the process of creating your own ggplot2 theme.

However, since this isn't a dedicated data visualization course, I haven't delved deeply into ggplot2 options. It's up to you to decide how much customization you want to apply to your charts. Here are a few suggestions:

- Incorporate your organization's **font**.
- Integrate your company's **logo** or branding elements.
- Develop custom **color scale** functions.
# 7 Quarto Tips and Tricks
Yan recommends perusing the [compilation of Quarto tips](https://www.productive-r-workflow.com/quarto-tricks) and tricks he maintain.