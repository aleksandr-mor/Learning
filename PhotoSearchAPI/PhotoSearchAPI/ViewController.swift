//
//  ViewController.swift
//  PhotoSearchAPI
//
//  Created by Aleksandr Morozov on 19.02.2022.
//

import UIKit

struct APIResponse: Codable {
    let total: Int
    let total_pages: Int
    let results: [Result]
}

struct Result: Codable {
    let id: String
    let urls: URLS
}

struct URLS: Codable {
    let full: String
}

class ViewController: UIViewController {

    let urlString = "https://api.unsplash.com/search/photos?page=1&query=office&client_id=8gkYLhlBTdYipIlW3iAa_b7LZholRd8tZpAk0CQuYuo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPhotos()
    }

    func fetchPhotos() {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                print(jsonResult.results.count)
                
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }

}

