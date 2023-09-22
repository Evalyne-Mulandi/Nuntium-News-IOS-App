//
//  Article.swift
//  nuntium
//
//  Created by Peter Mumonyi on 18/09/2023.
//

import UIKit

class Articless: UIViewController {

    @IBOutlet weak var newstitleLbl : UILabel!
    @IBOutlet weak var newsauthorlbl : UILabel!
    @IBOutlet weak var newscontentlbl : UILabel!
    @IBOutlet weak var backBtn : UIButton!
    @IBOutlet weak var shareBtn : UIButton!
    @IBOutlet weak var bookmarkBtn : UIButton!
    @IBOutlet weak var newsauthorDescLbl : UILabel!
    @IBOutlet weak var articleView : UIView!
    @IBOutlet weak var newsImageView :UIImageView!
    
    
    var articleTitle : String?
    var articleImageUrl: String?
    var articleContent: String?
    var articleAuthor : String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newstitleLbl.text = articleTitle
        newscontentlbl.text = articleContent
        newsauthorlbl.text = articleAuthor
        
        if let imageUrl = articleImageUrl {
            newsImageView.load(urlString: imageUrl)
        }
        

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension UIImageView {
//    func load(urlString : String) {
//        guard let url = URL(string: urlString)else {
//            return
//        }
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.image = image
//                    }
//                }
//            }
//        }
//    }
//}
