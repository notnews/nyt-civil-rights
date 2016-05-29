
"
Coverage of civil rights issues in NYT

Using rtimes package
https://github.com/rOpenGov/rtimes

# NYT Article Search API Key:
Go to: http://developer.nytimes.com/apps/register to get a key for the NYT Article Search API

" 

# Using a demo key from HDub
apikey <- "c2fede7bd9aea57c898f538e5ec0a1ee:6:68700045" 

# Set the key, load the lib.
options(nytimes_as_key = apikey)
library(rtimes)

# Dates
dates <- format(seq(as.Date("1851/1/1"), as.Date("2015/1/1"), by="3 months"), "%Y%m%d")

# Queries
qs <- c("affirmative action", "racial", "african american", "black", "negro", "racial discrimination", "civil rights", "segregation")

# Results df
results <- data.frame(startDate=NA, endDate=NA, afam=NA, racial=NA, aa=NA, black=NA, negro=NA, rd=NA, cr=NA, seg=NA)

# Loop through dates and qs
for(i in 1:(length(dates)-1)){
counts <- NA
for(j in 1:length(qs)){
counts[j] <- as_search(q=qs[j], begin_date = dates[i], end_date = dates[i+1])$meta[1]
# If you wanted to get articles matching the query just from the National Desk
# counts[j] <- as_search(q=qs[j], begin_date = dates[i], end_date = dates[i+1], fq = 'news_desk:("National Desk")')$meta[1]
}
results[i,] <- c(dates[i], dates[i+1], counts)
}

# Write out the results
write.csv(results, file="nyt_rtimes.csv", row.names=F)
