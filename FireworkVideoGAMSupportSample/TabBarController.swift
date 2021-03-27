//
//  TabBarController.swift
//  FireworkVideoGAMSupportSample
//

import UIKit
import FireworkVideo

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gridVideoFeedViewController = VideoFeedViewController()
        let gridTabBarItem = UITabBarItem(title: "Grid",
                                          image: UIImage(systemName: "rectangle.grid.3x2.fill")!,
                                          tag: 0)
        gridVideoFeedViewController.tabBarItem = gridTabBarItem
        let layout = VideoFeedGridLayout()
        layout.numberOfColumns = 3
        layout.contentInsets = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        gridVideoFeedViewController.layout = layout
        var gridConfiguration = gridVideoFeedViewController.viewConfiguration
        gridConfiguration.backgroundColor = .white
        gridConfiguration.playerView.videoCompleteAction = .loop
        gridVideoFeedViewController.viewConfiguration = gridConfiguration
        
        let verticalVideoFeedViewController = VideoFeedViewController()
        let verticalTabBarItem = UITabBarItem(title: "Vertical",
                                               image: UIImage(systemName: "rectangle.portrait.fill")!,
                                               tag: 1)
        verticalVideoFeedViewController.tabBarItem = verticalTabBarItem
        let verticalLayout = VideoFeedGridLayout()
        verticalLayout.numberOfColumns = 1
        verticalLayout.contentInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        verticalLayout.itemSpacing = 20
        verticalVideoFeedViewController.layout = verticalLayout
        var config = verticalVideoFeedViewController.viewConfiguration
        config.backgroundColor = .white
        verticalVideoFeedViewController.viewConfiguration = config
        
        let storyboard = UIStoryboard(name: "Storyboard",
                                      bundle: .main)
        let embedVideoFeedViewContainerController = storyboard.instantiateViewController(identifier: "GridVideoFeedViewController")
        let embedTabBarItem = UITabBarItem(title: "Embed",
                                           image: UIImage(systemName: "rectangle.split.3x1.fill")!,
                                           tag: 2)
        embedVideoFeedViewContainerController.tabBarItem = embedTabBarItem
        
         self.viewControllers = [
            embedVideoFeedViewContainerController,
            verticalVideoFeedViewController,
            gridVideoFeedViewController,
        ]
    }

}
