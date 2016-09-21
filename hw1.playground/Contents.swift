//: # Homework 1 - Swift Playground

//: In order to answer the [EXPLAIN YOUR ANSWER HERE] questions,
//: you must go to Editor -> Show Raw Markup and edit the bracketed text.
//: Once done, go to Editor -> Show Rendered Markup to return to the previous view mode.


import UIKit


//: ## Q1: Optionals
class Words {
    var wordA : String!
    var wordB : String!
    
    init (wordA: String?, wordB: String?) {
        self.wordA = wordA
        self.wordB = wordB
    }
    
    //: ### Are the values passed in to the **init** function and those set to the instance
    //: ### variables the same type? If not, why?
    //:
    //:
    //: They are not the same. The parameters passed in are Optionals (that enclose Strings) whereas the instance variables are Strings (actually ImplicityUnwrappedOptional).
    //:
    
    //: ## Q2: Variable Types and Function Types
    class func arePalindromes(_ words: [String]) -> Bool {
        let reversedWords = words.map() {String($0.characters.reversed())}
        let numElements = words.count
        
        for i in 0 ..< numElements {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        return true
    }
    //: ### Why does the compiler dislike the **for loop**? Fix it.
    //: ### What else is wrong with this function? You may have to refer to (but **not**
    //: ### change) the code at the very bottom. Debug the function.
    
    
    //: 1st issue: There's no return value after exiting the for loop if all the elements are palindromes.
    //: 2nd issue: The func should be a class func, since it is used by calling Words.arePalindromes, so the method belongs to the class, not an instance of Words.
    
    
    //: ## Q3: More Functions and Object Initialization
    func isAnagram() -> Bool {
        var countLetters = [Character : Int]() //Line X
        let lenA = self.wordA.characters.count
        let lenB = self.wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        
        var arrA = Array(self.wordA.characters)
        var arrB = Array(self.wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] { //Line Y
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (_, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
    //: ### What is the problem with declaring **countLetters** as we do in **Line X**,
    //: ### and then using it in **Line Y**? Fix it (by only changing **Line X**).
    //: ### What else is wrong with this function? You may have to refer to (but **not**
    //: ### change) the code at the very bottom. Debug the function.
    
    
    //: countLetters isn't initialized. So we cannot attempt to access one of its elements in Line Y because the dictionary doesn't even exist.
    //: Another issue is that the function should not be a class method because it is attached to an instance (wordsObj) in the code below.
    //: Lastly, the last return should not be nil because the return value is a boolean. If we pass the last for loop, the two words are anagrams, so we should return true instead. I also changed some stylistic things that Xcode recommended (using constants for count, since it cannot change, and putting a placeholder for the first element in the countLetters tuple in the last for-loop since we are not using it).
    
    
}


//: ## Check Your Answers
//: ### If you now see an output stream in the right sidebar, you have successfully
//: ### debugged the code above. Remember that you must also fully and correctly answer
//: ### all of the written questions above to receive full credit for this homework.


//: **DO NOT** touch any code below this point.
Words.arePalindromes(["hih", "racecar", "mom", "wow"])
Words.arePalindromes(["gene", "shawn", "hello"])
var wordsObj = Words.init(wordA: "anagram", wordB: "managra")
wordsObj.isAnagram()
wordsObj.wordA = "hello"
wordsObj.wordB = "what"
wordsObj.isAnagram()
