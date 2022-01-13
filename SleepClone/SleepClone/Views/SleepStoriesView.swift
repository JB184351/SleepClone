//
//  SleepStories.swift
//  SleepClone
//
//  Created by Justin Bengtson on 12/31/21.
//

import UIKit

class SleepStoriesView: UIView {

    private var collectionView: UICollectionView!
    private var testLabel = UILabel()
    private var images = [UIImage]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        populateDataSource()
        setupUI()
        collectionView.dataSource = self
        collectionView.delegate = self
        registerCells()
        self.collectionView.reloadData()
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
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .gray
        
        self.backgroundColor = .gray
        
        self.addSubview(collectionView)
        setupConstraints()
    }
    
    private func registerCells() {
        collectionView.register(SleepStoriesCollectionViewCell.self, forCellWithReuseIdentifier: "sleepStoriesTableViewCell")
    }
    
    private func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        self.collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

extension SleepStoriesView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sleepStory = images[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sleepStoriesTableViewCell", for: indexPath) as! SleepStoriesCollectionViewCell
        cell.setup(with: sleepStory)
        return cell
    }

}

extension SleepStoriesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 75)
    }
}




