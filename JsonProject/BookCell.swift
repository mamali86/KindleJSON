//
//  BookCell.swift
//  JsonProject
//
//  Created by Mohammad Farhoudi on 02/10/2017.
//  Copyright © 2017 Mohammad Farhoudi. All rights reserved.
//

import Foundation
import UIKit

class BookCell: UITableViewCell {
    
    
    var book: Book? {
        didSet{
//            coverImage.image = book?.Image
            titleLabel.text = book?.title
            authorLabel.text = book?.author
            
            
            guard let coverImageUrl = book?.coverImageUrl else {return}
            
            guard let url = URL(string: coverImageUrl) else{return}
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let err = error {
                    print("Failed to retrive data: ", err)
                    return
                }
                
                guard let imageData = data else {return}
                let image = UIImage(data: imageData)
                
                DispatchQueue.main.async {
                    self.coverImage.image = image
                }
                
                
                
                
            }.resume()
            
        }
    
        
        
        
        
    }
    
    
    
    let coverImage: UIImageView = {
        
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "steve_jobs")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "mamali is cool"
        return label
    }()
    
    
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "cool"
        return label
    }()
    
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        addSubview(coverImage)
        addSubview(titleLabel)
        addSubview(authorLabel)
        
        coverImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        coverImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        coverImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        coverImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        
        
        
        titleLabel.leftAnchor.constraint(equalTo: coverImage.rightAnchor, constant: 8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true

        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: coverImage.rightAnchor, constant: 8).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
}
