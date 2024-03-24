WITH SeasonWinners AS (
  SELECT season, winner, COUNT(winner) as total_wins
  FROM [IPL t20].[dbo].[t20]
  GROUP BY season, winner
),
MaxWins AS (
  SELECT season, MAX(total_wins) as max_wins
  FROM SeasonWinners
  GROUP BY season
)
SELECT sw.season, sw.winner as ipl_winner 
FROM SeasonWinners sw
JOIN MaxWins mw ON sw.season = mw.season AND sw.total_wins = mw.max_wins
ORDER BY sw.season;
