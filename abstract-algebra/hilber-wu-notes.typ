#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#show heading.where(level: 1): set text(size: 23pt)
#show heading.where(level: 1): set align(center)

= Notes on Category Theory
#align(right)[_from Hilton and Wu, A Course in Modern Algebra_]

== Notations
$frak(C), frak(D)$: categories\
$F, G$: functors\
$"Ob"(frak(C))$: the set of objects of category $frak(C)$\ 
$"Mor"(frak(C))$: the set of morphisms of  category $frak(C)$\
$frak(C)(X, Y)$: the set of morphisms from object $X$ to object $Y$\
$frak(S)$: the category of sets\
$frak(G)$: the category of groups\
$frak(T)$: the category of topological spaces and continuous functions\
$frak(A b)$: the category of abelian groups\
$frak(D)_K$: the category of finite dimensional vector spaces over the field $K$

== Categories 
*Axioms of Categories*:
#let axiom(.., last) = "CAT-" + str(last)
#set enum(numbering: axiom)

1. _The sets $frak(C)(A, B)$ and $frak(C)(C, D)$ are disjoint unless $(A, B) = (C, D)$._
2. _$f: A -> B, g: B -> C, h: C -> D$, then $h(g f) = (h g) f$_  
3. _For any object $A$, there is an identity morphism $1_A: A -> A$_ such that for any other two morphisms $f: A -> B, g: C -> A$, $f 1_A = f, 1_A g = g$.


*Definition 1 (Initial and Terminal Objects):* An object $I$ is said to be _initial_, if the set of morphisms $frak(C)(I, -)$ is a singleton. An object $T$ is said to be _terminal (coinitial)_ if  the set of morphisms $frak(C)(-, T)$ is a singleton, where $-$ is any object in $frak(C)$. If an object is both inital and terminal it is called a zero.

Example: ${}$ is the initial object in $frak(S)$. $1$ is the zero object in $frak(G)$.\
Remark: A zero object is also called _universal_.

== Functors
*Definition 2 (Forgetful functor)*: A functor $U: frak(C) -> frak(S)$ where $frak(S)$ is the category of the underlying set of $frak(C)$ and $U(f)$ is a function in $frak(S)$ such that $f(X) =  U(f)(U(X))$. For example, $U: frak(D)_K -> frak(A b)$ is a forgetful functor \"forgetting\" the multiplication operation in $frak(D)_K$.

*Definition 3 (Faithful and Full Functors)*: A functor $F: frak(C) -> frak(D)$ induces a map $F^*: frak(C)(X, Y) -> frak(D)(F X , F Y)$. A faithful functor $F$ (resp. full functor $F$) induces an injective (resp. surjecive) map $F^*$ for all $X, Y$.

Example: The forgetful functor $U: frak(G) -> frak(S)$ is faithful because all homomorphisms are functions between the sets underlying a group and the map $phi |-> U(phi)$ is injective. However, it is not full.

== Natural Transformations

* Definition 4 (Natural Transformations): * A map $tau: F -> G$ is called a natural transformation if it assigns to each object $X in frak(C)$ a morphism $tau_X$ such that the following diagram commutes:
// #diagram(cell-size: 15mm, $
// 	G edge(f, ->) edge("d", pi, ->>) & im(f) \
// 	G slash ker(f) edge("ur", tilde(f), "hook-->")
// $)

#align(center)[#diagram(cell-size: 15mm,  $
	F X edge(tau_X, ->) edge("d", F(f) , ->) & G X edge("d", G(f), ->) \
    F Y edge(tau_Y, ->) & G Y\
$)]
Example: In $frak(D)_K$, we have 

#align(center)[#diagram(cell-size: 15mm,  $
	V edge(v |-> tilde(v), ->) edge("d", f , ->) & V^(**) edge("d", f^(**), ->) \
    W edge(w |-> tilde(w) , ->) & W^(**)\
$)]
where $v |-> tilde(v)$ is the isomorphism between $V$ and the double dual space $V^(**)$ and $(f^(**) (v^(**)))(phi.alt) = v^(**)(f^(*)( phi.alt))$ and $f^*$ is the dual map of $f$ and $phi.alt in W^*$. Here $tau: id -> (**)$. 

== Duality Principle

We say the category $frak(C)^("op")$ _the opposite category of $frak(C)$_ if $"Ob"(frak(C)) = "Ob"(frak(C)^("op"))$ and $frak(C)(X, Y) = frak(C)^("op")(Y, X)$ such that $f bullet.stroked^("op") g = g bullet.stroked f$.

An example of dual statment $S$:
$S(frak(C))$: $I$ is an initial object if $frak(C)(I, X)$ is a singleton for every $X in frak(C)$.\
$S(frak(C)^"op")$: $I$ is an initial object if $frak(C)^"op"(I, X)$ is a singleton for every $X in frak(C)^"op"$\
$S^("op")(frak(C))$: $I$ is a coinitial object if $frak(C)(X, I)$ is a singleton for every $X in frak(C)^"op"$.

#rect[If $S$ is a statement such that it is meaningful in all categories. If $S$ is true in $frak(C)$, then $S$ is also true in $frak(C)^"op"$)]


