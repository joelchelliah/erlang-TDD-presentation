all: clean compile test

clean:
	touch ebin/a_file.beam
	rm ebin/*.beam
	touch out/production/tennis/a_file.beam
	rm out/production/tennis/*.* 

compile: 
	erlc -o ebin +debug_info src/*.erl     

test: 
	erl  -pa ebin/ -eval "eunit:test(tennis_rules_test)." -s init stop -noshell

