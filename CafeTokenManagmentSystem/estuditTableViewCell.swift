//
//  estuditTableViewCell.swift
//  CafeTokenManagmentSystem
//
//  Created by apple on 27/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class estuditTableViewCell: UITableViewCell {

    @IBOutlet weak var aridno: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var myimage: UIImageView!
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
