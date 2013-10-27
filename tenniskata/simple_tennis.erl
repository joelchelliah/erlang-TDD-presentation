-module(simple_tennis).
-export([start_game/2, score/2, getscore/1, init/2]).

-record(score, {name, points=0}).

%% Example:
% Pid = simple_tennis:start_game("Joel", "Thomas").
% simple_tennis:score(Pid, "Joel").
% simple_tennis:score(Pid, "Thomas").
% simple_tennis:score(Pid, "Joel").
% simple_tennis:getscore(Pid).


%% API

start_game(P1, P2) -> spawn_link(?MODULE, init, [P1, P2]).

score(Pid, Player) -> Pid ! Player.

getscore(Pid) -> Pid ! show.



%% Server functions

init(P1, P2) -> loop(#score{name=P1}, #score{name=P2}).

updateScore(#score{name = N, points = P}) when P < 40 ->
	#score{name = N, points = P + 15};
updateScore(#score{name = N, points = P}) ->
	% mer logikk for å oppdatere poeng
	#score{name = N, points = P + 9000}. % ...jeg kan ikke reglene

showScore(Score1, Score2) -> 
	io:format("The current score is:~n Player 1: ~w~n Player 2: ~w~n",
			      [Score1#score.points, Score2#score.points]).

loop(Score1 = #score{name=P1}, Score2 = #score{name=P2}) ->
	receive
		P1 ->
			io:format("~s scored!~n", [P1]),
			loop(updateScore(Score1), Score2);
		P2 ->
			io:format("~s scored!~n", [P2]),
			loop(Score1, updateScore(Score2));
		show ->
			showScore(Score1, Score2),
			loop(Score1, Score2);
		Unknown ->
			io:format("Could not find player: ~s~n", [Unknown]),
			loop(Score1, Score2)
	end.