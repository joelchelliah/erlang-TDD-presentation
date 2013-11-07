-module(counter).

%% API
-export([start/0, stop/1, add/2]).


%% accessible functions

%% usage : Pid = adder:start().
start() -> spawn(fun loop/0).

stop(Pid) -> Pid ! stop.

%% 0 = adder:add(0, Pid).
add(D, Pid) ->
  Pid ! {add_to_counter, D, self()},
  receive
    {actual_value, N} ->
      N
  end.


% internal functions

loop() -> loop(0).
loop(State) ->
  receive
    {add_to_counter, Value, From} ->
      NewState = State + Value,
      From ! {actual_value, NewState},
      loop(NewState);
    stop -> ok
  end.