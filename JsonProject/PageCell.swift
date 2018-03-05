//
//  PageCell.swift
//  JsonProject
//
//  Created by Mohammad Farhoudi on 02/10/2017.
//  Copyright © 2017 Mohammad Farhoudi. All rights reserved.
//

import Foundation
import UIKit


class PageCell: UICollectionViewCell {
    
    let pagetextlabel: UILabel =  {
        let label = UILabel()
        label.text = "SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(pagetextlabel)
        
        pagetextlabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        pagetextlabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        pagetextlabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        pagetextlabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        
        
        
    
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
