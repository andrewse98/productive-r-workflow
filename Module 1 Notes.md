---
aliases:
  - Productivity R Workflow - Module 1
tags:
  - type/notes
  - R
  - workflow
---
# 1 Befriend {Tidyverse}
# 2 Automatic formatting with {styler}
# 3 Self-contained project

> [!TIP] Tips
> A well-structured R project should be **self-contained**, ensuring that all the necessary **data**, **scripts**, and **resources** are included within its own ecosystem for consistent and **reproducible** results.

There isn't a single definitive method on how a **project folder** should be organized. However, a recommended approach might begin as follows:
```
project/
- README.md    # Project description written in markdown
- R/           # Where the R scripts live
- input/       # Data files
- output/      # Results: plot, tables, ...
```
Another approach, might use [Emily Riederer's](https://emilyriederer.netlify.app/post/rmarkdown-driven-development/) structure:
```
project/
- analysis/    # Final reports
- src/         # Scripts
- output/      # Data artifacts
- data/        # Raw source data
- docs/        # Documentation
- ext/         # External files
```
# 4 Ditch setwd()

> [!TIP] Tips
> RStudio projects make it straightforward to make your data analysis isolated in **its own working environment**. Each project will have its own **working directory**, **workspace** and **source documents**.

- Three main **benefits**:
	1. No more setwd(): properly set working directory
	2. Isolation of workspaces: easily jump from one project to the other in IDE
	3. Set project options: personalize project settings

> [!NOTE] Additional mistakes to avoid
> 1. Don't start an R script with `rm=(list=ls())`. It only removes all the variables from the current environment, but **keep all the packages loaded**.
> 2. Don't save `.RData` workspace. Your analysis must be able to run from **scratch** any time.
> 3. Don't resort into **absolute path**, use an R project and relative path instead.

# 5 Never ever modify raw data

- Editing a cell in a spreadsheet manually is one of the mechanisms that leads to the research reproducibility crisis. 
- Edit your spreadsheet **with code** instead to keep track of the exact data preparation steps to perform. This improves transparency and allows other people to easily review and reproduce your work.
# 6 Read directly from Excel

Avoid converting `.xlsx` files into `.csv`, because it comes with **some drawbacks**:
- **Time consuming**: one more unecessary step in your pipeline
- **Error prone**: you can easily lose some formatting while doing the conversion, or struggle with special characters
- **Lose the Multi-Sheet Structure**
- **Size Limitations**: you are now storing the data twice!
- **Metadata**: Excel files can contain metadata like comments, author information, and other properties that are lost when converted to `.csv`

Instead, consider using the `readxl` package which comes with additional utilities:
- **Read a specific sheet:**
```r
data <- read_excel("data.xlsx", sheet = "sheetNameOrNumber")
```
- **Specify how missing data are represented:**
```r
data <- read_excel("data.xlsx", na = "-")
```
- **Specify column types:**
```r
data <- read_excel("data.xlsx", col_types = c("date", "skip", "guess", "numeric"))
```
# 7 Create function, ditch duplication

Duplicated codes (more than two times) are **hard to work with**:
- **Hard to read**: that's a lot of code!
- **Hard to maintain**: if you want to change something, you will have to make the change 3 times.
- **Error prone**: one day, you will update all items and insert a bug in one. Or you will update an item and forget about the others.

> [!TIP] How to name your function
> It is best that your function name includes a **verb** and **self-explanatory**.
# 8 Split your work

Don't end up with 2000 lines long file that takes 35 minutes to run:
- **Slow**: when you open R again to modify the end of your script, you have to run the beginning again!
- **Hard to maintain**: navigating a 2000 lines long file is not fun at all.
- **Bad for collaboration**: if you are several people working on the same massive file, it is very likely that you get conflicts.

> [!TIP] 
> **Modularize** your code!

There are **three** main ways to modularize:
1. Use functions. `source()` them.
2. Split your analysis in several steps: `01_exploratory_analysis.R`, `02_modelling.R`, ...
3. Create intermediary dataset
	- The initial stage of **loading**, **cleaning**, and **wrangling** a dataset may require significant computational resources. Thus, it's a recommended practice to **isolate this step** in a separate script, allowing the script to output the **cleaned dataset**.
	- Isolating **prevents** the need to re-run computationally intensive step during subsequent phases of the analysis.
	- One can save the cleaned dataset using the `.rds` format which provide an efficient way for storing R objects. 

An **example** of modularizing your code:![[Pasted image 20240830105255.png]]
# 9 Use shortcuts
