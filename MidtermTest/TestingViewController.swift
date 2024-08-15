//
//  TestingViewController.swift
//  MidtermTest
//
//  Created by 洪宗燦 on 2024/8/12.
//

import UIKit

class TestingViewController: UIViewController {
    struct QuizQuestion {
        let question: String
        let options: [String]
        let correctAnswer: Int
    }
    var answer : Int = 1
    var index : Int = 0
    var score : Int = 0
    var correct : Int = 0
    @IBOutlet weak var labelPercent: UILabel!
    @IBOutlet weak var correctAnswer: UITextView!
    @IBOutlet weak var resultHint: UIImageView!
    @IBOutlet weak var question: UITextView!
    
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var scoreBoard: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var option1: UILabel!
    
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var option2: UILabel!
    
    @IBOutlet weak var option3: UILabel!
    
    @IBOutlet weak var option4: UILabel!
    var quizQuestions: [QuizQuestion] = [
        QuizQuestion(question: "二進位數值1101001轉換為十六進位時，其值為", options: ["7A", "39", "69","8A"], correctAnswer: 3),
        QuizQuestion(question: "1101111001二進位補數為下列何者？", options: ["0010000110", "1111111001", "1101111010","0010000111"], correctAnswer: 4),
        QuizQuestion(question: "電腦處理資料的原理是採用下列何者", options: ["10進位", "8進位", "16進位","2進位"], correctAnswer: 4),
        QuizQuestion(question: "一般PC所使用的內碼為", options: ["NTSC","BLSI","ASCII","EBCDIC"], correctAnswer: 3),
        QuizQuestion(question: "一般說來，我們說 P C 有 4MB 主記憶體，指的是", options: ["4096bytesRAM", "4096KBRAM", "4096bytesROM","4096KBROM"], correctAnswer: 2),
        QuizQuestion(question: "二進位1011，1001，1100，0011以十六進制表示", options: ["A9D3", "B9C3", "C8E4","C9E3"], correctAnswer: 2),
        QuizQuestion(question: "下列哪個符號非十六進位系統所用的符號？", options: ["A", "B", "F","G"], correctAnswer: 4),
        QuizQuestion(question: "請換算右列之數值，（456）8＝（）16：", options: ["228", "12E", "12D","12F"], correctAnswer: 2),
        QuizQuestion(question: "微秒（Microseconds）是計量電腦速度的微小時間單位之一，一 微秒等於", options: ["千分之一秒（", "千分之一秒", "萬分之一秒","十萬分之 一秒"], correctAnswer: 4),
        QuizQuestion(question: "一台主記憶體為640KB的個人電腦，其主記憶體容量可存放的英 文字母有", options: ["64個", "640個", "640×1024個","640×640個"], correctAnswer: 1),
  

    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NewGame()
   
    }
  
    func newQuestion() {
        question.text = quizQuestions[index].question
        option1.text = quizQuestions[index].options[0]
        option2.text = quizQuestions[index].options[1]
        option3.text = quizQuestions[index].options[2]
        option4.text = quizQuestions[index].options[3]
 
    }
    func NewGame (){
        quizQuestions.shuffle()
         resultHint.image = UIImage(systemName :  "")
         correctAnswer.text = ""
        scoreBoard.text="0"
        labelPercent.text = "0/0"
        index = 0
        correct = 0
        score = 0
        newQuestion()
        
        
    }

    @IBAction func answerButtonClicked(_ sender: UIButton) {
        if index >= quizQuestions.count{
            return
        }
        
        
        switch sender {
        case button1 :
            answer = 1
        case button2 :
            answer = 2
        case button3 :
            answer = 3
        case button4 :
            answer = 4
        default :
            break
        }
        
        if answer == quizQuestions[index].correctAnswer
        {
            score += 10;
            correct += 1
            scoreBoard.text = "\(score)"
            resultHint.image = UIImage(systemName :  "checkmark")
            
        }
        else {
            resultHint.image = UIImage(systemName: "multiply")
            answer = quizQuestions[index].correctAnswer
   
        }
        
        correctAnswer.text = "the correst answer is \(quizQuestions[index].correctAnswer)  \(quizQuestions[index].options[answer-1]) "
        labelPercent.text = "\(correct)/\(index+1)"
        index += 1
        if index >= quizQuestions.count {
            showFinishedAlert()
            
            
        }else{
            newQuestion()
        }
    }
 
    @IBAction func clickNextQuestion(_ sender: Any) {
        newQuestion()
    }
    
     @IBAction func restart(_ sender: Any) {
         NewGame()
     }
    
    func showFinishedAlert() {
        let alertController = UIAlertController(title: "完成", message: "你已經答完所有題目", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            // Handle OK button tap
        }

        alertController.addAction(okAction)

        present(alertController, animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
