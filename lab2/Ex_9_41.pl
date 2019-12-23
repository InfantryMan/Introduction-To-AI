step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+2, NewY is Y+1, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+2, NewY is Y-1, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+1, NewY is Y+2, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X+1, NewY is Y-2, concat_([NewX], [NewY], NewPosition).

step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-2, NewY is Y+1, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-2, NewY is Y-1, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-1, NewY is Y+2, concat_([NewX], [NewY], NewPosition).
step([X|YL], NewPosition):- devide_H(YL, Y), NewX is X-1, NewY is Y-2, concat_([NewX], [NewY], NewPosition).

check([X|YL]):- devide_H(YL, Y), X >= 1, X =< 8, Y >= 1, Y =< 8.

next_cell(From, To):- step(From, To), check(To).


%---	Searching

searching([[Dest|WayToDest] | _], Dest, [Dest|WayToDest]).
searching([[CurrCell | WayToCurrCell] | OtherWays], Dest, Path):- 	
	bagof([NewCell, CurrCell | WayToCurrCell], (next_cell(CurrCell, NewCell), not(member_(NewCell, [CurrCell | WayToCurrCell]))), NewWays),
	append(OtherWays, NewWays, AllWays),  !,
	searching(AllWays, Dest, Path); !, searching(OtherWays, Dest, Path).






path(From, To, Path):-	
						path_max(From, To, MaxPath),
						write(MaxPath), nl, nl,
	
						searching([[From]], To, PathTo),
						delete(PathTo, From, PathFrom),
						searching([PathFrom], From, PathResult),

						get_list_size(PathResult, Length),
						write('Length: '), write(Length),
						push_back(PathResult, From, Path).


path_max(From, _, Path):- 	cover_all_board(AllBoard), relink_list(AllBoard, From, Path_),
							get_list_size(Path_, LengthMax),
							write('Max way Length: '), write(LengthMax), nl, 
							push_back(Path_, From, Path), !.


/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   % Cover all chessboard
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

next_cell(From, To, Path):- step(From, To), check(To), not(member_(To, Path)).

get_next(_, [], Next, _, Minimum):- Minimum = Next.
get_next(Path, [Current|T], _, Min, Minimum):- 	push_back(Path, Current, NewList),
												findall(Dest, next_cell(Current, Dest, NewList), Destinations),
												get_list_size(Destinations, Size),
												Size =< Min,
												get_next(Path, T, Current, Size, Minimum).
get_next(Path, [_|T], Next, Min, Minimum):- get_next(Path, T, Next, Min, Minimum).


searching_max_cover(_, Path, ResPath):- get_list_size(Path, Size), Size > 62,
										devide_H(Path, LastElem),
										findall(Destination, next_cell(LastElem, Destination, Path), Destinations),
										get_list_size(Destinations, Count), Count > 0,
										member_([3,2], Destinations),
										ResPath = Path.
							
searching_max_cover(Current, Path, ResPath):- get_list_size(Path, Size), Size < 63,
									findall(Dest, next_cell(Current, Dest, Path), Destinations),
									get_list_size(Destinations, Count), Count > 0,
									get_next(Path, Destinations, Next, 10, Minimum),
									not([3,2] = Minimum),
									Next = Next,
									concat_([Minimum], Path, PathNew),
									searching_max_cover(Minimum, PathNew, ResPath).


cover_all_board(PathRes):- 	searching_max_cover([1,1], [[1,1]], Path), 
							concat_([[3,2]], Path, PathRes), !.



/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   % Help-functions
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */


devide_H([Head|_], Head):- !.
devide_T([_|Tail], Tail):- !.

concat_([], List, List):- !.
concat_([H|T], L2, [H|T3]):- concat_(T, L2, T3).

member_(H, [H|_]):- !.
member_(H, [_|T]) :- member_(H, T).

push_back([],X,[X]):- !.
push_back([H|T],X,[H|Res]):- push_back(T,X,Res).

get_list_size([], 0):- !.
get_list_size([_|T], Length):- get_list_size(T, NewLength), Length is NewLength + 1.

get_last_elem([Element], Element):-!.
get_last_elem([_|Tail], Element):- get_last_elem(Tail, Element).

relink_list([Head|Tail],Elem,Result):-  Elem==Head, Result=[Head|Tail], !; 
										append(Tail,[Head],L), 
										relink_list(L,Elem,Result).
