//
//  ViewController.swift
//  FI Quizzer
//
//  Created by Paulina Vara on 09/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var button1_bg: UIImageView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button3_bg: UIImageView!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button2_bg: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizModel = QuizModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateView()
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        let usersAnswer = sender.currentTitle!
        var colorImage: UIImage
        
        if(quizModel.verifyAnswer(usersAnswer)){
            colorImage = #imageLiteral(resourceName: "2")
        }else {
            colorImage = #imageLiteral(resourceName: "3")
        }
        
        let pressed = quizModel.getButtonPressed(b1: button1.currentTitle!, b2: button2.currentTitle!, b3: button3.currentTitle!, pressed: usersAnswer)
        
        switch pressed {
            case "button1":
                button1_bg.image = colorImage
            case "button2":
                button2_bg.image = colorImage
            case "button3":
                button3_bg.image = colorImage
            default:
                print("Error")
        }
        
        scoreLabel.text = "Score: \(quizModel.getScore())"
        
        Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false) { (Timer) in
            colorImage = #imageLiteral(resourceName: "1")
            self.button1_bg.image = colorImage
            self.button2_bg.image = colorImage
            self.button3_bg.image = colorImage
            self.quizModel.nextQuestion()
            self.updateView()
        }
        
    }
    
    func updateView(){
        questionLabel.text = quizModel.getQuestion()
        button1.setTitle(quizModel.getOptions()[0], for: UIControl.State.normal)
        button2.setTitle(quizModel.getOptions()[1], for: UIControl.State.normal)
        button3.setTitle(quizModel.getOptions()[2], for: UIControl.State.normal)
        progressBar.progress = quizModel.getProgress()
        scoreLabel.text = "Score: \(quizModel.getScore())"
        button1.titleLabel!.adjustsFontSizeToFitWidth = true;
        button2.titleLabel!.adjustsFontSizeToFitWidth = true;
        button3.titleLabel!.adjustsFontSizeToFitWidth = true;
    }
    
}

