rm(list=ls())

library(MASS)
library(ggplot2)
newsurvey<- na.omit(survey)

#1.  Plot a bar graph for the number of male and female participants in the survey. Provide the title as "Male and Female participants" and specify the colours for the bars.
gender<- newsurvey$Sex
gender_freq<- table(gender)
ggplot(data=newsurvey,mapping=aes(x=Sex,fill=Sex))+geom_bar()+ggtitle("Male and Female participants")

#2.  Plot a bar graph for the number of left handers and right handers in the survey. Provide the title as "Left Handers and Right Hnaders" and specify the colours for the bars.
write_hand<- newsurvey$W.Hnd
ggplot(data=newsurvey,mapping=aes(x=W.Hnd,fill=W.Hnd))+geom_bar()+scale_fill_manual(values = c("red", "green") )+ggtitle("Left Handers and Right Hnaders")

#3.  Plot the distribution between male left handers and female left handers using bar chart. Provide the title as "Female Left Handers and Male Left Handers" and specify the colours for the bars.
left_hand=write_hand=="Left"
left_hand_data=newsurvey[left_hand,]
ggplot(data=left_hand_data,mapping=aes(x=Sex,fill=Sex))+geom_bar()+scale_fill_manual(values = c("red", "green") )+ggtitle("Female Left Handers and Male Left Handers")


#4.  Draw the distribution of smoking habits of male left handers using pie chart.
male_left_hand<- left_hand_data$Sex=="Male"
male_left_hand_data<- left_hand_data[male_left_hand,]
ggplot(data=male_left_hand_data,aes(x="",y=Sex,fill=Smoke))+geom_bar(stat="identity", width=1, color="White")+coord_polar("y", start=0)+ggtitle("smoking habits of male left handers")+theme_void()

#5.  Draw the histogram of age distribution with the title as 'Age distribution' and xlabel as 'Age range' and ylabel as 'frequency'.
ggplot(newsurvey, aes(x=Age)) + geom_histogram(binwidth=5, fill="#69b3a2", color="#e9ecef", alpha=0.9)+labs(y= "Frequency", x = "Age Range")+ggtitle("Age distribution")

#6.  Reveal the relationship between writing hand span and the age using scatter plot.
write_hand_span<- newsurvey$Wr.Hnd
ggplot(newsurvey, aes(x=Wr.Hnd, y=Age)) + geom_point()

#7.  Draw the boxplot for pulse rate and analyse the five summary statistics.
pr<- newsurvey$Pulse
ggplot(newsurvey, aes(y=Pulse, fill=Pulse)) + geom_boxplot(fill="slateblue", alpha=0.2) + ylab("Pulse Rate")