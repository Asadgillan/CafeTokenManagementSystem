//
//  editfoodTableViewCell.swift
//  CafeTokenManagmentSystem
//
//  Created by apple on 27/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class editfoodTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var pricelbl: UIView!
    @IBOutlet weak var myimage: UIImageView!
    @IBOutlet weak var myfood: UILabel!
    @IBOutlet weak var price: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
