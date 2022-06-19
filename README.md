# Sudoku_16X16
This is the final deliverable of the University subject Knowledge representation from Wasilios Lekkas and Pascal Hillar.

This prolog program can solve a 16x16 sudoku.

We call the sudoku "Matrix". 

  length(Matrix, 16)
The function "Length" represents the variety of factors in the List. This predicate is a real relation and may be used to locate the duration of a listing or produce a listing (conserving variables) of duration Length. The length of this soduku is 16. 

  maplist(same_length(Matrix), Matrix)
The function "maplist" is higher-order predicates, which permit the definition of a predicate to be lifted approximately a unmarried detail to lists of such elements. We use the "maplist" command in this case to define that the matrix has the same lenght, as one matrix which is 16. 

  append(Matrix, Elems), Elems ins 1..16
The function "append" is used to define that each element in the matrix is a number between 1 and 16 and can't be anything outside of this range.

  maplist(all_distinct, Matrix)
The function "maplist" with the combination of all_distinct tells prolog that in each row the positions have to be different numbers between 1 and 16.

  transpose(Matrix, Matrix2)
The function "transpose" transfers the first matrix.

  maplist(all_distinct, Matrix2)
The function "maplist" with all_distinct ells prolog that in each row the positions have to be different numbers between 1 and 16.

  Matrix = [L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12, L13, L14, L15, L16],
This part of the code gives every row of the matrix an individual name, in this case L1-L16, which defines the 16 blocks.

  distinct_blocks(L1, L2, L3, L4),
  distinct_blocks(L5, L6, L7, L8),
  distinct_blocks(L9, L10, L11, L12),
  distinct_blocks(L13, L14, L15, L16)
Through the function "distinct_blocks" shows the different blocks in the row.

  distinct_blocks([], [], [], [])
This function allows prolog to fill the blocks with free solution 

distinct_blocks([E1, E2, E3, E4| Tail1], 
               [E5, E6, E7, E8| Tail2],
               [E9, E10, E11, E12| Tail3],
               [E13, E14, E15, E16| Tail4])
In this part of the code the first four elements are split from the rest of the list and so on for the the next three part fo the list.

all_distinct([E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, 
  E11, E12, E13, E14, E15, E16])
Through the "all_distinct" function in this part of the code we determine that each of the 16 elements are different.

distinct_blocks(Tail1, Tail2, Tail3, Tail4)
This part defines that each tail is different.

The 16X16 Sudoku that can be solved through this prolog program is as follows:
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

Through the input of the following command in the swi-prolog console this sudoku can be solved:
    sudoku1(S), maplist(label, S), maplist(portray_clause, S).
