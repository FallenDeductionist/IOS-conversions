//
//  ViewController.swift
//  Conversions
//
//  Created by Mario Fernando Paucar Gutierrez on 5/7/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var resultadoTextField: UITextField!
    @IBOutlet weak var medidaTextField: UITextField!
    @IBOutlet weak var calcularButton: UIButton!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    let pickerData = [String](arrayLiteral: "Kilometros", "Millas", "Yardas")
    let pickerData2 = [String](arrayLiteral: "Kilometros", "Millas", "Yardas")
    let picker = UIPickerView()
    let picker2 = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker2.delegate = self
        
        firstTextField.inputView = picker
        secondTextField.inputView = picker2
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }	
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == picker {
            firstTextField.text = pickerData[row]
        } else if pickerView == picker2{
            secondTextField.text = pickerData2[row]
        }
    }
    
    @IBAction func calcularTapped(_ sender: Any) {
        let joinedTexts = "\(String(describing: firstTextField.text!))\(String(describing: secondTextField.text!))"
        print(joinedTexts)
        let medida:Double? = Double(medidaTextField.text!)
        var resultado:Double?
        
        switch joinedTexts {
        case "KilometrosMillas":
            resultado = medida! * 0.0062
            resultadoTextField.text = "\(String(describing: resultado!))"
        case "KilometrosYardas":
            resultado = medida! * 1093.6132983377
            resultadoTextField.text = "\(String(describing: resultado!))"
        case "YardasMillas":
            resultado = medida! * 0.000568182
            resultadoTextField.text = "\(String(describing: resultado!))"
        case "YardasKilometros":
            resultado = medida! * 0.0009144
            resultadoTextField.text = "\(String(describing: resultado!))"
        case "MillasKilometros":
            resultado = medida! * 1.60934
            resultadoTextField.text = "\(String(describing: resultado!))"
        case "MillasYardas":
            resultado = medida! * 1760
            resultadoTextField.text = "\(String(describing: resultado!))"
        default:
            resultado = medida!
            resultadoTextField.text = "\(String(describing: resultado!))"
        }
    }
    
}
