//
//  PageCell.swift
//  LoginGuide
//
//  Created by David Yoon on 2021/07/26.
//

import UIKit

class PageCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    let imageVeiw: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .yellow
        iv.image = UIImage(named: "image03")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    func setupView() {
        backgroundColor = .blue
        addSubview(imageVeiw)
        
        imageVeiw.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
