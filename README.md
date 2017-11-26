# SwiftPageDemo
### 11月26日练习
* UIPageViewController的使用。练习中 PageViewController 的子视图是动态的，重复调用 WebViewController 每一页只是改变了 WKWebView 加载的url。在 PageViewController 中需要实现UIPageViewControllerDataSource的两个方法，返回当前页VC的前一个和后一个VC：
```
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WebViewController).index
        index -= 1
        return setViewController(index: index)
    }
```    
``` 
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WebViewController).index
        index += 1
        return setViewController(index: index)
    }
```
在 setViewController 方法中为 WebViewController 设置相应的url和索引并返回
```
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
```
* 练习中使用的url均选自[简书-7日热门](http://www.jianshu.com/trending/weekly?utm_medium=index-banner-s&utm_source=desktop)。简书网址使用HTTP协议所以需要在 Info.plist 文件中设置 App Transport Security Settings - Allow Arbitrary Loads 为 YES
