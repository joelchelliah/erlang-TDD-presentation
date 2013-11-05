-module(records_example).

-record(cat, {name, color=red, details=[]}).


make_cat() -> #cat{name = "Bob", color=green}.


inspect_cat(Cat = #cat{name=Name}) -> 	% pattern-matching record and field
	...
	Cat#cat.color 	% retrieve a field from the record
	...
	