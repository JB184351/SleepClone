//
//  PurchaseView.swift
//  SleepClone
//
//  Created by Justin Bengtson on 4/5/22.
//

import UIKit

class PurchaseView: UIView {

    private var stackView = UIStackView()
    private var timePeriodSegmentControl = UISegmentedControl()
    private var purchasePriceLabel = UILabel()
    private var priceDescriptionLabel = UILabel()
    private var purchaseSubscriptionButton = UIButton()
    private var moreOptionsButton = UIButton()
    
    private let monthlyPrice = "$7.99"
    private let yearlyPrice = "$39.99"
    private let monthlyPriceText = "Free for 3 days, then $7.99/month. Cancel anytime"
    private let yearlyPriceText = "Free for 3 days, then $39.99/year. Cancel anytime"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .systemBlue
        self.addRoundedCorners()
        
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
      
        timePeriodSegmentControl.addTarget(self, action: #selector(subscriptionChange), for: .valueChanged)
        timePeriodSegmentControl.insertSegment(withTitle: "1 Month", at: 0, animated: false)
        timePeriodSegmentControl.insertSegment(withTitle: "12 Months", at: 1, animated: false)
        timePeriodSegmentControl.selectedSegmentIndex = 0
        timePeriodSegmentControl.defaultConfiguration(font: UIFont.systemFont(ofSize: 18, weight: .bold) , color: .white)
        timePeriodSegmentControl.backgroundColor = .blue
        timePeriodSegmentControl.selectedSegmentTintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        timePeriodSegmentControl.addRoundedCorners()
        
        purchasePriceLabel.text = monthlyPrice
        purchasePriceLabel.textAlignment = .center
        purchasePriceLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        purchasePriceLabel.numberOfLines = 0
        purchasePriceLabel.textColor = .white
        
        priceDescriptionLabel.text = monthlyPriceText
        priceDescriptionLabel.textAlignment = .center
        priceDescriptionLabel.numberOfLines = 0
        priceDescriptionLabel.textColor = .white
        
        purchaseSubscriptionButton.setTitle("Get Full Access", for: .normal)
        purchaseSubscriptionButton.setTitleColor(.black, for: .normal)
        purchaseSubscriptionButton.backgroundColor = .white
        purchaseSubscriptionButton.addRoundedCorners()
        
        moreOptionsButton.setTitle("More Options", for: .normal)
        moreOptionsButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        moreOptionsButton.setTitleColor(.black, for: .normal)
        
        self.addSubview(stackView)
        self.addSubview(timePeriodSegmentControl)
        self.stackView.addArrangedSubview(purchasePriceLabel)
        self.stackView.addArrangedSubview(priceDescriptionLabel)
        self.stackView.addArrangedSubview(purchaseSubscriptionButton)
        self.stackView.addArrangedSubview(moreOptionsButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.timePeriodSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        self.purchaseSubscriptionButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.timePeriodSegmentControl.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        self.timePeriodSegmentControl.bottomAnchor.constraint(equalTo: self.stackView.topAnchor, constant: -8).isActive = true
        self.timePeriodSegmentControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        self.timePeriodSegmentControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        
        self.timePeriodSegmentControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.purchaseSubscriptionButton.heightAnchor.constraint(equalTo: self.timePeriodSegmentControl.heightAnchor, multiplier: 1.25).isActive = true
        self.purchaseSubscriptionButton.widthAnchor.constraint(equalTo: self.timePeriodSegmentControl.widthAnchor, multiplier: 0.95).isActive = true
        
        self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    }
    
    @objc private func subscriptionChange() {
        switch timePeriodSegmentControl.selectedSegmentIndex {
        case 0:
            purchasePriceLabel.text = monthlyPrice
            priceDescriptionLabel.text = monthlyPriceText
        case 1:
            purchasePriceLabel.text = yearlyPrice
            priceDescriptionLabel.text = yearlyPriceText
        default:
            purchasePriceLabel.text = monthlyPrice
            priceDescriptionLabel.text = monthlyPriceText
        }
    }

}
