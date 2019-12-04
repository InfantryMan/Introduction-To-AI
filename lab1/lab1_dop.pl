opora_sfer('2.910.01', m6).
opora_sfer('2.910.02', m8).
opora_sfer('3.910.01', m12).
opora_sfer('3.910.01', m16).

opora_nasechka('2.911.01', m6).
opora_nasechka('2.911.02', m8).
opora_nasechka('3.911.01', m12).

shtir('2.213.01', m6, D):- D >= 6, D =< 8.
shtir('2.213.04', m8, D):- D >= 8, D =< 12.
shtir('3.213.06', m12, D):- D >= 12, D =< 26.

kulachok_rezb('2.913.05', '30_18', m6, 16).
kulachok_rezb('2.913.06', '45_22', m8, 20).
kulachok_rezb('2.913.09', '65_30', m12, 38).

kulachok_prizm_gor('2.913.01', '30_18', 10, DG):- DG >= 8, DG =< 12.
kulachok_prizm_gor('2.913.02', '45_22', 12, DG):- DG >= 8, DG =< 12.
kulachok_prizm_gor('2.913.07', '65_30', 25, DG):- DG >= 12, DG =< 30.

kulachok_prizm_vert('2.913.01', '30_18', 10, DB):- DB >= 3, DB =< 7.
kulachok_prizm_vert('2.913.02', '45_22', 12, DB):- DB >= 3, DB =< 7.
kulachok_prizm_vert('2.913.07', '65_30', 25, DB):- DB >= 8, DB =< 18.

zajim('2.451.01', '45_30', '30_18', 29).
zajim('2.451.02', '60_45', '45_22', 34).
zajim('3.451.01', '60_45', '45_22', 35).
zajim('3.451.02', '90_60', '65_30', 42).

prokladka('2.217.10', '45_30', 5).
prokladka('2.217.09', '45_30', 3).
prokladka('2.217.07', '45_30', 2).
prokladka('2.217.01', '45_30', 1).

prokladka('3.217.10', '60_45', 5).
prokladka('3.217.09', '60_45', 3).
prokladka('3.217.07', '60_45', 2).
prokladka('3.217.01', '60_45', 1).

prokladka('3.107.28', '90_60', 5).
prokladka('3.107.27', '90_60', 3).
prokladka('3.107.25', '90_60', 2).


count([], _, 0).
count([H|T], El, N) :-
    El \= H,
    count(T, El, N).
count([H|T], El, N) :-
    El = H,
    count(T, El, N1),
    N is N1 + 1.

countHead([]) :- !.
countHead([H|T]) :-
    count([H|T], H, N),
    write(H),
    write(' :  '),
    writeln(N),
    delete([H|T], H, ResL),
    countHead(ResL).

firstElem([H|T], First):- First=[H].

sumToH([Ha|_], Sum, [Ha]) :- SumN is Sum - Ha, SumN = 0, !.
sumToH([Ha|Ta], Sum, [Ha|Tres]) :- SumN is Sum - Ha, SumN > 0, sumToH([Ha|Ta], SumN, Tres), !.

sumToH([Ha|Ta], Sum, ResL) :- SumN is Sum - Ha, SumN < 0, sumToH(Ta, Sum, ResL), !.

sumToH([_|Ta], Sum, ResL) :- sumToH(Ta, Sum, ResL).
sumToH([], _, _) :- !,fail.

% prokl_compl(H, _, N, Tail):- Tail = [], H < 0, N is 0, writeln('\'H\' should be more'), !, fail.
prokl_compl(H, _, _, Tail):- Tail = [], H < 0, !, fail.
prokl_compl(0, _, 0, Tail):- Tail = [], !.
prokl_compl(H, Size, N, List) :-
    findall(Hps, prokladka(_,Size,Hps), Heights),
    sumToH(Heights, H, Variant),
    % writeln(Variant),
    % firstElem(Variant, First),
    prokl_compl2(Size, N, List, Variant).

prokl_compl2(_, 0, Tail, []):- Tail = [], !.
prokl_compl2(Size, N, [Head|Tail], [Hv|Tv]):-
    % writeln('---1---'),
    % findMaxH(Heights, H, GH),
    % write('H = '),
    % writeln(H),
    % write('GH = '),
    % writeln(GH),
    prokladka(ID, Size, Hv),
    prokl_compl2(Size, N1, Tail, Tv),
    Head = ID,
    N is N1 + 1.
    % write('Pr #'),
    % write(N),
    % write(' = '),
    % writeln(ID).

prokladki(0, TR):-  !.
prokladki(H, TR):-  prokladka(Code, TR, H1),
                    H - H1 >= 0,
                    H2 is H - H1,
                    prokladki(H2, TR),
                    write(Code), tab(3), write(H1), nl.

min_list([MinElem], MinElem):-!.
min_list([Head|Tail], MinElem):-
    min_list(Tail, TailMinElem),
    TailMinElem < Head, !, MinElem = TailMinElem;
    MinElem = Head.

move_max_to_end([], []):- !.
move_max_to_end([Head], [Head]):- !.
move_max_to_end([First, Second|Tail], [Second|ListWithMaxEnd]):-
  length(First, L1), length(Second, L2),
  L1 > L2, !,
  % First > Second, !,
  move_max_to_end([First|Tail], ListWithMaxEnd).
move_max_to_end([First, Second|Tail], [First|ListWithMaxEnd]):-
  move_max_to_end([Second|Tail], ListWithMaxEnd).

bubble_sort(SortedList, SortedList):-
  move_max_to_end(SortedList, DoubleSortedList),
  SortedList = DoubleSortedList, !.
bubble_sort(List, SortedList):-
  move_max_to_end(List, SortedPart),
  bubble_sort(SortedPart, SortedList).

write_lists([]):- !.
write_lists([H | T]):- writeln(H),
                       write_lists(T).

optimal(H, 'perfor', D, N) :-
    findall(L, instr(H, 'perfor', D, L, _), Lists),
    findall(N, instr(H, 'perfor', D, _, N), Ns),
    bubble_sort(Lists, SortedLists),
    write_lists(SortedLists).

% Заготовки со специальными технологическими отверстиями
instr(H, 'perfor', D, List, N):-
                            shtir(Code_sh, DM, D),
                            kulachok_rezb(Code_kul, TR_kul, DM, H_kul),
                            zajim(Code_zaj, TR_zaj, TR_kul, H_zaj),
                            H_pr is H-(H_kul+H_zaj+30),
                            H_pr > 0,
                            % write('Sum H_pr: '), write(H_pr), nl,
                            % prokladki(H_pr, TR_zaj),
                            prokl_compl(H_pr, TR_zaj, N, List).
                            % countHead(List),
                            % write_instr('perfor', false, Code_sh, Code_kul, Code_zaj).

write_instr(Type_zag, Code_op, Code_sh, Code_kul, Code_zaj):-

                                                             ((Type_zag='plosk_chist' ; Type_zag='plosk_chern') ->
                                                             write('Kod opori: '), write(Code_op), nl;

                                                             (Type_zag='perfor' ->
                                                             write('Kod shtirya: '), write(Code_sh), nl; write(''))),

                                                             write('Kod kulachka: '), write(Code_kul), nl,
                                                             write('Kod zajima: '), write(Code_zaj).
