# EXIF tool
library(exifr)
image_files <- list.files('output//fulcrum_tree_photos/',full.names = TRUE)
e <- read_exif(image_files,tags = c('filename','filesize','DateTimeOriginal'))

e1 <- e %>% 
  group_by(DateTimeOriginal) %>%
  summarise(file_keep = FileName[1], files = toString(FileName), copies = n()) %>%
  arrange(-copies,DateTimeOriginal)

write_csv(e1 %>% select(file_keep),path = 'data/tree_photo_list_no_dupes.csv',col_names = FALSE)