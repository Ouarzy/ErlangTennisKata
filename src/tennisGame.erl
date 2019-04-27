-module(tennisGame).

%% API
-export([start/0]).
-export([wonPoint/2]).

increase(love) -> fifteen;
increase(fifteen) -> thirty;
increase(thirty) -> forty;
increase(forty) -> game.

start() -> {love, love}.

wonPoint(player1, {deuce}) -> {advantage, forty};
wonPoint(player2, {deuce}) -> {forty, advantage};
wonPoint(player2, {forty, thirty}) -> {deuce};
wonPoint(player1, {thirty, forty}) -> {deuce};
wonPoint(player1, {P1PreviousScore, P2PreviousScore}) -> {increase(P1PreviousScore), P2PreviousScore};
wonPoint(player2, {P1PreviousScore, P2PreviousScore}) -> {P1PreviousScore, increase(P2PreviousScore)}.
