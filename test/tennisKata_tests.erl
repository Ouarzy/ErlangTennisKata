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


player1_won_point_and_player2_won_point_test() -> 
	?assertEqual({fifteen, fifteen}, play([player1, player2])).

won_all_points_test() -> 
	?assertEqual({game, love}, play([player1, player1, player1, player1])),
	?assertEqual({love, game}, play([player2, player2, player2, player2])).

deuce_test() ->
	?assertEqual({deuce}, play([player1, player1, player1, player2, player2, player2])),
	?assertEqual({deuce}, play([player2, player2, player2, player1, player1, player1])).

advantage_test() ->
	?assertEqual({advantage, forty}, play([player1, player1, player1,  player2, player2, player2, player1])),
	?assertEqual({forty, advantage}, play([player1, player1, player1,  player2, player2, player2, player2])).

advantage_thenWin_test() ->
	?assertEqual({game, forty}, play([player1, player1, player1,  player2, player2, player2, player1, player1])),
	?assertEqual({forty, game}, play([player1, player1, player1,  player2, player2, player2, player2, player2])).

advantage_thenDeuce_test() ->
	?assertEqual({deuce}, play([player1, player1, player1,  player2, player2, player2, player1, player2])),
	?assertEqual({deuce}, play([player1, player1, player1,  player2, player2, player2, player2, player1])).
