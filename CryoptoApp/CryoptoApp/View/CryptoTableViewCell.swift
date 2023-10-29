//
//  CryptoTableViewCell.swift
//  CryoptoApp
//
//  Created by Necati Alperen IŞIK on 28.10.2023.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    public var item : Crypto!{
        didSet{
            self.nameLabel.text = item.currency
            self.priceLabel.text = item.price
        }
    }

}
