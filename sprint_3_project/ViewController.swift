//
//  ViewController.swift
//  sprint_3_project
//
//  Created by Dosh on 17.09.2023.
//

import UIKit

class ViewController: UIViewController {

    private var defaultValueCounter: Int = 0
    private var counter: Int = 0
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefault()
        minusButton.layer.cornerRadius = 6
        resetButton.layer.cornerRadius = 6
        addButton.layer.cornerRadius = 6
        historyTextView.layer.cornerRadius = 6
    }
    
    @IBAction func add(_ sender: Any) {
        counter += 1
        counterLabel.text = String(counter)
        addHistory(text: "значение изменено на +1")
    }
    
    @IBAction func minus(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            counterLabel.text = String(counter)
            addHistory(text: "значение изменено на -1")
        } else {
            addHistory(text: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        setDefault()
        addHistory(text: "значение сброшено")
    }
    
    private func setDefault() {
        counter = defaultValueCounter
        counterLabel.text = String(counter)
    }
    
    private func addHistory(text: String) {
        
        if let historyText = historyTextView.text {
            historyTextView.text = "\(historyText)\n\(getCurrentTime()): \(text)"
        } else {
            historyTextView.text = "\n\(getCurrentTime()): \(text)"
        }
    }
    
    private func getCurrentTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        let date = Date()
        return dateFormatter.string(from: date)
    }
    

}

