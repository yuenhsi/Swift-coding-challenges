//: [Previous](@previous)

import Foundation

// challenge 1

func challenge1(input: String) -> Bool {
    var map = [Character: Int]()
    for char in input.characters {
        if map[char] != nil {
            return false
        } else {
            map[char] = 0
        }
    }
    return true
}

assert(challenge1(input: "No duplicates") == true, "Challenge 1 failed")
assert(challenge1(input: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
assert(challenge1(input: "AaBbCc") == true, "Challenge 1 failed")
assert(challenge1(input: "Hello, world") == false, "Challenge 1 failed")


//: [Next](@next)
