
:- dynamic(animal_count/2).
:- dynamic(last_ranch_visit_chicken/1).
:- dynamic(last_ranch_visit_cow/1).
:- dynamic(last_ranch_visit_sheep/1).


ranch_animal(ayam).
ranch_animal(sapi).
ranch_animal(domba).

animal_count(ayam,0).
animal_count(sapi,0).
animal_count(domba,0).

last_ranch_visit_chicken(0).
last_ranch_visit_cow(0).
last_ranch_visit_sheep(0).

ranchCheat :-
    retract(playerLoc(_, _)),
    tile(X,Y,ranch),
    asserta(playerLoc(X,Y)), !.

ranch :-
    playerLoc(X,Y),
    tile(X,Y,ranch),
    write('Welcome to the ranch! You have:'),nl,
    forall(ranch_animal(Animal),
           (
               animal_count(Animal, Count),write(Count),write(' '),write(Animal),nl
           )
          ),
    write('What do you want to do?'),nl,!.
% TODO: change egg production logic to depend on chickens's age
% Priority2 as it need to track every buys
eggProduction(M) :-
    day(D),
    last_ranch_visit(LastVisit),
    Diff is D - LastVisit,
    animal_count(ayam,AyamCount),
    random(0,0.2,P),
    M is AyamCount * Diff * round(5 * P), !.

% TODO: change wool production logic to depend on sheep's age
% Priority2 as it need to track every buys
woolProduction(M) :-
    day(D),
    last_ranch_visit(LastVisit),
    Diff is D - LastVisit,
    animal_count(domba,DombaCount),
    random(0,0.2,P),
    M is DombaCount * Diff * round(2 * P), !.

% TODO: Change meat production logic to counts of the cow and its ages
milkProduction(M) :-
    day(D),
    last_ranch_visit(LastVisit),
    Diff is D - LastVisit,
    animal_count(sapi,SapiCount),
    random(0,0.6,P),
    M is SapiCount * Diff * round(10 * P), !.

increaseRanchingExp(ProductionCount, M) :-
    M is ProductionCount * 4, 
    gainExp(ranch, M), !.

    
ayam :-
    playerLoc(X,Y),
    tile(X,Y,ranch),
    eggProduction(M),
    M > 0,
    write('Your chicken lays '),
    write(M),
    write(' eggs.'),nl,
    inventory(telur, produce, ExistingEggs),
    NewEggs is ExistingEggs + M,
    retract(inventory(telur, produce, _)),
    asserta(inventory(telur, produce, NewEggs)),
    write('Now, you have '),
    write(NewEggs),
    write(' eggs.'),nl,
    increaseRanchingExp(M, NewExp),
    write('You gain '),
    write(NewExp),
    write(' exp.'),nl,
    day(D),
    retract(last_ranch_visit_chicken(_)),
    ,!.

ayam :-
    write('Your chicken lays no eggs today <(＿　＿)>'),nl,!.

domba :-
    playerLoc(X,Y),
    tile(X,Y,ranch),
    woolProduction(M),
    M > 0,
    write('Your sheep produces '),
    write(M),
    write(' kg of wool.'),nl,
    inventory(sutra, produce, ExistingWool),
    NewWool is ExistingWool + M,
    retract(inventory(sutra, produce, _)),
    asserta(inventory(sutra, produce, NewWool)),
    write('Now, you have '),
    write(NewWool),
    write(' kg of wool.'),nl,
    increaseRanchingExp(M, NewExp),
    write('You gain '),
    write(NewExp),
    write(' exp.'),nl,!.

    

sapi :-
    playerLoc(X,Y),
    tile(X,Y,ranch),
    milkProduction(M),
    M > 0,
    write('Your cow produces '),
    write(M),
    write(' litres of milk.'),nl,
    inventory(susu, produce, ExistingMilk),
    NewMilk is ExistingMilk + M,
    retract(inventory(susu, produce, _)),
    asserta(inventory(susu, produce, NewMilk)),
    write('Now, you have '),
    write(NewMilk),
    write(' litres of milk.'),nl,
    increaseRanchingExp(M, NewExp),
    write('You gain '),
    write(NewExp),
    write(' exp.'),nl,!.

