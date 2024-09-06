---
aliases:
  - Productivity R Workflow - Module 2
tags:
  - type/notes
  - R
  - workflow
  - quarto
---
# 1 Clean Figures
## 1.1 Figure Sizes

> [!NOTE] How to control figure size
> You can control both the **width** and **height** of a figure using the `fig.width` and `fig.height` options. These dimensions are specified in **inches**.

> [!TIP] Creating a figure that spans the full width of the page
> On the web, we usually have **96 Pixels Per Inch** (PPI). And by default, a Quarto document is rendered with a width of 900 pixels. Setting the chart's width to **9 inches** thus ensures it spans the **full width** of the page.
## 1.2 Responsiveness

- By default Quarto creates responsive figures **automatically**.
## 1.3 Multiple figures

- By default, charts generated within a single code chunk are displayed **one after the other vertically**, consuming considerable space on the page.
- **Two effective strategies** for optimizing layout and conserving space:
	- [Patchwork](https://r-graph-gallery.com/package/patchwork.html)
		- This package is an **extension** of the `ggplot2` package, designed to simplify the process of **combining multiple plots into a single layout**.
		- Check out [this post](https://r-graph-gallery.com/package/patchwork.html) for a short introduction.
	- [Quarto](https://thomasmock.quarto.pub/test-lists/)
		- Straightforward use of the `layout-ncol` feature, which allows you to specify the **number of columns** across which your graphs should be displayed
		- The added advantage of this approach is **responsiveness**. Graphs will **automatically stack vertically** when viewed on narrower screens.
		- Check out [this post](https://quarto.org/docs/authoring/figures.html#custom-layout) for more complicated layouts.
## 1.4 Caption
- Adding captions is straightforward with the `fig.cap` chunk parameter. 
- A useful technique I favor is placing the caption **in the margin**, achievable through a specific YAML header parameter: 
```r
---
title: "Penguin Analysis"
...other YAML header parameters
fig-cap-location: margin
---
```
![[Pasted image 20240901070803.png]]
# 2 more little tips
1. Table of content
	- Use the `toc` option to include an automatically generated **table of contents**
	- Play with these options:
		- `toc-depth`: number of section levels to include
		- `toc-expand`: how much of the table of contents to show initially
		- `toc-title`: TOC title
		- `toc-location`: TOC side, `right` or `left`
2. Section numbering
	- Use the `number-sections` option in the YAML header for **automatic section numbering**.
	- This approach directly aligns with the hierarchy established by your headings: `#`, `##`, `###` in Markdown.

> [!CAUTION] Avoid manually numbering your titles!
> Manual numbering is **time-consuming** and **prone to errors**, especially in lengthy or complex documents.

3. Equation
	- Use **LaTeX syntax** to add equations in a Quarto document
		- For **inline equations**, enclose your LaTeX code within single dollar signs (`$`). For example, `$E=mc^2$` renders the famous equation inline with the text.
		- For **display equations**, which are centered and on their own line, use double dollar signs (`$$`) around your LaTeX code. For example, `$$E=mc^2$$` will render the equation centered on its own line.
		- If you don't know how to write equations, you can check [this full reference](https://en.wikibooks.org/wiki/LaTeX/Mathematics), but [this tutorial](https://latex-tutorial.com/tutorials/amsmath/) is more user friendly.
4. Dynamic Variable Integration
	- Dynamically incorporate a variable into your text, using the `r variable_name` format.
	- Powerful method that ensures your document remains **up-to-date**. That is, if the value of the variable changes due to a modification, the displayed value in your text will automatically adjust to reflect this new result.
5. Callouts
	- Callouts in Quarto documents allow for the inclusion of specialized blocks of text to guide the reader’s attention to important pieces of information.
	- Callouts are created by enclosing the text in a block **with a specific class attribute** (e.g., `{.callout-note}` or `{.callout-tip}`)
```r
::: {.callout-note}
A few notes that require specific attention!
:::
```

