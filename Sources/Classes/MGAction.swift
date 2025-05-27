import Foundation
open class MGAction: NSObject {
    open private(set) var title: String?
    open private(set) var subTitle: String?
    open private(set) var style: MGAction.Style
    open var isEnabled: Bool
    open var config: MGActionConfig
    open var customParam: Any?

    var handle: ((MGAction) -> Void)?

    override public init() {
        self.isEnabled = true
        self.style = .default
        self.config = self.style.config
        super.init()
    }

    
    /// 初始化
    /// - Parameters:
    ///   - title: 标题
    ///   - subTitle: 小标题
    ///   - config: UI 配置
    ///   - style: 样式风格， 这里有默认风格
    ///   - handler: 事件回调
    public convenience init(title: String?,
                            subTitle: String? = nil,
                            style: MGAction.Style,
                            config: MGActionConfig? = nil,
                            handler: ((MGAction) -> Void)? = nil)
    {
        self.init()
        self.title = title
        self.subTitle = subTitle
        self.style = style
        self.config = self.style.config
        if let config = config {
            self.config = config
        }
        self.handle = handler
    }
}

public extension MGAction {
    
    /// Action 样式，cacel 只能有一个，且只展示在最下方，添加多个默认展示第一个添加的
    enum Style {
        case `default`
        case cancel
        case destructive
        case custom(CustomCellProvider.Type)
         
         // 是否为 custom 类型
         public var isCustom: Bool {
             if case .custom = self { return true }
             return false
         }
         
         // 获取关联的自定义 cell 类型
        public var customCellType: ( CustomCellProvider.Type)? {
             if case let .custom(cellType) = self { return cellType }
             return nil
         }
    }
}

extension MGAction.Style: Equatable {
    public static func == (lhs: MGAction.Style, rhs: MGAction.Style) -> Bool {
        switch (lhs, rhs) {
        case (.default, .default): return true
        case (.cancel, .cancel): return true
        case (.destructive, .destructive): return true
        case let (.custom(l), .custom(r)): return l == r
        default: return false
        }
    }
    
     
    /// Style 的默认样式配置， 可通过 MGAction 的 config 属性覆盖
    var config: MGActionConfig {
        switch self {
        case .default:
            MGGlobalAction.shared.defaultAction
        case .cancel:
            MGGlobalAction.shared.cancelAction
        case .destructive:
            MGGlobalAction.shared.destructiveAction
        case .custom(_):
            MGGlobalAction.shared.defaultCustomAction
        }
    }
}
