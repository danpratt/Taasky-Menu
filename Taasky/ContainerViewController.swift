//
//  ContainerViewController.swift
//  Taasky
//
//  Created by Daniel Pratt on 2/23/18.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var menuItem: NSDictionary? {
        didSet {
            if let detailViewController = detailViewController {
                detailViewController.menuItem = menuItem
            }
        }
    }
    
    private var detailViewController: DetailViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

     // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewSegue" {
            let navigationController = segue.destination as! UINavigationController
            detailViewController = navigationController.topViewController as? DetailViewController
        }
    }
 

}
