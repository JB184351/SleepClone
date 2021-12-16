//
//  ViewController.swift
//  SleepClone
//
//  Created by Justin Bengtson on 12/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var pageViewController: UIPageViewController?
    private var subscriptionViewController = UIViewController()
    private let dataSource = ["One", "Two", "Three", "Four"]
    private var allViewControllers = [UIViewController]()
    private var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateDataSource()
        setupPageViewController()
    }
    
    private func setupPageViewController() {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        pageViewController?.delegate = self
        pageViewController?.dataSource = self
        
        self.pageViewController?.view.backgroundColor = .clear
        self.pageViewController?.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        self.addChild(self.pageViewController!)
        
        self.view.addSubview(self.pageViewController!.view)
        
        self.pageViewController?.didMove(toParent: self)
        
        if let firstViewController = allViewControllers.first {
            self.pageViewController?.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
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
        return currentIndex
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

