//
//  GameViewController.swift
//  iOSIncubator
//
//  Created by Keegan Rush on 2016/09/26.
//  Copyright © 2016 Entelect. All rights reserved.
//

import UIKit

enum GameState {
    case start
    case playing(Player)
    case finished(Player)
}

class GameViewController: UIViewController, HeapDelegate {
    
    @IBOutlet weak var heapStackView: UIStackView!
    @IBOutlet weak var currentPlayerLabel: UILabel!
    var heapViewControllers: [HeapViewController]
    var currentState: GameState
    var players: (human: Player, computer: Player)
    
    required init?(coder aDecoder: NSCoder) {
        heapViewControllers = Array()
        currentState = .start
        
        players.human = Player(playerType: .human)
        players.computer = Player(playerType: .computer)
        
        super.init(coder: aDecoder)
        
        heapViewControllers = [HeapViewController(delegate: self), HeapViewController(delegate: self), HeapViewController(delegate: self)]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for heap in heapViewControllers {
            self.addChildViewController(heap)
            heapStackView.addArrangedSubview(heap.view)
        }
        currentState = .playing(players.human)
        updatePlayerLabel()
    }
    
    // MARK: - HeapDelegate
    
    func tokensTaken(from heapView: HeapViewController) {
        handleStateChange()
    }
    
    func changedStepperValue(for heapView: HeapViewController) {
        let otherHeaps = heapViewControllers.filter({return $0 != heapView})
        
        for heap in otherHeaps {
            heap.tokensToTakeStepper.value = 0
            heap.setLabelsText()
        }
    }
    
    // MARK: -
    
    func handleStateChange() {
        guard case .playing(let currentPlayer) = currentState else { return }
        
        let allRemainingTokens = heapViewControllers.reduce(0, {(currentResult, heap) in return currentResult + heap.remainingTokens})
        
        if allRemainingTokens > 0 {
            let otherPlayer = currentPlayer == players.human ? players.computer : players.human
            currentState = .playing(otherPlayer)
            
            updatePlayerLabel()
            
            if otherPlayer.playerType == .computer {
                playComputer()
            }
            
        } else {
            currentState = .finished(currentPlayer)
            endGame(winner: currentPlayer)
        }
    }
    
    func playComputer() {
        let delay = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: delay, execute: {
            let heapsWithTokens = self.heapViewControllers.filter({$0.remainingTokens > 0})
            
            let randomHeapIndex = Int(arc4random_uniform(UInt32(heapsWithTokens.count)))
            let randomHeap = heapsWithTokens[randomHeapIndex]
            
            var amountOfTokensToTake = 0
            
            if heapsWithTokens.count > 1 {
                amountOfTokensToTake = Int(arc4random_uniform(UInt32(randomHeap.remainingTokens + 1)))
            } else {
                amountOfTokensToTake = heapsWithTokens.first!.remainingTokens
            }
            
            randomHeap.takeTokens(amountOfTokensToTake)
        })
    }
    
    func updatePlayerLabel() {
        if case .playing(let player) = currentState {
            if player.playerType == .human {
                if let playerName = UserDefaults.standard.string(forKey: UserDefaultsKeys.userName.rawValue) {
                    currentPlayerLabel.text = "\(playerName)'s turn"
                } else {
                    currentPlayerLabel.text = "Your turn"
                }
            } else {
                currentPlayerLabel.text = "Computer's turn"
            }
            currentPlayerLabel.isHidden = false
        } else {
            currentPlayerLabel.isHidden = true
        }
    }
    
    func endGame(winner player: Player) {
        let humanWon = "You won! Congratulations!"
        let computerWon = "You lost to a random number generator. How does that make you feel?"
        let alertBody = player.playerType == .human ? humanWon : computerWon
        
        displayAlertViewForEndGame(with: alertBody)
        
        <#set up game object#>
        GameHistory.addToHistory(<#T##GameHistory#>)
    }
    
    func displayAlertViewForEndGame(with alertBody: String) {
        let alertController = UIAlertController(title: "Game Over", message: alertBody, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {(_) in let _ = self.navigationController?.popViewController(animated: true)})
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)

    }
}
