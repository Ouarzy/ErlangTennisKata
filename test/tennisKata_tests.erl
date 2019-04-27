-module(tennisKata_tests).

-include_lib("eunit/include/eunit.hrl").

play([Winner_of_point | []]) ->
  play([Winner_of_point], tennisGame:start());
play(Players) ->
  play(Players, tennisGame:start()).
play([Winner_of_point | []], Score) ->
  tennisGame:wonPoint(Winner_of_point, Score);
play([Winner_of_point | Rest], Score) ->
  NewScore = tennisGame:wonPoint(Winner_of_point, Score),
  play(Rest, NewScore).

start_game_test() -> ?assertEqual(tennisGame:start(), {love, love}).

player1_won_point_test() -> 
	?assertEqual({fifteen, love}, play([player1])).


player2_won_point_test() -> 
	?assertEqual({love, fifteen}, play([player2])).


player1_won_point_and_player2_won_point_test() -> 
	?assertEqual({fifteen, fifteen}, play([player1, player2])).

player1_won_all_points_test() -> 
	?assertEqual({forty, love}, play([player1, player1, player1])),
	?assertEqual({love, forty}, play([player2, player2, player2])).

deuce_test() ->
	?assertEqual({deuce}, play([player1, player1, player1, player2, player2, player2])),
	?assertEqual({deuce}, play([player2, player2, player2, player1, player1, player1])).
