//
//  selectfoodTableViewCell.swift
//  CafeTokenManagmentSystem
//
//  Created by Asad Khan on 10/04/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class selectfoodTableViewCell: UITableViewCell {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var foodimg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
