//
//  SleepStoriesTableViewCell.swift
//  SleepClone
//
//  Created by Justin Bengtson on 1/1/22.
//

import UIKit

class SleepStoriesCollectionViewCell: UICollectionViewCell {

    private var sleepStoryTitle = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.addRoundedCorners()
    }
    
    private func setupUI() {
        sleepStoryTitle.textColor = .black
        sleepStoryTitle.font = .systemFont(ofSize: 17)
        sleepStoryTitle.textAlignment = .left
        
        self.addSubview(sleepStoryTitle)
        setupConstraints()
    }
    
    private func setupConstraints() {
        sleepStoryTitle.translatesAutoresizingMaskIntoConstraints = false
        
        self.leadingAnchor.constraint(equalTo: sleepStoryTitle.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: sleepStoryTitle.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: sleepStoryTitle.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: sleepStoryTitle.bottomAnchor).isActive = true
    }
    
    public func setup(with sleepStory: String) {
        sleepStoryTitle.text = sleepStory
        setupUI()
    }

}
