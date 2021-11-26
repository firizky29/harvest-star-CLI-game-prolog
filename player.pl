
:- include('map.pl').
% fakta-fakta dari player
% reqexp(level, N) : reqierementXP

reqexp(0, 0).
reqexp(1, 300).
reqexp(2, 700).
reqexp(3, 1500).
reqexp(4, 3100).
reqexp(5, 6300).
reqexp(6, 12700).
reqexp(7, 25500).
reqexp(8, 51100).
reqexp(9, 102300).
reqexp(10, 204500).

% Move Player
w :-
    playerLoc(X, Y),
    (X =:= 1),
    write('You can\'t go beyond borders'), nl, !.

w:-
    playerLoc(X, Y),
    X1 is X-1,
    tile(X1, Y, water),
    write('You can\'t swim, can you? stop playing around!'), nl, !.

w:- 
    playerLoc(X, Y),
    X1 is X-1,
    retract(playerLoc(_, _)),
    asserta(playerLoc(X1, Y)),
    retract(tile(X,Y,player)),
    retract(tile(X1, Y, _)),
    asserta(tile(X,Y,empty)),
    asserta(tile(X1, Y, player)), !.

s :-
    playerLoc(X, Y),
    heightMap(H),
    (X =:= (H-2)),
    write('You can\'t go beyond borders'), nl, !.

s:-
    playerLoc(X, Y),
    X1 is X+1,
    tile(X1, Y, water),
    write('You can\'t swim, can you? stop playing around!'), nl, !.

s:- 
    playerLoc(X, Y),
    X1 is X+1,
    retract(playerLoc(_, _)),
    asserta(playerLoc(X1, Y)),
    retract(tile(X,Y,player)),
    retract(tile(X1, Y, _)),
    asserta(tile(X,Y,empty)),
    asserta(tile(X1, Y, player)), !.

a :-
    playerLoc(X, Y),
    (Y =:= 1),
    write('You can\'t go beyond borders'), nl, !.

a:-
    playerLoc(X, Y),
    Y1 is Y-1,
    tile(X, Y1, water),
    write('You can\'t swim, can you? stop playing around!'), nl, !.

a:- 
    playerLoc(X, Y),
    Y1 is Y-1,
    retract(playerLoc(_, _)),
    asserta(playerLoc(X, Y1)),
    retract(tile(X,Y,player)),
    retract(tile(X, Y1, _)),
    asserta(tile(X,Y,empty)),
    asserta(tile(X, Y1, player)), !.


d :-
    playerLoc(X, Y),
    heightMap(H),
    (Y =:= H-2),
    write('You can\'t go beyond borders'), nl, !.

d:-
    playerLoc(X, Y),
    Y1 is Y+1,
    tile(X, Y1, water),
    write('You can\'t swim, can you? stop playing around!'), nl, !.

d:- 
    playerLoc(X, Y),
    Y is Y+1,
    retract(playerLoc(_, _)),
    asserta(playerLoc(X, Y1)),
    retract(tile(X,Y,player)),
    retract(tile(X, Y1, _)),
    asserta(tile(X,Y,empty)),
    asserta(tile(X, Y1, player)), !.

    
    

