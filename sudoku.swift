//sudoku
import Foundation

var sudoku:[[Int]] = [ //indexes start at 0 and end at 8, so we have in total 9; it is different form C
                [5,3,0,0,7,0,0,0,0], //creating the grid
                [6,0,0,1,9,5,0,0,0],
                [0,9,8,0,0,0,0,6,0],
                [8,0,0,0,6,0,0,0,3],
                [4,0,0,8,0,3,0,0,1],
                [7,0,0,0,2,0,0,0,6],
                [0,6,0,0,0,0,2,8,0],
                [0,0,0,4,1,9,0,0,5],
                [0,0,0,0,8,0,0,7,9]
]

var user_choice = 2
let BLANK = 0

print("+-------------------------------------------------------------------------------+");
print("|                                  Sudoku game                                  |");
print("|                                *swift edition*                                |")
print("|                                  version:1.0                                  |");
print("|(C) alexcarchiar, realised as a project for the Politecnico di Torino          |");
print("|This is a simple sudoku: your goal is to solve it.                             |");
print("|Remark that for the current version there is no solution nor a random generator|");
print("+-------------------------------------------------------------------------------+");

print("\n\n\n\nPress any key to start\n");

var start: Character;
start = Character(readLine()!)
while(user_choice != 3){
    for row in 0...8{ //prints the +---+ lines
        
        if(row%3 != 0){
            print("+", terminator: "")
            for _ in 0...8{
                print("---+", terminator: "");
            }
        } else{
            print("#", terminator: "");
            for _ in 0...8{
                print("===#", terminator: "");
            }
        }
        print("\nH", terminator: "");
        for coloumn in 0...8{ //prints the | n | lines
            if(sudoku[row][coloumn] == BLANK){
            print("   ", terminator: "");
            } else{
                print(" \(sudoku[row][coloumn]) ", terminator: "")
            }
            if (coloumn % 3 == 2){
                print("H", terminator: "")
            } else{
                print("|", terminator: "")
            }
        }
        print("")
        
        }
    print("#", terminator: "");
    for _ in 0...8{
        print("===#", terminator:"");
    }
    
    
    //selection for user's choice
    print("\nEnter [1] to insert a number\nEnter [2] to remove a number\nEnter [3] to quit\n");
    user_choice = Int(readLine()!)!
    switch user_choice {
    case 1:
        var row, coloumn, number: Int
        print("Insert row [0,8], coloumn [0,8] and number [1,9]\nRow: ")
        row = Int(readLine()!)!
        print("Coloumn: ")
        coloumn = Int(readLine()!)!
        print("Number: ")
        number = Int(readLine()!)!
        var flag = true //used to check if a number is valid. false means the number is invalid
        /* we have to check:
         1 - if there are any numbers which are equal in the same coloumn
         2 - if there are any numbers which are equal in the same row
         3 - if there are any numbers which are equal in the same 3*3 square */
        for i in 0...8{ //checking the numbers in the same row
            if(sudoku[row][i] == number){
                flag = false;
            }
        }
        for i in 0...8{ //checking the numbers in the same coloumn
            if(sudoku[i][coloumn] == number){
                flag = false;
            }
        }
        //to check the numbers in the same 3*3 square, we need to define to variables that allow us to work inside it
        var sub_block_row: Int = row/3
        sub_block_row *= 3
        var sub_block_col: Int = coloumn/3
        sub_block_col *= 3
        for i in sub_block_row...(sub_block_row+3){
            for j in sub_block_col...(sub_block_col+3){
                if(sudoku[i][j] == number){
                    flag = false
                }
            }
        }
        if (flag == false){
            print("Invalid number");
        } else if (flag == true){
            sudoku[row][coloumn] = number;
        }
       
    case 2:
        var row, coloumn: Int //gets the coordinates and assings the blank value to the corresponding value in the matrix
        print("Insert row [0,8], coloumn [0,8]")
        row = Int(readLine()!)!
        print("Coloumn: ")
        coloumn = Int(readLine()!)!
        sudoku[row][coloumn] = BLANK
    case 3:
        print("Goodbye!\nGame brought you by alexcarchiar")
        user_choice = 3
    default:
        print("Invalid Input. Try again")
    }
    
}
