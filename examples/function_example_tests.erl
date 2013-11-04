-module(function_example_tests).
-include_lib("eunit/include/eunit.hrl").


% Test
factorial_base_case_test() ->
	?assertEqual(1, function_example:fac(1)).

% Test generator
nth_factorial_test_() ->
	 [?_assertEqual(2, function_example:fac(2)),
		?_assertEqual(6, function_example:fac(3)),
		?_assertEqual(24, function_example:fac(4)),
		?_assertEqual(121, function_example:fac(5))].