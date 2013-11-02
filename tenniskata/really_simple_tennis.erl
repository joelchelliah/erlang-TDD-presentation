-module(really_simple_tennis).
-export([score/2, results/2]).


score(player1, {Score1, Score2}) -> {updateScore(Score1), Score2};
score(player2, {Score1, Score2}) -> {Score1, updateScore(Score2)}.

results(Score, Score) when Score > 30 -> "Deuce";
results(Score1, Score2) -> io:format("Player 1: ~w~n Player 2: ~w~n", [Score1, Score2]).

updateScore(Score) -> Score + 15.
