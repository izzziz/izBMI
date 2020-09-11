//
//  ViewController.swift
//  izBmi
//
//  Created by Izzat Jabali on 16/8/20.
//  Copyright © 2020 Izzat Jabali. All rights reserved.
//

import UIKit


class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String (format:"%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
        
    }
        
     @IBAction func calculatePressed(_ sender: UIButton) {
            let height = heightSlider.value
            let weight = weightSlider.value
            
            
            calculatorBrain.calculateBMI(height: height, weight: weight)
            //Trigger the method to move forward with the Segue
            performSegue(withIdentifier: "goToResult", sender: self)
            
        }
        // ViewController to get initialised when the seguae gets triggered
      
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToResult" {
                // Reference to the new View controller which is gonna be initalized when the segue gets performed.
                let destinationVC = segue.destination as! ResultViewController
                destinationVC.bmiValue = calculatorBrain.getBMIValue()
                destinationVC.advice = calculatorBrain.getAdvice()
                destinationVC.colour = calculatorBrain.getColour()     
        }
    }
}

