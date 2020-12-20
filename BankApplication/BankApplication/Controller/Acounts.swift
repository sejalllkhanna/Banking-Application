//
//  Acounts.swift
//  BankApplication
//
//  Created by sejal khanna on 19/12/20.
//  Copyright © 2020 sejal khanna. All rights reserved.
//

import UIKit

class Acounts: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var Aname:UILabel!
    @IBOutlet weak var Ano:UILabel!
    @IBOutlet weak var Balance:UILabel!

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
