library(tidyverse)
# Define input locationsfulcrum export data
fulcrum_file <- 'data/tree_transfer_20200423.csv'
photo_source <- "data/photos/" # Put full selection of export photos here
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

for(i in file_list$filename)
{
  #print(i)
  if (file.exists(i)){
    file.copy(i, photo_destination)
    print(paste0('File ',i,' has been moved to ',photo_destination))
    file.remove(i)
  }
  
}