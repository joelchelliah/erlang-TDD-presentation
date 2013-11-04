-module(tennis_scoreboard).


%% API
-export([actual_score/1, start/0, player_scores/2, stop/1]).

start() -> spawn(fun loop/0).
stop(Pid) -> Pid ! stop.

player_scores(Pid, Player) ->
  Pid ! {player_scores, Player}.

actual_score(Pid) ->
  Pid ! {self(), get_score},
  receive
    Score -> Score
  end.


loop() -> loop({0,0}).
loop(Actual_score) ->
  receive
    {player_scores, Player} ->
      loop(tennis_rules:a_player_scores(Actual_score, Player));
    {From, get_score} ->
      From ! Actual_score,
      loop(Actual_score);
    stop -> ok
  end.
