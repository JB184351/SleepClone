//
//  UnlockMessageView.swift
//  SleepClone
//
//  Created by Justin Bengtson on 1/19/22.
//

import UIKit

class DozeFeatureDescriptionView: UIView {
    
    //MARK: - Private Variables
    
    private var stackView = UIStackView()
    private var headerLabel = UILabel()
    private var messageLabel = UILabel()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    
    private func setupUI() {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 50.0
        
        headerLabel.textColor = .white
        headerLabel.textAlignment = .center
        
        messageLabel.numberOfLines = 0
        messageLabel.textColor = .white
        messageLabel.textAlignment = .center
        
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(messageLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}
