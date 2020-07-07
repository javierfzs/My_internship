
# Reading data
df0<- read_csv("~/Google Drive/Internship_WB_Summer/Edit/DataEditM2017-2018/R Outputs/df1.csv")
df1<-data.frame(df0)

#first version
my.hist<-hist(df0$Edit_2017_2018.avg_16_q, ylab ="Probability", breaks=20)

my.hist$counts
mycount<-data.frame(my.hist$counts)
write.csv(mycount,"~/Google Drive/Internship_WB_Summer/Edit/DataEditM2017-2018/R Outputs/df2.csv")


#second version

my.data <- as.numeric(df1$Edit_2017_2018.avg_16_q)
my.data<-data.frame(my.data)

my.hist <- hist(my.data$my.data, breaks=20, yaxt='n', ylab="Probability")

ticks <- seq(par("yaxp")[1], par("yaxp")[2], length.out=par("yaxp")[3]+1)
l <- length(my.data$my.data)
max.prob <- max(my.hist$counts)/l
tick.labels <- head(pretty(c(0, max.prob)), -1)
ticks <- tick.labels * l
print(tick.labels)
print(sum(my.hist$counts/l))

axis(2, at=ticks, labels=tick.labels)



# 4. Histogram for Management Score

# original version
#ggplot(df1) +
#  geom_histogram(aes(x =Edit_2017_2018_2.avg_16_q ),  fill = "blue") +
#  labs(title = "Distribution Management Score",
#       x="Management Score",
#       y="Frequency")

# first version

#myhist<-hist(df1$Edit_2017_2018_2.avg_16_q, ylab ="Probability", breaks=20)
#myhist

#second version

#my.data <- df1$Edit_2017_2018_2.avg_16_q

#my.hist <- hist(my.data, breaks=20, yaxt='n', ylab="Probability")

#ticks <- seq(par("yaxp")[1], par("yaxp")[2], length.out=par("yaxp")[3]+1)
#l <- length(my.data)
#max.prob <- max(my.hist$counts)/l
#tick.labels <- head(pretty(c(0, max.prob)), -1)
#ticks <- tick.labels * l
#print(tick.labels)
#print(sum(my.hist$counts/l))

#axis(2, at=ticks, labels=tick.labels)


#Third version

#dat<-data.frame(df1$Edit_2017_2018_2.avg_16_q)
## Basic histogram from the vector "rating". Each bin is .5 wide.
## These both result in the same output:
#ggplot(dat, aes(x=df1.Edit_2017_2018_2.avg_16_q)) + geom_histogram(binwidth=.5)
# qplot(dat$rating, binwidth=.5)

# Draw with black outline, white fill
#ggplot(dat, aes(x=df1.Edit_2017_2018_2.avg_16_q)) +
#    geom_histogram(binwidth=.05, colour="black", fill="white")

#ggplot(dat, aes(x=df1.Edit_2017_2018_2.avg_16_q)) +
#    geom_histogram(aes(y=..density..),binwidth=.05, colour="black", fill="white")

# Density curve
#ggplot(dat, aes(x=df1.Edit_2017_2018_2.avg_16_q)) + geom_density()

# Histogram overlaid with kernel density curve
#ggplot(dat, aes(x=df1.Edit_2017_2018_2.avg_16_q)) + 
#    geom_histogram(aes(y=..density..),      # Histogram with density instead of count on y-axis
#                   binwidth=.05,
#                   colour="black", fill="white") +
#    geom_density(alpha=.3, fill="#FF6664",colour="blue")  # Overlay with transparent density plot


# Side by side barplot in ggplot2 R
#data %＞% ggplot(aes(x = clarity, fill = color)) +
#         geom_bar(color = "black", position = "dodge") +
#         scale_fill_manual(values = colors)

#using scale fill manual
#ggplot(my_over_hist,aes(x=class))+ 
#    geom_bar(data=subset(my_over_hist,group=='1'),aes(fill=group),alpha=0.5)+
#    geom_bar(data=subset(my_over_hist,group=='1'),aes(fill=group),alpha=0.5)+
#    scale_fill_manual(name="Score", values=c("red","darkgray"),labels=c("Colombia","USA"))


library(haven)
Edit_2017_2018_1 <- read_dta("~/Google Drive/Internship_WB_Summer/Edit/DataEditM2017-2018/Edit 2017_2018.dta")





