//
//  AdvancedFeaturesView.swift
//  SleepClone
//
//  Created by Justin Bengtson on 1/24/22.
//

import UIKit

class AdvancedFeaturesView: UIView {
    
    private var tableView: UITableView!
    private var advancedFeatures = [AdvancedFeatureModel]()
    
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
    
    private func setupUI() {
        tableView = UITableView(frame: .zero, style: .grouped)
        
        //TODO: Update to actual color
        tableView.backgroundColor = .blue
        self.backgroundColor = .blue
        
        self.addSubview(tableView)
        setupConstraints()
    }
    
    private func populateDataSource() {
        let firstFeature = AdvancedFeatureModel(image: UIImage(systemName: "speaker.wave.3")!, featurename: "3D Voice")
        let secondFeature = AdvancedFeatureModel(image: UIImage(systemName: "infinity")!, featurename: "Loop Narrations")
        let thirdFeature = AdvancedFeatureModel(image: UIImage(systemName: "timer")!, featurename: "Sleep Timer")
        let fourthFeature = AdvancedFeatureModel(image: UIImage(systemName: "moon.circle")!, featurename: "Audio Fusion")
        
        advancedFeatures.append(firstFeature)
        advancedFeatures.append(secondFeature)
        advancedFeatures.append(thirdFeature)
        advancedFeatures.append(fourthFeature)
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func registerCells() {
        tableView.register(AdvancedFeaturesTableViewCell.self, forCellReuseIdentifier: "advancedFeaturesTableViewCell")
    }
}

extension AdvancedFeaturesView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return advancedFeatures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let advancedFeature = advancedFeatures[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "advancedFeaturesTableViewCell", for: indexPath) as! AdvancedFeaturesTableViewCell
        cell.backgroundColor = .blue
        cell.setup(with: advancedFeature)
        return cell
    }
    
    
}

extension AdvancedFeaturesView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //TODO: Configure Font and spacing
        let featureView = DozeFeatureDescriptionView()
        featureView.headerLabel.text = "Unlock Doze"
        featureView.messageLabel.text = messageText
        
        return featureView
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
        return 50
    }
}
