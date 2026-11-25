#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Start fresh by clearing all table entries each time
CLEARTABLES=$($PSQL "TRUNCATE games,teams")
#cho $CLEARTABLES

# Read and insert teams

while IFS=, read -r _ _ TEAM1 TEAM2 _; do
  if [[ "$TEAM1" == "winner" ]]; then
    continue
  fi

#echo $team1 $team2
  INSERTTEAM1=$($PSQL "INSERT INTO teams (name) VALUES ('$TEAM1')")
  INSERTTEAM2=$($PSQL "INSERT INTO teams (name) VALUES ('$TEAM2')")
done < games.csv

# Read and insert games (Doing this in a second while loop is inefficient, but corresponds directly to the task list)

while IFS=, read -r YEAR ROUND WINNER OPPONENT WINNERGOALS OPPONENTGOALS ; do
  if [[ "$WINNER" == "winner" ]]; then
    continue
  fi
  # get winner and opponent id values:
  WINNERID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  #echo $WINNERID
  OPPONENTID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  #echo $OPPONENTID
  INSERTGAME=$($PSQL "INSERT INTO games (year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES ($YEAR,'$ROUND',$WINNERID,$OPPONENTID,$WINNERGOALS,$OPPONENTGOALS)")
done < games.csv
