#' Determine le sexe d'un individu
#'
#' @param name Un prenom. Non sensible a la casse.
#' @param birth_date Date de naissance, au format Date.
#' @param birth_year Annee de naissance.
#' @param age Age, en annees.
#' @details
#' Renseigner aucun ou un seul des trois arguments relatifs a la date de naissance.
#' Si aucun n'est renseigne, le sexe est determine sur la periode 1900-2018.
#' @return Le sexe estime de l'individu, 'F' ou 'M'.
#' @examples
#' estim_sex('Robin', birth_year = 1995)
#' estim_sex('JEAN-JACQUES', age = 59)
#'
estim_sex <- function(name, birth_year = NULL, age = NULL, birth_date = NULL){

  first_name = stringr::str_to_title(name) # Todo : Comprendre pourquoi utiliser directement name pose probleme au niveau du filter plus bas
  ref_year <- 1900:2018

  if (!missing(birth_year)) {
    ref_year <- birth_year
  } else if (!missing(age)) {
    ref_year <- lubridate::year(Sys.Date() -lubridate:: years(age))
  } else if (!missing(birth_date)) {
    ref_year <- lubridate::year(birth_date)
  }


  prenoms_nat %>%
    filter(
      name == first_name,
      year %in% ref_year
    ) %>%
    group_by(sex) %>%
    summarise(
      n = sum(n)
    ) %>%
    ungroup() %>%
    filter(
      n == max(n)
    ) %>%
    pull(sex)

}



