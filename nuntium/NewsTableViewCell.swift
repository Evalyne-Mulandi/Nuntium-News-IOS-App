//
//  NewsTableViewCell.swift
//  nuntium
//
//  Created by Peter Mumonyi on 15/09/2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var newsTitle : UILabel!
    @IBOutlet weak var newsImage : UIImageView!
    @IBOutlet weak var bookmarkBtn : UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
