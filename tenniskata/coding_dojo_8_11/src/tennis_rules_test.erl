-module(tennis_rules_test).

-include_lib("eunit/include/eunit.hrl").

a_first_test() ->
  ?assertEqual(ok, tennis_rules:smoke()).