//
//  MovieCollectionViewCell.swift
//  movieDatabase
//
//  Created by Michael Kozub on 9/10/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit
import Anchorage

class MovieCollectionViewCell: UICollectionViewCell {
    
    var movieName = UILabel()
    var movieImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configureViews()
    }
    
    func addViews() {
        
        let background = UIView()
        self.addSubview(background)
        background.topAnchor == self.topAnchor
        background.bottomAnchor == self.bottomAnchor
        background.horizontalAnchors == self.horizontalAnchors
        background.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        background.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        background.layer.borderWidth = 1
        background.layer.cornerRadius = 5.0
        
        let image = movieImage
        self.addSubview(image)
        image.topAnchor == background.topAnchor + 6
        image.bottomAnchor == background.bottomAnchor - 20
        image.horizontalAnchors == horizontalAnchors
        image.contentMode = .scaleAspectFit
        
        let title = movieName
        self.addSubview(title)
        title.horizontalAnchors == background.horizontalAnchors
        title.bottomAnchor == background.bottomAnchor - 1
        title.centerXAnchor == background.centerXAnchor
        title.numberOfLines = 0
        title.textColor = .purple
        title.backgroundColor = .yellow
        title.adjustsFontSizeToFitWidth = true
        title.textAlignment = .center
        
    }
    
    func configureViews() {
        let name = movieName
        name.numberOfLines = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
