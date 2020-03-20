#' Determine le sexe d'un individu
#'
#' @param name Un prenom. Non sensible a la casse.
#' @param birth_date Date de naissance, au format Date.
#' @param birth_year Annee de naissance.
#' @param age Age en annees.
#' @details
#' Renseigner aucun ou un seul des trois arguments relatifs a la date de naissance.
#' Si aucun n'est renseigne, le sexe est determine sur la periode 1900-2018.
#' @return Le sexe estime de l'individu, 'F' ou 'M'.
#' @examples
#' get_sex('Robin', birth_year = 1995)
#' get_sex('JEAN-JACQUES', age = 59)
#'
get_sex <- function(name, birth_date = NULL, birth_year = NULL, age = NULL){

  flag <- 0

  if (!missing(birth_date)) {
    ref_year <- year(birth_date)
  } else if (!missing(birth_year)) {
    ref_year <- birth_year
  } else if (!missing(age)) {
     ref_year <- year(Sys.Date() - years(age))
  } else {
    flag <- 1
  }

  inf_year <- ifelse(flag == 0, ref_year - 5, 1900)
  sup_year <- ifelse(flag == 0, ref_year + 5, 2017)

  prenoms_france %>%
    filter(name == name, between(year, inf_year, sup_year)) %>%
    group_by(sex) %>%
    summarise(
      n = sum(n)
    ) %>%
    ungroup() %>%
    mutate(
      prop = n / sum(n)
    ) %>%
    filter(
      prop == max(prop)
    ) %>%
    pull(sex)

}
