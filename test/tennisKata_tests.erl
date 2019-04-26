-module(tennisKata_tests).

-include_lib("eunit/include/eunit.hrl").

new_game_test() -> ?assertEqual(tennisGame:start(), {love, love}).

player1_won_point_test() -> ?assertEqual(tennisGame:wonPoint(player1, tennisGame:start()), {fifteen, love}).



