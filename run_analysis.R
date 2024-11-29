# Paso 0: Descargar y descomprimir el conjunto de datos si es necesario
if (!file.exists("UCI HAR Dataset")) {
  zipfile <- "dataset.zip"
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = zipfile, method = "curl")
  unzip(zipfile)
}

# Paso 1: Fusionar los conjuntos de entrenamiento y de prueba
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

merged_data <- rbind(train_data, test_data)
merged_labels <- rbind(train_labels, test_labels)
merged_subjects <- rbind(train_subjects, test_subjects)

# Paso 2: Extraer las mediciones de la media y la desviación estándar
features <- read.table("UCI HAR Dataset/features.txt")
mean_std_indices <- grep("mean\\(\\)|std\\(\\)", features$V2)
mean_std_data <- merged_data[, mean_std_indices]
names(mean_std_data) <- features[mean_std_indices, 2]

# Paso 3: Utilizar nombres de actividades descriptivos
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
merged_labels$V1 <- activity_labels[merged_labels$V1, 2]
names(merged_labels) <- "Activity"

# Paso 4: Etiquetar adecuadamente el conjunto de datos
names(merged_subjects) <- "Subject"
tidy_data <- cbind(merged_subjects, merged_labels, mean_std_data)

# Paso 5: Crear un segundo conjunto de datos ordenado con la media de cada variable
library(dplyr)
tidy_data_avg <- tidy_data %>%
  group_by(Subject, Activity) %>%
  summarize_all(mean)

write.table(tidy_data_avg, "tidy_data_avg.txt", row.name=FALSE)
