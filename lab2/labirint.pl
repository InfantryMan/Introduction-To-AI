prohod(a, b, 5).
prohod(b, d, 3).
prohod(d, c, 2).
prohod(a, e, 2).
prohod(e, c, 1).

% prohod(b, c, 7).

prohod(b, a, 5).
prohod(d, b, 3).
prohod(c, d, 2).
prohod(e, a, 2).
prohod(c, e, 1).


prohod(b, c, 7).
prohod(c, b, 7).

prohod(e, d, 3).
prohod(d, e, 3).

path(From, To, [H | T]):- prohod(From, X, H1),
                          X=To,
                          H=H1,
                          T=[].

path(From, To, [H | T]):- prohod(From, X, H),
                          X\=To,
                          path(X, To, T).

v_glubinu(B, [B]):- writeln('1'), writeln(B).
v_glubinu(B, [B | Resh1]):- writeln('2'), prohod(B, B1, _),
                                      v_glubinu(B1, Resh1).

v_glubinu2( Way, B, [ B ] ) :- nl.
v_glubinu2( Way, B, [B | Resh] ) :- writeln(Way),
                                    writeln(B),
                                    writeln(Resh),
                                    prohod( B, B1, X),
                                    not( member( B1, Way ) ),
                                    v_glubinu2( [ B | Way ], B1, Resh ).

user_interface( B, Resh ) :- v_glubinu2( [ ], B, Resh ).



move_max_to_end([], []):- !.
move_max_to_end([Head], [Head]):- !.
move_max_to_end([First, Second|Tail], [Second|ListWithMaxEnd]):-
  % length(First, L1), length(Second, L2),
  % L1 > L2, !,
  First > Second, !,
  move_max_to_end([First|Tail], ListWithMaxEnd).
move_max_to_end([First, Second|Tail], [First|ListWithMaxEnd]):-
  move_max_to_end([Second|Tail], ListWithMaxEnd).

bubble_sort(SortedList, SortedList):-
  move_max_to_end(SortedList, DoubleSortedList),
  SortedList = DoubleSortedList, !.
bubble_sort(List, SortedList):-
  move_max_to_end(List, SortedPart),
  bubble_sort(SortedPart, SortedList).




path1(From, To, Way, [H | T], Length):- prohod(From, X, Length),
                                     not( member(X, Way) ),
                                     X = To,
                                    
                                     writef('1. From = %w, Way = %w\n', [From, Way]),
                                     H = From,
                                     T = [X | []].

path1(From, To, Way, [H | T], SumL):- prohod(From, X, Length),
                                     not( member(X, Way) ),
                                     X \= To,

                                     writef('2. From = %w, Way = %w\n', [From, Way]),
                                     H = From,
                                     path1(X, To, [From | Way], T, SumL1),
				     SumL is SumL1 + Length.

path1_call(From, To, Path, Len):- path1(From, To, [], Path, Len).

write_path([], []):- !.
write_path([H1 | T1], [H2 | T2]):- write('Steps: '), write(H1), write(', length = '), writeln(H2), write_path(T1,T2).

path1_call_opt(From, To):- findall(Lpaths, path1_call(From, To, Lpaths, Len), Paths),
                           findall(Llen, path1_call(From, To, _, Llen), Lens),                           
			   write_path(Paths, Lens),
                           % writeln(Lens),
bubble_sort(Lens, SortedLens),
writeln(SortedLens).















