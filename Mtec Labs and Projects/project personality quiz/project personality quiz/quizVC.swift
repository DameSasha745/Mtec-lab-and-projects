//
//  quizVC.swift
//  project personality quiz
//
//  Created by Sasha Cummings on 2/19/25.
//

import UIKit

class quizVC: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStakView: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabel1: UILabel!
    @IBOutlet var multipleLabel2: UILabel!
    @IBOutlet var multipleLabel3: UILabel!
    @IBOutlet var multipleLabel4: UILabel!
    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet var multiSwitch3: UISwitch!
    @IBOutlet var multiSwitch4: UISwitch!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    @IBOutlet var rangedSlider: UISlider!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    var questions: [Question] = [Question(text: "What food do you like the most?", type: .single, answers: [Answer(text: "meat", type: .dragon), Answer(text: "sushi", type: .murmaid), Answer(text: "fruit", type: .pheonix), Answer(text: "grass", type: .unicorn)]), Question(text: "what kind of activitys do you enjoy?", type: .multiple, answers: [Answer(text: "sleeping on gold", type: .dragon), Answer(text: "swimming and singing", type: .murmaid), Answer(text: "protecting from unnecicary warfar", type: .pheonix), Answer(text: "running in a field of flowers", type: .unicorn)]),Question(text: "how much do you enjoy humens?", type: .ranged, answers: [Answer(text: "burn them!", type: .dragon), Answer(text: "barely notice them", type: .murmaid), Answer(text: "kinda like them", type: .pheonix), Answer(text: "I love them", type: .unicorn)])]
    
    var questionIndex = 0
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    @IBAction func singleAnswerButtonTapped(_ sender: UIButton) {
        
        let currentAnswers = questions[questionIndex].answers
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers  = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    func updateUI() {
        singleStakView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnwers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Qestion #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnwers)
        case .multiple:
            updateMultipleStackView(useing: currentAnwers)
        case .ranged:
            updateRangedStack(using: currentAnwers)
        }
    }
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> resultsVC? {
        return resultsVC(coder: coder, responses: answersChosen)
    }
    
    
    
    
    func updateSingleStack(using answers: [Answer]) {
        singleStakView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    func updateMultipleStackView(useing answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multipleLabel1.text = answers[0].text
        multipleLabel2.text = answers[1].text
        multipleLabel3.text = answers[2].text
        multipleLabel4.text = answers[3].text
    }
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
}
