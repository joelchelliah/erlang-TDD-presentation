-module(loop_example).
-export([greet/0, counter/1, counter2/1, counter2_client/0]).


%%% En enkel loop

% Pid = spawn(loop_example, greet, []).
% Pid ! "World".
greet() ->
	receive
		"World" -> io:format("Hello World~n"),
							 greet();
		Name 		-> io:format("Howdy ~s~n", [Name]),
							 greet()
	end.



%%% En loop med state

% Pid = spawn(loop_example, counter, [0]).
% Pid ! inc.
% Pid ! show.
counter(X) ->
	receive
		inc  -> io:format("Incrementing counter~n"),
						counter(X + 1);
		show -> io:format("Counter: ~w~n", [X]),
						counter(X)
	end.



%%% En loop som svarer til klienten

% Pid = spawn(loop_example, counter2, [0]).
% Pid ! {inc, self()}.
% Pid ! {show, self()}.
% flush().
counter2(X) ->
	receive
		{inc, Pid}  -> Pid ! ok,
									 counter2(X + 1);
		{show, Pid} -> Pid ! {result, X},
									 counter2(X)
	end.


% En klient som bruker counter2

counter2_client() ->
	Pid = spawn(?MODULE, counter2, [0]),
	Pid ! {inc, self()},
	Pid ! {inc, self()},
	Pid ! {inc, self()},
	Pid ! {show, self()},
	receive
		{result, X}  -> io:format("Counter: ~w~n", [X])
	% delay ?
	end.
