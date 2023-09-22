//
//  Homepage.swift
//  nuntium
//
//  Created by Peter Mumonyi on 18/09/2023.
//

import UIKit

class Homepage: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var newsTableView : UITableView!
    
    @IBOutlet weak var homepageContainer : UIView!
    
    @IBOutlet weak var browse : UILabel!
    @IBOutlet weak var discover : UILabel!
    @IBOutlet weak var search :UISearchBar!
    
    
    @IBOutlet weak var buttonsCollectionView : UICollectionView!
    
    
    @IBOutlet var buttons : [UIButton]!
    
    
    var articles : [Article] = []
    var filteredArticles : [Article] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArticles.count;
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        
        let article = filteredArticles[indexPath.row]
        
        cell.newsTitle?.text = article.title
        cell.newsImage.load(urlString: article.urlToImage ?? "")
        
        
        
        
//        cell.imageView?.image = UIImage(named: "pexels")
//        cell.textLabel?.text=article.title
        
        
        
        return cell
    }
    
   // Passing Selected News from Home page to Articles page:

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected article
        let selectedArticle = filteredArticles[indexPath.row]
        
        // Create an instance of the Articles screen
        
        
        //Added code
        if let articlesVC = UIStoryboard(name: "Article", bundle: nil).instantiateViewController(withIdentifier: "NewsArticle") as? Articless {
            // Pass the selected news item data to the Articles screen
            articlesVC.articleTitle = selectedArticle.title
            articlesVC.articleImageUrl = selectedArticle.urlToImage
            articlesVC.articleContent = selectedArticle.content
            articlesVC.articleAuthor = selectedArticle.author
            
            
            // Push the Articles screen onto the navigation stack
            self.navigationController?.pushViewController(articlesVC, animated: true)
        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 279
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Get the search text
        guard let searchText = search.text?.lowercased() else {
            return
        }
        
        decodeAPI(query: searchText) { [weak self] articles in
            if let articles=articles{
                self? .articles=articles
                self? .filteredArticles=articles
                DispatchQueue.main.async {
                    self?.newsTableView.reloadData()
                }
            } else{
                print("failed to decode")
            }
        }
        
        //Reload the table view with the filtered articles
        newsTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    
        
//
//        //Initialize button colors to the default color
//        for button in buttons {
//            button.backgroundColor = UIColor(named: "buttonDefaultColor")
//        }
//
//        //Load saved button states from UserDefaults
//        if let savedButtonTags = UserDefaults.standard.array(forKey: "ClickedButtonTags") as? [Int]{
//            let clickedButtonTags = Set(savedButtonTags)
//
//           // Iterate through all buttons
//            for button in buttons{
//                if clickedButtonTags.contains(button.tag){
//                    button.backgroundColor = UIColor(named: "buttonClickedColor")
//                    button.isHidden = false
//                } else {
//                    button.backgroundColor = UIColor(named: "buttonDefaultColor")
//                    button.isHidden = true
//                }
//            }
//        } else{
//            for button in buttons {
//                button.isHidden = true
//            }
//        }
//
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        search.delegate = self
        
       
        decodeAPI{ [weak self]articles in
            if let articles=articles{
                self? .articles=articles
                self? .filteredArticles=articles
                DispatchQueue.main.async {
                    self?.newsTableView.reloadData()
                }
            } else{
                print("failed to decode")
            }

        }
                
        
        print("articles -- \(articles)")
        
        // Do any additional setup after loading the view.
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: .main), forCellReuseIdentifier: "NewsTableViewCell")
        newsTableView.rowHeight = UITableView.automaticDimension
        newsTableView.estimatedRowHeight = 279
        
        newsTableView.reloadData()
    }
//    @IBAction func buttonTapped(_ sender: UIButton){
//        //Toggle the buttons color based on its current state
//        if sender.backgroundColor == UIColor(named: "buttonDefaultColor"){
//            sender.backgroundColor = UIColor(named: "buttonClickedColor")
//            clickedButtonTags.insert(sender.tag)
//        } else {
//            sender.backgroundColor = UIColor(named: "buttonDefaultColor")
//            clickedButtonTags.remove(sender.tag)
//        }
//
//        //Save the clicked button tags to User Defaults
//        UserDefaults.standard.set(Array(clickedButtonTags), forKey: "ClickedButtonTags")
//    }
    
    @IBAction func navigateToArticles() {
        
//        let  ForgotPasswordViewController = storyboard.instantiateViewController(withIdentifier: "ForgotPasswordViewControllerID")
        print("Navigating to Articles")
        let storyboard: UIStoryboard = UIStoryboard(name: "Article", bundle: nil)
        let articleController = storyboard.instantiateViewController(withIdentifier: "NewsArticle")
        self.navigationController?.pushViewController(articleController, animated: true)
    }
}



extension UIImageView {
    func load(urlString : String) {
        guard let url = URL(string: urlString)else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}





