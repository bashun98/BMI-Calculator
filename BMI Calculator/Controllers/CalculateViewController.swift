//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Евгений Башун on 06.02.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    var calculatorBrain = CalculatorBrain()
    private var bmiValue: Double {
        get {
            Double(weightSlider.value / pow(heightSlider.value, 2))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


   
    @IBAction func heightChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(height, weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            guard let destination = segue.destination as? ResultViewController else { return }
            destination.bmiValue = calculatorBrain.getBMIValue()
            destination.backgroundColor = calculatorBrain.getBackgroundColor()
            destination.advice = calculatorBrain.getAdvice()
        }
    }
}

