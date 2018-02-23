//
//  DetailViewController.swift
//  Taasky
//
//  Created by Audrey M Tam on 18/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var hamburgerView: HamburgerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.clipsToBounds = true
        
        // load hamburger view
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hamburgerViewTapped))
        hamburgerView = HamburgerView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        hamburgerView!.addGestureRecognizer(tapGestureRecognizer)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: hamburgerView!)
    }
  
    var menuItem: NSDictionary? {
        didSet {
            if let newMenuItem = menuItem {
                view.backgroundColor = UIColor(colorArray: newMenuItem["colors"] as! NSArray)
                backgroundImageView?.image = UIImage(named: newMenuItem["bigImage"] as! String)
            }
        }
    }
    
    @objc func hamburgerViewTapped() {
        let navigationController = parent as! UINavigationController
        let containerViewController = navigationController.parent as! ContainerViewController
        containerViewController.hideOrShowMenu(show: !containerViewController.showingMenu, animated: true)
    }
  
}
