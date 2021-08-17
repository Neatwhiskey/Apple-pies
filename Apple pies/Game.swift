//
//  Game.swift
//  Apple pies
//
//  Created by Jamaaldeen Opasina on 8/16/21.
//

import Foundation
struct Game{
    var word: String
    var IncorrectMovesRemaining: Int
    var guessedLetters:[Character]
    
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        
        if !word.contains(letter){
            IncorrectMovesRemaining -= 1
        }
        
        }
    var formattedWord: String{
        var guessedWord = ""
        
        for letter in word{
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
            }else{
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
}
