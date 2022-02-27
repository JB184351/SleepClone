//
//  SleepStoriesTableViewCell.swift
//  SleepClone
//
//  Created by Justin Bengtson on 1/1/22.
//

import UIKit

class SleepStoriesTableViewCell: UITableViewCell {
    
    //MARK: - Private Properties
    
    private var soundImageView = UIImageView()
    private var soundTitleLabel = UILabel()
    private var playButton = UIButton()
    private var spaceView = UIView()
    private var isPlaying = false
    
    //MARK: - Private Methods

    private func setupUI() {
        playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        playButton.tintColor = .white
        playButton.addTarget(self, action: #selector(buttonAction(_ :)), for: .touchUpInside)
        
        //TODO: Add Correct Font
        soundTitleLabel.textColor = .white
        soundTitleLabel.font = soundTitleLabel.font.withSize(12)
        
        //An empty UIView to add spaces between Table View Cells
        spaceView.backgroundColor = .blue
        
        //Got rounded corners working!
        soundImageView.addRoundedCorners()
        
        self.contentView.addSubview(spaceView)
        self.contentView.addSubview(soundImageView)
        self.contentView.addSubview(soundTitleLabel)
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
        spaceView.translatesAutoresizingMaskIntoConstraints = false
        soundImageView.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        soundTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        spaceView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        spaceView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        spaceView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        spaceView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        soundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        soundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        soundImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        soundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10).isActive = true
        
        playButton.leadingAnchor.constraint(equalTo: soundImageView.leadingAnchor, constant: self.soundImageView.frame.width / 2).isActive = true
        playButton.trailingAnchor.constraint(equalTo: soundImageView.trailingAnchor).isActive = true
        playButton.topAnchor.constraint(equalTo: soundImageView.topAnchor, constant: soundImageView.frame.height / 2).isActive = true
        playButton.bottomAnchor.constraint(equalTo: soundImageView.bottomAnchor).isActive = true
        
        soundTitleLabel.leadingAnchor.constraint(equalTo: self.soundImageView.leadingAnchor, constant: 12).isActive = true
        soundTitleLabel.trailingAnchor.constraint(equalTo: self.soundImageView.trailingAnchor).isActive = true
        soundTitleLabel.topAnchor.constraint(equalTo: self.soundImageView.topAnchor, constant: 40).isActive = true
        soundTitleLabel.bottomAnchor.constraint(equalTo: self.soundImageView.bottomAnchor).isActive = true
    }
    
    //MARK: - Public Methods
    
    public func setup(with model: SleepStoryModel) {
        soundImageView.image = model.image
        soundTitleLabel.text = model.title
        setupUI()
    }
    
}
