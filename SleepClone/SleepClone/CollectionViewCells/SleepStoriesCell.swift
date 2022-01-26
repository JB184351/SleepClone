//
//  SleepStoriesCell.swift
//  SleepClone
//
//  Created by Justin Bengtson on 12/20/21.
//

import UIKit

class SleepStoriesCell: UICollectionViewCell {
    
    //MARK: - Private Methods
    
    private var someView = UIView()
    
    //MARK: - Init Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    
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
    
    //MARK: - Public Methods
    
    public func setup(with view: UIView) {
        someView = view
        setupUI()
    }
}
