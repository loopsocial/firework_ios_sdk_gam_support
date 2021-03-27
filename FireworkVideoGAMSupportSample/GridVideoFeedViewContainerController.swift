//
//  GridVideoFeedViewController.swift
//  FireworkVideoGAMSupportSample
//

import UIKit
import FireworkVideo

class GridVideoFeedViewContainerController: UIViewController {
    lazy var gridVideoFeedVC: VideoFeedViewController = {
        let vc = VideoFeedViewController(source: .discover)
        vc.delegate = self
        let layout = VideoFeedHorizontalLayout()
        layout.itemSpacing = 8
        layout.contentInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        vc.layout = layout
        var config = vc.viewConfiguration
        config.backgroundColor = .gray
        config.itemView.cornerRadius = 12
        config.itemView.titleLayoutConfiguration.insets = UIEdgeInsets(top: 10, left: 4, bottom: 0, right: 4)
        config.itemView.title.isHidden = false
        config.itemView.title.font = UIFont.systemFont(ofSize: 12)
        config.itemView.title.numberOfLines = 2
        config.itemView.title.textColor = UIColor.white.withAlphaComponent(0.9)
        config.itemView.titleLayoutConfiguration.titlePosition = .stacked
        vc.viewConfiguration = config
        return vc
    }()
    
    lazy var channelVideoFeedVC: VideoFeedViewController = {
        let vc = VideoFeedViewController(source: .channel(channelID: "bJDywZ"))
        vc.delegate = self
        let layout = VideoFeedHorizontalLayout()
        layout.itemSpacing = 8
        layout.contentInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        vc.layout = layout
        var config = vc.viewConfiguration
        config.backgroundColor = .lightGray
        config.itemView.cornerRadius = 12
        config.itemView.titleLayoutConfiguration.insets = UIEdgeInsets(top: 10, left: 4, bottom: 0, right: 4)
        config.itemView.title.isHidden = true
        config.itemView.titleLayoutConfiguration.titlePosition = .nested
        vc.viewConfiguration = config
        return vc
    }()
    
    @IBOutlet weak var videoFeed: UIView!
    
    @IBOutlet weak var channelFeed: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupListVC()
        setupChannelVC()
    }
    
    private func setupListVC() {
        addChild(gridVideoFeedVC)
        videoFeed.addSubview(gridVideoFeedVC.view)
        gridVideoFeedVC.view.frame = videoFeed.bounds
        gridVideoFeedVC.willMove(toParent: self)
    }
    
    private func setupChannelVC() {
        addChild(channelVideoFeedVC)
        channelFeed.addSubview(channelVideoFeedVC.view)
        channelVideoFeedVC.view.frame = channelFeed.bounds
        channelVideoFeedVC.willMove(toParent: self)
    }
}

extension GridVideoFeedViewContainerController: VideoFeedViewControllerDelegate {
    func videoFeedDidLoadFeed(_ viewController: VideoFeedViewController) {
        print("Did load video feed")
    }
    
    func videoFeed(_ viewController: VideoFeedViewController, didFailToLoadFeed error: VideoFeedError) {
        print("Failed to load video feed \(error.localizedDescription)")
    }
}

