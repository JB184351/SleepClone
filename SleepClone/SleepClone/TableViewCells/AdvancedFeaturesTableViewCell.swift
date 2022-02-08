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
    private var advancedFeatureImageView = UIImageView()
    private var advancedFeatureLabel = UILabel()
    
    //MARK: - Private Methods
    
    private func setupUI() {
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 8
        
        //TODO: Configure Font
        advancedFeatureLabel.textColor = .white
        
        self.contentView.addSubview(stackView)
        self.stackView.addArrangedSubview(advancedFeatureImageView)
        self.stackView.addArrangedSubview(advancedFeatureLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        advancedFeatureImageView.translatesAutoresizingMaskIntoConstraints = false
        
        advancedFeatureImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        advancedFeatureImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

    }
    
    //MARK: - Public Methods
    
    public func setup(with model: AdvancedFeatureModel) {
        advancedFeatureImageView.image = model.image
        advancedFeatureLabel.text = model.featureName
        setupUI()
    }
    

}
