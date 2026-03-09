//
//  ViewController.swift
//  Apple Pie
//
//

import UIKit

class ViewController: UIViewController {
    var listOfWords = ["buccaneer","dog","program","glories","money"]
    
    let incorrectMovesAllowed = 7
    
    var totalScore = 0 {
        didSet {
            updateUI()
        }
    }
    var totalWins = 0 {
        didSet {
            updateUI()
        }
    }
    var totalLosses = 0 {
        didSet {
            updateUI()
        }
    }
    
    
    
    // var totalWins = 0
    // var totalLosses = 0
    
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    
    @IBOutlet weak var nextRoundButton: UIButton!
    
    @IBAction func nextRoundButtonPressed(_ sender: UIButton) {
    
        newRound()
    }
    
    
    
    var currentGame: Game!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        
        // Do any additional setup after loading the view.
    }
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
            nextRoundButton.isHidden = true
            
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration?.title ?? sender.title(for: .normal) ?? ""
        let letter = Character(letterString.lowercased())
        
        if currentGame.word.contains(letter) {
            totalScore += 10
        }
    
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }

    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
            
            enableLetterButtons(false)

        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
            totalScore += 100
            enableLetterButtons(false)
        } else {
      
            updateUI()
        }
    }
    
    func updateUI() {
        let letters = currentGame.formattedWord.map { String($0) }
        
        let wordWithSpacing = letters.joined(separator: " ")
        
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins)  Losses: \(totalLosses)   Point: \(totalScore)"
        
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    
        let isRoundOver = (currentGame.word == currentGame.formattedWord) || (currentGame.incorrectMovesRemaining == 0)
        let hasMoreWords = !listOfWords.isEmpty
        
        nextRoundButton.isEnabled = isRoundOver && hasMoreWords
        nextRoundButton.isHidden = !isRoundOver
    }
    
    
    }

    


