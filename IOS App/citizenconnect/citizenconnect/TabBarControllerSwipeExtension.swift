//
//  TabBarControllerSwipeExtension.swift
//  citizenconnect
//
//  Created by Shahzaib Shahid on 27/04/2018.
//  Copyright © 2018 cfp. All rights reserved.
//

import UIKit

extension UITabBarController {
    func setupSwipeGestureRecognizers(allowCyclingThoughTabs cycleThroughTabs: Bool = false) {
        let swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: cycleThroughTabs ? #selector(handleSwipeLeftAllowingCyclingThroughTabs) : #selector(handleSwipeLeft))
        swipeLeftGestureRecognizer.direction = .left
        self.tabBar.addGestureRecognizer(swipeLeftGestureRecognizer)
        
        let swipeRightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: cycleThroughTabs ? #selector(handleSwipeRightAllowingCyclingThroughTabs) : #selector(handleSwipeRight))
        swipeRightGestureRecognizer.direction = .right
        self.tabBar.addGestureRecognizer(swipeRightGestureRecognizer)
    }
    
    @objc private func handleSwipeLeft(swipe: UISwipeGestureRecognizer) {
        self.selectedIndex -= 1
    }
    
    @objc private func handleSwipeRight(swipe: UISwipeGestureRecognizer) {
        self.selectedIndex += 1
    }
    
    @objc private func handleSwipeLeftAllowingCyclingThroughTabs(swipe: UISwipeGestureRecognizer) {
        let maxIndex = (self.viewControllers?.count ?? 0)
        let nextIndex = self.selectedIndex - 1
        self.selectedIndex = nextIndex >= 0 ? nextIndex : maxIndex - 1
        
    }
    
    @objc private func handleSwipeRightAllowingCyclingThroughTabs(swipe: UISwipeGestureRecognizer) {
        let maxIndex = (self.viewControllers?.count ?? 0)
        let nextIndex = self.selectedIndex + 1
        self.selectedIndex = nextIndex < maxIndex ? nextIndex : 0
    }
}
