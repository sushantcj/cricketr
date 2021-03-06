##########################################################################################
# Designed and developed by Tinniam V Ganesh
# Date : 13 May 2016
# Function: relativeBowlerCumulativeAvgEconRate
# This function computes and plots the relativecumulative average economy rates bowlers
#
###########################################################################################

relativeBowlerCumulativeAvgEconRate <- function(frames, names){
    Econ=cs=no=bowler=NULL
    g <- NULL
    for(i in 1:length(frames))
    {
        df <- cleanBowlerData(frames[[i]]) 
        b <- select(df,Econ)
        b$no<-seq.int(nrow(b))
        c <- select(b,no,Econ)
        
        d <- mutate(c,cs=cumsum(Econ)/no)
        d$bowler <- names[[i]]
        g <- rbind(g,d)
    }
    plot.title= paste("Relative cumulative avg Economy Rate vs No innings")
    ggplot(g,aes(no,cs,colour=bowler)) +geom_line(size=1) +
        xlab("No of innings") + ylab("Cumulative Avg. Economy Rate") +
        ggtitle(bquote(atop(.(plot.title),
                            atop(italic("Data source:ESPN Cricinfo"),""))))
}
