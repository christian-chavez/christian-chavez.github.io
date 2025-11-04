---
layout: post
title: Computing the interleaving distance between two interval modules
author: Christian Chávez
# excerpt: "Tools and tips that helped me with the writing process of my bachelor thesis."
published: true
toc: true
---

<style>
blockquote {
  background-color: #e8f7e8;
  border-left: 4px solid #6bbf59;
  padding: 0.8em 1.2em;
  margin: 1.2em 0;
  font-style: normal;
  color: #1a1a1a;
  border-radius: 6px;
}

.bluebox {
  background: #e6f3ff;
  border-left: 4px solid #4b9de1;
  padding: 0.8em 1.2em;
  margin: 1.2em 0;
  color: #1a1a1a;
  border-radius: 6px;
}

.yellowbox {
  background: #fff8e1;
  border-left: 4px solid #ffb300;
  padding: 0.8em 1.2em;
  margin: 1.2em 0;
  border-radius: 6px;
}
</style>

```matlab
Post under construction
```


I found nowhere the explicit computation of the interleaving distance
between interval modules, 
so I decided to post it here.

# Preliminaries

Let $\mathbf{k}$ be an arbitrary field, fixed throughout. We denote by
$\mathbb{R}$ either the real line or the category induced by the poset
$(\mathbb{R},\leq)$. All functors are covariant.

## The category of persistence modules

A **persistence module** is a functor
$\mathbb{R}\to \mathrm{Vect}(\mathbf{k} )$.


**Example 1.** Let $I\subseteq \mathbb{R}$ be an interval.
Define $\mathbf{k}^I\colon \mathbb{R}\to \mathrm{Vect}(\mathbf{k} )$ by


$$
t\mapsto \begin{cases}
\mathbf{k} &\text{ if } t\in I\\
\mathbf{0}&\text{ else }
\end{cases}
\qquad\text{and}\qquad
r\to s\; \mapsto \begin{cases}
\mathbf{k}\xrightarrow{\mathrm{Id}} \mathbf{k} &\text{ if } r,s\in I\\
\mathbf{0}&\text{ else }
\end{cases}
$$

on objects and morphisms, respectively. Here $\mathbf{0}$
denotes both the zero vector space and the zero map, respectively. We
call $\mathbf{k}^I$ the **interval module** over $I$.


<div class="bluebox">
Remark. Interval modules are the building blocks of persistence modules. In
fact, one objective of persistence theory is to understand persistence
modules by decomposing them into interval modules. However, this is not
always possible. A situation when such a decomposition is guaranteed is
when we work with finite dimentional vector spaces, that is, if we work
over $\mathrm{vect}(\mathbf{k} )$ instead of
$\mathrm{Vect}(\mathbf{k} )$.
</div>



The concise definition of persistence module can be expanded to aide
comprehension. Let $V\colon \mathbb{R}\to \mathrm{Vect}(\mathbf{k} )$ be
a persistence module.

- For each $t\in \mathbb{R}$ and each arrow $r\to s$ denote $V(t)=V_t$
    and $V(r\to s) = v_s^r$.

- Since $V$ is a functor, we have the so-called **composition law**: $v_t^s\circ v_s^r = v_t^r$ whenever $ r\leq s\leq t$ and     $V(t\to t) = v_t^t = \mathrm{Id}_{V_t}$.

Thus, a persistence module $V$ is a family 
$\left(V_t\right)$ 
of vector spaces
together with a family
$\left(v_t^s \colon V_s\to V_t\mid s\le t\right)_{s,t\in\mathbb{R}}$

We got a set theorical definition from the categorical one above. In
fact, the two are equivalent. We will use the first, but prefer the
notation of the second.

Since persistence modules are functors, we can consider the natural
transformations between them, and since those can be composed (using
vertical composition) we obtain a category.

**Definition 1**. The **category of persistence modules** is
$\mathbf{X} = \mathrm{Fun}(\mathbb{R}, \mathrm{Vect}(\mathbf{k} ))$.

Yes, this category is fun. Concretely, a morphism of persistence modules
$\alpha\colon U\to V$ is a family of linear maps
$(\alpha_r\colon U_r\to V_r)_{r\in \mathbb{R}}$ such that the diagram

<div id="eq:naturality-morphism-persistence-modules" align="center">
  <img src="/assets/media/post-interleaving/diagram_01.svg" alt="diagram 1" width="150"><br>
  <em>(1)</em>
</div>

 commutes for all $s\le t$, i.e.
$v_t^s\circ \alpha_s=\alpha_t\circ u_t^s$.



**Example 2**. If $U$ and $V$ are any persistence modules, then there is
a zero morphism $U\to V$, given by
$(  U_r\xrightarrow{\mathbf{0}} V_r)_{r\in\mathbb{R}}$, and denoted by
$\mathbf{0}$.

**Example 3**. Consider two interval modules $\mathbf{k}^{[0,1]}$ and
$\mathbf{k}^{[0,2]}$. For each $r\in \mathbb{R}$, define

$$
\alpha_r = \mathbf{k}^{[0,1]}(x)\to\mathbf{k}^{[0,2]}(x)
$$

So
$\alpha=(\alpha_r)_{r\in\mathbb{R}}$ is the inclusion
$\mathbf{k}^{[0,1]}\hookrightarrow\mathbf{k}^{[0,2]}$. However, $\alpha$
is not a morphism of persistence modules. For example, for the arrow
$1\to 2$ we have

$$\mathbf{k}^{[0,1]}(1\to 2) = \mathbf{k}\xrightarrow{\mathrm{0}} \mathbf{0}$$

and

$$\mathbf{k}^{[0,2]}(1\to 2) = \mathbf{k}\xrightarrow{\mathrm{Id}} \mathbf{k}$$

but $\alpha_1 = \mathbf{k}\xrightarrow{\mathrm{Id}} \mathbf{k}$ and
$\alpha_2 = \mathbf{0}\xrightarrow{\mathrm{0}} \mathbf{k}$. Therefore,
the diagram

<div style="text-align:center; margin:1em 0;">
  <img src="/assets/media/post-interleaving/diagram_02.svg" alt="diagram 2" width="150">
</div>

does not commute. The same situation happens if we'd taken $r\to s$ with
$r\in [0,1]\cap [0,2]=[0,1]$ and $s\in [0,2]\setminus [0,1]=(1,2]$.

## The shift functor

Let $U$ be a persistence module and fix any $t\in \mathbb{R}$. Define a
new persistence module $U[t]$ by 

$$U[t](r)  = U_{r+t}
\quad\text{and}\quad 
U[t](r\to s) = u_{r+t}^{s+t}.$$

We say that $U[t]$ is a **shifted
module**. Note that

$$U[0]=U
\quad\text{and}\quad
U[t][t'] = U[t+t']$$

for any $t,t'\in \mathbb{R}$. Similarly, for any
morphism of persistence modules $\alpha\colon U\to V$, we can define a
**shifted module morphism**
$\alpha[t] = (\alpha_{r+t})_{r\in \mathbb{R}}$.

Suppose we've made two shifts of $U$, say $U[s]$ and $U[t]$, where
$s\leq t$. We might ask ourserlves: *what is the relationship between
these shifted modules?* In other words, we wonder if there is a
canonical natural transformation $\alpha\colon U[s]\to U[t]$. To find
out, consider any $p\to q$ and apply both $U[s]$ and $U[t]$ to this
arrow. We get

$$U[s](p\to q)\; =\; U_{p+s}\xrightarrow{u_{q+s}^{p+s}} U_{q+s}$$

and

$$U[t](p\to q) \;=\; U_{p+t}\xrightarrow{u_{q+t}^{p+t}} U_{q+t}.$$

Since $\alpha=(\alpha_r )_{r\in \mathbb{R}}$ is determined by its components,
we need to find the vertical arrows that make the square

<div style="text-align:center; margin:1em 0;">
  <img src="/assets/media/post-interleaving/diagram_03.svg" alt="diagram 3" width="200">
</div>

commute. Set $\alpha_p = u_{p+t}^{p+s}$ and $\alpha_{q}=u_{q+t}^{q+s}$.
Then the composition law give us

$$u_{q+t}^{p+t} \circ  u_{p+t}^{p+s} = u_{q+t}^{p+s} = u_{q+t}^{q+s}\circ u_{q+s}^{p+s},$$

which means the square commutes. So, yes there is a canonical way to map
$U[s]$ to $U[t]$. Denote $\alpha = U[s\to t]$ and define

$$U[s]\xrightarrow{U[s\to t]} U[t]\;\; = \;\;\left( u_{r+t}^{r+s} \right)_{r\in \mathbb{R}}.$$


**Remark 1**.

-   For $t\geq 0$, we denote $\mathbb{1}^{t}_U = U[0\to t]$.

-   Observe that

    $$\mathbb{1}^{0}_U = U[0\to 0] = (u_r^r)_{r\in \mathbb{R}} 
    = (\mathrm{Id}_{U_r})_{r\in \mathbb{R}}
    =\mathbb{1}_{U}$$
    
    is an identity natural transformation. So, for
    $t\geq 0$, we might think of $\mathbb{1}^{t}_U$ as a generalized
    identity.

-   By definition, we get $U[t\to t] = \mathbb{1}_{U[t]}$ for any
    $t\in \mathbb{R}$. Moreover, if $r\leq s\leq t$, for any
    $p\in \mathbb{R}$ we have 
    
    $$\begin{aligned}
    \left( U[s\to t] \circ U[r\to s] \right)_p &= U[s\to t]_p \circ U[r\to s]_p\\
    &= u_{p+t}^{p+s} \circ u_{p+s}^{p+r}\\
    &= u_{p+t}^{p+r}\\
    &= U[r\to t]_p
    \end{aligned}$$ 
    
    thanks to the composition law. Thus

    $$U[s\to t] \circ U[r\to s] = U[r\to t].$$

The last remark leads us to the following definition.

**Definition 2**. The **shift functor**
$T = [\,\cdot\,]\colon \mathbb{R}\to \mathrm{End}(X)$ is defined as
follows

1. Objects: for each $t\in \mathbb{R}$ we have a functor
    $T(t) \colon X\to X$ denoted $T_t$, which is defined by
    $T_t( U) = U[t]$ on objects $U\in X$, and by
    $T_t(\alpha) = \alpha[t] = (\alpha_{r+t})$ on
    morphisms $\alpha=(\alpha_r)_{r\in \mathbb{R}}$. (Equivalently, we
    can define $T_t(\alpha) = \alpha \star [t]$, using a whiskering)

2.  Morphisms: for each $r\to s$, define a natural transformation
    $T(r\to s)\colon T_r\to T_s$ by
    $$T(r\to s) = \left( U[r\to s] \right)_{U\in X}.$$

**Example 4**. Let $\mathcal{I}=\mathbf{k}^I$ be an interval module and
fix $t\in \mathbb{R}$. Then, for any $r\in \mathbb{R}$,

$$
\mathbf{k}^I(r+t) = \begin{cases}
\mathbf{k} &\text{ if }r+t\in I\\
\mathbf{0}&\text{ else }
\end{cases}
= 
\begin{cases}
\mathbf{k} &\text{ if }r \in I-t\\
\mathbf{0}&\text{ else }
\end{cases}
=
\mathbf{k}^{I-t}(r)$$ 

and similarly, for any $r\leq s$ we obtain

$$\mathbf{k}^I(r+t\to s+t) = \mathbf{k}^{I-t}(r\to s).$$

Thus
$\mathbf{k}^I[t] =  \mathbf{k}^{I-t}$. We will denote
$\mathcal{I}[t]=\mathcal{I}-t$.

## The interleaving distance between persistence modules

Let $U$ and $V$ be persistence modules. A $t$-**interleaving** of $U$
and $V$ is a pair of natural transformations
$(\phi\colon U\to V[t], \; \psi\colon V\to U[t] )$ that make the
diagrams

<div style="text-align:center; margin:1em 0;">
  <img src="/assets/media/post-interleaving/diagram_04.svg" alt="diagram 4" width="500">
</div>

commute. If such a pair exists, we say that $U$ and $V$ are
$t$-**interleaved**.

**Example 5**. Two persistence modules are isomorphic if and only if
they are $0$-interleaved. Thus, we can think of interleavings as
generalized isomorphisms. Let us see why\...

**Definition 3**. The **interleaving distance** between two persistence
modules $U$ and $V$ is

$$d_T (U, V)=\inf \left\{t\geq 0 \mid \text {there exists a } t\text {-interleaving of } U \text { and } V\right\}.$$

in case there is at least one interleaving of $U$ and $V$. If no such
interleaving exists, we set $d_T (U, V)= \infty$ .

The subscript $T$ remind us that $d_T$ depends on the shift functor. On
the other hand, $d_T$ is not an actual metric, but a *pseudometric*,
since $d_T (U, V)=0$ does not imply $U = V$.



Let us prove $d_T$ satisfies the triangle inequality.

# The computation

We'll do the computation of $d_T(\mathbf{k}^I,\mathbf{k}^J)$ for the
case of closed intervals. Let $I=[a,b]$ and $J=[c,d]$. Denote by
$\mathcal{I}=\mathbf{k}^I$ and $\mathcal{J}=\mathbf{k}^J$ the associated
interval modules.

Our strategy is to find some apropriate bounds for $d_T (\mathbf{k}^I,\mathbf{k}^J)$. Befor
going into the search for the pair of morphisms that would make the
triangles above commute, we need to know how are the morphisms between
arbitrary interval modules, because then we can characterize the
morphisms between shifted interval modules.

Let $\alpha\colon \mathcal{I}\to \mathcal{J}$ be any persistence module
morphism. For each $s\in \mathbb{R}$ we have a map of vector spaces
$\alpha_s \colon \mathcal{I}_s\to \mathcal{J}_s$. The only available
options for $\mathcal{I}_s$ and $\mathcal{J}_s$ are either $\mathbf{k}$
or $\mathbf{0}$.

<p align="center">
  <img src="/assets/media/interval_module.gif" alt="Interval module">
</p>


Note that, if $s\notin I\cap J$, then either $\mathcal{I}_s=\mathbf{0}$
or $\mathcal{J}_s=\mathbf{0}$, and in any case $\alpha_s$ is the zero
map. Thus, we always get trivial morphisms outside of the intersection.
Inside the intersection, when $s\in I\cap J$, we have a linear map
$\alpha_s\colon \mathbf{k}\to \mathbf{k}$, but since $\mathbf{k}$ is a
field, $\alpha_s$ is nothing more than multiplication by some scalar
$\lambda\in \mathbf{k}$, so $\alpha_s\colon x\mapsto \lambda x$. Such
$\lambda$ could be zero, though.

As a first result, we have the following.

> **Fact 1.**
If $I\cap J=\varnothing$, then
$\mathrm{Hom}(\mathbf{k}^I, \mathbf{k}^J) = \mathbf{0}$.

With this trivial case out of the way, assume $I\cap J\neq \varnothing$,
and let us consider two cases: $a < c$ or $c\leq a$.

1.  Suppose $a < c$. Recall that our goal is to characterize the
    morphisms $\mathbf{k}^I \to \mathbf{k}^J$. Since we already know
    what happens when $t\notin I\cap J$, let us focus on
    $\alpha_t\colon \mathbf{k}^I_t \to \mathbf{k}^J_t$ with
    $t\in I\cap J$, that is with $c\leq t\leq b$.

    <p align="center">
    <img src="/assets/media/nt_between_interval_modules.gif" alt="Interval module">
    </p>

    Take the arrow $a\to t$ and apply both $\mathbf{k}^I$ and
    $\mathbf{k}^J$. We have
    $\mathbf{k}^I(a\to t) = \mathbf{k}\xrightarrow{\mathrm{Id}} \mathbf{k}$
    and
    $\mathbf{k}^J(a\to t) = \mathbf{0}\xrightarrow{\mathrm{0}} \mathbf{k}$.
    Note that $\alpha_a\colon \mathbf{k}\to \mathbf{0}$ is the zero map
    and $\alpha_t\colon \mathbf{k}\to \mathbf{k}$ is some linear map. By
    [\[eq:naturality-morphism-persistence-modules\]](#eq:naturality-morphism-persistence-modules){reference-type="eqref"
    reference="eq:naturality-morphism-persistence-modules"}, naturality
    implies $$\alpha_t =  \alpha_t\circ \mathbf{k}^I(a\to t) 
    = \mathbf{k}^J(a\to t)\circ \alpha_a = 0.$$ Thus $\alpha_t$ is zero
    even on $I\cap J$. The conclusion is that
    $\mathrm{Hom}(\mathbf{k}^I, \mathbf{k}^J)\cong \mathbf{0}$ if $I$
    was *born* before $J$.

2.  Suppose $c\leq a$, meaning that $J$ was *born* before $I$. Now we
    consider two more cases.

3.  Suppose $b <d$. This means that $J$ *died* after $I$. We also get
    $\mathrm{Hom}(\mathbf{k}^I, \mathbf{k}^J)\cong \mathbf{0}$.

4.  Suppose $d\leq b$. Here we prove there is an isomorphism
    $\mathrm{Hom}(\mathbf{k}^I, \mathbf{k}^J)\cong \mathbf{k}$.

Now we come to the following conclusion.

> **Fact 2.** If $c\leq a\leq d\leq b$, then $\mathrm{Hom}(\mathbf{k}^I, \mathbf{k}^J)\cong \mathbf{k}$. 

Given
$\lambda\in \mathbf{k}$, define
$\alpha^\lambda \colon \mathbf{k}^I\to \mathbf{k}^J$ by

$$
\alpha^\lambda_r =
\begin{cases}
\mathbf{k}\xrightarrow{\mu_\lambda}\mathbf{k}
&\text{if } r\in I\cap J\\
\mathbf{k}^I_r\xrightarrow{0}\mathbf{k}^J_r&\text{else}
\end{cases}
$$ 

where $\mu_\lambda\colon r\mapsto \lambda r$. The map

$$\Psi \colon \mathbf{k}\to \mathrm{Hom}(\mathbf{k}^I, \mathbf{k}^J):\lambda\mapsto \alpha^\lambda$$

is injective, and surjective, and linear (proof\...)

Both Fact 1 and Fact 2 will help us determine
$d_T(\mathbf{k}^I, \mathbf{k}^J)$ for any closed intervals $I$ and $J$.

## Bound above

We start looking for values of $t\geq 0$ for which a $t$-interleaving of
${\mathcal{I}}=\mathbf{k}^I$ and ${\mathcal{J}}=\mathbf{k}^J$ exists,
that is, for which we can find maps
$\phi\colon {\mathcal{I}}\to {\mathcal{J}}[t]$ and
$\psi\colon {\mathcal{J}}\to {\mathcal{I}}[t]$ that make the diagrams

<div style="text-align:center; margin:1em 0;">
  <img src="/assets/media/post-interleaving/diagram_05.svg" alt="diagram 5" width="600">
</div>

commute. By using the fact that a shift of an interval module is the
interval module of the shifted interval (Example 4), we can redraw these diagram as

<div style="text-align:center; margin:1em 0;">
  <img src="/assets/media/post-interleaving/diagram_06.svg" alt="diagram 6" width="650">
</div>


The first observation is that if the top arrows are both $0$, then we
can put $\phi=0$ and $\psi=0$ because then the triangles commute
trivially. But, how do we get the top arrows to be zero? Here we can use
Fact 1: if $[a,b]\cap [a-2t,b-2t]=\varnothing$, then

$$\mathrm{Hom}(\mathbf{k}^{[a,b]}, \mathbf{k}^{[a-2t,b-2t]}) = \mathbf{0}.$$

In order to get an empty intersection, we just need to make a
sufficiently large shift. Since $t\geq 0$, the shift moves to the left,
so we need $b-2t < a$, that is $t> \frac{b-a}{2}$.

<div style="text-align:center; margin:1em 0;">
  <img src="/assets/media/intervalAB-empty-intersection.png" alt="empty intersection" width="300">
</div> 

By the same reason we arrive at $t> \frac{d-c}{2}$. Thus the top arrows
are both zero if $t> \frac{b-a}{2}$ and $t> \frac{d-c}{2}$, which is
equivalent to $$t>\frac{1}{2}\max\left\{ b-a,d-c \right\}.$$ If we
denote the right term by $M$, we get that an
$(M+\varepsilon)$-interleaving of $\mathcal{I}$ and $\mathcal{J}$ exists
for every $\varepsilon > 0$. Thus
$d_T(\mathbf{k}^I, \mathbf{k}^J) \leq M+\varepsilon$ for every
$\varepsilon > 0$, and taking the infimum over $\varepsilon$ give us

$$d_T(\mathbf{k}^{[a,b]}, \mathbf{k}^{[c,d]}) \leq \frac{1}{2}\max\left\{ b-a,d-c \right\}.$$

Notice that this bound does not take into account the relationship (or
position) between $I$ and $J$, so our next step is to find a bound that
does consider this aspect.

Now we use Fact 2. Framed in our context, it tell us that

$$
\begin{aligned}
c-t\leq a \leq d-t\leq b &\implies \mathrm{Hom}(\mathbf{k}^{[a,b]}, \mathbf{k}^{[c-t,d-t]})\cong \mathbf{k} \\
a-t\leq c \leq b-t\leq d &\implies \mathrm{Hom}(\mathbf{k}^{[c,d]}, \mathbf{k}^{[a-t,b-t]})\cong \mathbf{k} .
\end{aligned}
$$ 

Now we start looking for values of $t\geq0$ for which
the two sets of inequalities are satisfied, because then we can choose
apropriate nonzero $\phi$ and $\psi$ such that $(\phi,\psi)$ is a
$t$-interleaving.

The conditions $c-t\leq a$ and $a-t\leq c$ are equivalent to
$t\geq  |c-a|$, and the conditions $d-t\leq b$ and $b-t\leq d$ are
equivalent to $t\geq  |d-b|$. So, let $t\geq\max\left\\{|c-a|,|d-b|\right\\}$.

With respect to the middle inequalities, we consider two cases.

1.  Suppose $d-t < a$ and $b-t<c$. Using the fact that
    $t\geq |d-b|\geq b-d$, we have

    $$b-2t = b -t -t \leq b-(b-d)-t \leq d-t < a$$
    
    whence
    $t > \frac{b-a}{2}$. Similarly, if $b-t < c$, we get
    $t> \frac{d-c}{2}$. 
    Thus
    $t\geq \max\left\\{\frac{b-a}{2},\frac{d-c}{2}\right\\}$, which lead us to the
    situation above where a $t$-interleaving trivially exists, but the
    two hom-sets are zero.

2.  Suppose then that $a\leq d-t$ or $c\leq b-t$. Using the assumption
    that $t\geq\max\left\\{|c-a|,|d-b|\right\\}$, we see that either inequality
    implies the other. Thus we have $a\leq d-t$ and $c\leq b-t$.
    Therefore both sets of inequalities   above are
    satisfied, whence

    $$\mathrm{Hom}(\mathbf{k}^{[a,b]}, \mathbf{k}^{[c-t,d-t]})\cong \mathbf{k} 
    \quad\text{and}\quad 
    \mathrm{Hom}(\mathbf{k}^{[c,d]}, \mathbf{k}^{[a-t,b-t]})\cong \mathbf{k}.$$

    Using Fact 2, we see that this implies that for $1\in \mathbf{k}$,
    there exists
    $\phi\colon \mathbf{k}^{[a,b]}\to \mathbf{k}^{[c-t,d-t]}$ and
    $\psi\colon \mathbf{k}^{[c,d]}\to \mathbf{k}^{[a-t,b-t]}$ defined by

    $$\phi_r =  
    \begin{cases}
    \mathbf{k}\xrightarrow{\mathrm{Id}}\mathbf{k}
    &\text{if } r\in [a,d-t]\\
    \mathbf{0}&\text{else}
    \end{cases}
    $$ 
    
    and 
    
    $$\psi_r = 
    \begin{cases}
    \mathbf{k}\xrightarrow{\mathrm{Id}}\mathbf{k}
    &\text{if } r\in [c,b-t]\\
    \mathbf{0}&\text{else}
    \end{cases}
    $$
    
    The final, and most important, step is to prove that
    $(\phi,\psi)$ is a $t$-interleaving of $\mathbf{k}^I$ and
    $\mathbf{k}^J$. This amounts to prove that the triangles

    <div style="text-align:center; margin:1em 0;">
    <img src="/assets/media/post-interleaving/diagram_07.svg" alt="diagram 7" width="650">
    </div>
    commute for every $r\in \mathbb{R}$. Let's consider the first
    triangle. We consider three cases.

    <div style="text-align:center; margin:1em 0;">
    <img src="/assets/media/post-interleaving/nonzero-regions-interleaving.gif" alt="diagram 7">
    </div> 

    If $r\in (-\infty,a)$, then 
    
    $$
    \begin{aligned}
    \psi_{r+t}\circ \phi_r 
    &= \psi_{r+t}\circ (\mathbf{0}\xrightarrow{\mathrm{0}}\mathbf{k^*})\\
    &= \mathbf{0}\xrightarrow{\mathrm{0}}\mathbf{k^*}\\
    &= \mathbf{k}^{[a,b]}(r\to  r+2t)
    \end{aligned}
    $$ 
    
    no matter the value of $\psi_{r+t}$. Here
    $\mathbf{k^*}$ denotes either $\mathbf{0}$ or $\mathbf{k}$.

    If $r\in[a,b-2t]$, then 
    
    $$
    \begin{aligned}
    \psi_{r+t}\circ \phi_r &= 
    (\mathbf{k}\xrightarrow{\mathrm{Id}}\mathbf{k}) \circ (\mathbf{k}\xrightarrow{\mathrm{Id}}\mathbf{k})\\
    &= \mathbf{k}\xrightarrow{\mathrm{Id}}\mathbf{k}\\
    &= \mathbf{k}^{[a,b]}(r\to  r+2t).
    \end{aligned}
    $$ 
    
    Finally, if $r\in(b-2t,\infty)$, 
    
    $$
    \begin{aligned}
    \psi_{r+t}\circ \phi_r &= 
    (\mathbf{k^*}\xrightarrow{\mathrm{0}}\mathbf{0}) \circ \phi_r\\
    &= \mathbf{k^*}\xrightarrow{\mathrm{0}}\mathbf{0}\\
    &= \mathbf{k}^{[a,b]}(r\to  r+2t).
    \end{aligned}
    $$ 
    
    where $\mathbf{k^*}$ denotes either $\mathbf{0}$ or
    $\mathbf{k}$. We have proved that the left triangle commutes for
    every $r\in \mathbb{R}$. In an entirely analogous manner we prove
    the right triangle commutes. Therefore $(\phi,\psi)$ is a
    $t$-interleaving of $\mathbf{k}^{I}$ and $\mathbf{k}^J$.

We have proved that, in either case A or B, $\mathbf{k}^{I}$ and
$\mathbf{k}^J$ are $t$-interleaved if $t\geq\max\left\\{|c-a|,|d-b|\right\\}$.
Therefore

$$d_T(\mathbf{k}^{[a,b]}, \mathbf{k}^{[c,d]}) \leq  \max\left\{ |c-a|,|d-b|\right\}.$$

Up to now we've found two upper bounds for
$d_T(\mathbf{k}^{[a,b]}, \mathbf{k}^{[c,d]})$, so we know that the
distance is smaller than both of them. We summarize what we've found in
the following

> **Fact 3.** For any closed intervals $I=[a,b]$ and $J=[c,d]$,

$$ 
d_T(\mathbf{k}^{[a,b]}, \mathbf{k}^{[c,d]}) \leq \min\left\{ \frac{1}{2}\max\left\{ b-a,d-c \right\},\max\left\{ |c-a|,|d-b|\right\}\right\}.
$$

## Bound below

Let's prove that the last inequality  is actually an equality. Denote that
minimum by $m$. Our goal is to prove that if a $t$-interleaving exists,
then necessarily $t\geq m$, for then we can take the infimum over all
those $t\geq 0$ and get that
$d_T(\mathbf{k}^{[a,b]}, \mathbf{k}^{[c,d]})\geq m$.

Let $t\geq0$. We will actually prove that if $t<m$, then no interleaving
can exists.

