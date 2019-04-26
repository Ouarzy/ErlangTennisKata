-module(tennisGame).

%% API
-export([start/0]).
-export([wonPoint/2]).

start() -> {love, love}.

wonPoint(player1, _) -> {fifteen, love}.		    	
