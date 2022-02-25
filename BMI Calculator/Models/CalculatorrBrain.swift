//
//  CalculatorrBrain.swift
//  BMI Calculator
//
//  Created by Евгений Башун on 06.02.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    private var bmi: BMI?
    
    mutating func calculateBMI(_ height: Float, _ weight: Float) {
        let bmiValue = weight / pow(height, 2)
        switch bmiValue {
        case ..<18.5:
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: .blue)
        case ..<24.9:
            bmi = BMI(value: bmiValue, advice: "You are good bro", color: .green)
        default:
            bmi = BMI(value: bmiValue, advice: "Please, stop eating", color: .red)
        }
    }
    
    func getBMIValue() -> String {
        let bmiTo1Decimal = String(format: "%.1f", bmi?.value ?? 0)
        return bmiTo1Decimal
    }
    
    func getBackgroundColor() -> UIColor {
        bmi?.color ?? UIColor.white
    }
    
    func getAdvice() -> String {
        bmi?.advice ?? "Can't get an advice"
    }
}
