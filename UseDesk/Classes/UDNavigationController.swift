//
//  UDNavigationController.swift

import Foundation

class UDNavigationController: UINavigationController {

    var barTintColor: UIColor?
    var tintColor: UIColor?
    var titleTextColor: UIColor?
    var titleTextFont: UIFont?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle ?? super.preferredStatusBarStyle
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationBar.isTranslucent = false
        
        tintColor = (tintColor != nil) ? tintColor : navBarTextColor
        
        titleTextColor = titleTextColor ?? navBarTextColor
        titleTextFont = titleTextFont ?? navBarTextFont
        
        barTintColor = (barTintColor != nil) ? barTintColor : navBarBackgroundColor
        if #available(iOS 13.0, *) {
            let appearance = self.navigationBar.standardAppearance
            appearance.backgroundColor = barTintColor
            navigationBar.standardAppearance = appearance
        } else {
            navigationBar.barTintColor = barTintColor
        }
        navigationBar.tintColor = titleTextColor
    }
    
    func setTitleTextAttributes() {
        var attributes: [NSAttributedString.Key: Any] = [:]
        if let textColor = titleTextColor {
            attributes[.foregroundColor] = textColor
        }
        if let textFont = titleTextFont {
            attributes[.font] = textFont
        }
        if #available(iOS 13.0, *) {
            let appearance = self.navigationBar.standardAppearance
            appearance.titleTextAttributes = attributes
            navigationBar.standardAppearance = appearance
        } else {
            navigationBar.titleTextAttributes = attributes
        }
    }
}
