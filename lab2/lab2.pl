% Zadanie 1
concat([], L3, L3):- !.
concat([H | T], L2, L3):- L3=[H | Tail], concat(T, L2, Tail).

% Zadanie 2
firstElem(L, First):- [H | _] = L, First = H.
deleteFirstElem([H|T], T):- !.

reverse([], []).
reverse([X|L1], L2):-reverse(L1, L3), concat(L3, [X], L2).

equal_lists([], []):- !.
equal_lists([H | T1], [H | T2]):- equal_lists(T1, T2).

invert(L1, L2):- reverse(L1, L1_rev),
                 equal_lists(L1_rev, L2).

% Zadanie 3
% member(X, [H1 | T1]):- X=H1, !.
% member(X, [_ | T1]):- member(X, T1).
deleteElem([], _, L):- L=[], !.
deleteElem([H|T], Elem, L):- H\=Elem, L=[H|Tail], deleteElem(T, Elem, Tail), !.
deleteElem([H|T], Elem, L):- H=Elem, deleteElem(T, Elem, L).

list_length([]     , 0 ).
list_length([_|Xs] , L ) :- list_length(Xs,N) , L is N+1.

uniq([], []):- !.
uniq(L1, [H | T]):- deleteElem(L1, H, L2),
                    list_length(L1, LL1),
                    list_length(L2, LL2),
                    LL1\=LL2,
                    uniq(L2, T).

% Zadanie 4
make_uniq([], L3, L3):- !.
make_uniq([H1 | T1], L2, L3):- deleteElem(L2, H1, L4),
                               make_uniq(T1, L4, L3).

ucat([], _, _):- !.
ucat(_, [], _):- !.
ucat(L1, L2, L3):- make_uniq(L1, L2, L4),
                   concat(L1, L4, L3).

% Zadanie 5
mapop(_, [], [], L3):- L3=[], !.
mapop('+',[H1 | T1],[H2 | T2], [H3 | T3]) :- H3 is H1+H2, mapop('+', T1, T2, T3).
mapop('-',[H1 | T1],[H2 | T2], [H3 | T3]) :- H3 is H1-H2, mapop('-', T1, T2, T3).
mapop('*',[H1 | T1],[H2 | T2], [H3 | T3]) :- H3 is H1*H2, mapop('*', T1, T2, T3).
mapop('/',[H1 | T1],[H2 | T2], [H3 | T3]) :- H3 is H1/H2, mapop('/', T1, T2, T3).

% Zadanie 6
add(X, L1, [X | L1]):- !.

unbr1(X, X):- (integer(X); atom(X)).
unbr1([H1 | T1], V):- unbr1(H1, V).
unbr1([_ | T1], V):- unbr1(T1, V).

unbr(L1, L2):- findall(V, unbr1(L1, V), L2).

% Zadanie 7
make_sum([], 0):- !.
make_sum([H | T], S):- make_sum(T, S1), S is S1 + H.

msum([], []):- !.
msum([H1 | T1], [H2 | T2]):- make_sum(H1, H2),
                             msum(T1, T2).

