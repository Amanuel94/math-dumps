#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
// #set text(font:"MathJax_SansSerif", weight:"thin")
#set text(font:"MathJax_SansSerif")

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
$S(frak(C)^"op")$: $I$ is an initial object if $frak(C)^"op"  (I, X)$ is a singleton for every $X in frak(C)^"op"$\
$S^("op")(frak(C))$: $I$ is a coinitial object if $frak(C)(X, I)$ is a singleton for every $X in frak(C)^"op"$.

#rect[If $S$ is a statement such that it is meaningful in all categories. If $S$ is true in $frak(C)$, then $S$ is also true in $frak(C)^"op"$)]


*Definition 5 (Monic and Epic)*: A morphism $f$ is called _monic_ if $f bullet.stroked u = f bullet.stroked v$ implies $ u = v$. We call the dual analoge _epic_.

*Theorem 1*: #align(center)[
    monic $<=>$ injective\
    epic  $<=>$ surjective
]

#let Coker = "Coker"
Remark: The cokernel $Coker f = Y slash im f$ and  $ker f$ are dual pairs. Hence, if $f$ is surjective in $frak(C)$, then $f$ is injective in $frak(C)^"op"$.  

*Definition 6 (Kernel)*, In category theory, a kernel $kappa$ of a morphism $f: X -> Y$ of a category $frak(C)$ is defined as a monic morphism $kappa: K -> X$ such that\
(i) $f bullet.stroked kappa  = 0$\
(ii) $f bullet.stroked g = 0$ implies the exisitence of $h$ such that  $g = f bullet.stroked h$.

*Definition 7 (Contravariant Functor)*: A functor $F: frak(C) -> frak(D)$ is called contravariant if $F: frak(C)^"op" -> frak(D)$.

Example (_The contravariant powerset functor_): Let $Q: frak(S) -> frak(S)$ such that $Q X = 2^X$ and for a morphism $f: X -> Y$, $(Q f) B = f^(-1) B$ where $B subset.eq Y$ so that $Q f: 2^Y -> 2^X$. This gives rise to more interesting properties than the _covariant powerset functor_ $P$. For example, consider the subsets, $A_1, A_2 subset.eq X$ and $B_1, B_2 subset.eq Y$. It is not necessarily true that $
    P(f)(A_1 inter A_2) =^? P(A_1) inter P(A_2) 
$
where as, the following is $
    Q(f)(B_1 inter B_2) = Q(B_1) inter Q(B_2)
$
for example if $A_1 = {x}, A_2 = {y}$, $f(x) = f(y)$.

== Products and Coproducts
*Definition 8 (Product)*: If $A_1, A_2 in "Ob"(frak(C))$, we define $ (P, p_1, p_2)$ with $p_i: P -> A_i$  if for any $f_i: X -> A_i$ there is a unique $f: X -> P$ following diagram commutes:


#align(center)[#diagram(cell-size: 10mm,  $
    & A_1\
	X edge("ne", f_1, ->)  edge("se", f_2, ->) edge("e", f, ->) & P edge("u", p_1, ->) edge("d", p_2, ->)  \
        & A_2
    
$)]

Products in categories are unique upto canonical equivalence. 
Example: $bb(Z) slash 2 bb(Z) times bb(Z) slash 4 bb(Z) in frak(C)$ does not exsist in the category of cyclic groups.

#set enum(numbering: "(i)")
*Proposition 1*:\
1. $(g_1 times g_2) bullet.stroked (h_1 times h_2) = (g_1 bullet.stroked h_1 times g_2 bullet.stroked h_2)$.
2. $(g_1 times g_2) bullet.stroked {f_1, f_2} = {g_1 bullet.stroked f_1,  g_2 bullet.stroked f_2}$
3. ${f_1, f_2} bullet.stroked g = {f_1g, f_2g}$

Example: In the category of finitely generated abelian groups, no infinite set has a product. The set ${bb(Z) slash p^n bb(Z) : n in bb(N)}$ has infite product in the category of torision abelian groups namely the torsion subgroup of the product $product bb(Z) slash p^n bb(Z)$.\


*Definition 9 (Coproducts)*: $(Q, q_1, q_2)$ such that the below diagram commutes.

#align(center)[#diagram(cell-size: 10mm,  $
    & A_1\
	X edge("ne", f_1, <-)  edge("se", f_2, <-) edge("e", f, <-) & Q edge("u", q_1, <-) edge("d", q_2, <-)  \
        & A_2
    
$)]
