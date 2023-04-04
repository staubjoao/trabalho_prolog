% In this clause, the list has a single element.
min([H], H, []).

% In this clause, the head is not the minimal element of the list.
min([H|L], M, [H|R]) :- min(L, M, R), H >= M.

% In this clause, the head is the minimal element of the list.
min([H|L], H, [M|R]) :- min(L, M, R), H < M.
% In this clause, the list is empty.
sorted([], []).

% In this clause, the sorted list in ascending order is the concatenation of
% its minimal element and the sorted remaining sublist in ascending order.
sorted(L, [M|S]) :- min(L, M, R), sorted(R, S).

reverse([], []).
reverse([H|T], R) :- reverse(T, RT), append(RT, [H], R).