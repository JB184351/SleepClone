//
//  AdvancedFeaturesView.swift
//  SleepClone
//
//  Created by Justin Bengtson on 1/24/22.
//

import UIKit

class AdvancedFeaturesView: UIView {
    
    //MARK: - Private Variables
    
    private var tableView: UITableView!
    private var advancedFeatures = [AdvancedFeatureModel]()
    
    //MARK: - Public Methods
    
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
    
    private func setupUI() {
        tableView = UITableView(frame: .zero, style: .grouped)
        
        //TODO: Update to actual color
        tableView.backgroundColor = .blue
        self.backgroundColor = .blue
        
        self.addSubview(tableView)
        setupConstraints()
    }
    
    private func populateDataSource() {
        let firstFeature = AdvancedFeatureModel(image: UIImage(systemName: "speaker.wave.3")!, featureName: "3D Voice")
        let secondFeature = AdvancedFeatureModel(image: UIImage(systemName: "infinity")!, featureName: "Loop Narrations")
        let thirdFeature = AdvancedFeatureModel(image: UIImage(systemName: "timer")!, featureName: "Sleep Timer")
        let fourthFeature = AdvancedFeatureModel(image: UIImage(systemName: "moon.circle")!, featureName: "Audio Fusion")
        
        advancedFeatures.append(firstFeature)
        advancedFeatures.append(secondFeature)
        advancedFeatures.append(thirdFeature)
        advancedFeatures.append(fourthFeature)
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func registerCells() {
        tableView.register(AdvancedFeaturesTableViewCell.self, forCellReuseIdentifier: "advancedFeaturesTableViewCell")
    }
}

//MARK: - TableView DataSource

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

//MARK: - TableView Delegate

extension AdvancedFeaturesView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //TODO: Configure Font and spacing
        let featureView = DozeFeatureDescriptionView()
        featureView.headerLabel.text = "Unlock Doze"
        featureView.messageLabel.text = messageText
        
        return featureView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
