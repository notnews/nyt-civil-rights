"
Coverage of civil rights issues in NYT

Using jsonlite

# NYT Article Search API Key:
Go to: http://developer.nytimes.com/apps/register to get a key for the NYT Article Search API
"

library(jsonlite)

# Using a demo key from HDub
apikey <- "c2fede7bd9aea57c898f538e5ec0a1ee:6:68700045" 

# Dates
dates <- format(seq(as.Date("2014/9/1"), as.Date("2015/5/1"), by="3 months"), "%Y%m%d")

# Queries
qs <- c("affirmative+action", "racial", "african+american", "black", "negro", "racial+discrimination", "civil+rights", "segregation")

# Using a demo key from HDub
uri <- paste0("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=", qs[2], "&begin_date=", dates[1],"&end_date=", dates[2],"&api-key=", apikey)
fromJSON(uri)

# Results df
results <- data.frame(startDate=NA, endDate=NA, afam=NA, racial=NA, aa=NA, black=NA, negro=NA, rd=NA, cr=NA, seg=NA)

# Loop through dates and qs
for(i in 1:(length(dates)-1)){
counts <- NA
for(j in 1:length(qs)){
# Get All articles
uri <- paste0("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=", qs[j], "&begin_date=", dates[i],"&end_date=", dates[i+1],"&api-key=", apikey)
res <- fromJSON(uri)
counts[j] <- res$response$meta$hits
}
results[i,] <- c(dates[i], dates[i+1], counts)
}

# Write out the results
write.csv(results, file="nyt_basic2.csv", row.names=F)