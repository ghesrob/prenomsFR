# Nettoyage et mise en forme des donnees au niveau departemental
prenoms_dpt <-
  read_csv2("data-raw/dpt2018.csv", na = c("XX", "XXXX")) %>%
  rename(
    n = nombre,
    sex = sexe,
    year = annais,
    name = preusuel,
    dpt_num = dpt
  ) %>%
  filter(
    !is.na(year),
    name != "_PRENOMS_RARES"
  ) %>%
  mutate(
    name = str_to_title(name),
    n = as.integer(n),
    sex = if_else(sex == 1, "M", "F")
  ) %>%
  left_join(read_csv("data-raw/tools/corresp_dpt.csv")) %>%
  arrange(year, sex, name, dpt_num) %>%
  select(year, name, sex, dpt_num, dpt_name, n)


save(prenoms_dpt, file = "data/prenoms_dpt.rda", compress = "xz")
