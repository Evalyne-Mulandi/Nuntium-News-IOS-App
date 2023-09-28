//
//  ButtonCollectionViewCell.swift
//  nuntium
//
//  Created by Peter Mumonyi on 25/09/2023.
//

import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var topicButton : UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        //Check if the buttons title is Random and update its background color
        if topicButton.titleLabel?.text == "Random" {
            topicButton.backgroundColor = UIColor(named: "buttonClickedColor")
        }
        
    }
    
    @IBAction func buttonClicked(_ sender: UIButton){
        //Toggle the buttons color based on its current state
        if sender.backgroundColor == UIColor(named: "buttonDefaultColor"){
            sender.backgroundColor = UIColor(named: "buttonClickedColor")
            sender.setTitleColor(UIColor.white, for: .normal)

        } else {
//            sender.backgroundColor = UIColor(named: "buttonDefaultColor")
            sender.backgroundColor = UIColor(named: "buttonDefaultColor")
            sender.setTitleColor(UIColor.black, for: .normal)
            
        }
        
       
    }

}
