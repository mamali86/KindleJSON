//
//  Book.swift
//  JsonProject
//
//  Created by Mohammad Farhoudi on 02/10/2017.
//  Copyright © 2017 Mohammad Farhoudi. All rights reserved.
//

import Foundation
import UIKit

struct Book {
    let title: String
    let author: String
//    let Image: UIImage
    let pages: [Page]
    let coverImageUrl: String
    
    
    init(dictionary: [String: Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.author = dictionary["author"] as? String ?? ""
        self.coverImageUrl = dictionary["coverImageUrl"] as? String ?? ""
        
        
        var bookpages = [Page]()
        if let pageDictionaries = dictionary["pages"] as? [[String: Any]] {
        for pageDictionary in pageDictionaries {
            
            let pageText =  pageDictionary["text"]
            
            let page = Page(number: 1, pageText: pageText as! String)

            bookpages.append(page)
            
        }
        }
        
           pages = bookpages
    }

}


struct Page {
    let number: Int
    let pageText: String
}
