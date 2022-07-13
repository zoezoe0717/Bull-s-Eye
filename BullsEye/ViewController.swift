//
//  ViewController.swift
//  BullsEye
//
//  Created by Zoe on 2022/7/9.
//

import UIKit

class ViewController: UIViewController {
    var messageValue =  0
    var targetValue = 0
    var score = 0
    var gameRoundValue = 0
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetLabel:UILabel!
    @IBOutlet weak var scoreLabel:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let roundValue = slider.value.rounded()
        messageValue = Int(roundValue)
        startNewRound()
        startOver()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbHighLight = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbHighLight, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizeable = trackLeftImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftImage, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackRightResizeable = trackRightImage?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightImage, for: .normal)
        
    }
    
    @IBAction func showAlert(){
        let difference = abs(targetValue - messageValue)
        let alertTitle:String
        var point = 100 - difference

        if difference == 0 {
            alertTitle = "Perfect!"
            point += 100
        }else if difference < 5 {
            alertTitle = "You almost have it!"
            if difference == 1 {
                point += 50
            }
        }else if difference < 10 {
            alertTitle = "Um...Not bad~"
        }else{
            alertTitle = "Not even close..."
        }

        let message = "You scored \(point) points !"
        score += point
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert )
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
//        startNewRound()
    }
    @IBAction func startOver(){
        score = 0
        gameRoundValue = 0
        startNewRound()    }
    
    @IBAction func sliderMoved(_ slider:UISlider){
        let roundValue = slider.value.rounded()
        messageValue = Int(roundValue)
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        messageValue = 50
        slider.value = Float(messageValue)
        gameRoundValue += 1
        updateLabel()
    }
    
    func updateLabel(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(gameRoundValue)
    }
}

