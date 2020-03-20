# Creation d'un fichier de correspondance numero de dpt / nom de dpt
corresp_dpt <-
  read_csv("data-raw/tools/departement.csv",
          col_names = c("index", "dpt_num", "dpt_name", "dpt_name2", "dpt_name3", "soundex")
  ) %>%
  select(dpt_num, dpt_name) %>%
  filter(!dpt_num %in% c('2a', '2b')) %>%
  add_row(dpt_num = 20, dpt_name = "Corse") %>%
  arrange(dpt_num) %>%
  write_csv("data-raw/tools/corresp_dpt.csv")

