---
layout: post
title: "On the definition(s) of homotopy"
author: "Christian Chávez"
published: true
---


The definition of homotopy between two maps in the classical setting of algebraic topology is as follows.

> **Definition.**     Let \\(f\\) and \\(g\\) be two continuous maps from a topological space \\(X\\) into a topological space \\(Y\\). An homotopy from \\(f\\) to \\(g\\) is   a continuous map \\(H \colon X\times I \to Y\\) such that 
> 
$$
\forall x\in X :\quad H(x,0) = f(x) \quad\text{and}\quad H(x,1) = g(x).
$$
>
If there is an homotopy from \\(f\\) to \\(g\\), then   \\(f\\) is said to be homotopic to  \\(g\\),  which is  denoted by  \\(f\simeq g\\). 

The relation $$\simeq$$ is an equivalence relation.
However, the definition of homotopy for chain complexes looks quite different. 

> **Definition.**   Let $$\mathcal{A}$$ be an additive category. Let $$A^\bullet$$ and $$B^\bullet$$ be two complexes in $$\mathcal{A}$$. Let  $$f^\bullet,g^\bullet\colon A^\bullet\to B^\bullet $$ be chain maps. A chain homotopy from $$f^\bullet$$ to $$g^\bullet$$ is a collection of maps $$h^n: A^n \rightarrow B^{n-1}$$  such that
>
$$
f^n - g^n = d_B^{n-1} h^n + h^{n+1} d_A^n
$$
>
for every $$n\in \mathbb{Z}$$. If there is a chain homotopy from $$f^\bullet$$ to $$g^\bullet$$, we write $$ f^\bullet\sim g^\bullet$$.

Again, $$\sim$$ is also an equivalence relation.
Although these definitions of homotopy arise in  different contexts, and in fact they look unrelated, it turns out there is indeed a relationship.

Browsing the internet, I found [this excellent post](https://grossack.site/2022/06/24/chain-homotopies.html) that describes it.
When I have more time, I will come back to this post  and expand on the details further.
