//
//  SleepStoriesCell.swift
//  SleepClone
//
//  Created by Justin Bengtson on 12/20/21.
//

import UIKit

class SleepStoriesCell: UICollectionViewCell {
    
    private var someView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with view: UIView) {
        someView = view
        setupUI()
    }
    
    private func setupUI() {
        self.addSubview(someView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        someView.translatesAutoresizingMaskIntoConstraints = false
        
        someView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        someView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        someView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        someView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
