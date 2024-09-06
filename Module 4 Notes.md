---
aliases:
  - Productivity R Workflow - Module 4
tags:
  - type/notes
  - R
  - workflow
  - quarto
  - git
number headings: first-level 1, max 3, start-at 1, 1.1
---
# 1 What is GitHub?
GitHub can help you solve some significant challenges in:

- 🔥 **Safety** → Imagine the horror if your computer crashed! To safeguard your hard work, relying solely on a hard drive won't cut it; it's time to embrace the cloud.

- ✉️ **Sharing** → Sending your work via email feels antiquated, doesn't it? Merely sharing the qmd file won't suffice; your colleagues need the ability to rerun your analysis and stay up-to-date with your latest insights.

- 🦕 **History** → Ever wished you could rewind time to a previous project version? With no project history, tracking changes feels like navigating a labyrinth.

- 🤝 **Collaboration** → Picture a colleague eager to contribute a few lines to your script. Without a collaborative platform, coordinating efforts becomes a logistical nightmare.
## 1.1 Anatomy of a GitHub profile
Apart from a profile picture and a bit of general info, **a GitHub homepage is essentially a collection of repositories** (or repos).
![[Pasted image 20240901104759.png]]
## 1.2 Anatomy of a GitHub repository
![[Pasted image 20240901104848.png]]

## 1.3 GitHub in a nutshell
GitHub is a bit like a Dropbox (but way better). It's a **safe place** where your work is **duplicated**, and where folders are called **repositories**.

GitHub serves as the **ultimate reference point**, or "source of truth." While your work can be replicated across multiple computers, it's the version stored on GitHub that takes precedence in case of **conflicts**.
# 2 Commit
GitHub Desktop enables us to mark significant improvements in our work as **individual steps**, known as commits.

With Git, your project becomes a **series of incremental steps**. Whenever you accomplish something you're satisfied with, we document it as a step, which we call a **commit**.

![[Pasted image 20240901105816.png]]

Each step (commit) will be accompanied by a **brief message** detailing the changes made.

This allows us to revisit any of these commits at **any point in time**. Thanks to Git, we can precisely track the progression of our analysis between each step.
#### Mental model update
Our local work now operates within **two distinct states**. When you implement a change, your files deviate from what is currently tracked by GitHub Desktop, marking them as **uncommitted**.

When you **commit** your changes, you **synchronize** the current state of your folder with GitHub Desktop.

![[Pasted image 20240901110001.png]]

> [!CAUTION] You need to push
> However, there's one crucial piece missing from the puzzle! These changes are currently **recorded locally only**. It's time to take them online by **pushing** them to GitHub.

# 3 Push
Our work folder exists in duplicate: one version resides locally, while the other is stored on [github.com](https://www.github.com/).

Throughout the previous lessons, we've made changes to the local version of the repository, encapsulated in several **commits**.

Now, it's time to **synchronize** the local changes with the version on GitHub! This process is accomplished through a procedure known as a **push**.

![[Pasted image 20240901110150.png]]

#### Workflow ready

> [!NOTE] Summary
> Here's a recap: You **edit** your code and make a **commit** whenever you've accomplished something significant. Then, when you're ready for your work to be secure and visible to others, you **push** your changes.

Now, the ball is in your court! Seize this opportunity:
✨ **Turn this into your new work routine. ✨**

# From Repo to Website
The `analysis.html` file that you pushed into your repo can only be seen as code.

**Only web browsers**, such as Firefox or Chrome, have the ability to transform `.html` into a visually appealing, colored, and formatted website.
#### The solution
GitHub allows to transform a repository into a **website**!

Step-by-step:
1. Go to your GitHub repo that contains your project.
2. Click `Settings`.
3. On the left panel click `Pages`.
4. In the `Branch` section , pick `main` instead of `none` in the select button.
5. Click `save`. Wait 2 minutes.


