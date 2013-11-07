all: clean compile test

clean:
	rm ebin/*.beam

compile: 
	erlc -o ebin +debug_info src/*.erl     

test: 
	erl  -pa ebin/ -eval "eunit:test(tennis_rules_test)." -s init stop -noshell

