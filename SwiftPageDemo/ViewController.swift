//
//  ViewController.swift
//  SwiftPageDemo
//
//  Created by 高鑫 on 2017/11/26.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var pageView : PageViewController?

    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pageSegue" {
            pageView = segue.destination as? PageViewController
        }
    }

}

