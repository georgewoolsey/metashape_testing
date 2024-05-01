# bread-and-butter
library(tidyverse) # the tidyverse
input_dir = "c:/data/metashape_testing/data/SfM_Software_Comparison/Pix4D"
study_site_list = c(
  "SQ09_02", "WA85_02"
  , "Kaibab_High", "Kaibab_Low"
  , "n1"
  # , "SQ02_04" # SQ09_02 and SQ02_04 have same imagery? 
)
### get tracking data
  
  # c:/ SfM_Software_Comparison
   # read list of all processed tracking files
    tracking_list_df =
      dplyr::tibble(
        file_full_path = list.files(
          input_dir
          , pattern = ".*_processed_tracking_data.csv$"
          , full.names = T, recursive = T
        )
      ) %>%
    # filter processed tracking files
    dplyr::mutate(
      study_site = file_full_path %>%
        stringr::word(-1, sep = fixed(input_dir)) %>%
        toupper() %>%
        stringr::str_extract(pattern = paste(toupper(study_site_list),collapse = "|"))
      , file_name = file_full_path %>%
        stringr::word(-1, sep = fixed("/")) %>%
        stringr::word(1, sep = fixed(".")) %>%
        toupper() %>%
        stringr::str_remove_all("_PROCESSED_TRACKING_DATA")
    ) %>%
    dplyr::filter(
      !is.na(study_site)
      & study_site %in% toupper(study_site_list)
    ) %>%
    # keep only unique files for processing
    dplyr::group_by(study_site, file_name) %>%
    dplyr::filter(dplyr::row_number()==1) %>%
    dplyr::ungroup() %>%
    dplyr::rename(tracking_file_full_path = file_full_path)
  
  tracking_list_df %>% dplyr::glimpse()
  # read each tracking data file, bind rows
  processed_tracking_data = 1:nrow(tracking_list_df) %>%
    purrr::map(function(row_n){
      tracking_list_df %>%
        dplyr::filter(dplyr::row_number() == row_n) %>%
        dplyr::bind_cols(
          read.csv(tracking_list_df$tracking_file_full_path[row_n]) 
        )
    }) %>%
    dplyr::bind_rows()

  processed_tracking_data %>% dplyr::glimpse()
  # write file
  write.csv(
    processed_tracking_data
    , paste0(input_dir,"/ptcld_processing_tracking_data.csv")
    , row.names = F
  )
