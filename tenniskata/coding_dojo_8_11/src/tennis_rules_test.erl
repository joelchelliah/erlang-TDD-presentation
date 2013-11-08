-module(tennis_rules_test).

-include_lib("eunit/include/eunit.hrl").

add_point_to_0_returns_15_test() ->
  ?assertEqual(15, tennis_rules:add_point(0)).

add_point_to_15_returns_30_test() ->
  ?assertEqual(30, tennis_rules:add_point(15)).

add_point_to_30_returns_40_test() ->
  ?assertEqual(40, tennis_rules:add_point(30)).

add_point_to_40_returns_won_test() ->
  ?assertEqual(won, tennis_rules:add_point(40)).

add_point_when_adv_returns_won_test() ->
  ?assertEqual(won, tennis_rules:add_point(adv)).

add_point_to_22_returns_error_test() ->
?assertEqual(error, tennis_rules:add_point(22)).

add_point_to_player1_when_score_is_0_0_test() ->
?assertEqual({15,0}, tennis_rules:player_scores({0,0}, player1)).

add_point_to_player2_when_score_is_15_30_test() ->
  ?assertEqual({15,40}, tennis_rules:player_scores({15,30}, player2)).

player2_wins_when_score_is_15_40_and_scores_test() ->
  ?assertEqual({15,won}, tennis_rules:player_scores({15,40}, player2)).

player1_wins_when_score_is_40_30_and_scores_test() ->
  ?assertEqual({won,30}, tennis_rules:player_scores({40,30}, player1)).

player1_gets_advantage_when_score_is_40_40_and_scores_test() ->
  ?assertEqual({adv,40}, tennis_rules:player_scores({40,40}, player1)).

player2_gets_advantage_when_score_is_40_40_and_scores_test() ->
  ?assertEqual({40,adv}, tennis_rules:player_scores({40,40}, player2)).

player1_wins_if_scores_when_has_advantage_test() ->
  ?assertEqual({won,40}, tennis_rules:player_scores({adv,40}, player1)).

players_go_back_to_deuce_if_player2_Without_advantage_scores_test() ->
  ?assertEqual({40,40}, tennis_rules:player_scores({adv,40}, player2)).

players_go_back_to_deuce_if_player1_Without_advantage_scores_test() ->
  ?assertEqual({40,40}, tennis_rules:player_scores({40, adv}, player1)).