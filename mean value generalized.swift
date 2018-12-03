//mean value computation
import Foundation

//Using let as #define in C

let MAX_SIZE = 10
var num: [Int] = [] //must initialize every array
var to_int: Int
var reader: String
var mean: Double = 0


for i in 0...MAX_SIZE{ //scanning the number
    print("Insert number index \(i)")
    reader = readLine()!
    to_int = Int(reader)!
    num.append(to_int)
}

for i in 0...MAX_SIZE{
    mean += Double(num[i])
}

mean /= Double(MAX_SIZE)
print("The mean is: \(mean)")


