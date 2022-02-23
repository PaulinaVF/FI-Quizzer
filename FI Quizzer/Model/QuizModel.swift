//
//  QuizModel.swift
//  FI Quizzer
//
//  Created by Paulina Vara on 09/08/21.
//

import Foundation

struct QuizModel {
    let questions = [
        Question(question: "Who speaks the first line of the series?", options: ["Rory", "Lorelai", "Luke"], answer: 1),
        Question(question: "Which journalist does Rory idolize?", options: ["Arthur Kent", "Barbara Ehrenreich", "Christiane Amanpour"], answer: 2),
        Question(question: "How old was actress Keiko Agena when she began playing Lane Kim?", options: ["26", "16", "19"], answer: 0),
        Question(question: "Which major character was originally scripted as a woman?", options: ["Michel", "Luke", "Kirk"], answer: 1),
        Question(question: "Which of the Gilmore Girl actresses hates coffee in real life?", options: ["Alexis Bledel", "Lauren Graham", "Melissa McCarthy"], answer: 0),
        Question(question: "What was the name of Babette's cat that died in Season 1?", options: ["Sugar", "Cinnamon", "Cookie"], answer: 1),
        Question(question: "Which actress had a part written specifically for her?", options: ["Keiko Agena", "Melissa McCathy", "Liza Weil"], answer: 2),
        Question(question: "What does Rory shoplift after her first kiss with Dean?", options: ["Coffee", "Soda", "Cornstarch"], answer: 2),
        Question(question: "Who was Richard engaged to before Emily?", options: ["Pennilyn Lott", "He wasn't", "Francine Hayden"], answer: 0)
    ]
    var questionNumber = 0
    var progressBar = Float(0.0)
    var score = 0
    
    func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion (){
        if(questionNumber < questions.count - 1){
            questionNumber += 1
            progressBar = Float(questionNumber + 1) / Float(questions.count)
        } else {
            questionNumber = 0
            progressBar = 1.0 / Float(questions.count)
            score = 0
        }
        
    }
    
    func getProgress () -> Float {
        return progressBar
    }
    
    func getQuestion () -> String {
        return questions[questionNumber].question
    }
    
    func getOptions () -> [String] {
        return questions[questionNumber].options
    }
    
    func getAnswer () -> Int {
        return questions[questionNumber].answer
    }
    
    mutating func verifyAnswer(_ option: String) -> Bool {
        let answer = getOptions()[getAnswer()]
        if option == answer {
            score += 10
            return true
        } else {
            return false
        }
    }
    
    func getButtonPressed (b1: String, b2: String, b3: String, pressed: String) -> String {
        switch pressed {
            case b1:
                return "button1"
            case b2:
                return "button2"
            case b3:
                return "button3"
            default:
                return "none"
        }
    }
}
