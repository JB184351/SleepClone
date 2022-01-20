//
//  SleepStoriesTableViewCell.swift
//  SleepClone
//
//  Created by Justin Bengtson on 1/1/22.
//

import UIKit

class SleepStoriesTableViewCell: UITableViewCell {
    
    private var soundImageView = UIImageView()
    private var playButton = UIButton()
    private var roundedCornerView = UIView()
    private var isPlaying = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        playButton.tintColor = .white
        playButton.addTarget(self, action: #selector(buttonAction(_ :)), for: .touchUpInside)
        
        self.roundedCornerView.addRoundedCorners()
        
        self.contentView.addSubview(roundedCornerView)
        self.contentView.addSubview(soundImageView)
        self.contentView.addSubview(playButton)
        setupConstraints()
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
        isPlaying = !isPlaying
        let imageName = isPlaying ? "pause.circle.fill" : "play.circle.fill"
        
        sender.setImage(UIImage(systemName: imageName), for: .normal)
        sender.tintColor = .white
    }
    
    private func setupConstraints() {
        soundImageView.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        roundedCornerView.translatesAutoresizingMaskIntoConstraints = false
        
        roundedCornerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        roundedCornerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        roundedCornerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        roundedCornerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        soundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        soundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        soundImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        soundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        playButton.leadingAnchor.constraint(equalTo: soundImageView.leadingAnchor, constant: self.soundImageView.frame.width / 2).isActive = true
        playButton.trailingAnchor.constraint(equalTo: soundImageView.trailingAnchor).isActive = true
        playButton.topAnchor.constraint(equalTo: soundImageView.topAnchor, constant: soundImageView.frame.height / 2).isActive = true
        playButton.bottomAnchor.constraint(equalTo: soundImageView.bottomAnchor).isActive = true
    }
    
    public func setup(with sleepStoryImage: UIImage) {
        soundImageView.image = sleepStoryImage
        setupUI()
    }
    
}
