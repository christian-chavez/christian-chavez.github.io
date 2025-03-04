---
layout: post
title: How I wrote my bachelor thesis
author: Christian Chávez
excerpt: "Tools and tips that helped me with the writing process of my bachelor thesis."
published: true
toc: true
---

<base target="_blank">

In this post I want to share the tools I used to write my bachelor thesis.
I won't discuss the process of completing a research project or such.
I wrote my thesis using \\(\\LaTeX\\) with Tex Live, locally on my computer running Arch Linux.

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

Although I liked VS Code a lot, I discovered Vim a year ago, and Neovim quickly became my preferred editor. Reason? I like shortcuts so much. (But the real power of Vim lies in macros.)   If you're unfamiliar with Vim, check out [this video](https://youtu.be/-txKSRn0qeA), and for a practical example, watch [this one](https://youtu.be/NzD2UdQl5Gc). There's a lot to say about Vim, but I won't go into details for now—just know that (Neo)Vim makes me far more efficient.


## Zathura 

I love this PDF viewer for its    minimality. Take a look at its [webpage](https://pwmt.org/projects/zathura/). It has vim-like keybindings, so it is very easy to navigate around a pdf, no need to use a mouse at all.
Here is  a screenshot of VS Code alongside  Zathura on the right. (Btw: I use arch linux with bspwm as my tiling window manager.)

![VS Code on the left and Zathura on the right](/assets/media/vscode-zathura.png)

## Git & GitHub  

Version control is essential for managing projects, and Git makes it seamless. I use GitHub to back up my work. For my \\(\\LaTeX\\)  documents, Git allows me to keep a clean history of edits, revert to previous versions, and sync across devices. I usually follow a simple workflow when I make a change to a `*.tex` file:  

```bash
git add -A
git commit -m "fix typo in page x"
git push origin main
```

To simplify the process, I  created this bash function

```bash
function git-commit () {
    git add -A && git commit -m "$@"
}
```
Now, I can quickly commit changes with `git-commit "fix typo in page x"`. This way, the source code of my thesis is always safely backed up in a github repository.

## Aspell 

_Editing..._

## Inkscape

_Editing..._


## Bonus:
- **Obsidian**: for taking notes. It helped me implement a digital version of the Zettelkasten method.  The tag feature is really useful for organizing ideas and notes.
- **Xournalpp**: for sketching ideas. Sometimes, I feel like I'm wasting too much paper, so I take notes using a Wacom tablet. It's especially useful when studying from a book in PDF format.  
- **Flameshot**: for screenshots. I mention it because it has a great feature that allows pinning a screenshot to the screen.  

![](/assets/media/flameshot-example.gif)
