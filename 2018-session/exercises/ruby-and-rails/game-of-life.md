Implement the [Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life).
The game is a simulation that models the life cycle of bacteria.
Given an initial pattern, the game simulates the birth and death of future generations using simple rules.

The game plays out on a two-dimensional grid (array).
Each grid location is either empty or occupied by a single cell (X).
A location's neighbors (N) are any cells in the surrounding eight adjacent locations.

|   |   |   |   |   |
|---|---|---|---|---|
| . | .	| . |	. | . |
|   | N	| N |	N | . |
| . | N	| X |	N | . |
| . | N	| N |	N | . |
| . | .	| . |	. | . |

Life starts with an initial pattern of cells on the grid and computes successive generations
of cells according to the following rules:

1. A location that has zero or one neighbors will be empty in the next generation. If a cell was in that location, it dies of loneliness.
2. A location with two neighbors is stable—that is, if it contained a cell, it still contains a cell. If it was empty, it's still empty.
3. A location with three neighbors will contain a cell in the next generation. If it was unoccupied before, a new cell is born. If it currently contains a cell, the cell remains.
4. A location with four or more neighbors will be empty in the next generation. If there was a cell in that location, it dies of overcrowding.

The births and deaths that transform one generation to the next must all take effect simultaneously.

Note that cells on the edge have fewer neighbors:

|   |   |   |   |   |
|---|---|---|---|---|
| . | .	| . |	. | . |
| . | .	| . |	N | N |
| . | .	| . |	N | X |
| . | .	| . |	N | N |
| . | .	| . |	. | . |


|   |   |   |   |   |
|---|---|---|---|---|
| . | .	| . |	. | . |
| . | .	| . |	. | . |
| . | .	| . |	. | . |
| . | .	| . |	N | N |
| . | .	| . |	N | X |

Steps:

1. Create a square array. Prompt the user for the size. I'd suggest starting with a 10x10 square.
1. For each location, randomly set it to live or dead.
1. Iterate: Print the cells to the terminal. I'd suggest using an asterisk ("*") for live cells and a space (" ")
 for dead cells.
1. Add up the neighbors of each cell and decide if it should be alive or dead in the next generation.
 Update the array to the new state.
1. Return to Iterate: print the cells.

You can use the string "\e[H\e[2J" to move the cursor to the top of the page before each time that you print. This will allow you to see the evolution.

Check your work using some of the patterns from the Wiki page above.