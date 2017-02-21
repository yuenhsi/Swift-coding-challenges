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


func challenge2(input: String) -> Bool {
    return input.lowercased().characters.reversed() == Array(input.lowercased().characters)
}

assert(challenge2(input: "rotator") == true, "Challenge 2 failed")
assert(challenge2(input: "Rats live on no evil star") == true, "Challenge 2 failed")
assert(challenge2(input: "Never odd or even") == false, "Challenge 2 failed")
assert(challenge2(input: "Hello, world") == false, "Challenge 2 failed")


func challenge3(first: String, second: String) -> Bool {
    return Array(first.characters).sorted() == Array(second.characters).sorted()
}

assert(challenge3(first: "abca", second: "abca") == true, "Challenge 3 failed")
assert(challenge3(first: "abc", second: "cba") == true, "Challenge 3 failed")
assert(challenge3(first: " a1 b2 ", second: "b 1 a 2") == true, "Challenge 3 failed")
assert(challenge3(first: "abc", second: "abca") == false, "Challenge 3 failed")
assert(challenge3(first: "abc", second: "Abc") == false, "Challenge 3 failed")
assert(challenge3(first: "abc", second: "cbAa") == false, "Challenge 3 failed")


extension String {
    func fuzzyContains(_ innerStr: String) -> Bool {
        return range(of: innerStr, options: .caseInsensitive) != nil
    }
}

assert("Hello, world".fuzzyContains("Hello") == true, "Challenge 4 failed")
assert("Hello, world".fuzzyContains("WORLD") == true, "Challenge 4 failed")
assert("Hello, world".fuzzyContains("Goodbye") == false, "Challenge 4 failed")


func challenge5(str: String, char: Character) -> Int {
    
    return str.characters.reduce(0) {
        $1 == char ? $0 + 1 : $0
    }
}

assert(challenge5(str: "The rain in Spain", char: "a") == 2, "Challenge 5 failed.")
assert(challenge5(str: "Mississippi", char: "i") == 4, "Challenge 5 failed.")
assert(challenge5(str: "HackingWithSwift", char: "i") == 3, "Challenge 5 failed.")


func challenge6(input: String) -> String {
    var usedChars = [Character]()
    let uniqueChars = input.characters.filter {
        if !usedChars.contains($0) {
            usedChars.append($0)
            return true
        } else {
            return false
        }
    }
    return String(uniqueChars)
}

assert(challenge6(input: "wombat") == "wombat", "Challenge 6 failed.")
assert(challenge6(input: "hello") == "helo", "Challenge 6 failed.")
assert(challenge6(input: "Mississippi") == "Misp", "Challenge 6 failed.")


func challenge7(input: String) -> String {
    return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression)
}

assert(challenge7(input: "a   b  c") == "a b c", "Challenge 7 failed.")
assert(challenge7(input: "   a") == " a", "Challenge 7 failed.")
assert(challenge7(input: "abc") == "abc", "Challenge 7 failed.")


func challenge8(firstInput: String, secondInput: String) -> Bool {
    if firstInput.characters.sorted() == secondInput.characters.sorted() {
        if (firstInput + firstInput).contains(secondInput) {
            return true
        }
    }
    return false
}

assert(challenge8(firstInput: "abcde", secondInput: "eabcd") == true, "Challenge 8 failed.")
assert(challenge8(firstInput: "abcde", secondInput: "cdeab") == true, "Challenge 8 failed.")
assert(challenge8(firstInput: "abcde", secondInput: "abced") == false, "Challenge 8 failed.")
assert(challenge8(firstInput: "abc", secondInput: "a") == false, "Challenge 8 failed.")


func challenge9(input: String) -> Bool {
    let set = Set(input.lowercased().characters)
    let letters = set.filter { $0 >= "a" && $0 <= "z" }
    return letters.count == 26
}

assert(challenge9(input: "The quick brown fox jumps over the lazy dog") == true, "Challenge 9 failed.")
assert(challenge9(input: "The quick brown fox jumped over the lazy dog") == false, "Challenge 9 failed.")


func challenge10(input: String) -> (vowels: Int, consonants: Int) {
    let vowels = [Character](["A","E","I","O","U"])
    let charactersToCheck = input.uppercased().characters.sorted().filter { $0 >= "A" && $0 <= "Z" }
    let numberOfVowels = charactersToCheck.filter { vowels.contains($0) }.count
    let numberOfConsonants = charactersToCheck.count - numberOfVowels
    return (vowels: numberOfVowels, consonants: numberOfConsonants)
}

assert(challenge10(input: "Swift Coding Challenges") == (vowels: 6, consonants: 15), "Challenge 10 failed.")
assert(challenge10(input: "Mississippi") == (vowels: 4, consonants: 7), "Challenge 10 failed.")


func challenge11(first: String, second: String) -> Bool {
    if first.characters.count == second.characters.count {
        var differences = 0
        for iterator in first.characters.indices {
            if second[iterator] != first[iterator] {
                differences += 1
            }
        }
        return differences <= 3
    }
    return false
}

assert(challenge11(first: "Clamp", second: "Cramp") == true, "Challenge 11 failed.")
assert(challenge11(first: "Clamp", second: "Crams") == true, "Challenge 11 failed.")
assert(challenge11(first: "Clamp", second: "Grams") == true, "Challenge 11 failed.")
assert(challenge11(first: "Clamp", second: "Grans") == false, "Challenge 11 failed.")
assert(challenge11(first: "Clamp", second: "Clam") == false, "Challenge 11 failed.")
assert(challenge11(first: "clamp", second: "maple") == false, "Challenge 11 failed.")

//: [Next](@next)
