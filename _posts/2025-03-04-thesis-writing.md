---
layout: post
title: The tools I used to write  my bachelor thesis
author: Christian Chávez
excerpt: "Tools and tips that helped me with the writing process of my bachelor thesis."
published: true
toc: true
---

<base target="_blank">

In this post I want to share the tools I used to write my bachelor thesis. 
I wrote my thesis using \\(\\LaTeX\\) with Tex Live, locally on my computer running   Linux.

In summary, I used the following tools:
- VS Code & Neovim, as my editors
- Zathura, as pdf viewer
- Git(Hub), for version control and backup
- Aspell, for spell checking
- Inkscape, for drawing figures



## VS Code and Neovim
I used the extension  [LaTeX Workshop](https://github.com/James-Yu/latex-workshop/wiki/Install) for VS Code. Its usefulness comes down to the shortcuts and snippets it provides, significantly speeding up the typesetting process. For instance, selecting a word and typing `fbf` makes it bold. In math mode, `@` brings up a list of symbols—e.g., `@a` expands to `\alpha` (see [here](https://github.com/James-Yu/latex-workshop/wiki/Snippets)). There are plenty of [predefined snippets](https://github.com/James-Yu/latex-workshop/wiki/Snippets), but we can add custom ones as well. For example, I use one that inserts an environment template and another that expands `fun` to `f:\R\to\R`.


<p align="center">
  <img src="/assets/media/snippet-example.gif" alt="Snippet Example">
</p>

Although I liked VS Code a lot, I discovered Vim a year ago, and Neovim quickly became my preferred editor. Reason? I like shortcuts so much. (Although the real power of Vim lies in macros.)   If you're unfamiliar with Vim, check out [this video](https://youtu.be/-txKSRn0qeA), and for a practical example, watch [this one](https://youtu.be/NzD2UdQl5Gc). There's a lot to say about Vim, but I won't go into details for now—just know that (Neo)Vim makes me far more efficient.


## Zathura 

I like this  PDF viewer for its    minimality. Take a look at its [webpage](https://pwmt.org/projects/zathura/). It has vim-like keybindings, so it is very easy to navigate around a pdf, no need to use a mouse at all.
Here is  a screenshot of VS Code alongside  Zathura on the right. (Btw: I use arch linux with bspwm as my tiling window manager.) 
 
![VS Code on the left and Zathura on the right](/assets/media/vscode-zathura.png)

Moreover, Zathura supports backward search (clicking on a specific location in the PDF will take you directly to the corresponding position in the source code). LaTeX Workshop comes with a built-in pdf viewer, but you can easily  change it to the one you like. 

## Git & GitHub  

Version control is essential for managing projects, and Git makes it seamless. I use GitHub to back up my work. For my \\(\\LaTeX\\)  documents, Git allows me to keep a clean history of edits, revert to previous versions, and sync across devices. (If something happens to my computer, I still have my thesis project in the cloud).  When I make a change to a `.tex` file and want to save   a version at this time, I run this:

```bash
git add -A
git commit -m "reviewed chapter homotopy"
git push origin main
```

To simplify the process, I  created this bash function:

```bash
function git-commit () {
    git add -A && git commit -m "$@"
}
```
Now, I can quickly commit changes with `git-commit "reviewed chapter homotopy"`. This way, the source code of my thesis is always safely backed up in a github repository. The integrated terminal in VS Code makes it very easy to create backups. It is even easier with Vim.



## Aspell 
 
[Aspell](http://aspell.net/)  is a command line program that lets you check the spelling of each word in a text file. It supports multiple languages and markup languages. For instance, to check a file named `chap02-category-theory.tex`, we use the command 
```bash
aspell -t -c chap02-category-theory.tex
```

Since ``.tex`` files contain commands that should not be checked, we use the `-t` flag to ignore \\(\\LaTeX\\) syntax. The `-c` flag opens an interactive mode, allowing you to review and correct misspelled words on the fly. Press any number from 1 to 9 to replace the word with the suggested correction.

<p align="center">
  <img src="/assets/media/aspell-example.gif" alt="Aspell checking example">
</p>



## Inkscape

We can draw in \\( \LaTeX \\) using TikZ or PGFPlots, but this method isn't very user-friendly since it's entirely command-based. Drawing is a visual process, and that's where [Inkscape](https://inkscape.org/) comes in handy. It allows us to export figures in \\( \LaTeX \\) format, rendering text directly at compilation time. Here are some examples:

<div style="display: flex; justify-content: center; align-items: center; gap: 15px; margin-bottom:15px">
    <img src="/assets/media/klein-bottle.png" alt="Klein Bottle" style="max-width: 20%; height: auto;">
    <img src="/assets/media/torus.png" alt="Torus" style="max-width: 35%; height: auto;">
    <img src="/assets/media/functor-illustration.png" alt="Functor Diagram" style="max-width: 27%; height: auto;">
</div>

The process is quite simple: draw anything you want, select `File > Export > PDF file`, and then import the PDF as you would with any figure in \\( \LaTeX \\). However, to compile the text with \\( \LaTeX \\), we need an additional step. The text you see in the figures above is written directly in Inkscape using \\( \LaTeX \\) commands. For instance, the second one looks like this before exporting:


<p style="text-align: center;">
  <img src="/assets/media/torus-drawing.png" alt="Drawing in Inkscape" style="width: 50%; display: block; margin: auto;">
</p>


Open the export dialog and choose to _Omit text in PDF and create LaTeX file_. You get a file with extension `.pdf_tex`, which is later  imported into the \\(\\LaTeX\\) document.

<p align="center">
  <img src="/assets/media/inkscape-example.png" alt="Inkscape export example">
</p>

In your preamble, include the following:
{% raw %}
````tex
\usepackage{import}
\usepackage{xifthen}
\usepackage{pdfpages}
\usepackage{transparent}

\newcommand{\incfig}[2]{%
    \def\svgwidth{#1\linewidth}
    \import{./images/}{#2.pdf_tex}
}
````
{% endraw %}

Then you can use the command `\incfig{width}{figure-name}` to include the figure in your   document, where `width` is a number from 0 to 1. For example, to include the drawing above in a figure environment,  use something like this 

```tex
\begin{figure}
    \centering
    \incfig{0.95}{figure-name}
    \caption{}
    \label{fig:ref}
\end{figure}
```

I have to give credit to [this blog post](https://castel.dev/post/lecture-notes-2/) by Gilles Castel, from which I learned this stuff. Read that blog for more details.



## Bonus

- **[Obsidian](https://obsidian.md/)**: for taking notes. It helped me implement a digital version of the Zettelkasten method.  The tag feature is really useful for organizing ideas, notes, to-do lists, etc.
- **[Xournalpp](https://xournalpp.github.io/)**: for sketching ideas. Sometimes, I feel like I'm wasting too much paper, so I take notes using a Wacom tablet. It's especially useful when studying from a book in PDF format.  
- **[Flameshot](https://flameshot.org/)**: for screenshots. I mention it because it has a nice feature that allows pinning a screenshot to the screen.  

![](/assets/media/flameshot-example.gif)
