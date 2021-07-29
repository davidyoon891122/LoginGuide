//
//  PageCell.swift
//  LoginGuide
//
//  Created by David Yoon on 2021/07/26.
//

import UIKit

class PageCell: UICollectionViewCell {
    var page: Page? {
        didSet {
            guard let page = page else {
                return
            }
            
            var imageName = page.imageName
            if UIDevice.current.orientation.isLandscape {
                imageName += "_landscape"
            }
            
            imageVeiw.image = UIImage(named: page.imageName)
            
            let color = UIColor(white: 0.2, alpha: 1)
            
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium),NSAttributedString.Key.foregroundColor: color])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.meesage)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: color]))
            
            //textView.text = page.title + "\n\n" + page.meesage
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.count
            
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            textView.attributedText = attributedText
        }
    }
    
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
    
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "Sample Text For Now"
        tv.isEditable = false
        tv.clipsToBounds = true
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    let lineSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    func setupView() {
        addSubview(imageVeiw)
        addSubview(textView)
        addSubview(lineSeparatorView)
        
        imageVeiw.anchorToTop(topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        
        //textView.anchorToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        textView.anchorWithConstantsToTop(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        lineSeparatorView.anchorToTop(nil, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        lineSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
