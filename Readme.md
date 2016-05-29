## Civil Rights Coverage in the NYT Over Time

Track the number of news stories about African American civil rights issues over the decades. We track the coverage using a simple keyword search. Article featuring any of the following keywords are taken to deal with black civil rights:
affirmative action, racial, voting rights, busing, african american, black, negro, racial discrimination, civil rights, segregation

You can track coverage aggregated over an entire year on the [NYT Chronicle](http://chronicle.nytlabs.com/?keyword=civil%20rights.black.african%20american.negro.racial.voting%20rights.racial%20descrimination.segregation.affirmative%20action.affirmative%20action.busing).

If you would like to get your own data, start by getting a [NYT Article Search API key](http://developer.nytimes.com/apps/register). Then you can use the R package, rtimes, using the following [script](scripts/using_rtimes.R) (Output: [Quarterly Data](nyt_rtimes.csv)) or the R package jsonlite using the following [script](scripts/using_jsonlite.R). You can plot the data using the following [script](scripts/plot.R). (See the [graph (pdf)](figs/nyt_aa.pdf).)

<img src="figs/nyt_aa.png" width="700">

**Note** 

The scripts track the number of articles containing the keyword search. But sometimes a more apt unit of measurement is the proportion of articles mentioning the search term. The point is especially important over great lengths of time as, over time, the number of articles published in the NYT has been increasing. To get the proportion of articles, you need to use the 'source facet.' For instance, if you look at the end of the output given by the following
[API Request](http://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=c2fede7bd9aea57c898f538e5ec0a1ee:6:68700045&facet_field=source&facet_filter=true&begin_date=20150710&end_date=20150710), you will see the total number of articles from various sources (Reuters, AP, NYT, Internet Video Archive, CNBC etc.) for the specified date (2015-07-10).       

### License

Scripts are released under the [MIT License](https://opensource.org/licenses/MIT).
