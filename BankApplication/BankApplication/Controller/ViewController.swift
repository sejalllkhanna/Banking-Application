//
//  ViewController.swift
//  BankApplication
//
//  Created by sejal khanna on 18/12/20.
//  Copyright © 2020 sejal khanna. All rights reserved.
//

import UIKit
import CoreData



class ViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBOutlet weak var HolderName:UITextField!
    @IBOutlet weak var AccNumber:UITextField!
    @IBOutlet weak var Abalance:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func SaveAcountDetailsButton(Sender:UIButton) {
        saveAcountDetails()
        performSegue(withIdentifier: "AcountDetails", sender: nil)
    }
    func saveAcountDetails() {
        let Adetail = AcountDetail(context: context)
        Adetail.aHolderName = HolderName.text!
        Adetail.acountNumber = Double(AccNumber.text!) ?? 100
        Adetail.balance = Double(Abalance.text!) ?? 1000
        save()
        
    }
    func save() {
        do {
            try context.save()
            print("data saved ")
        } catch{
            print(error)
        }
    }
    
  
    
   

}


