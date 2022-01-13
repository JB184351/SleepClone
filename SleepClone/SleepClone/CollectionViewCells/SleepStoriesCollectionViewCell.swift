//
//  SleepStoriesTableViewCell.swift
//  SleepClone
//
//  Created by Justin Bengtson on 1/1/22.
//

import UIKit

class SleepStoriesCollectionViewCell: UICollectionViewCell {
    
    private var imageView = UIImageView()
    private var playButton = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.addRoundedCorners()
    }
    
    private func setupUI() {
        playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        playButton.tintColor = .white
        playButton.addTarget(self, action: #selector(buttonAction(_ :)), for: .touchUpInside)
        
        self.addSubview(imageView)
        self.addSubview(playButton)
        setupConstraints()
    }
    
    @objc private func buttonAction(_ sender: UIButton!) {
        sender.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        sender.tintColor = .white
        print("Pressed Button")
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        playButton.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: self.imageView.frame.width / 2).isActive = true
        playButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        playButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: imageView.frame.height / 2).isActive = true
        playButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
    }
    
    public func setup(with sleepStoryImage: UIImage) {
        //        imageView.image = sleepStoryImage
        imageView.backgroundColor = .red
        setupUI()
    }
    
}
