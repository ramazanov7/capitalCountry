
import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
    var questions = QuestionModel.shared
//    var questions = QuestionModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        update()
    }
    
    @IBAction func selectedButtons(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userAnswerCheck = questions.checkAnswer(userAnswer: userAnswer)
        
        if userAnswerCheck == true {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        questions.nextQuestion()
        
        let currentIndex = questions.questionNumber
        guard currentIndex < questions.questionList.count - 1 else {
            performSegue(withIdentifier: "showResult", sender: self)
            return
        }
        
//        if currentIndex == questions.questionList.count {
//
//        } else {
//            performSegue(withIdentifier: "showResult", sender: self)
//            return
//        }
        


        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(update), userInfo: nil, repeats: false)
        

    }
    

    @objc func update() {
        
        questionLabel.text = questions.getQuestionText()
        
        let answerChoices = questions.getAnswer()
        
        firstButton.setTitle(answerChoices[0], for: .normal)
        secondButton.setTitle(answerChoices[1], for: .normal)
        
        progressBar.progress = questions.getProgress()
        scoreLabel.text = "Score: \(questions.getScore())"
        
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        
        
        
        // MARK: have to switching to Result View Controller
        
//        if questions.questionNumber == questions.questionList.count {
//            ResultViewController.segueForUnwinding(UIViewController)
//        }
        
        // MARK: have to return to main View Controller
        
        
        
    }
    
    
    


}
