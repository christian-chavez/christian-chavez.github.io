---
author: Christian Chavez
categories: math persistence
date: "2025-10-29 00:00:00 -0400"
layout: post
title: Computing the interleaving distance between two interval modules
---

I found nowhere the explicit computation of the interleaving distance
between interval modules, tough it is well known that it equals the
bottleneck distance.

In this block I want to show

# Preliminaries

We take $\mathds{R}$ as the category induced by the poset
$(\mathds{R},\leq)$.

## The category of persistence modules

A persistence module is

An interval module is a functor
$\mathds{R}\to \mathrm{Vect}(\mathbf{k} )$. Let $\mathbf{k}$ be an
arbitrary field, fixed throughout.

## The shift functor

## The interleaving distance between persistence modules

A $t$-interleaving of $U$ and $V$ is a pair of morphisms $(\phi, \psi )$
that make the diagrams $$\begin{tikzcd}
U \arrow[rd, "\phi"'] \arrow[rr, "\mathds{1}^{2t}_U"] &                                 & {U[2t]} & V \arrow[rd, "\psi"'] \arrow[rr, "\mathds{1}^{2t}_V"] &                                 & {V[2t]} \\
                                                      & {V[t]} \arrow[ru, "{\psi[t]}"'] &         &                                                       & {U[t]} \arrow[ru, "{\phi[t]}"'] &        
\end{tikzcd}$$ commute. If such a pair exists, we say that $U$ and $V$
are $t$-interleaved.

::: defi
**Définition 1**. The interleaving distance between two intervalmodules
is
$$d_T (U, V)=\inf \left\{t\geq 0 \mid \text { there exists a } t\text {-interleaving of } U \text { and } V\right\}.$$
:::

# The computation
