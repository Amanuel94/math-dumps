;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "poly"
 (lambda ()
   (TeX-add-symbols
    "ord"
    "cont"
    "Frac"
    "Res")
   (LaTeX-add-labels
    "sec:power-series"))
 :latex)

