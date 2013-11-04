-module(tennis_rules).

%% API
-export([player_scores/1, a_player_scores/2]).

a_player_scores({40, 40}, p1) ->
  {adv, 40};
a_player_scores({40, 40}, p2) ->
  {40, adv};
a_player_scores({Points1, Points2}, p1) ->
  {player_scores(Points1), Points2};
a_player_scores({Points1, Points2}, p2) ->
  {Points1, player_scores(Points2)}.

player_scores(Points) when Points < 30 ->
  Points + 15;
player_scores(30) ->
  40;
player_scores(40) ->
  game_won;
player_scores(adv) ->
  game_won.


