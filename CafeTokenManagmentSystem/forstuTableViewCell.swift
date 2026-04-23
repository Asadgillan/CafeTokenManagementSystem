//
//  forstuTableViewCell.swift
//  CafeTokenManagmentSystem
//
//  Created by Asad Khan on 07/04/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
protocol cellbuttonclick:class {
    func addbuttonclick(cell:forstuTableViewCell)
    func minus(cell:forstuTableViewCell)
    
    
}

class forstuTableViewCell: UITableViewCell {

    @IBOutlet weak var subbtn: UIButton!

    @IBOutlet weak var addbtn: UIButton!
    var addmiunusdelegate:cellbuttonclick?
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var price: UILabel!
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
    
    
    @IBAction func sum(_ sender: UIButton) {
        addmiunusdelegate?.addbuttonclick(cell: self)
        
    }
    @IBAction func sub(_ sender: UIButton) {
        addmiunusdelegate?.addbuttonclick(cell: self)
    }
    
}
