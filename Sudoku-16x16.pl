
:- use_module(library(clpfd)).

/*
sudoku(+Matrix)
 it is true if Matrix unify with a 16x16 matrix
 that represent a valid 16x16 sudoku. 
*/

sudoku(Matrix):- 
  length(Matrix, 16),
  maplist(same_length(Matrix), Matrix),
  append(Matrix, Elems), Elems ins 1..16,
  maplist(all_distinct, Matrix),
  transpose(Matrix, Matrix2),
  maplist(all_distinct, Matrix2),
  Matrix = [L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12, L13,
  L14, L15, L16],
  distinct_blocks(L1, L2, L3, L4),
  distinct_blocks(L5, L6, L7, L8),
  distinct_blocks(L9, L10, L11, L12),
  distinct_blocks(L13, L14, L15, L16).
  
  
/*
distinct_blocks(+Line1, +Line2, +Line3, +Line4)
 it is true if each block of 4x4 has different
 numbers. Each line has a length of 16 numbers.
*/

distinct_blocks([], [], [], []).
distinct_blocks([E1, E2, E3, E4| Tail1], 
                [E5, E6, E7, E8| Tail2],
        [E9, E10, E11, E12| Tail3],
        [E13, E14, E15, E16| Tail4]):-
 all_distinct([E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, 
  E11, E12, E13, E14, E15, E16]),
 distinct_blocks(Tail1, Tail2, Tail3, Tail4). 

sudoku1([
        [_, 10, _, 4, 7, 15, _, 6, _, 5, 2, 9, 16, _, _, 3],
[ _, 9, _, _, 13, 14, _, 16, _, 8, 6, _, 10, 5, _, _],
 [14, 16, 15, 11, 9, 1, _, _, _, 3, 12, 13, 2, 7, 8, 6],
 [3, 6, 5, _, 11, 4, _, 2, _, _, 7, _, _, 14, 15, 9],
 [12, _, 6, 7, _, _, 11, _, _, 15, 8, 5, _, 10, _, 16],
 [_, 14, 2, 16, 10, 8, 7, 15, _, 12, _, 1, 9, 4, 5, 13],
 [_, 13, _, 15, 2, 12, _, _, 9, 4, 10, _, _, _, 6, 11],
 [1, 4, _, 9, _, 6, 13, _, 11, 7, 16, 2, _, _, 14, _],
 [_, _, 12, 14, 8, 3, 6, _, 2, 16, _, _, _, 9, 1, _],
[ _, 11, 9, 3, 12, _, _, _, _, 14, _, _, 8, _, _, 4],
 [_, 5, _, 13, 16, 2, _, 9, _, _, 1, _, _, 15, 12, 10],
[ _, 2, _, _, _, _, 15, 13, 3, 10, _, 12, 6, 11, 16, 14],
 [9, _, 16, _, 6, _, 5, 14, 1, _, _, 15, 4, 12, 3, 8],
 [13, 1, _, _, 15, 7, _, 8, 12, _, 4, 3, _, 16, _, _],
 [15, 8, _, _, 1, _, 4, 12, 7, 13, _, 10, 11, _, 9, 2],
 [4, 12, 14, 6, _, 11, 2, 10, _, 9, 5, _, 15, _, 7, 1]
 ]).



