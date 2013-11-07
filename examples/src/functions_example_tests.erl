-module(functions_example_tests).
-include_lib("eunit/include/eunit.hrl").

%% Test

greet_world_test() -> ?assertEqual("Hello world!", functions_example:greet("World")).

factorial_base_case_test() -> ?assertEqual(2, functions_example:fac(1)).





































%  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %

%  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %

%  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %


%% %% Test generator
%% factorial_nth_case_test_() ->
%%   [?_assertEqual(2, functions_example:fac(2)),
%%     ?_assertEqual(6, functions_example:fac(3)),
%%     ?_assertEqual(24, functions_example:fac(4)),
%%     ?_assertEqual(120, functions_example:fac(5)),
%%     ?_assertEqual(720, functions_example:fac(6))].

%%
%% % Using helper functions to generate tests
%% factorial_nth_case_improved_test_() ->
%%   factorial_test_cases([{2,2}, {3,6}, {4,24}, {5,120}, {6,720}, {7,5040}]).
%%
%% % The helper function
%% factorial_test_case({N, Fac}) -> ?_assertEqual(Fac, functions_example:fac(N)).
%% factorial_test_cases(Cases) -> lists:map(fun factorial_test_case/1, Cases).
