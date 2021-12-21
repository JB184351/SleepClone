//
//  ViewController.swift
//  SleepClone
//
//  Created by Justin Bengtson on 12/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var allViewControllers = [UIViewController]()
    private var collectionView: UICollectionView!
    private var pageControl = UIPageControl()
    
    let colors: [UIColor] = [.red, .green, .blue, .yellow]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateDataSource()
        pageControl.numberOfPages = colors.count
        setupCollectionView()
        registerCells()
        collectionView.reloadData()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.width, height: 500)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        self.view.addSubview(collectionView)
        self.collectionView.addSubview(pageControl)
        
        pageControl.backgroundColor = .clear
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        setupConstraints()
        
        self.collectionView.isPagingEnabled = true
        collectionView.contentOffset = .zero
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .never
        
        self.collectionView.backgroundColor = .orange
    }
    
    private func setupConstraints() {
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.collectionView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        self.pageControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.pageControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.pageControl.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
       
        self.pageControl.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    private func registerCells() {
        collectionView.register(SleepStoriesCell.self, forCellWithReuseIdentifier: "sleepStoriesCell")
    }
    
    private func populateDataSource() {
        let sleepViewController = SleepStoriesViewController()
        let songsViewController = SongsViewController()
        let advancedFeaturesViewController = AdvancedFeaturesViewController()
        let ratingsViewController = RatingsViewController()
        
        allViewControllers.append(sleepViewController)
        allViewControllers.append(songsViewController)
        allViewControllers.append(advancedFeaturesViewController)
        allViewControllers.append(ratingsViewController)
    }
    
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sleepStoriesCell", for: indexPath) as! SleepStoriesCell
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
}
