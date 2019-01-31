//
//  ViewController.swift
//  bullseye_mina
//
/*
1. The application works; I figured out the reason why my application was offset last time, I was emulating it to the iPhone 8 but was building it on the iPhone SE layout. After emulating it on the SE correctly, everything lays out fine
2. I do not have an iPhone to deploy the app to
3. The application now uses outlets to display dynamic information to the storyboard, such as generating and displaying a random target number every run. It also displays the number you selected once tapping the 'hit me' button
4. I created and linked the outlet for the round number label, as well as created the shell for the score label (since I currently don't know how the scoring convention will work)
5. I learned about variable scope in swift, as well as how the outlets work and allow us to display dynamic information from the code to the storyboard
6. No other material was consulted other than the videos
7. None
*/

//

import UIKit

class ViewController: UIViewController {

    var currentVal: Int = 0
    var targetVal: Int = 0
    var roundNum: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var target: UILabel!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var scoreLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentVal = Int(roundedValue)
        startNewRound()
    }

    @IBAction func showAlert(){
        let message = "The value of the slider is now: \(currentVal)" +
        "\nThe target value is: \(targetVal)";
        let alert = UIAlertController(title: "Popup Message", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded();
        currentVal = Int(roundedValue);
    }
    
    func startNewRound(){
        targetVal = Int.random(in: 1...100)
        currentVal = 50
        slider.value = Float(currentVal)
        roundNum += 1
        updateLabels()
    }
    func updateLabels(){
        target.text = String(targetVal)
        round.text = String(roundNum)
        //scoreLabel.text = String (score)
    }
}
