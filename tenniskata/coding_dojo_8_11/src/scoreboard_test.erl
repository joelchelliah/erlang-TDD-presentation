-module(scoreboard_test).
-author("thomas").

-include_lib("eunit/include/eunit.hrl").

when_the_match_starts_the_score_shoud_be_0_0_test() ->
  Pid = scoreboard:start(),
  ?assertEqual({0,0}, scoreboard:score(Pid)).

when_the_match_starts_and_player1_scores_the_score_shoud_be_15_0_test() ->
  Pid = scoreboard:start(),
  scoreboard:player_scores(Pid, player1),
  ?assertEqual({15,0}, scoreboard:score(Pid)).

when_the_match_is_started_and_player1_scores_twice_the_score_should_be_30_0_test() ->
  Pid = scoreboard:start(),
  scoreboard:player_scores(Pid, player1),
  scoreboard:player_scores(Pid, player1),
  ?assertEqual({30,0}, scoreboard:score(Pid)).

when_the_match_is_started_and_player1_scores_from_40_heorshewins_test() ->
  Pid = scoreboard:start(),
  scoreboard:player_scores(Pid, player1),
  scoreboard:player_scores(Pid, player1),
  scoreboard:player_scores(Pid, player1),
  scoreboard:player_scores(Pid, player1),
  ?assertEqual({won,0}, scoreboard:score(Pid)).

when_the_match_starts_and_player2_scores_the_score_should_be_0_15_test() ->
  Pid = scoreboard:start(),
  scoreboard:player_scores(Pid, player2),
  ?assertEqual({0,15 }, scoreboard:score(Pid)).
