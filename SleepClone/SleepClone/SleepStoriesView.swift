//
//  SleepStories.swift
//  SleepClone
//
//  Created by Justin Bengtson on 12/31/21.
//

import UIKit

class SleepStoriesView: UIView {

//    private var collectionView: UICollectionView!
    private var testLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .red
        
        testLabel.text = "Testing"
        testLabel.textColor = .black
        
        self.addSubview(testLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.leadingAnchor.constraint(equalTo: self.testLabel.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: self.testLabel.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: self.testLabel.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: self.testLabel.bottomAnchor).isActive = true
    }
}

//extension SleepStoriesView: UICollectionViewDataSource {
//
//}
//
//extension SleepStoriesView: UICollectionViewDelegate {
//
//}


