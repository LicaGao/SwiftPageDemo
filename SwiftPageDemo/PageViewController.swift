//
//  PageViewController.swift
//  SwiftPageDemo
//
//  Created by 高鑫 on 2017/11/26.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    let urls = ["http://www.jianshu.com/p/834f3bf1fc43",
                "http://www.jianshu.com/p/d432bd180ab8",
                "http://www.jianshu.com/p/449afd7ab05d",
                "http://www.jianshu.com/p/899c09c7dbee",
                "http://www.jianshu.com/p/be17f1e5a709"]
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        if let startVC = setViewController(index: 0) {
            setViewControllers([startVC], direction: .reverse, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WebViewController).index
        index -= 1
        return setViewController(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WebViewController).index
        index += 1
        return setViewController(index: index)
    }
    
    func setViewController(index: Int) -> WebViewController? {
        if case 0..<urls.count = index {
            let main = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            if let webVC = main.instantiateViewController(withIdentifier: "webView") as? WebViewController {
                webVC.url = urls[index]
                webVC.index = index
                
                return webVC
            }
        }
        return nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
