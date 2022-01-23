//
//  SleepStories.swift
//  SleepClone
//
//  Created by Justin Bengtson on 12/31/21.
//

import UIKit

class SleepStoriesView: UIView {

    private var tableView: UITableView!
    private var testLabel = UILabel()
    private var images = [UIImage]()
    
    public var messageText = String()
    
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
        images.append(UIImage(named: "test")!)
        images.append(UIImage(named: "test")!)
        images.append(UIImage(named: "test")!)
        images.append(UIImage(named: "test")!)
        images.append(UIImage(named: "test")!)
        images.append(UIImage(named: "test")!)
        images.append(UIImage(named: "test")!)
        images.append(UIImage(named: "test")!)
        images.append(UIImage(named: "test")!)
        images.append(UIImage(named: "test")!)
        images.append(UIImage(named: "test")!)
    }
    
    private func setupUI() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
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

extension SleepStoriesView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sleepStory = images[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sleepStoriesTableViewCell", for: indexPath) as! SleepStoriesTableViewCell
        cell.setup(with: sleepStory)
        return cell
    }
}

extension SleepStoriesView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //TODO: Configure Font and spacing
        let unlockView = DozeFeatureDescriptionView()
        unlockView.headerLabel.text = "Unlock Doze"
        unlockView.messageLabel.text = messageText
        
        return unlockView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        //TODO: Configure Font and spacing
        let moreMessaingLabel = UILabel()
        moreMessaingLabel.text = "And many more..."
        moreMessaingLabel.textAlignment = .left
        moreMessaingLabel.textColor = .white
        
        
        return moreMessaingLabel
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}




