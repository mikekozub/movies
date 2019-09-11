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

class MoviesViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var collectionView : UICollectionView!
    var movies = [MovieDataModel]()
    let cellId = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAndConfigureViews()
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MovieCollectionViewCell
        
        let movie = movies[indexPath.item]
        let prefix = "https://image.tmdb.org/t/p/w500/"
        let imageUrl = URL(string: prefix + movie.imageUrl! )
        let movieName = movie.title ?? ""
        
        cell.movieName.text = movieName
        cell.movieImage.sd_setImage(with: imageUrl)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.bounds.size.width) / 2) - 4
        return CGSize(width: width, height: width * 2)
    }
    
    func addAndConfigureViews() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor.white
        collectionView.horizontalAnchors == self.view.safeAreaLayoutGuide.horizontalAnchors + 12
        collectionView.topAnchor == self.view.safeAreaLayoutGuide.topAnchor + 12
        collectionView.bottomAnchor == self.view.safeAreaLayoutGuide.bottomAnchor
    }
    
}

