//
//  ContainerViewController.swift
//  Taasky
//
//  Created by Daniel Pratt on 2/23/18.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var menuContainerView: UIView!
    
    var showingMenu = false
    
    var menuItem: NSDictionary? {
        didSet {
            hideOrShowMenu(show: false, animated: true)
            if let detailViewController = detailViewController {
                detailViewController.menuItem = menuItem
            }
        }
    }
    
    private var detailViewController: DetailViewController?

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        hideOrShowMenu(show: showingMenu, animated: false)
    }

    // MARK: - Container View Controller
    func hideOrShowMenu(show: Bool, animated: Bool) {
        showingMenu = show
        let menuOffset = menuContainerView.bounds.width
        scrollView.setContentOffset(show ? CGPoint.zero : CGPoint(x: menuOffset, y: 0), animated: animated)
    }
    
    // MARK: - UIScrollView Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.isPagingEnabled = scrollView.contentOffset.x < (scrollView.contentSize.width - scrollView.frame.width)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let menuOffset = menuContainerView.bounds.width
        showingMenu = !__CGPointEqualToPoint(CGPoint(x: menuOffset, y: 0), scrollView.contentOffset)
        print("didEndDecelerating showingMenu: \(showingMenu)")
    }

     // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewSegue" {
            let navigationController = segue.destination as! UINavigationController
            detailViewController = navigationController.topViewController as? DetailViewController
        }
    }
 

}
