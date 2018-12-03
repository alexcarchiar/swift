//12 days of Xmas HISHE
import Foundation

var strings: [String] = [
                    "and ",
                    "the one ring to rule them all",
                    "two sith lords",
                    "three creepy dolls",
                    "four robotic arms",
                    "all five jokers",
                    "six infinity stones",
                    "seven horcruxes",
                    "eight dogs a stranging",
                    "nine Loki's scheming",
                    "ten Daleks zapping",
                    "eleven zombies eating",
                    "twelve antlers pointing",
                    "On the ",
                    " day of Christmas, my hatred did recall, "
]
var emi_verse: String = strings[0] + strings[1]

print("\(strings[13])first\(strings[14])\(strings[1]).")
for i in 2...12{
    var day: String
    emi_verse = strings[i] + ", " + emi_verse
    switch i{
    case 2:
        day = "second"
    case 3:
        day = "third"
    case 4:
        day = "fourth"
    case 5:
        day = "fifth"
    case 6:
        day = "sixth"
    case 7:
        day = "seventh"
    case 8:
        day = "eight"
    case 9:
        day = "ninth"
    case 10:
        day = "tenth"
    case 11:
        day = "eleventh"
    case 12:
        day = "twelth"
    default:
        day = ""
    }
    print("\(strings[13])\(day)\(strings[14])\(emi_verse).")
}
