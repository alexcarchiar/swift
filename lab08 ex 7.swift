//Lab08 ex7
import Foundation

var matrix: [[Int]] = [
    [0,0,0,0,0],
    [0,0,0,0,0],
    [0,0,0,0,0],
    [0,0,0,0,0],
    [0,0,0,0,0]
]

for i in 0...4{
    print("Insert line index \(i)")
    for j in 0...4{
        print("Insert number position: (\(i);\(j))")
        matrix[i][j] = Int(readLine()!)!
    }
}
for i in 0...4{
    for j in 0...4{
        print("\(matrix[i][j]) ", terminator: "")
    }
    print("")
}
