-module(tennisKata_tests).

-include_lib("eunit/include/eunit.hrl").

new_game_test() -> ?assertEqual(tennisGame:start(), {love, love}).

player1_won_point_test() -> 
	?assertEqual({fifteen, love},  tennisGame:wonPoint(player1, tennisGame:start())).


player2_won_point_test() -> 
	?assertEqual({love, fifteen}, tennisGame:wonPoint(player2, tennisGame:start())).


player1_won_point_and_player2_won_point_test() -> 
	?assertEqual({fifteen, fifteen}, tennisGame:wonPoint(player2, tennisGame:wonPoint(player1, tennisGame:start()))).
