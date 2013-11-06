-module(fibonacci_test).
-include_lib("eunit/include/eunit.hrl").

f0_er_0__test() ->
  ?assertEqual(0, fibonacci:fib(0)).

f1_er_1__test() ->
  ?assertEqual(1, fibonacci:fib(1)).

f4_er_3__test() ->
  ?assertEqual(3, fibonacci:fib(4)).

f20_er_6765__test() ->
  ?assertEqual(6765, fibonacci:fib(20)).

f_minus1_er_error__test() ->
  ?assertEqual(error, fibonacci:fib(-1)).
