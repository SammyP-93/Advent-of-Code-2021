library(readr)
library(stringr)

#reading in csv file for code input exercise
day2<-read_csv("C:\\Users\\Sam_P\\OneDrive\\Desktop\\Code Advent\\Day2\\day2.csv")
day2

#converting dataframe to vector to improve possible manipulation
new_vector <- day2$Movement

#Need to isolate the numeric counterpart of each observation in the character vector
Numbers_Vector <- new_vector %>% str_replace("^[a-z]* ","")

#Make character vector into numeric
Numeric_Vector <- as.numeric(Numbers_Vector)

#Isolate the Character Vector element
Character_Vector <- new_vector %>% str_replace(" *[0-9]","")

#Make Boolean vector for movement types
Boolean_Forward <- Character_Vector =="forward"
Boolean_Up <- Character_Vector =="up"
Boolean_Down <- Character_Vector =="down"

#Improved Split Dataframe for Calculation
Movement_df <- data.frame(Boolean_Forward,Boolean_Up,Boolean_Down,Numeric_Vector)

#Calculate Horizontal Element
Horizontal_only <- Movement_df[Movement_df$Boolean_Forward=="TRUE",]
Horizontal <- sum(Horizontal_only$Numeric_Vector)

#Calculate Depth Element
Up_only <- Movement_df[Movement_df$Boolean_Up=="TRUE",]
Down_only <- Movement_df[Movement_df$Boolean_Down=="TRUE",]
Up <- sum(Up_only$Numeric_Vector)
Down <- sum(Down_only$Numeric_Vector)
Depth=Down - Up

#Solution of Day2.1 Exercise
Solution_2_1 <- Depth*Horizontal
print(Solution_2_1)
