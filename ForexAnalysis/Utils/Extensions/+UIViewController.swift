import UIKit.UIViewController

extension UIViewController {
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiate(from appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    internal func push(_ viewController: UIViewController, animated: Bool) {
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
    internal func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

