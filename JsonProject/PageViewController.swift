//
//  PageViewController.swift
//  JsonProject
//
//  Created by Mohammad Farhoudi on 02/10/2017.
//  Copyright © 2017 Mohammad Farhoudi. All rights reserved.
//

import Foundation
import UIKit

class PageViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "PageCellID")
        
        collectionView?.backgroundColor = .white
        
        collectionView?.isPagingEnabled = true
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        
        layout?.scrollDirection = .horizontal
        layout?.minimumLineSpacing = 0
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "close", style: .plain, target: self, action: #selector(handleCloseBook))
        navigationItem.title = book?.title
        
    }
    
    func handleCloseBook() {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Pagecell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCellID", for: indexPath) as! PageCell
        
        
        let page = book?.pages[indexPath.item]
        Pagecell.pagetextlabel.text = page?.pageText
        
        return Pagecell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return book?.pages.count ?? 0 
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 44 - 20)
    }
    
}
