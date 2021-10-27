library(httr)

auction_get <- GET("https://fantasy.espn.com/apis/v3/games/fba/seasons/2022/segments/0/leaguedefaults/1?view=kona_player_info", 
                   add_headers("X-Fantasy-Filter" = 
                               '{"players":{"filterSlotIds":{"value":[0,1,2,3,4,5,6,7,8,9,10,11]},"sortAdp":{"sortPriority":2,"sortAsc":true},"sortDraftRanks":{"sortPriority":100,"sortAsc":true,"value":"STANDARD"},"limit":881,"filterStatsForTopScoringPeriodIds":{"value":5,"additionalValue":["002022","102022","002021","012022","022022","032022","042022"]}}}'))

auction_content <- jsonlite::fromJSON(content(auction_get, as = "text"))


frame <- data.frame(auction_content$players$player$firstName,
                    auction_content$players$player$lastName,
                    auction_content$players$player$ownership,
                    auction_content$players$player$draftRanksByRankType)

espn_information
