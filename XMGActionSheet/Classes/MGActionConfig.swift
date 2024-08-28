

public struct MGActionConfig {
    
    public var titleColor: UIColor? = #colorLiteral(red: 0.2156862745, green: 0.2156862745, blue: 0.2156862745, alpha: 1)
    public var titleFont: UIFont? = .systemFont(ofSize: 16, weight: .regular)
    
    /// title 和 subtitle 的间距
    public var spacing: CGFloat = 4
    public var backgroundColor: UIColor? = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    public var selectionBackgroundColor: UIColor? = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5547392384)
    
    public var subtitleColor: UIColor? = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    public var subtitleFont: UIFont? = .systemFont(ofSize: 12, weight: .regular)
    
    public var separatorColor: UIColor? = #colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
    public var separatorHeight: CGFloat = 0.5
    /// 默认底部，左右边距 12 ,  ⚠️top 设置不生效
    public var separatorInset: UIEdgeInsets = .init(top: 0, left: 12, bottom: 0, right: 12)
    
    public var isAutoHeight: Bool = true
    public var actionHeight: CGFloat = UITableView.automaticDimension
    public var actionMinHeight: CGFloat = 55
    
    public var cancelSeparatorColor: UIColor? = Ces.color("#F2F3F6")
    public var cancelSeparatorHeight: CGFloat = 5
    
    public init(
        titleColor: UIColor? = MGGlobalUIConfig.shared.titleColor,
            titleFont: UIFont? = MGGlobalUIConfig.shared.titleFont,
            spacing: CGFloat = MGGlobalUIConfig.shared.spacing,
            backgroundColor: UIColor? = MGGlobalUIConfig.shared.cellBackgroundColor,
            selectionBackgroundColor: UIColor? = MGGlobalUIConfig.shared.selectionBackgroundColor,
            subtitleColor: UIColor? = MGGlobalUIConfig.shared.subtitleColor,
            subtitleFont: UIFont? = MGGlobalUIConfig.shared.subtitleFont,
            separatorColor: UIColor? = MGGlobalUIConfig.shared.separatorColor,
            separatorHeight: CGFloat = MGGlobalUIConfig.shared.separatorHeight,
            separatorInset: UIEdgeInsets = MGGlobalUIConfig.shared.separatorInset,
            isAutoHeight: Bool = MGGlobalUIConfig.shared.isAutoHeight,
            actionHeight: CGFloat = MGGlobalUIConfig.shared.actionHeight,
            actionMinHeight: CGFloat = MGGlobalUIConfig.shared.actionMinHeight,
            cancelSeparatorColor: UIColor? = MGGlobalUIConfig.shared.cancelSeparatorColor,
            cancelSeparatorHeight: CGFloat = MGGlobalUIConfig.shared.cancelSeparatorHeight
        ) {
            self.titleColor = titleColor
            self.titleFont = titleFont
            self.spacing = spacing
            self.backgroundColor = backgroundColor
            self.selectionBackgroundColor = selectionBackgroundColor
            self.subtitleColor = subtitleColor
            self.subtitleFont = subtitleFont
            self.separatorColor = separatorColor
            self.separatorHeight = separatorHeight
            self.separatorInset = separatorInset
            self.isAutoHeight = isAutoHeight
            self.actionHeight = actionHeight
            self.actionMinHeight = actionMinHeight
            self.cancelSeparatorColor = cancelSeparatorColor
            self.cancelSeparatorHeight = cancelSeparatorHeight
        }
    
    
}
