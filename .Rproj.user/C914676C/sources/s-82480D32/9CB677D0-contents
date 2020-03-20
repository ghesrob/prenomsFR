# Nettoyage et mise en forme des donnees au niveau national
prenoms_nat <-
  read_csv2("data-raw/nat2018.csv", na = c("XX", "XXXX")) %>%
  rename(
    n = nombre,
    sex = sexe,
    year = annais,
    name = preusuel
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
  select(year, name, sex, n) %>%
  group_by(year, sex) %>%
  mutate(prop = n / sum(n)) %>%
  ungroup() %>%
  arrange(year, sex, name)


save(prenoms_nat, file = "data/prenoms_nat.rda", compress = "xz")

