---
layout: post
title: new blog
published: false
---

Este blog solo sirve para testear LaTeX.

los dos dólares no funcionan, pero el dólar inline sí.

Differential \\(eudj\\) geometry studies smooth manifolds and the structures defined on them, such as metrics, connections, and curvature. A \\(m\\) manifold \\(ueh + \in_A^b = Z + \mathcal{Z}\\) of dimension $n$ locally resembles $\mathbb{R}^n$, allowing us to define tangent spaces $T_pM$ at each point $p \in M$. Given a smooth map $f : M \rightarrow N$ between manifolds, the derivative 
\\[
df_p : T_pM \rightarrow T_{f(p)}N
\\]
maps tangent vectors in $M$ to tangent vectors in $N$. 

One key object of study is the Riemannian metric $g$, a smoothly varying positive-definite inner product on the tangent bundle. This allows us $c+cd=d0d$ to measure distances and angles on $M$, and to define the length of a curve $\gamma : [a, b] \rightarrow M$ as

\\[
\text{Length}(\gamma) = \int_a^b \sqrt{g(\dot{\gamma}(t), \dot{\gamma}(t))} \, dt.
\\]

From the metric, we can derive the Levi-Civita connection, which allows us to differentiate vector fields along curves, and the Riemann curvature tensor $R$, which measures the failure of second covariant derivatives to commute. One important result in differential geometry is the Gauss-Bonnet theorem, which relates the integral of the Gaussian curvature $K$ over a surface $S$ to the Euler characteristic 

This theorem beautifully connects geometry and topology, providing deep insights into the structure of surfaces. \\[A=E+F\\] hola?

Moreover
let try 
the following code 

```tex
$$
\begin{aligned}
  a &= b + c \\
  d + e &= f
\end{aligned}
$$
``` 
this gives 

$$
\begin{aligned}
  a &= b + c \\
  d + e &= f
\end{aligned}
$$

it does work. be sure to add an empty line before the display mathblock. Unfortunately, align* does not work (but i could make align work).
i wish align would work. try this 

```latex
$$
\begin{align*}
  a &= b + c \\
  d + e &= f\\
  A/(fX-1) &\cong A_f
\end{align*}
$$
```
this gives 

$$
\begin{align*}
  a &= b + c \\
  d + e &= f\\
  A/(fX-1) &\cong A_f
\end{align*}
$$

omg, i got it working! it also work without the star (try it).
The trick was to put the envs inside the double dollars.

now lets try a  commutative diagram.

```tex 
$$
\begin{CD}
   A @>a>> B \\
@VbVV @AAcA \\
   C @= D
\end{CD}
$$
```
this gives 

$$
\begin{CD}
   A @>a>> B \\
@VbVV @AAcA \\
   C @= D
\end{CD}
$$

Unfortunately, the vertical arrows look bad, like broken.
maybe convert cds to svgs anyways.