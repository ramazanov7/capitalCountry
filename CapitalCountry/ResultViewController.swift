//
//  ResultViewController.swift
//  CapitalCountry
//
//  Created by Алибек Рамазан on 13.11.2023.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var resultLabel: UILabel!
    
    var result = QuestionModel.shared
//    var result = QuestionModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupDoneButton()

        resultLabel.text = "Your score: \(result.getScore())"
        print(resultLabel.text!)
    }
    
    func setupDoneButton() {
        let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonDidTap))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc
    private func doneButtonDidTap() {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
