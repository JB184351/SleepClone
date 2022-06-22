//
//  ViewController.swift
//  SleepClone
//
//  Created by Justin Bengtson on 12/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Private Variables
    
    private var allViewControllers = [UIViewController]()
    private var collectionView: UICollectionView!
    private var purchaseView = PurchaseView()
    private var pageControl = UIPageControl()
    private var views: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateDataSource()
        pageControl.numberOfPages = views.count
        setupUI()
        registerCells()
        collectionView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    //MARK: - Private Methods
    
    private func setupUI() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.width, height: 500)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        self.view.addSubview(collectionView)
        self.view.addSubview(purchaseView)
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
        
        self.collectionView.backgroundColor = .blue
    }
    
    private func setupConstraints() {
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.purchaseView.translatesAutoresizingMaskIntoConstraints = false
        
        self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.collectionView.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.60).isActive = true
        
        self.pageControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.pageControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.pageControl.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.pageControl.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.purchaseView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.purchaseView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.purchaseView.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor).isActive = true
        self.purchaseView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.purchaseView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.40).isActive = true
    }
    
    private func registerCells() {
        collectionView.register(SleepStoriesCell.self, forCellWithReuseIdentifier: "sleepStoriesCell")
    }
    
    private func populateDataSource() {
        let sleepStoriesView = SleepStoriesView()
        sleepStoriesView.messageText = "Doze off with +100 sleep stories and mediations updated on a weekly basis."
        
        let moreSleepStoriesView = SleepStoriesView()
        moreSleepStoriesView.messageText = "Relax your body with +150 soothing music and nature sounds. Weekly new updates."
        
        let advancedFeaturesView = AdvancedFeaturesView()
        advancedFeaturesView.messageText = "Enjoy advanced features like"
        
        let ratingsView = RatingsView()
        ratingsView.messageText = "What our users think about us"
        
        views.append(sleepStoriesView)
        views.append(moreSleepStoriesView)
        views.append(advancedFeaturesView)
        views.append(ratingsView)
    }
    
}

//MARK: - CollectionView DataSource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        views.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = views[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sleepStoriesCell", for: indexPath) as! SleepStoriesCell
        cell.setup(with: view)
        return cell
    }
    
    
}

//MARK: - CollectionView Delegate

extension ViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width - (scrollView.contentInset.left * 2)
        let index = scrollView.contentOffset.x / width
        let roundedIndex = round(index)
        self.pageControl.currentPage = Int(roundedIndex)
    }
}
