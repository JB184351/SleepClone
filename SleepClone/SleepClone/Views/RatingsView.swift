//
//  RatingsView.swift
//  SleepClone
//
//  Created by Justin Bengtson on 1/24/22.
//

import UIKit

class RatingsView: UIView {
    
    //MARK: - Private Variables
    private var tableView: UITableView!
    private var ratings = [RatingModel]()
    
    //MARK: - Public Variables
    public var messageText = String()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        registerCells()
        populateDataSource()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    
    private func populateDataSource() {
        let rating = RatingModel(ratingTitle: "The Best App", userName: "Justin B", detailReview: "this is the very best app and no one can tell me otherwise lolololololoolololololololo0lolololololol")
        
        ratings.append(rating)
    }
    
    private func setupUI() {
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .blue
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
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
    
    //TODO: - Update to automatically cells to size based on content.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
