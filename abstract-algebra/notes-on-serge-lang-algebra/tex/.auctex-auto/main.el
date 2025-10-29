;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("book" "")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("amsmath" "") ("amssymb" "") ("amsthm" "") ("hyperref" "") ("bookmark" "") ("cochineal" "") ("mathpazo" "") ("tikz-cd" "") ("enumerate" "")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "groups"
    "rings"
    "modules"
    "poly"
    "book"
    "bk10"
    "amsmath"
    "amssymb"
    "amsthm"
    "hyperref"
    "bookmark"
    "cochineal"
    "mathpazo"
    "tikz-cd"
    "enumerate")
   (TeX-add-symbols
    '("tor" 1)
    '("ddual" 1)
    '("dual" 1)
    '("m" 1)
    '("fto" 1)
    '("cat" 1)
    '("I" 1)
    '("dihedral" 1)
    '("C" 1)
    '("orbit" 1)
    '("normalizer" 1)
    '("set" 1)
    '("gen" 1)
    '("idx" 2)
    '("size" 1)
    "normal"
    "subgroup"
    "centerizer"
    "aut"
    "inn"
    "syl"
    "sym"
    "alt"
    "id"
    "im"
    "ZZ"
    "iso"
    "dicyc"
    "hol"
    "Map"
    "nequiv"
    "Cat"
    "Mor"
    "Ob"
    "End"
    "horline"
    "Img"
    "Hom"
    "from"
    "rank"
    "dirlim"
    "invlim")
   (LaTeX-add-amsthm-newtheorems
    "theorem"
    "lemma"
    "corollary"
    "conjecture"
    "proposition"
    "definition"
    "example"
    "remark"))
 :latex)

