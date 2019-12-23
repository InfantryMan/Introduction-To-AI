/*
	58.  Ферзь находится на поле C3 шахматной доски. 
	Необходимо найти последовательность из 15 ходов, завершающуюся в поле F6 и обеспечивающую прохождение всех полей шахматной доски.
	При этом ни одно поле нельзя проходить более одного раза.
*/

% --- Steps
% --- step left
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+7, NewY is Y, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+6, NewY is Y, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+5, NewY is Y, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+4, NewY is Y, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+3, NewY is Y, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+2, NewY is Y, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+1, NewY is Y, concat_([NewX], [NewY], NewPosition).

% --- step right
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-7, NewY is Y, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-6, NewY is Y, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-5, NewY is Y, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-4, NewY is Y, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-3, NewY is Y, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-2, NewY is Y, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-1, NewY is Y, concat_([NewX], [NewY], NewPosition).
% --- step top
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X, NewY is Y-7, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X, NewY is Y-6, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X, NewY is Y-5, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X, NewY is Y-4, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X, NewY is Y-3, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X, NewY is Y-2, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X, NewY is Y-1, concat_([NewX], [NewY], NewPosition).


% --- step bottom
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X, NewY is Y+7, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X, NewY is Y+6, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X, NewY is Y+5, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X, NewY is Y+4, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X, NewY is Y+3, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X, NewY is Y+2, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X, NewY is Y+1, concat_([NewX], [NewY], NewPosition).


% --- step top-left
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+7, NewY is Y-7, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+6, NewY is Y-6, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+5, NewY is Y-5, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+4, NewY is Y-4, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+3, NewY is Y-3, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+2, NewY is Y-2, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+1, NewY is Y-1, concat_([NewX], [NewY], NewPosition).
% --- step bottom-right
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-7, NewY is Y+7, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-6, NewY is Y+6, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-5, NewY is Y+5, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-4, NewY is Y+4, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-3, NewY is Y+3, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-2, NewY is Y+2, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-1, NewY is Y+1, concat_([NewX], [NewY], NewPosition).
% --- step top-right
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-7, NewY is Y-7, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-6, NewY is Y-6, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-5, NewY is Y-5, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-4, NewY is Y-4, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-3, NewY is Y-3, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-2, NewY is Y-2, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-1, NewY is Y-1, concat_([NewX], [NewY], NewPosition).
% --- step bottom-left
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+7, NewY is Y+7, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+6, NewY is Y+6, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+5, NewY is Y+5, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+4, NewY is Y+4, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+3, NewY is Y+3, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+2, NewY is Y+2, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+1, NewY is Y+1, concat_([NewX], [NewY], NewPosition).


check([X|YL]):- devide_H(YL, Y), X >= 1, X =< 8, Y >= 1, Y =< 8.

next_cell(From, To):- step(From, To), check(To).

/*
v_glubinu2( Way, B, [ B ] ) :- nl.
v_glubinu2( Way, B, [B | Resh] ) :- writeln(Way),
                                    writeln(B),
                                    writeln(Resh),
                                    prohod( B, B1, X),
                                    not( member( B1, Way ) ),
                                    v_glubinu2( [ B | Way ], B1, Resh ).



path1(From, To, Way, [H | T], Length):- prohod(From, X, Length),
                                     not( member(X, Way) ),
                                     X = To,

                                     H = From,
                                     T = [X | []].

path1(From, To, Way, [H | T], SumL):- prohod(From, X, Length),
                                     not( member(X, Way) ),
                                     X \= To,
					
                                     H = From,
                                     path1(X, To, [From | Way], T, SumL1),
				     				 SumL is SumL1 + Length.

path1_call(From, To, Path, Len):- path1(From, To, [], Path, Len).


*/

% path(From, To, Way, MoveCount, [H | T]):- 	MoveCount > 1, !, fail.

path(From, To, Way, MoveCount, [H | T], OS):-   
											next_cell(From, NewPos),
											% write(OS, '1. NewPos = '), write(OS, NewPos), write(OS, ' '), nl(OS),
											create_path(From, NewPos, P),
											copy(Way, WayCopy),
											% write(OS, '1. P = '), write(OS, P), write(OS, ' '), nl(OS),
											% write(OS, '1. Way = '), write(OS, Way), write(OS, ' '), nl(OS),
											% write(OS, '1. WayCopy = '), write(OS, WayCopy), write(OS, ' '), nl(OS),
											[HP | TP] = P,
											check_pos(TP, WayCopy),
											% write(OS, '1.1. Way = '), write(OS, Way), write(OS, ' '), nl(OS),
											NewPos = To,
											get_list_size(Way, WaySize),
											get_list_size(TP, PSize),
											% write(OS, '1.1. WaySize = '), write(OS, WaySize), write(OS, ' '), nl(OS),
											% write(OS, '1.1. PSize = '), write(OS, PSize), write(OS, ' '), nl(OS),
											% write(OS, '1.1. MoveCount = '), write(OS, MoveCount), write(OS, ' '), nl(OS),
											% WaySize + PSize = 64,
											% MoveCount = 14,
											Sum is (WaySize + PSize),
											% Sum = 6,
											% MoveCount = 1,
											Sum = 64,
											MoveCount = 14,
											% write(OS, 'URAA\n'),
											% writef('Way = %w \n P = %w \n', [Way, P]),
											H = From,
											T = [NewPos | []].
											
path(From, To, Way, MoveCount, [H | T], OS):-   
											% write(OS, 'MayBEHELP?'), write(OS, From), write(OS, ' '), nl(OS),
											% write(OS, 'a.Way = '), write(OS, Way), write(OS, ' '), nl(OS),

											% writef(OS, '2.1. Way = %w\n', [Way]),
											next_cell(From, NewPos),	
											create_path(From, NewPos, P),
											% write(OS, 'b.Way = '), write(OS, Way), write(OS, ' '), nl(OS),	
											copy(Way, WayCopy),
											% write(OS, 'c.Way = '), write(OS, Way), write(OS, ' '), nl(OS),
											% write(OS, 'c.From = '), write(OS, From), write(OS, ' '), nl(OS),
											% write(OS, 'c.NewPos = '), write(OS, NewPos), write(OS, ' '), nl(OS),
											% write(OS, 'c.P = '), write(OS, P), write(OS, ' '), nl(OS),
											[HP | TP] = P,
											check_pos(TP, WayCopy),
											% write(OS, 'c.NewPos = '), write(OS, NewPos), write(OS, ' '), nl(OS),
											NewPos \= To,
											get_list_size(Way, WaySize),
											get_list_size(TP, PSize), 
											% WaySize + PSize < 64,
											% MoveCount < 14,
											Sum is (WaySize + PSize),
											% Sum < 6,
											% MoveCount < 1,
											Sum < 64,
											MoveCount < 14,
											% write(OS, '2.1. Way = '), write(OS, Way), write(OS, ' '), nl(OS),
											H = From,
											concat_(TP, Way, NewWay),
											% write(OS, '2.1. NewWay = '), write(OS, NewWay), write(OS, ' '), nl(OS),
											MC is MoveCount + 1,
											path(NewPos, To, NewWay, MC, T, OS). 
											
path1_call(From, To, Path):- open('output.txt', write, OS),
							(	path(From, To, [From], 0, Path, OS),
								false
								;
								close(OS)
							).

path_call(From, To, Path):- 	path(From, To, [From], 0, Path, OS),
								open('output1.txt', append, OS),
								(	
									write(OS, Path),
									nl(OS),
									false
									;
									close(OS)
								).

path_call_all(From, To, Path):- findall(P, path(From, To, [From], 0, P, OS), Path),
								open('output.txt', append, OS),
								(	
									write(OS, Path),
									false
									;
									close(OS)
								).


	



/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   % Help-functions
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

check_pos2([], [], []):- !.
check_pos2([], [H], Path):- !.
check_pos2([], [_ | T], Path):- [H1 | T1] = Path, [H2 | T2] = T, check_pos2([H1 | T1], [H2 | T2], Path).
check_pos2([H1 | T1], [H2 | T2], Path):- H1 \= H2, check_pos2(T1, [H2 | T2], Path).
check_pos2([H1 | T1], [H2 | T2], Path):- H1 = H2, !, fail.

% Проверяет, нет ли элементов из 1 массива во втором массиве. Возвращает true, если их нет.
% Первый аргумент - потенциальный путь, второй - весь прошедший путь
check_pos([H1 | T1], [H2 | T2]):- check_pos2([H1 | T1], [H2 | T2], [H1 | T1]).	
check_pos([H1 | T1], []):- true.	

create_path(From, NewPos, P):-	devide_C(From, X1, Y1),
								devide_C(NewPos, X2, Y2),
								create_path_x(X1, X2, MasX),
								create_path_x(Y1, Y2, MasY),
								combine(MasX, MasY, P).

create_path_x(X1, X2, [H | []]):- X1 = X2, H = X2, !.
create_path_x(X1, X2, [X1 | T]):- X1 < X2, X is X1 + 1, create_path_x(X, X2, T), !. 
create_path_x(X1, X2, [X1 | T]):- X1 > X2, X is X1 - 1, create_path_x(X, X2, T). 


combine([], [], []):- !.
combine([H1 | []], [], []):- !.
combine([], [H2 | []], []):- !.
combine([H1|[]], [H2 | T2], [[H1, H2] | T3]):- combine([H1 | []], T2, T3), !.
combine([H1 | T1], [H2 | []], [[H1, H2] | T3]):- combine(T1, [H2 |[]], T3), !.
combine([H1 | T1], [H2 | T2], [[H1, H2] | T3]):- combine(T1, T2, T3).


devide_H([Head|_], Head):- !.
devide_T([_|Tail], Tail):- !.

devide_C(C, X, Y):- devide_H(C, X),
					devide_T(C, YM),
					devide_H(YM, Y).

concat_([], List, List):- !.
concat_([H|T], L2, [H|T3]):- concat_(T, L2, T3).

compare_coords(C1, C2):- C1 = C2.

push_back([],X,[X]):- !.
push_back([H|T],X,[H|Res]):- push_back(T,X,Res).

get_list_size([], 0):- !.
get_list_size([_|T], Length):- get_list_size(T, NewLength), Length is NewLength + 1.

copy(L,R) :- accCp(L,R).
accCp([],[]).
accCp([H|T1],[H|T2]) :- accCp(T1,T2).









