//
//  ViewController.swift
//  Apple pies
//
//  Created by Jamaaldeen Opasina on 8/7/21.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords = ["swift","java","kotlin","dart","python"]
    
    let incorrectiveMovesAllowed = 7
     
    var totalWins = 0 {
        didSet{
            newRound()
        }
    }
    var totalLoss = 0{
        didSet{
            newRound()
        }
    }
    

    
    
    
    @IBOutlet var scoreLabel: UILabel!
       
    @IBOutlet var correctWordLabel: UILabel!
       
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBOutlet var treeImageView: UIImageView!
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view.
    }
    var currentGame:Game!
    
    func newRound(){
        if !listOfWords.isEmpty{
        let newWord = listOfWords.randomElement()
            currentGame = Game(word: newWord!, IncorrectMovesRemaining:incorrectiveMovesAllowed, guessedLetters:[])
            enableLetterButtons(_enable: true)
        }else{
            enableLetterButtons(_enable: false)
        }
        updateUi()
        
    }
    
    func enableLetterButtons(_enable: Bool){
        for button in letterButtons {
            button.isEnabled = _enable
        }
    }
    
    func updateUi(){
        var letters = [String]()
        for letter in currentGame.formattedWord{
            letters.append(String(letter))
        }
        correctWordLabel.text = letters.joined(separator: " ")
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLoss)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.IncorrectMovesRemaining)")
    }
    
    func updateGameState(){
        if currentGame.IncorrectMovesRemaining == 0{
            totalLoss += 1
        }else if currentGame.word == currentGame.formattedWord{
            totalWins += 1
        }else{
            updateUi()
        }
    }
    


}

