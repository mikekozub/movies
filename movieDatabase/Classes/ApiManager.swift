//
//  ApiManager.swift
//  movieDatabase
//
//  Created by Michael Kozub on 9/10/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit

class APIManager {
    
    func loadJsonFromUrl() -> Data? {
        do {
            let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a020691c4cf21a30210d62ca7b841e5a")!
            let data = try Data(contentsOf: url)
            print(data)
            return data
        } catch {
            print(error)
        }
        return nil
    }
    
    func deserializeData(loadedData: Data, onCompletion: @escaping (_ toilets: [MovieDataModel]) -> Void){
        DispatchQueue.global().async {
            do {
                let decoder = JSONDecoder()
                let moviesDecoded = try decoder.decode(ApiResponse.self, from: loadedData)
                DispatchQueue.main.async {
                    onCompletion(moviesDecoded.results)
                }
            } catch {
                print(error)
            }
        }
    }
    
}
