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

One usually denotes the coproduct of $A$ and $B$ by $A product.co B$.

*Theorem 2*: Let $X_1, X_2, dots.h,  X_m, Y_1, dots.h, Y_n in "Ob"(frak(C))$. Let $f_(i j): X_i -> Y_j in frak(C)(X_i, Y_j)$ and consider the below diagram: 

#align(center)[#diagram(cell-size: 30mm,$
	X_i edge("d", q_i, ->)  edge("r", f_(i j), ->) edge("se", hat(f)_i, ->,  label-pos: #(0.60), label-angle: #auto) & Y_j edge("d", p_1, <-) \
    product.co X_i edge("r", f, ->)  edge("ne", tilde(f)_j, ->, label-pos: #(0.25), label-angle:#auto) & product Y_j
    
$)]

Where $hat(f)_i$ is the unique morphism from $X_i$ associated with the product $product Y_i$ and $tilde(f)_j$ is the unique morphism to $Y_j$ associated with the coproduct $product.co X_i$. $f = hat(tilde(f)) = tilde(hat(f))$. 

== Pullback and Pushouts

*Definition 10 (Pullback and Pushout)*: A pullback of the diagram

#align(center)[#diagram(cell-size: 10mm,$
    & edge("d", phi.alt_1, ->, label-side: #left)   \
    edge("r", phi.alt_2, -> , label-side: #right) & " " 
$)]

is the commutative square

#align(center)[#diagram(cell-size: 10mm,$
    " " edge("r", psi_1, ->, label-side: #left) edge("d", psi_2, ->, label-side: #right) & " "  edge("d", phi.alt_1, ->, label-side: #left)   \
    " " edge("r", phi.alt_2, -> , label-side: #right) & " " 
$)]

such that the following universal property holds:

#let univ = (-1, 0)
#align(center)[#diagram(cell-size: 20mm,$
    
    edge(vertices: #((univ, (1, 1))), ->, label: alpha_1 , label-side: #left)  edge(vertices: #((univ, (0, 2))),  -> , label: alpha_2, label-side: #right) edge(vertices: #((univ, (0, 1))), label: alpha, ->, label-pos: #80%, label-side: #right, label-sep: #0em)  & & \
    " " edge("r", psi_1, ->, label-side: #right) edge("d", psi_2, ->, label-side: #left) & " "  edge("d", phi.alt_1, ->, label-side: #left)   \
    " " edge("r", phi.alt_2, -> , label-side: #right) & " " 
$)]

A pushback of the diagram

#align(center)[#diagram(cell-size: 10mm,$
    " " edge("r", phi.alt_1, -> , label-side: #right) edge("d", phi.alt_2, ->, label-side: #left)   
$)]

#set text(font:"MathJax_SansSerif")
is the commutative square

#align(center)[#diagram(cell-size: 10mm,$
    " " edge("r", phi.alt_1, ->, label-side: #left) edge("d", phi.alt_2, ->, label-side: #right) & " "  edge("d", psi_1, ->, label-side: #left)   \
    " " edge("r", psi_2, -> , label-side: #right) & " " 
$)]

such that the following universal property holds:

#let univ = (2, 2)
#align(center)[#diagram(cell-size: 20mm,$
    
    " " edge("r", phi.alt_1, ->, label-side: #left) edge("d", phi.alt_2, ->, label-side: #right) & " "  edge("d", psi_1, ->, label-side: #left)   \
    " " edge("r", psi_2, -> , label-side: #right) & " " & \

        & & " " edge(vertices: #((univ, (1, 0))), <-, label: alpha_1 , label-side: #right)  edge(vertices: #((univ, (0, 1))),  <- , label: alpha_2, label-side: #left) edge(vertices: #((univ, (1, 1))), label: alpha, <-, label-pos: #80%, label-side: #right, label-sep: #0em) \
$)]

The pullback is similar to the product in the following way. Consider a category $frak(C)$. Let $Y$ be an object in $frak(C)$. Then define the category $frak(C) slash Y$ as the category of morphisms $f: X -> Y$ for all $X in "Ob"(frak(C))$. The morphisms of $frak(C) slash Y$, $f: phi -> psi$ are the morphisms such that the following diagram commutes:
#align(center)[
    #diagram(cell-size: 20mm, $

        X  edge(vertices: #(((0, 0), (2, 0))), f, ->)  &  & Z \
            & Y edge("nw", phi, <-) edge("ne", psi, <-) &
    $)
]

Then the pullback of $phi$ and $psi$ in $frak(C)$ is the product of $phi$ and $psi$ in the category $frak(C) slash Y$.


*Theorem 3*: Suppose $frak(C)$ is a category with zero and consider the following pullback diagram of the $phi.alt_1: X_1 -> Y$ and $phi.alt_2: X_2 -> Y$:

#align(center)[#diagram(cell-size: 10mm, $
    X_0 edge("r", psi_1, ->) edge("d", psi_2,  ->) & X_1 edge("d", phi.alt_1, ->, label-side: #left)\
    X_2 edge("r", phi.alt_2, ->, label-side: #right) & Y

$)]
then the following statements are true:
#set enum(numbering: "(i)")
1. If $kappa$ is a kernel of $psi_2$, then $phi.alt_1$ has a kernel $psi_1 kappa$.
2. If $lambda$ is a kernel of $phi.alt_1$, then $lambda = psi_1 kappa$ for some kernel $kappa$ of $psi_2$.

_Sketch of proof_: On can use the pullback property that if $phi.alt_1 alpha = phi.alt_2 beta$, then there is a unique morphism $kappa: - -> X_0$, that makes $psi_1 kappa$ a kernel of $phi.alt_1$ and $kappa$ a kernel of $phi.alt_1$.

*Proposition 2*: In $frak(A b)$, the diagram  

#align(center)[#diagram(cell-size: 10mm, $
    A edge("r", psi_1, ->) edge("d", psi_2,  ->) & X_1 edge("d", phi.alt_1, ->, label-side: #left)\
    X_2 edge("r", phi.alt_2, ->, label-side: #right) & Y

$)]
is pullback if and only if $hat(psi)$ is the kernel of $tilde(phi.alt)$ in  $A >->^(hat(psi)) X_1 plus.o X_2 ->^tilde(phi.alt) Y$

// Remark: When $phi.alt_1 = phi.alt_2 = id$,  then the pullback is the following diagram

// #align(center)[
//     #diagram(cell-size: 3mm, $

//         A_1 inter A_2  edge("r", >->) edge("d", >->)  & A_1 edge("d", id, ->)\
//         A_2 edge("r", id, ->) & Y

//     $)
// ]
== Adjoint Functors

For $B in "Ob"(frak(S))$, let $F = - times B$ and $G = -^B$ be two functors from $frak(S)-> frak(S)$. We then have the equivalence of the following sets,
$
    frak(S)(F A, C) tilde.equiv frak(S)(A, G C)
$
If $alpha: A_1 -> A$ and $beta: C -> C_1$ are two morphisms in $frak(S)$, and $phi.alt: F A -> C$, then we have the equialence $eta$,

#align(center)[
    #diagram(cell-size: 15mm, $

        F A_1 edge("r", F alpha, ->) & F A edge("r", phi.alt, ->) & C edge("r", beta, ->) & C_1\
        edge(vertices: #(((1.5, 0.1), (1.5, 0.7))), |->, label: eta )

A_1 edge("r",alpha, ->) &  A edge("r", eta(phi.alt), ->) & G C edge("r", G beta, ->) & G C_1

    $)
]

which is natural as in
$

    eta(beta bullet.stroked phi.alt bullet.stroked F alpha) = G beta bullet.stroked eta(phi.alt) bullet.stroked alpha .
$


#let circ = $bullet.stroked$
#let Hom = $"Hom"$

To show this (informally), it suffices to prove $eta(beta bullet.stroked phi.alt)  = G beta bullet.stroked eta (phi.alt)$ and $eta(phi.alt bullet.stroked F alpha) = eta(phi.alt) bullet.stroked  alpha$. Since $eta( (a, b) |-> c) = a |-> (b |-> c)$, $eta(beta circ phi.alt) = eta((a, b) |-> c |->^beta c') = a |-> b |-> c |->^beta c'$ and the first equation follows. Similarly, $eta(phi.alt circ F alpha) = eta((a', b) |->^alpha (a, b) |-> c) = a' |->^alpha a |-> b |-> c.$

// For the first, note that $psi = G beta  circ eta(phi.alt) in frak(S)(A, G C_1)$. One can write $psi(a) = beta circ (eta(phi.alt) (a))$. By equivalence of $eta$, one also has $eta(beta circ phi.alt)(a)$ 

*Definition 11 (Adjoint Functor)*: A functor $F: frak(C) -> frak(D)$ is called _left adjoint_ to functor $G: frak(D) -> frak(C)$ if there exists a natural equivalence $eta$, such that $

    frak(D)(F A, B) tilde.equiv^eta frak(C)(A, G B).
$
#let adj = $tack.r.long$
We also say $G$ is right adjoint to $F$ and we say adjugant $eta$ establishes an adjunction. We write $F adj ^eta G$.


#let Abel = $"Abel"$
Example: $Abel adj U$, i.e.,
$
    frak(A b)(G slash G', A) tilde.equiv  frak(G)(G, U A)
$
    
In fact the morphism $phi.alt |-> eta(phi.alt) = U phi.alt $ is an isomorphism. 
