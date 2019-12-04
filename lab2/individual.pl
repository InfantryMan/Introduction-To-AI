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


path(From, To, Way, [H | T]):-  next_cell(From, NewPos),
								writef('NewPos = %w', [NewPos]),
								not( member(NewPos, Way) ),
								writeln('kek'),
								NewPos = To,
								get_list_size(Way, WaySize),
								writef('1. From = %w, NewPos = %w, Way = %w, WaySize = %w\n', [From, NewPos, Way, WaySize]),
								WaySize = 14,
								H = From,
								T = [NewPos | []].


path(From, To, Way, [H | T]):-  next_cell(From, NewPos),
								create_path(From, NewPos, P),
								check_pos(From, NewPos, Way),
								not( member(NewPos, Way) ),
								NewPos \= To,
								get_list_size(Way, WaySize), 
								writef('2. From = %w, NewPos = %w, Way = %w', [From, NewPos, Way]),
								WaySize < 15,
								H = From,
								path(NewPos, To, [From | Way], T). 

path_call(From, To, Path):- path(From, To, [], Path).
			

check_pos(From, NewPos, Way):- 	!.			

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



/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   % Help-functions
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */


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









