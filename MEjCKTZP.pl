poz(0).
poz(1).
poz(2).
poz(3).

marki(flora).
marki(sport).
marki(kosmos).
marki(fauna).

lev(1, 0).
lev(2, 1).
lev(3, 2).
lev(0, 3).

naprotiv(0, 2).
naprotiv(2, 0).
naprotiv(1, 3).
naprotiv(3, 1).

vybor(PV, PNi, PNa, PNu, TNi, TNa, TNu) :-
    poz(PV), poz(PNi), poz(PNa), poz(PNu),
    PV \= PNi, PV \= PNa, PV \= PNu,
    PNi \= PNa, PNi \= PNu, PNa \= PNu,
    marki(TNi), marki(TNa), marki(TNu),
    TNi \= TNa, TNi \= TNu, TNa \= TNu,
    lev(PV, PNa),
    naprotiv(PNu, PNa),
    TNu \= sport,
    ( TNa = kosmos, lev(PNa, PNi)
    ; TNu = kosmos, lev(PNu, PNi)
    ).

pokaz(Imya, Poz, Marka) :-
    write(Imya), write(': тема - '), write(Marka),
    write(', место '), write(Poz), nl.

go :-
    vybor(PV, PNi, PNa, PNu, TNi, TNa, TNu),
    nl,
    pokaz('Серый Волк', PV, fauna),
    pokaz('Ниф-Ниф', PNi, TNi),
    pokaz('Наф-Наф', PNa, TNa),
    pokaz('Нуф-Нуф', PNu, TNu),
    nl.