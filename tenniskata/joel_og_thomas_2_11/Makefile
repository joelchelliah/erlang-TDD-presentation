all: compile

compile: 
	erlc -o ebin +debug_info src/*.erl     
##        erl -pa ./ebin -eval "erl_make:make(development)" -s init stop -noshell

test: 
	erl -pa tennis2 -pa ebin/ -eval "eunit:test(tennis_scoreboard_test)." -s init stop -noshell

