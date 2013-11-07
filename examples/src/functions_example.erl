-module(functions_example).
-export([greet/1, abs/1, fac/1, fib/1]).


%% Pattern matching
greet("World") -> "Hello world!";
greet(42) -> "...";
greet({Name, Title}) -> "Hello " ++ Title ++ " " ++ Name;
greet(Name) -> "Hey " ++ Name.



%% Guards
abs(X) when (X < 0) -> -X;
abs(X) -> X.




%% Other examples

% Factorial
fac(1) -> 1;
fac(X) when X > 1 -> X * fac(X-1);
fac(_) -> error.

% Fibonacci
fib(0) -> 0;
fib(1) -> 1;
fib(X) when X > 1 -> fib(X-1) + fib(X-2);
fib(_) -> error.