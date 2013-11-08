-module(tennis_rules).

%% API
-export([add_point/1, player_scores/2]).

add_point(0) -> 15;
add_point(15) -> 30;
add_point(30) -> 40;
add_point(40) -> won;
add_point(adv) -> won;
add_point(_) -> error.


player_scores({adv, 40}, player2) -> {40, 40};
player_scores({40, adv}, player1) -> {40, 40};
player_scores({40, 40}, player1) -> {adv, 40};
player_scores({40, 40}, player2) -> {40, adv};
player_scores({P1, P2}, player1) -> {add_point(P1), P2};
player_scores({P1, P2}, player2) -> {P1, add_point(P2)}.
