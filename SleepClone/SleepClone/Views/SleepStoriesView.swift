//
//  SleepStories.swift
//  SleepClone
//
//  Created by Justin Bengtson on 12/31/21.
//

import UIKit

class SleepStoriesView: UIView {

    private var tableView = UITableView()
    private var testLabel = UILabel()
    private var sleepStories = [String]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        populateDataSource()
        setupUI()
        tableView.dataSource = self
        tableView.delegate = self
        registerCells()
        self.tableView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func populateDataSource() {
        sleepStories.append("The first one")
        sleepStories.append("The second one")
    }
    
    private func setupUI() {
        tableView = UITableView(frame: .zero)
        
        
        self.addSubview(tableView)
        setupConstraints()
    }
    
    private func registerCells() {
        tableView.register(SleepStoriesTableViewCell.self, forCellReuseIdentifier: "sleepStoriesTableViewCell")
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.leadingAnchor.constraint(equalTo: self.tableView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: self.tableView.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: self.tableView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: self.tableView.bottomAnchor).isActive = true
    }
}

extension SleepStoriesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sleepStories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sleepStory = sleepStories[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sleepStoriesTableViewCell", for: indexPath) as! SleepStoriesTableViewCell
        cell.setup(with: sleepStory)
        return cell
    }
    
    
}

extension SleepStoriesView: UITableViewDelegate {
    
}




