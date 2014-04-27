
#Read features and labels

features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

#Read Data

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

acc_body_X_test <- read.table("test/Inertial Signals/body_acc_x_test.txt")
acc_body_Y_test <- read.table("test/Inertial Signals/body_acc_y_test.txt")
acc_body_Z_test <- read.table("test/Inertial Signals/body_acc_z_test.txt")

acc_total_X_test <- read.table("test/Inertial Signals/total_acc_x_test.txt")
acc_total_Y_test <- read.table("test/Inertial Signals/total_acc_y_test.txt")
acc_total_Z_test <- read.table("test/Inertial Signals/total_acc_z_test.txt")

gyro_body_X_test <- read.table("test/Inertial Signals/body_gyro_x_test.txt")
gyro_body_Y_test <- read.table("test/Inertial Signals/body_gyro_y_test.txt")
gyro_body_Z_test <- read.table("test/Inertial Signals/body_gyro_z_test.txt")


x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

acc_body_X_train <- read.table("train/Inertial Signals/body_acc_x_train.txt")
acc_body_Y_train <- read.table("train/Inertial Signals/body_acc_y_train.txt")
acc_body_Z_train <- read.table("train/Inertial Signals/body_acc_z_train.txt")

acc_total_X_train <- read.table("train/Inertial Signals/total_acc_x_train.txt")
acc_total_Y_train <- read.table("train/Inertial Signals/total_acc_y_train.txt")
acc_total_Z_train <- read.table("train/Inertial Signals/total_acc_z_train.txt")

gyro_body_X_train <- read.table("train/Inertial Signals/body_gyro_x_train.txt")
gyro_body_Y_train <- read.table("train/Inertial Signals/body_gyro_y_train.txt")
gyro_body_Z_train <- read.table("train/Inertial Signals/body_gyro_z_train.txt")

#Descriptive variable labels
names(x_test) <- features[,2]
names(x_train) <- features[,2]

#Descriptive activity labels
y_test_desc <- merge(y_test, activity_labels, by.x="V1", by.y="V1", all=TRUE)
y_train_desc <- merge(y_train, activity_labels, by.x="V1", by.y="V1", all=TRUE)

subject <- rbind(subject_test, subject_train)
names(subject) <- c("subject")
all_X_Data <- rbind(x_test, x_train)
all_Y_Data <- rbind(y_test_desc, y_train_desc )
names(all_Y_Data) <- c("id", "activity")

allData <- cbind( subject, all_Y_Data$activity, all_X_Data)

write.table(allData, 'extractedData.txt', sep='\t')
