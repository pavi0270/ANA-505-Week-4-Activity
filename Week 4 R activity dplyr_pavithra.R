#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice
dim(HairEyeColor)
HairEyeColor

#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(HairEyeColor,n=1)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr

install.packages("dplyr")

library(dplyr)

#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns 
#(hint: use the 'select' function)

#HairEyeColor %>% select(2,3) It did not work for me
install.packages("reshape2")
library(reshape2)

x <- melt(HairEyeColor)
x[rep(seq_len(nrow(x)), x$value), -4]

x %>% select(1,3)

#Let's name the dataset with just the two columns, Hair and Sex
#TASK: Write the function to save the two columns as a new dataset
#and give it a name

newdata = x %>% select(1,3)

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)

select(newdata, -c(Sex)) 

#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'

rename(newdata, Gender=Sex)


#Let's make a new dataset with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column

newcolname = rename(newdata, Gender=Sex)

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
maledata=newcolname %>% 
  filter(Gender == "Male")

#Let's 'group' our data by gender
#TASK: Write the function to group the data by gender (hint: group_by)

newcolname %>%
  group_by(Gender)

#Let's see how many students were examined in the dataset (total the frequency)
#TASK: replace 'datasetname' with the name of your dataset and get the total
#After you run it, write the total here:____
total=mutate(newcolname, total=cumsum(Freq))


#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
femaledata= newcolname %>% 
  filter(Gender == "Female")

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')

union(maledata,femaledata)


#Optional Task: add any of the other functions 
#you learned about from the dplyr package

mutate(x, value+10)

#adding 10 to value

#x <- melt(HairEyeColor)
#x[rep(seq_len(nrow(x)), x$value), -4]

#learned reshaping
