//
//  RatingsTableViewCell.swift
//  SleepClone
//
//  Created by Justin Bengtson on 1/27/22.
//

import UIKit

class RatingsTableViewCell: UITableViewCell {

    //MARK: - Private Properties
    private var ratingStackView = UIStackView()
    private var ratingUserInfoStackView = UIStackView()
    private var ratingStarStackView = UIStackView()
    private var ratingDetailStackView = UIStackView()
    private var ratingStarImageView = UIImageView()
    
    private var ratingTitleLabel = UILabel()
    private var userNameLabel = UILabel()
    private var detailRatingReviewLabel = UILabel()

    //MARK: - Private Methods
    
    private func setupUI() {
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        self.addRoundedCorners()
        
        ratingStackView.axis = .vertical
        ratingStackView.distribution = .fill
        ratingStackView.alignment = .fill
        ratingStackView.spacing = 8
        ratingStackView.accessibilityIdentifier = "ratingStackView"
        
        ratingUserInfoStackView.axis = .horizontal
        ratingUserInfoStackView.distribution = .fill
        ratingUserInfoStackView.alignment = .fill
        ratingUserInfoStackView.spacing = 8
        ratingUserInfoStackView.accessibilityIdentifier = "ratingUserInfoStackView"
        
        ratingTitleLabel.textColor = .white
        ratingTitleLabel.textAlignment = .left
        ratingTitleLabel.font = ratingTitleLabel.font.withSize(16)
        ratingTitleLabel.accessibilityIdentifier = "ratingTitleLabel"
        
        userNameLabel.textColor = .white
        userNameLabel.textAlignment = .right
        userNameLabel.font = ratingTitleLabel.font.withSize(16)
        userNameLabel.accessibilityIdentifier = "userNameLabel"
        
        ratingStarStackView.axis = .vertical
        ratingStarStackView.distribution = .fill
        ratingStarStackView.alignment = .leading
        ratingStarStackView.accessibilityIdentifier = "ratingStarStackView"
        
        ratingStarImageView.image = UIImage(named: "review_stars")!
        ratingStarImageView.contentMode = .scaleAspectFit
        ratingStarImageView.accessibilityIdentifier = "ratingStarImageView"
        
        ratingDetailStackView.axis = .horizontal
        ratingDetailStackView.distribution = .fill
        ratingDetailStackView.alignment = .top
        ratingDetailStackView.accessibilityIdentifier = "ratingDetailStackView"
        
        detailRatingReviewLabel.textColor = .white
        detailRatingReviewLabel.numberOfLines = 0
        detailRatingReviewLabel.accessibilityIdentifier = "detailRatingReviewLabel"
        
        self.contentView.addSubview(ratingStackView)
        self.ratingStackView.addArrangedSubview(ratingUserInfoStackView)
        self.ratingUserInfoStackView.addArrangedSubview(ratingTitleLabel)
        self.ratingUserInfoStackView.addArrangedSubview(userNameLabel)
       
        self.ratingStackView.addArrangedSubview(ratingStarStackView)
        self.ratingStarStackView.addArrangedSubview(ratingStarImageView)

        self.ratingStackView.addArrangedSubview(ratingDetailStackView)
        self.ratingDetailStackView.addArrangedSubview(detailRatingReviewLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.ratingStackView.translatesAutoresizingMaskIntoConstraints = false
        self.ratingStarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.ratingStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 32).isActive = true
        self.ratingStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -32).isActive = true
        self.ratingStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 32).isActive = true
        self.ratingStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -32).isActive = true
        
        self.ratingStarImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    public func setup(with model: RatingModel) {
        ratingTitleLabel.text = model.ratingTitle
        userNameLabel.text = model.userName
        detailRatingReviewLabel.text = model.detailReview
        setupUI()
    }
}
