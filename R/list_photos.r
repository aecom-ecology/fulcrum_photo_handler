library(tidyverse)
# Define input locationsfulcrum export data
fulcrum_file <- 'data/ecow_bat_box_subset.csv'
photo_source <- "data/photos_i/" # Put full selection of export photos here
photo_destination <- "output/photos_o/" # Location where exported photos will be moved

#### Photo ID processings
df <- read_csv(fulcrum_file) # Enter the necessary file location here (exported from fulcrum and subsetted)

df_photos <- df %>% 
  select(photos) # This is the field with the photo UUIDs
  
ls_photos <- tibble(photoid = unlist(stringr::str_split(df_photos$photos,','))) # Extract them and put them all in a single character vector


# TODO run check to determine whether file name already has extension appended
# take photo id list and append file extension
file_list <- ls_photos %>% 
  mutate(filename = paste0(photo_source,photoid,'.jpg'))

#copy vector
#setwd("C:/Users/neil.a.robinson/OneDrive - AECOM Directory/HS2_EWC_North_Ecology_WP23/tree app dev")

for(i in file_list)
{
  #print(i)
  #print(file.exists(i))
  file.copy(i, photo_destination)
}