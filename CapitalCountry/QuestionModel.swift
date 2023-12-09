
import UIKit

class QuestionModel {
    
    static let shared = QuestionModel()
    
    private init() {}

    var questionNumber = 0
    var score = 0
    
    struct QuestionAnswer {
        let title: String
        let variants: [String]
        var correctAnswer: String
        
        init(tit: String, vari: [String], ans: String) {
            self.title = tit
            self.variants = vari
            self.correctAnswer = ans
        }
    }
    
    let questionList = [
        QuestionAnswer(tit: "Japan", vari: ["Seul", "Tokyo"], ans: "Tokyo"),
        QuestionAnswer(tit: "Germany", vari: ["Berlin", "Dublin"], ans: "Berlin"),
        QuestionAnswer(tit: "Kazakhstan", vari: ["Almaty", "Astana"], ans: "Astana"),
        QuestionAnswer(tit: "Russia", vari: ["Moscow", "Pristtina"], ans: "Moscow"),
        QuestionAnswer(tit: "Netherlands", vari: ["Amsterdam", "Wellington"], ans: "Amsterdam"),
        QuestionAnswer(tit: "Sweden", vari: ["Stockholm", "Bern"], ans: "Stockholm"),
        QuestionAnswer(tit: "Switzerland", vari: ["Bern", "Stockholm"], ans: "Bern"),
        QuestionAnswer(tit: "Thailand", vari: ["Gangkok", "Bangkok"], ans: "Bangkok"),
        QuestionAnswer(tit: "Colombia", vari: ["Bogota", "Santiago"], ans: "Bogota"),
        QuestionAnswer(tit: "Azerbaijan", vari: ["Kabul", "Baku"], ans: "Baku")
        
    ]
    
    func getQuestionText() -> String {
        return questionList[questionNumber].title
    }

    func getAnswer() -> [String] {
        return questionList[questionNumber].variants
    }
    
    func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == questionList[questionNumber].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func nextQuestion() {
        if questionNumber + 1 < questionList.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(questionList.count)
    }
    
    func getScore() -> Int{
        return score
    }
    
}
