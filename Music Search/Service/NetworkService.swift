//
//  NetworkService.swift
//  Music Search
//
//  Created by Вячеслав on 03.12.2019.
//  Copyright © 2019 Вячеслав. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
    
    func fetchTracks(seacrhString: String, completion: @escaping((SearchResponse?) -> Void)){
        let url = "https://itunes.apple.com/search"
        
        let parameters = ["term": seacrhString, "limit":"20", "media":"music"]
        
        AF.request(url, parameters: parameters).responseData { (response) in
            if let error = response.error{
                print(error)
                return
            }
            guard let data = response.data else {return}
   
            do {
                let objects = try JSONDecoder().decode(SearchResponse.self, from: data)
                completion(objects)
            }catch let jsonError{
                print(jsonError)
            }
        }
            
    }
}
