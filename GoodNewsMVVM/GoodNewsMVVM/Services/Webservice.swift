//
//  Webservice.swift
//  GoodNewsMVVM
//
//  Created by 류창휘 on 2022/06/24.
//

import Foundation

class WebService {
    func getArticles(url: URL, completion:  @escaping ([Any]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                print(data)
            }
        }
    }
}
