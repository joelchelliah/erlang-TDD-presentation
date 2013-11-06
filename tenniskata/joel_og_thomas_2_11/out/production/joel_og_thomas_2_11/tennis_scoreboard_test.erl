-module(tennis_scoreboard_test).
-include_lib("eunit/include/eunit.hrl").


%%suite_test_() ->
%%  {setup,
%%    fun()->
%%      Pid = tennis_scoreboard:start(),
%%      register(srv, Pid),
%%      Pid end,
%%    fun tennis_scoreboard:stop/1,
%%    [?_assertEqual({0,0}, tennis_scoreboard:actual_score(Pid)),
%%      ?_assertEqual({15,0} = tennis_scoreboard:player_scores(Pid, p1))]
%%  }.



remember_the_score_test() ->
  Pid = tennis_scoreboard:start(),
  {0,0} = tennis_scoreboard:actual_score(Pid).

get_score_after_player1_scores_test() ->
  Pid = tennis_scoreboard:start(),
  tennis_scoreboard:player_scores(Pid, p1),
  {15,0} = tennis_scoreboard:actual_score(Pid).

get_score_after_2_players_score__test() ->
  Pid = tennis_scoreboard:start(),
  tennis_scoreboard:player_scores(Pid, p2),
  {0,15} = tennis_scoreboard:actual_score(Pid).

get_score_after_a_long_match__test() ->
  Pid = tennis_scoreboard:start(),
  tennis_scoreboard:player_scores(Pid, p2),
  tennis_scoreboard:player_scores(Pid, p1),
  tennis_scoreboard:player_scores(Pid, p1),
  tennis_scoreboard:player_scores(Pid, p1),
  tennis_scoreboard:player_scores(Pid, p2),
  {40,30} = tennis_scoreboard:actual_score(Pid).

get_score_after_a_long_match__player2_wins__test() ->
  Pid = tennis_scoreboard:start(),
  tennis_scoreboard:player_scores(Pid, p2),
  tennis_scoreboard:player_scores(Pid, p1),
  tennis_scoreboard:player_scores(Pid, p1),
  tennis_scoreboard:player_scores(Pid, p1),
  tennis_scoreboard:player_scores(Pid, p2),
  tennis_scoreboard:player_scores(Pid, p2),
  tennis_scoreboard:player_scores(Pid, p2),
  tennis_scoreboard:player_scores(Pid, p2),
  {40,game_won} = tennis_scoreboard:actual_score(Pid).
