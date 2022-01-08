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
    private var sleepStories = [String]()
    
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
        sleepStories.append("The first one")
        sleepStories.append("The second one")
    }
    
    private func setupUI() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
        layout.itemSize = CGSize(width: self.frame.width, height: 20)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        self.addSubview(collectionView)
        setupConstraints()
    }
    
    private func registerCells() {
        collectionView.register(SleepStoriesCollectionViewCell.self, forCellWithReuseIdentifier: "sleepStoriesTableViewCell")
    }
    
    private func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.leadingAnchor.constraint(equalTo: self.collectionView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: self.collectionView.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: self.collectionView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: self.collectionView.bottomAnchor).isActive = true
    }
}

extension SleepStoriesView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sleepStories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sleepStory = sleepStories[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sleepStoriesTableViewCell", for: indexPath) as! SleepStoriesCollectionViewCell
        cell.backgroundColor = .blue
        cell.setup(with: sleepStory)
        return cell
    }

}

extension SleepStoriesView: UICollectionViewDelegate {
    
}

extension SleepStoriesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 50)
    }
}




