-module(tennis_rules_test).
-include_lib("eunit/include/eunit.hrl").

a_player_scores_the_first_point_test() ->
  ?assertEqual(15, tennis_rules:player_scores(0)).

a_player_scores_the_second_point_test() ->
  ?assertEqual(30, tennis_rules:player_scores(15)).

a_player_scores_the_third_point_test() ->
  ?assertEqual(40, tennis_rules:player_scores(30)).

a_player_scores_the_last_point_in_the_game_test() ->
  ?assertEqual(game_won, tennis_rules:player_scores(40)).

player1_scores_test() ->
  ?assertEqual({15, 0}, tennis_rules:a_player_scores({0, 0}, p1)),
  ?assertEqual({30, 0}, tennis_rules:a_player_scores({15, 0}, p1)),
  ?assertEqual({30, 15}, tennis_rules:a_player_scores({15, 15}, p1)),
  ?assertEqual({40, 30}, tennis_rules:a_player_scores({30, 30}, p1)),
  ?assertEqual({40, 40}, tennis_rules:a_player_scores({30, 40}, p1)),
  ?assertEqual({adv, 40}, tennis_rules:a_player_scores({40, 40}, p1)),
  ?assertEqual({game_won, 40}, tennis_rules:a_player_scores({adv, 40}, p1)).



player2_scores_test() ->
  ?assertEqual({0, 15}, tennis_rules:a_player_scores({0, 0}, p2)),
  ?assertEqual({0, 30}, tennis_rules:a_player_scores({0, 15}, p2)),
  ?assertEqual({0, 40}, tennis_rules:a_player_scores({0, 30}, p2)),
  ?assertEqual({15, 30}, tennis_rules:a_player_scores({15, 15}, p2)),
  ?assertEqual({15, 40}, tennis_rules:a_player_scores({15, 30}, p2)),
  ?assertEqual({15, 40}, tennis_rules:a_player_scores({15, 30}, p2)),
  ?assertEqual({30, 40}, tennis_rules:a_player_scores({30, 30}, p2)),
  ?assertEqual({30, game_won}, tennis_rules:a_player_scores({30, 40}, p2)),
  ?assertEqual({40, adv}, tennis_rules:a_player_scores({40, 40}, p2)),
  ?assertEqual({40, game_won}, tennis_rules:a_player_scores({40, adv}, p2)).

