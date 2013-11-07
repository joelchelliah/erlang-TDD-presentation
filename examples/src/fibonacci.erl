-module(fibonacci).

%% API
-export([fib/1]).

fib(0) -> 0;

fib(1) -> 1;

fib(X) when X > 1 -> fib(X - 1) + fib(X - 2);

fib(_) -> error.