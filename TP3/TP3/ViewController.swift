//
//  ViewController.swift
//  TP3
//
//  Created by Guillaume Gonzales on 28/10/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var resultLB: UILabel!
    
    var scores = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Game.sharedInstance.reset()
        resultLB.text = "Welcome to the game ! Try to guess the number between 0 & 100"
    }

    @IBAction func playAction(_ sender: Any) {
        Game.sharedInstance.nbRound += 1
        
        guard let value = Int(numberTF.text ?? "") else { return }
        let result: GameStatus? = Game.sharedInstance.checkValue(value: value)
        
        if (result == GameStatus.OVER) {
            resultLB.text = "Secret value is lower"
        } else if (result == GameStatus.UNDER) {
            resultLB.text = "Secret value is higher"
        } else {
            scores.append(Game.sharedInstance.nbRound)
            
            resultLB.text = ""
            
            let alertController = UIAlertController(title: "Congratulations !!!", message: "You found in \(Game.sharedInstance.nbRound) tries !", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default) { (_) in
                self.resetAction(self)
            }
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func resetAction(_ sender: Any) {
        Game.sharedInstance.reset()
        
        numberTF.text = ""
        resultLB.text = "Welcome to the game ! Try to guess the number between 0 & 100"
    }
}

