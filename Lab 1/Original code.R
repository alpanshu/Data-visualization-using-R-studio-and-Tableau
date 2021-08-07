rm(list=ls())

library(MASS)
newsurvey<- na.omit(survey)

#1.  Plot a bar graph for the number of male and female participants in the survey. Provide the title as "Male and Female participants" and specify the colours for the bars.
gender<- newsurvey$Sex
gender_freq<- table(gender)
barplot(gender_freq,main="Male and Female participants",ylab="frequency",col=c('red',"blue"))

#2.  Plot a bar graph for the number of left handers and right handers in the survey. Provide the title as "Left Handers and Right Hnaders" and specify the colours for the bars.
write_hand<- newsurvey$W.Hnd
write_hand_freq<- table(write_hand)
barplot(write_hand_freq,main="Left Handers and Right Handers",ylab="count",col=c('red',"blue"))

#3.  Plot the distribution between male left handers and female left handers using bar chart. Provide the title as "Female Left Handers and Male Left Handers" and specify the colours for the bars.
left_hand=write_hand=="Left"
left_hand_data=newsurvey[left_hand,]
g <- left_hand_data$Sex
g_freq<- table(g)
barplot(g_freq,main="Female Left Handers and Male Left Handers",ylab="count",col=c('cyan',"green"))

#4.  Draw the distribution of smoking habits of male left handers using pie chart.
male_left_hand<- left_hand_data$Sex=="Male"
male_left_hand_data<- left_hand_data[male_left_hand,]
smk<- male_left_hand_data$Smoke
smk_freq<- table(smk)
pie(smk_freq,main="Distribution of smoking habits of male left handers",col=c('red','magenta','cyan',"green"))

#5.  Draw the histogram of age distribution with the title as 'Age distribution' and xlabel as 'Age range' and ylabel as 'frequency'.
age_rg<- newsurvey$Age
hist(age_rg,main='Age distribution',right=FALSE,xlab='Age range',ylab='frequency')

#6.  Reveal the relationship between writing hand span and the age using scatter plot.
write_hand_span<- newsurvey$Wr.Hnd
plot(write_hand_span,age_rg,main="Relationship between writing hand span and the age")

#7.  Draw the boxplot for pulse rate and analyse the five summary statistics.
pr<- newsurvey$Pulse
boxplot(pr,main="Box plot for Pulse rate",ylab="Pulse rate")
