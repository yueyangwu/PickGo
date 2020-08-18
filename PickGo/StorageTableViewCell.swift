//
//  StorageTableViewCell.swift
//  PickGo
//
//  Created by Zhou Timena on 5/1/18.
//  Copyright © 2018 Lily. All rights reserved.
//

import UIKit

class StorageTableViewCell: UITableViewCell {

    @IBOutlet weak var materialLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var addText: UITextField!
    @IBOutlet weak var decreaseText: UITextField!
    
    var idPos: Int!
    
    var amount: Int = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
