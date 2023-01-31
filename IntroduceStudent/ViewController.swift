//
//  ViewController.swift
//  IntroduceStudent
//
//  Created by Oluwajoba Bello on 30/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var backgroundColorUIView: UIView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var sportNameTextField: UITextField!
    @IBOutlet weak var courseNameTextField: UITextField!
    
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
        
    @IBOutlet var textLabels: [UILabel]!
    @IBOutlet var moreInfoInputFields: [UITextField]!
    @IBOutlet var moreInfoTextLabels: [UILabel]!

    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    
    // change the color of the background view from light to dark mode when the switch is toggled
    @IBAction func darkModeUISwitch(_ sender: UISwitch) {
        backgroundColorUIView.backgroundColor = sender.isOn ? .darkMode : .white
        textLabels.forEach { $0.textColor = sender.isOn ? .white : .black }
        moreInfoTextLabels.forEach { $0.textColor = sender.isOn ? .white : .black }
        morePetsStepper.backgroundColor = sender.isOn ? .white : .none
        darkModeSwitch.onTintColor = sender.isOn ? .lightGray : .none
        darkModeSwitch.thumbTintColor = sender.isOn ? .none : .black
    }
    
    // show or hide the "more info" section when the switch is toggle
    @IBAction func toggleMoreInfo(_ sender: UISwitch) {
        moreInfoInputFields.forEach { $0.isHidden = !sender.isOn }
        moreInfoTextLabels.forEach { $0.isHidden = !sender.isOn }
    }
    
    // increament or decreament pets values when stepper button is clicked
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    // show form content on alert-box when "Introduce Self" button is clicked
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)

        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I attend \(schoolNameTextField.text!). I am currently in my \(year!) year and I own \(numberOfPetsLabel.text!) dogs. I like \(courseNameTextField.text!) and \(sportNameTextField.text!). It is \(morePetsSwitch.isOn) that I want more pets."


        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)

        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // randomly change the color of the background view when clicked
    @IBAction func changeColorButtonTapped(_ sender: UIButton) {
        backgroundColorUIView.backgroundColor = .random()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension UIColor {
  // dark mode color selector
  static var darkMode: UIColor {
    return UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0)
  }

  // random color selector
  static func random() -> UIColor {
    return UIColor(red: .random(in: 0...1),
           green: .random(in: 0...1),
           blue: .random(in: 0...1),
           alpha: 1.0)
  }
}
