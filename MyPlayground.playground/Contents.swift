import UIKit

    func isValid(_ s: String) -> Bool {
        let bracketDict: [Character: Character] = [
            "(": ")",
            "{": "}",
            "[": "]"
        ]
        var bracketStack = [Character]()
        for char in s {
            if bracketDict.keys.contains(char) {
                bracketStack.append(char)
            } else {
                if let last = bracketStack.last {
                    if char != bracketDict[bracketStack.removeLast()] {
                        return false
                    }
                } else {
                    return false
                }
            }
        }
        return bracketStack.isEmpty
    }

isValid("(){}")
