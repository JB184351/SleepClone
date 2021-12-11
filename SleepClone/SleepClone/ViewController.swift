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
    private var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageViewController?.delegate = self
        pageViewController?.dataSource = self
    }
    
    private func setupPageViewController() {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        self.pageViewController?.view.backgroundColor = .clear
        self.pageViewController?.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        self.addChild(self.pageViewController!)
        
        self.view.addSubview(self.pageViewController!.view)
        
        self.pageViewController?.didMove(toParent: self)
    }


}

extension ViewController: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return dataSource.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return UIViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return UIViewController()
    }
    
}

extension ViewController: UIPageViewControllerDelegate {
    
}

