//
//  ViewController.swift
//  SleepClone
//
//  Created by Justin Bengtson on 12/11/21.
//

import UIKit

//protocol PageDelegate: AnyObject {
//    func didUpdatePageIndicator()
//}

class ViewController: UIViewController {
    
    private var pageViewController =  UIPageViewController()
    private var allViewControllers = [UIViewController]()
    private var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateDataSource()
        setupPageViewController()
        setupPageControl()
    }
    
    private func setupPageViewController() {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        self.pageViewController.view.backgroundColor = .clear
        
        // Remember to add to subview before adding constraints
        self.view.addSubview(pageControl)
        self.pageControl.addSubview(pageViewController.view)
        
        setupConstraints()
        
        self.addChild(self.pageViewController)
        
        self.pageViewController.didMove(toParent: self)
        
        if let firstViewController = allViewControllers.first {
            self.pageViewController.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func setupConstraints() {
        self.pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.pageViewController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.pageViewController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.pageViewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.pageViewController.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        
        self.pageControl.leadingAnchor.constraint(equalTo: self.pageViewController.view.leadingAnchor).isActive = true
        self.pageControl.trailingAnchor.constraint(equalTo: self.pageViewController.view.trailingAnchor).isActive = true
        self.pageControl.bottomAnchor.constraint(equalTo: self.pageViewController.view.bottomAnchor).isActive = true
        self.pageControl.topAnchor.constraint(equalTo: self.pageViewController.view.topAnchor, constant: 50).isActive = true
    }
    
    func setupPageControl() {
        pageControl.backgroundColor = .red
    }
    
    func populateDataSource() {
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

extension ViewController: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return allViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = allViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = currentIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard allViewControllers.count > previousIndex else {
            return nil
        }
        
        return allViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = allViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = currentIndex + 1
        
        guard allViewControllers.count > nextIndex else {
            return nil
        }
        
        return allViewControllers[nextIndex]
    }
    
}

extension ViewController: UIPageViewControllerDelegate {
    
}

