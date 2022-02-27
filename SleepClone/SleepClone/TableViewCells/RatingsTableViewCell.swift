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
    private var ratingStarImageView1 = UIImageView()
    private var ratingStarImageView2 = UIImageView()
    private var ratingStarImageView3 = UIImageView()
    private var ratingStarImageView4 = UIImageView()
    private var ratingStarImageView5 = UIImageView()
    
    private var ratingTitleLabel = UILabel()
    private var userNameLabel = UILabel()
    private var detailRatingReviewLabel = UILabel()

    //MARK: - Private Methods
    
    private func setupUI() {
        //TODO: Get actual value for this
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        self.addRoundedCorners()
        
        ratingStackView.axis = .vertical
        ratingStackView.distribution = .fill
        ratingStackView.alignment = .leading
        ratingStackView.spacing = 4
        
        ratingUserInfoStackView.axis = .horizontal
        ratingUserInfoStackView.distribution = .fill
        ratingUserInfoStackView.alignment = .top
        ratingUserInfoStackView.spacing = 80
        
        ratingStarStackView.axis = .horizontal
        ratingStarStackView.distribution = .fillProportionally
        ratingStarStackView.alignment = .leading
        
        ratingDetailStackView.axis = .vertical
        ratingDetailStackView.distribution = .fill
        ratingDetailStackView.alignment = .fill
        
        ratingStarImageView1.image = UIImage(systemName: "star.fill")!
        ratingStarImageView2.image = UIImage(systemName: "star.fill")!
        ratingStarImageView3.image = UIImage(systemName: "star.fill")!
        ratingStarImageView4.image = UIImage(systemName: "star.fill")!
        ratingStarImageView5.image = UIImage(systemName: "star.fill")!
        
        ratingStarImageView1.tintColor = .white
        ratingStarImageView2.tintColor = .white
        ratingStarImageView3.tintColor = .white
        ratingStarImageView4.tintColor = .white
        ratingStarImageView5.tintColor = .white

        ratingTitleLabel.textColor = .white
        ratingTitleLabel.font = ratingTitleLabel.font.withSize(16)
        
        userNameLabel.textColor = .white
        userNameLabel.font = ratingTitleLabel.font.withSize(16)
        
        detailRatingReviewLabel.textColor = .white
        detailRatingReviewLabel.numberOfLines = 0
        
        self.contentView.addSubview(ratingStackView)
        self.ratingStackView.addArrangedSubview(ratingUserInfoStackView)
        self.ratingUserInfoStackView.addArrangedSubview(ratingTitleLabel)
        self.ratingUserInfoStackView.addArrangedSubview(userNameLabel)
        self.ratingDetailStackView.addArrangedSubview(detailRatingReviewLabel)
       
        self.ratingStackView.addArrangedSubview(ratingStarStackView)
        self.ratingStarStackView.addArrangedSubview(ratingStarImageView1)
        self.ratingStarStackView.addArrangedSubview(ratingStarImageView2)
        self.ratingStarStackView.addArrangedSubview(ratingStarImageView3)
        self.ratingStarStackView.addArrangedSubview(ratingStarImageView4)
        self.ratingStarStackView.addArrangedSubview(ratingStarImageView5)

        self.ratingStackView.addArrangedSubview(ratingDetailStackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.ratingStackView.translatesAutoresizingMaskIntoConstraints = false
        self.ratingUserInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.ratingStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        self.ratingStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        self.ratingStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.ratingStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.ratingUserInfoStackView.leadingAnchor.constraint(equalTo: self.ratingStackView.leadingAnchor, constant: 16).isActive = true
        self.ratingUserInfoStackView.trailingAnchor.constraint(equalTo: self.ratingStackView.trailingAnchor, constant: -16).isActive = true
        
               
        self.ratingStarImageView1.widthAnchor.constraint(equalToConstant: 14).isActive = true
        self.ratingStarImageView2.widthAnchor.constraint(equalToConstant: 14).isActive = true
        self.ratingStarImageView3.widthAnchor.constraint(equalToConstant: 14).isActive = true
        self.ratingStarImageView4.widthAnchor.constraint(equalToConstant: 14).isActive = true
        self.ratingStarImageView5.widthAnchor.constraint(equalToConstant: 14).isActive = true
        
        self.ratingStarImageView1.heightAnchor.constraint(equalToConstant: 14).isActive = true
        self.ratingStarImageView2.heightAnchor.constraint(equalToConstant: 14).isActive = true
        self.ratingStarImageView3.heightAnchor.constraint(equalToConstant: 14).isActive = true
        self.ratingStarImageView4.heightAnchor.constraint(equalToConstant: 14).isActive = true
        self.ratingStarImageView5.heightAnchor.constraint(equalToConstant: 14).isActive = true
        
    }
    
    
    public func setup(with model: RatingModel) {
        ratingTitleLabel.text = model.ratingTitle
        userNameLabel.text = model.userName
        detailRatingReviewLabel.text = model.detailReview
        setupUI()
    }
}
