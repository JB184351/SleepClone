//
//  AdvancedFeaturesTableViewCell.swift
//  SleepClone
//
//  Created by Justin Bengtson on 1/24/22.
//

import UIKit

class AdvancedFeaturesTableViewCell: UITableViewCell {

    //MARK: - Private Variables
    
    private var stackView = UIStackView()
    private var emptyView = UIView()
    private var advancedFeatureImageView = UIImageView()
    private var advancedFeatureLabel = UILabel()
    
    //MARK: - Private Methods
    
    private func setupUI() {
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        
        emptyView.backgroundColor = .clear
        
        advancedFeatureImageView.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        
        //TODO: Configure Font
        advancedFeatureLabel.textColor = .white
        
        self.contentView.addSubview(emptyView)
        self.emptyView.addSubview(stackView)
        self.stackView.addArrangedSubview(advancedFeatureImageView)
        self.stackView.addArrangedSubview(advancedFeatureLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        advancedFeatureImageView.translatesAutoresizingMaskIntoConstraints = false
        
        emptyView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width / 4).isActive = true
        emptyView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        emptyView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        emptyView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: self.emptyView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.emptyView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.emptyView.topAnchor, constant: 16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.emptyView.bottomAnchor).isActive = true
        
//        advancedFeatureImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
//        advancedFeatureImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }
    
    //MARK: - Public Methods
    
    public func setup(with model: AdvancedFeatureModel) {
        advancedFeatureImageView.image = model.image
        advancedFeatureLabel.text = model.featureName
        setupUI()
    }
    

}
