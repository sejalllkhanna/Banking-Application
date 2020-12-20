//
//  AccountViewController.swift
//  BankApplication
//
//  Created by sejal khanna on 18/12/20.
//  Copyright © 2020 sejal khanna. All rights reserved.
//

import UIKit
import CoreData


let reuseIdentifier = "Acounts"

 class AcountViewController: UITableViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var Acounts = [AcountDetail]();

    @IBOutlet weak var AcountsTable:UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "Acounts", bundle: nil)
        AcountsTable.register(nib, forCellReuseIdentifier: "AcountCell")
        getAcountDetails()
        

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        AcountsTable.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight:CGFloat = CGFloat(80) //80
        return rowHeight
    }

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Acounts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AcountCell", for: indexPath) as! Acounts
        let iconImage = UIImage(systemName: "person.circle")

       cell.Aname.text = Acounts[indexPath.row].aHolderName ?? "NIL"
       cell.icon.image = iconImage
        cell.Ano.text = String(Acounts[indexPath.row].acountNumber)
        cell.Balance.text = String(Acounts[indexPath.row].balance)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
   
        performSegue(withIdentifier: "Money", sender: nil)
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Money" {
            if let indexPath = self.AcountsTable.indexPathForSelectedRow{
                let moneyVC = segue.destination as! MoneyTransfer
                moneyVC.acount = Acounts[indexPath.row]
                moneyVC.allAcounts = Acounts
                
            }
        }
    }
    
    func getAcountDetails() {
        let request:NSFetchRequest<AcountDetail> = AcountDetail.fetchRequest()
        let sort = NSSortDescriptor(key: "aHolderName", ascending: true)
        request.sortDescriptors = [sort]
        
        do {
            Acounts = try context.fetch(request)
        } catch {
            print(error)
        }
        
        
    }
    
  

}
