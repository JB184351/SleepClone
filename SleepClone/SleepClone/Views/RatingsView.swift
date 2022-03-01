//
//  RatingsView.swift
//  SleepClone
//
//  Created by Justin Bengtson on 1/24/22.
//

import UIKit

class RatingsView: UIView {
    
    //MARK: - Private Properties
    private var tableView: UITableView!
    private var timer: Timer!
    private var ratings = [RatingModel]()
    
    //MARK: - Public Properties
    public var messageText = String()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        registerCells()
        populateDataSource()
        tableView.estimatedRowHeight = 140
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    
    private func populateDataSource() {
        let rating = RatingModel(ratingTitle: "The Best App!", userName: "Sarah P.", detailReview: "The selection of sounds and stories is incredible! The 3D Voice feature is AMAZING! So hypnotic. Can’t wait to see what comes next.")
        let rating2 = RatingModel(ratingTitle: "Perfect", userName: "Joshua C.", detailReview: "I can’t even express how much I love this app, I like that the background noise that you choose keeps playing even after the story ends. I’m so glad I was recommended this app!")
        let rating3 = RatingModel(ratingTitle: "I recommend it", userName: "Molly A.", detailReview: "So many awesome options! I love how many different types of stories there are. Particulary fond of the dreamy myths. John’s voice is incredible on those!")
        let rating4 = RatingModel(ratingTitle: "Amazing", userName: "Barbara L.", detailReview: "Doze puts other sleep apps to bed.This app is so good it leaves me speechless. I don’t know how they do it but I swear the stories make my dreams more interesting.")
        let rating5 = RatingModel(ratingTitle: "Amazing", userName: "Zoe C.", detailReview: "I love this app. My husband and I fall asleep with it almost every night. We decided the subscription was well worth it. It works!")
        
        ratings.append(rating)
        ratings.append(rating2)
        ratings.append(rating3)
        ratings.append(rating4)
        ratings.append(rating5)
        
    }
    
    private func setupUI() {
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .blue
        self.addSubview(tableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func registerCells() {
        tableView.register(RatingsTableViewCell.self, forCellReuseIdentifier: "ratingsTableViewCell")
    }
    
//    private func updateCells() {
//        
//        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { _ in
//            guard let rating = self.ratings.randomElement() else { return }
//        })
//        
//        tableView.reloadData()
//    }
}

extension RatingsView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ratings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rating = ratings[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ratingsTableViewCell", for: indexPath) as! RatingsTableViewCell
        cell.setup(with: rating)
        return cell
    }
    
}

extension RatingsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //TODO: Configure Font and spacing
        let featureView = DozeFeatureDescriptionView()
        featureView.headerLabel.text = "Unlock Doze"
        featureView.messageLabel.text = messageText
        
        return featureView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
