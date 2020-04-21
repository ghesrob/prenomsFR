prenomsFR
================

## Description

Un petit package R contenant deux jeux de données sur les prénoms
Français, et une fonction permettant d’inférer sur le sexe d’un
individu à partir de son prénom.

## Installation

``` r
# Installation depuis github avec le package devtools
devtools::install_github("ghesrob/prenomsFR")
library(prenomsFR)
```

## Contenu

Ce package contient les deux jeux de données suivants :

<ul>

<li>

`prenoms_nat` : Données sur les prenoms attribués aux nouveaux nés en
France entre 1900 et 2018

</li>

<li>

`prenoms_dpt` : Comme ci-dessus, mais avec des données ventilées au
niveau départemental

</li>

</ul>

Il contient par ailleurs la fonction `estim_sex` qui permet d’inférer
sur le sexe d’un individu à partir de son prénom et, optionellement, de
sa date de naissance ou de son âge.
