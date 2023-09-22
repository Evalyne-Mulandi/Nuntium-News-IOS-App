//
//  Newsmodel.swift
//  nuntium
//
//  Created by Peter Mumonyi on 18/09/2023.
//

import Foundation
struct ResponseData : Decodable {
    var articles : [Article]
}



struct  Article : Decodable{
    var author : String?
    var title : String?
    var description : String?
    var url : String?
    var urlToImage : String?
    var publishedAt : String?
    var content : String?

    enum CodingKeys : String, CodingKey{
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case content
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        author = try container.decodeIfPresent(String.self, forKey: .author)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
        publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt)
        content = try container.decodeIfPresent(String.self, forKey: .title)
    }


}

//func loadJson(filename fileName: String) -> [Article]? {
//    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = JSONDecoder()
//            let jsonData = try decoder.decode(ResponseData.self, from: data)
//            return jsonData.articles
//        } catch {
//            print("Error decoding JSON: \(error)")
//        }
//
//    }
//
//    return nil
//}

func decodeAPI(query:String = "f1" , completion: @escaping ([Article]?) -> Void) {
   
    
    
    var request = URLRequest(url: URL(string: "https://newsapi.org/v2/everything?q=\(query)&apiKey=f7fb9af7c3404ec4916ef36a55bd8f40")!)
    request.httpMethod = "GET"



    let task = URLSession.shared.dataTask(with: request){
        data, response, error in

        let jsonDecoder = JSONDecoder()

        if let data = data{
            do{
                let jsonData = try jsonDecoder.decode(ResponseData.self, from: data)
                print(jsonData)
                completion(jsonData.articles)

            }catch{
                print(error)
                completion(nil)
            }
        }else{
            completion(nil)
        }
    }
    task.resume()


}


