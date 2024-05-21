
/// 常用常量And方法
public enum Ces {
    public static let px1 = 1.0 / UIScreen.main.scale
    public static let width = UIScreen.main.bounds.width
    public static let height = UIScreen.main.bounds.height
    public static let navigationHeight = statusBarHeight + 44.0
    public static let tabBarHeight = barHeight == 44.0 ? 83.0 : 49.0
    public static let barHeight: CGFloat = {
        if #available(iOS 13.0, *) {
            return Ces.keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            return UIApplication.shared.statusBarFrame.height
        }
    }()
    
    public static let statusBarHeight: CGFloat = {
        if #available(iOS 13.0, *) {
            let statusManager = UIApplication.shared.windows.first?.windowScene?.statusBarManager
            return statusManager?.statusBarFrame.height ?? 20.0
        } else {
            return UIApplication.shared.statusBarFrame.height
        }
    }()
    
    /// 安全区域
    public static let topSafeAreaHeight = barHeight - 20
    public static let bottomSafeAreaHeight = tabBarHeight - 49
    public static let safeAreaEdgeInsets: UIEdgeInsets = {
        if #available(iOS 11.0, *) {
            return Ces.keyWindow?.safeAreaInsets ?? UIEdgeInsets.zero
        } else {
            return UIEdgeInsets.zero
        }
    }()
    
    public static let isIphoneX: Bool = {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return false
        }
        let size = UIScreen.main.bounds.size
        let notchValue = Int(size.width / size.height * 100)
        if notchValue == 216 || notchValue == 46 {
            return true
        }
        guard #available(iOS 11.0, *) else { return false }
        if let bottomHeight = Ces.keyWindow?.safeAreaInsets.bottom {
            return bottomHeight > 30
        }
        return false
    }()
    
    public static let keyWindow: UIWindow? = {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.connectedScenes
                .filter { $0.activationState == .foregroundActive }
                .first(where: { $0 is UIWindowScene })
                .flatMap { $0 as? UIWindowScene }?.windows
                .first(where: \.isKeyWindow)
        } else {
            return UIApplication.shared.keyWindow
        }
    }()
    
    public static var topViewController: UIViewController? {
        var resultVC: UIViewController?
        resultVC = _topVC(keyWindow?.rootViewController)
        while resultVC?.presentedViewController != nil {
            resultVC = _topVC(resultVC?.presentedViewController)
        }
        return resultVC
    }
    
    private static func _topVC(_ vc: UIViewController?) -> UIViewController? {
        if vc is UINavigationController {
            return _topVC((vc as? UINavigationController)?.topViewController)
        } else if vc is UITabBarController {
            return _topVC((vc as? UITabBarController)?.selectedViewController)
        } else {
            return vc
        }
    }
    
    public static func getTopViewController(controller: UIViewController) -> UIViewController {
        if let presentedViewController = controller.presentedViewController {
            return self.getTopViewController(controller: presentedViewController)
        } else if let navigationController = controller as? UINavigationController {
            if let topViewController = navigationController.topViewController {
                return self.getTopViewController(controller: topViewController)
            }
            return navigationController
        } else if let tabbarController = controller as? UITabBarController {
            if let selectedViewController = tabbarController.selectedViewController {
                return self.getTopViewController(controller: selectedViewController)
            }
            return tabbarController
        } else {
            return controller
        }
    }
}

public extension Ces {
    static func className(_ obj: Any) -> String {
        let type = Mirror(reflecting: obj)
        let keys = NSStringFromClass(type.subjectType as! AnyClass)
        let key = keys.components(separatedBy: ".").last!
        return key
    }
    
    static func instance(_ clazz: AnyClass?) -> UIViewController? {
        guard let clazz = clazz as? NSObject.Type else {
            return nil
        }
        return clazz.init() as? UIViewController
    }
}


public extension Ces {
    static func color(_ hex: String, alpha: CGFloat = 1) -> UIColor {
        UIColor(hex: hex, alpha: alpha)
    }
}

extension UIColor {
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1)
    }
    
    convenience init(hex: String, alpha: CGFloat) {
        var real = hex
        if hex.lengthOfBytes(using: .ascii) == 7 {
            real = String(hex.dropFirst())
        }
        
        let number = UInt(real, radix: 16) ?? 0
        
        let red     = CGFloat( (number & 0xff0000) / 0x10000 )
        let green   = CGFloat( (number & 0x00ff00) / 0x100 )
        let blue    = CGFloat( (number & 0x0000ff) )
        self.init(red: red/255.0 , green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    convenience init (wHex:String, wAlpha: CGFloat, dHex: String, dAlpha: CGFloat) {
        if #available(iOS 13.0, *) {
            self.init { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .light {
                    return UIColor.init(hex: wHex, alpha: wAlpha)
                } else {
                    return UIColor.init(hex: dHex, alpha: dAlpha)
                }
            }
        } else {
            self.init(hex: wHex, alpha: wAlpha)
        }
    }
}
