
-module(scoreboard).

-export([start/0, score/1, player_scores/2]).

start() -> spawn(fun loop/0).

score(Pid) ->
  Pid ! {score, self()},
  receive
    State ->
      State
  end.

player_scores(Pid, Player) ->
  Pid ! {player_scores, Player}.

loop() -> loop({0,0}).

loop(State) ->
  receive
    {player_scores, Player} ->
      NewState = tennis_rules:player_scores(State, Player),
      loop(NewState);
    {score, From} ->
      From ! State,
      loop(State)

  end.