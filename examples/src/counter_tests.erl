-module(counter_tests).
-include_lib("eunit/include/eunit.hrl").


not_error_proof__test() ->
  Pid = counter:start(),
  Result = counter:add(3, Pid),
  counter:stop(Pid),

  ?assertEqual(3, Result).

%% Fixture

% Setup fixture
counts_to_3_test_() ->
	{setup,
	 fun start/0,
	 fun stop/1,
	 fun add_3_to_counter/1}.


start() -> counter:start().

stop(Pid) -> counter:stop(Pid).


add_3_to_counter(Pid) -> [?_assertEqual(3, counter:add(3, Pid))].



















add_4_to_counter(Pid) -> [?_assertEqual(4, counter:add(4, Pid))].
add_5_to_counter(Pid) -> [?_assertEqual(5, counter:add(5, Pid))].
add_6_to_counter(Pid) -> [?_assertEqual(6, counter:add(6, Pid))].

%% counts_to_N_test_() ->
%%  	[{setup, fun start/0, fun stop/1, fun add_3_to_counter/1},
%%  	 {setup, fun start/0, fun stop/1, fun add_4_to_counter/1},
%%  	 {setup, fun start/0, fun stop/1, fun add_5_to_counter/1},
%%  	 {setup, fun start/0, fun stop/1, fun add_6_to_counter/1}].



 % Foreach fixture
%%  counts_to_N_2_test_() ->
%%  	{foreach,
%%  		fun start/0,
%%  		fun stop/1,
%%  		[fun add_3_to_counter/1, fun add_4_to_counter/1,
%%  		 fun add_5_to_counter/1, fun add_6_to_counter/1]}.