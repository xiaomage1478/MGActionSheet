
open class MGAction: NSObject {
    open private(set) var title: String?
    open private(set) var subTitle: String?
    open private(set) var style: MGAction.Style
    open var isEnabled: Bool
    open var config: MGActionConfig

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
    enum Style: Int {
        case `default` = 0
        case cancel = 1
        case destructive = 2
    }
}

public extension MGAction.Style {
    
    /// Style 的默认样式配置， 可通过 MGAction 的 config 属性覆盖
    var config: MGActionConfig {
        switch self {
        case .default:
            MGActionConfig()
        case .cancel:
            MGActionConfig(titleFont: .systemFont(ofSize: 16))
        case .destructive:
            MGActionConfig(titleColor: .red, titleFont: .systemFont(ofSize: 16))
        }
    }
}
