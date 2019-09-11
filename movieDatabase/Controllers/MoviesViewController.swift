//
//  ViewController.swift
//  movieDatabase
//
//  Created by Michael Kozub on 9/10/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit
import SDWebImage
import Anchorage

class MoviesViewController: UIViewController {

    var movies = [MovieDataModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    
    func loadData() {
        if let loadedData = APIManager().loadJsonFromUrl() {
            deserializeData(loadedData: loadedData)
        }
    }
    
    func deserializeData(loadedData: Data) {
        APIManager().deserializeData(loadedData: loadedData) { (movies) in
            self.movies = movies
            self.collectionView.reloadData()
            for movie in movies {
                print(movie.title!)
            }
        }
    }
}

