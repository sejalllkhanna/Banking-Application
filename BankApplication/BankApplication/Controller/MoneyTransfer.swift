//
//  MoneyTransfer.swift
//  BankApplication
//
//  Created by sejal khanna on 18/12/20.
//  Copyright © 2020 sejal khanna. All rights reserved.
//

import UIKit


class MoneyTransfer: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var acount:AcountDetail?
    var allAcounts:[AcountDetail]?
    var status = false
    
    
    @IBOutlet weak var amountField:UITextField!
    @IBOutlet weak var acountField:UITextField!
     var transferAmt:Double = 0
    
    @IBAction func SendMoney(_ sender:UIButton) {
        checkAcount()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
    }
    
    func checkAcount() {
        transferAmt = Double(amountField.text!)!
        let recAcc:Double = Double(acountField.text!)!
        if (acount!.balance >= transferAmt) {
        for a in allAcounts!{
            if recAcc == a.acountNumber {
                print(a.acountNumber)
                let updatedBalance = transferAmt + a.balance
                let preACC = acount!.balance - transferAmt
                acount?.setValue(preACC, forKey: "balance")
                a.setValue(updatedBalance, forKey:"balance")
                self.save()
                status = true
                break
            }
            status = false
        }
            if status {
                print("acount found")
            }else{
                print("wrong Acccount no")
            }
        
    }
        else {
            print("you dont have sufficient Amount")
        }
    }

        func save() {
            do {
                try context.save()
               
            } catch{
                print(error)
            }
        }
    
}
