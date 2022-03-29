//
//  SleepStories.swift
//  SleepClone
//
//  Created by Justin Bengtson on 12/31/21.
//

import UIKit

class SleepStoriesView: UIView {

    //MARK: - Private Properties
    
    private var tableView: UITableView!
    private var testLabel = UILabel()
    private var sleeepStories = [SleepStoryModel]()
    
    //MARK: - Public Properties
    
    public var messageText = String()
    
    //MARK: - Init
    
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
    
    //MARK: - Private Methods
    
    private func populateDataSource() {
        let sleepStory = SleepStoryModel(image: (UIImage(named: "test")!), title: "Test")
    
        sleeepStories.append(sleepStory)
        sleeepStories.append(sleepStory)
        sleeepStories.append(sleepStory)
        sleeepStories.append(sleepStory)
        sleeepStories.append(sleepStory)
        sleeepStories.append(sleepStory)
        sleeepStories.append(sleepStory)
        sleeepStories.append(sleepStory)
        sleeepStories.append(sleepStory)
        sleeepStories.append(sleepStory)
        sleeepStories.append(sleepStory)
        sleeepStories.append(sleepStory)
        sleeepStories.append(sleepStory)
    }
    
    private func setupUI() {
        tableView = UITableView(frame: .zero, style: .grouped)
        
        //TODO: Update to actual color
        tableView.backgroundColor = .blue
        self.backgroundColor = .blue
        
        self.addSubview(tableView)
        setupConstraints()
    }
    
    private func registerCells() {
        tableView.register(SleepStoriesTableViewCell.self, forCellReuseIdentifier: "sleepStoriesTableViewCell")
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

//MARK: - TableView DataSource

extension SleepStoriesView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sleeepStories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sleepStory = sleeepStories[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sleepStoriesTableViewCell", for: indexPath) as! SleepStoriesTableViewCell
        cell.setup(with: sleepStory)
        return cell
    }
}

//MARK: - TableView Delegate

extension SleepStoriesView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //TODO: Configure Font and spacing
        let featureView = DozeFeatureDescriptionView()
        featureView.headerLabel.text = "Unlock Doze"
        featureView.messageLabel.text = messageText
        
        return featureView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        //TODO: Configure Font and spacing
        let moreMessagingLabel = UILabel()
        moreMessagingLabel.text = "And many more..."
        moreMessagingLabel.textAlignment = .left
        moreMessagingLabel.textColor = .white
        
        return moreMessagingLabel
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
}




