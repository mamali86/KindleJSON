//
//  ViewController.swift
//  JsonProject
//
//  Created by Mohammad Farhoudi on 02/10/2017.
//  Copyright © 2017 Mohammad Farhoudi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var books: [Book]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetupNavigationBarStyles()
        SetupNavigationBarItems()
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(BookCell.self, forCellReuseIdentifier: "CellID")
        navigationItem.title = "kindle"
        
        
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor(white: 1, alpha:0.3)
        tableView.separatorColor =  UIColor(white: 1, alpha:0.2)
    
        
        fetchBooks()
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView()
        footerView.backgroundColor = UIColor(colorLiteralRed: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        
        
        let segmentedControl = UISegmentedControl(items: ["cloud", "device"])
        
        
    
        
        
        let gridButton = UIButton(type: .system)
        gridButton.setImage(#imageLiteral(resourceName: "grid").withRenderingMode(.alwaysOriginal), for: .normal)
        gridButton.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(gridButton)
    
        
        
        
        gridButton.leftAnchor.constraint(equalTo: footerView.leftAnchor, constant: 8).isActive = true
        gridButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        gridButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        gridButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        
        footerView.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        segmentedControl.tintColor = .white
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.widthAnchor.constraint(equalToConstant: 200).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        segmentedControl.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        
        let sortButton = UIButton(type: .system)
        sortButton.setImage(#imageLiteral(resourceName: "sort").withRenderingMode(.alwaysOriginal), for: .normal)
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(sortButton)
        
        sortButton.rightAnchor.constraint(equalTo: footerView.rightAnchor, constant: -8).isActive = true
        sortButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        sortButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sortButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        
        
        return footerView
        
    }
    

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! BookCell
        
        let book = books?[indexPath.row]
        cell.book = book
        cell.backgroundColor = .darkGray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let selectedbook = books?[indexPath.row]
    
        
        let pageViewController = PageViewController(collectionViewLayout: UICollectionViewFlowLayout())
        pageViewController.book = selectedbook
        
        let navController = UINavigationController(rootViewController: pageViewController)
        
        
        present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = books?.count {
        return count
        }
        return 0
    }
    
    
    
    func SetupNavigationBarStyles() {
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }
    
    
    func SetupNavigationBarItems() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuPress))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "amazon_icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAmazonPress))
        
    }
    
    func handleMenuPress() {
        print("menu pressed")
    }
    
    func handleAmazonPress() {
        print("Icon pressed")
    }
    
    func fetchBooks() {
        
        
        if let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json") {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print("couldnt get json", err)
                return
            }
            
            
            guard let data = data else{return}
            
            do{
            
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                guard let BooksDictionaries = json as? [[String: Any]] else {return}
                self.books = []
                for bookDictionary in BooksDictionaries {
//                    if let title = bookDictionary["title"] as? String,
//                    let author = bookDictionary["author"] as? String,
//                    let coverImageUrl = bookDictionary["coverImageUrl"] as? String{
//                        let book = Book(title: title, author: author, pages: [page1, page2], coverImageUrl: coverImageUrl)
//                        self.books?.append(book)
//                    }
                    let book = Book(dictionary: bookDictionary)
                    self.books?.append(book)
                    
                }
//
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        
                    }

                }
                
                

            catch let jsonError {
                print("Failed to parse JSON properly:", jsonError)
                
            }
        
        }.resume()
        
        
        
    }
    
    }
    


}

