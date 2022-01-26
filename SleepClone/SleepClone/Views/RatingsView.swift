//
//  RatingsView.swift
//  SleepClone
//
//  Created by Justin Bengtson on 1/24/22.
//

import UIKit

class RatingsView: UIView {
    
    //MARK: - Private Variables
    
    private var ratingStackView = UIStackView()
    private var ratingInfoStackView = UIStackView()
    private var ratingDetailStackView = UIStackView()
    
    private var ratingTitleLabel = UILabel()
    private var userNameLabel = UILabel()
    private var ratingStarDisplay = [UIImageView]()
    private var detailRatingReviewTextView = UITextView()
    
    //MARK: - Private Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        populateDataSource()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    
    private func populateDataSource() {
        let starFillImage = UIImageView(image: UIImage(systemName: "star.fill")!)
        
        ratingStarDisplay.append(starFillImage)
        ratingStarDisplay.append(starFillImage)
        ratingStarDisplay.append(starFillImage)
        ratingStarDisplay.append(starFillImage)
        ratingStarDisplay.append(starFillImage)
    }
    
    private func setupUI() {
        
    }
    
    private func setupConstraints() {
        
    }
    
    //MARK: - Public Methods
    
    public func setup(with model: RatingModel) {
        ratingTitleLabel.text = model.ratingTitle
        userNameLabel.text = model.userName
        detailRatingReviewTextView.text = model.detailReview
    }
}
