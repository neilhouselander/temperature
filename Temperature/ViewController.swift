//
//  ViewController.swift
//  Temperature
//
//  Created by Neil Houselander on 28/12/2015.
//  Copyright © 2015 Neil Houselander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//centigrade conversion outlets
    @IBOutlet weak var centigradeTextField: UITextField!
    @IBOutlet weak var farenheightOutputLabel: UILabel!
    @IBOutlet weak var convertButtonOutlet: UIButton!
    @IBOutlet weak var resetButtonOutlet: UIButton!
    @IBOutlet weak var errorHandlingLabel: UILabel!
    
//farenheight conversion outlets
    @IBOutlet weak var farenheightTextField: UITextField!
    @IBOutlet weak var centigradeOutputLabel: UILabel!
    @IBOutlet weak var convertFtoCButtonOutlet: UIButton!
    @IBOutlet weak var resetFtoCButtonOutlet: UIButton!
    
    
//FIRST DO THE CENTIGRADE TO FARENHEIGHT FUNCTIONS
    @IBAction func convertButtonPressed(sender: UIButton)
    {
//error handling here
       if centigradeTextField.text == ""
       {
        errorHandlingLabel.text = "Enter A Number Please"
        errorHandlingLabel.hidden = false
        convertButtonOutlet.hidden = true
        resetButtonOutlet.hidden = false
        centigradeTextField.resignFirstResponder()
       }
            else //main else statement
            {
//take the text field value
                let tempInCentigrade = Double(centigradeTextField.text!)
                if tempInCentigrade == nil
                {
                 errorHandlingLabel.text = "Needs To Be A Number"
                 errorHandlingLabel.hidden = false
                 convertButtonOutlet.hidden = true
                 resetButtonOutlet.hidden = false
                 centigradeTextField.resignFirstResponder()
                 }
                else //second else statement
                {
//do the maths
                let theAnswer = Int(((tempInCentigrade! * 9) / 5) + 32)
//output to the label
                farenheightOutputLabel.text = "\(theAnswer) °F"
//unhide the label
                farenheightOutputLabel.hidden = false
//hide this button
                convertButtonOutlet.hidden = true
//unhide the reset button
                resetButtonOutlet.hidden = false
//tidy up - lose the keyboard
                centigradeTextField.resignFirstResponder()
//silly bits
                    if tempInCentigrade <= -100
                    {
                        errorHandlingLabel.text = "Face Freezing Weather !"
                        errorHandlingLabel.hidden = false
                        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "freezing.jpg")!)
                    }
                    
                    if tempInCentigrade <= 0 && tempInCentigrade > -100
                    {
                        errorHandlingLabel.text = "Brrrr Chilly!!!!"
                        errorHandlingLabel.hidden = false
                       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "snow-1.png")!)
                        
                        
                    }
                    if tempInCentigrade == 666
                    {
                        errorHandlingLabel.text = "DEVILISHLY HOT !"
                        errorHandlingLabel.hidden = false
                        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "devil.png")!)
                    }
                    
                    if tempInCentigrade >= 100 && tempInCentigrade < 665
                    {
                        errorHandlingLabel.text = "Its Getting Hot In Here!"
                        errorHandlingLabel.hidden = false
                        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "sun.png")!)
                    }
          
                }//end of second else statement
        
            }//end of main else statement
    }//end of function

    @IBAction func resetButtonPressed(sender: UIButton)
    {
//clear the text field
        centigradeTextField.text = ""
//hide the label
        farenheightOutputLabel.hidden = true
//hide this button
        resetButtonOutlet.hidden = true
//unhide the convert button
        convertButtonOutlet.hidden = false
//hide the error handling label
        errorHandlingLabel.hidden = true
 //hide keyboard if showing
        centigradeTextField.resignFirstResponder()
//reset the view background
        self.view.backgroundColor = UIColor.blackColor()
     }
    
//NOW DO THE FARENHEIGHT TO CENTIGRADE FUNCTIONS - repeat above but use updated outlets etc.
    //maths for this is deduct 32 multiply by 5, divide by 9
    
    @IBAction func convertFtoCButtonPressed(sender: UIButton)
    {
     if farenheightTextField.text == ""
     {
        errorHandlingLabel.text = "Enter A Number Please"
        errorHandlingLabel.hidden = false
        convertFtoCButtonOutlet.hidden = true
        resetFtoCButtonOutlet.hidden = false
        farenheightTextField.resignFirstResponder()
        
     }
        else
            {
            let tempInFarenheight = Double(farenheightTextField.text!)
                if tempInFarenheight == nil
                        {
                            errorHandlingLabel.text = "Needs To Be A Number"
                            errorHandlingLabel.hidden = false
                            convertFtoCButtonOutlet.hidden = true
                            resetFtoCButtonOutlet.hidden = false
                            farenheightTextField.resignFirstResponder()
                         }
                else
                {
                    let theFarenheightAnswer = Int(((tempInFarenheight! - 32) * 5) / 9)
                    centigradeOutputLabel.text = "\(theFarenheightAnswer) °C"
                    centigradeOutputLabel.hidden = false
                    convertFtoCButtonOutlet.hidden = true
                    resetFtoCButtonOutlet.hidden = false
                    farenheightTextField.resignFirstResponder()
                    
                        if tempInFarenheight <= -148
                        {
                            errorHandlingLabel.text = "Face Freezing Weather"
                            errorHandlingLabel.hidden = false
                            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "freezing.jpg")!)
                        }
                    
                        if tempInFarenheight <= 32 && tempInFarenheight > -148
                        {
                         errorHandlingLabel.text = "Brrrr chilly !"
                         errorHandlingLabel.hidden = false
                         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "snow-1.png")!)
                        }
                    
                        if tempInFarenheight == 666
                        {
                         errorHandlingLabel.text = "DEVILISHLY HOT"
                         errorHandlingLabel.hidden = false
                         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "devil.png")!)
                        }
                    
                        if tempInFarenheight >= 212 && tempInFarenheight < 665
                        {
                          errorHandlingLabel.text = "Its Getting Hot In Here"
                          errorHandlingLabel.hidden = false
                          self.view.backgroundColor = UIColor(patternImage: UIImage(named: "sun.png")!)
                        }
                 }
               }
        
        
       }
    
    
    @IBAction func resetFtoCButtonPressed(sender: UIButton)
    {
        farenheightTextField.text = ""
        centigradeOutputLabel.hidden = true
        resetFtoCButtonOutlet.hidden = true
        convertFtoCButtonOutlet.hidden = false
        errorHandlingLabel.hidden = true
        farenheightTextField.resignFirstResponder()
         self.view.backgroundColor = UIColor.blackColor()
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

