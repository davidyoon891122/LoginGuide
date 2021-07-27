//
//  ViewController.swift
//  LoginGuide
//
//  Created by David Yoon on 2021/07/26.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    
    // create collection view with closure
    // this is for drawing view without storyBoard
    // set lazy for using self
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //set CollectionViewFlowLayout direction from vertical to horizontal
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        // set CollectionView pageing feature
        cv.isPagingEnabled = true
        return cv
    }()
    
    let cellId = "cellId"
    
    let pages: [Page] = {
        let firstPage = Page(title: "Share a great listen", meesage: "It's free to send your books to the people in your life. Every recipient's first book is on us.", imageName: "image03")
        
        let secondPage = Page(title: "Send from your library", meesage: "Tap the More menu next to any book. Choose \"Send this Book\".", imageName: "image01")
        
        let thirdPage = Page(title: "Send from the player", meesage: "Tap the More menu in the upper corner. Choose \"Send this Book\".", imageName: "image02")
        
        
        
        return [firstPage, secondPage, thirdPage]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(collectionView)
//        collectionView.frame = view.frame
        // use autolayout instrea
        
        collectionView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        // sample code for individual settings for view constains
        //collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        // regist CollectionViewCell (default)
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // create CollectionView's cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        
        cell.page = page
        
        return cell
    }
    
    //set cell's size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    

}

// add extention to set view constrains
extension UIView {
    func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
        anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0 )
    }
    
    func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0,
                                  bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
        }
    }
    
}



