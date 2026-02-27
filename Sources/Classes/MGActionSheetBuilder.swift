import UIKit
public class MGActionSheetBuilder {
    private var actions: [MGAction] = []
    private var backgroundColor: UIColor = MGGlobalUIConfig.shared.backgroundColor
    private var bottomSheetCornerRadius: CGFloat = MGGlobalUIConfig.shared.bottomSheetCornerRadius
    private var titleViewHeight: CGFloat = 0
    private var titleView: MGTitleViewType? = nil
    private var bottomInset: CGFloat = 0
    
    public init() {}

    @discardableResult
    public func addAction(_ isShow: Bool = true,
                          title: String,
                          subtitle: String? = nil,
                          style: MGAction.Style,
                          config: MGActionConfig? = nil,
                          isEnable: Bool = true,
                          customParam: Any? = nil,
                          handler: ((MGAction) -> Void)? = nil) -> MGActionSheetBuilder
    {
        guard isShow else { return self }
        let action = MGAction(title: title, subTitle: subtitle, style: style, config: config, handler: handler)
        action.customParam = customParam
        action.isEnabled = isEnable
        actions.append(action)
        return self
    }

    @discardableResult
    public func addCancleAction(_ isShow: Bool = true,
                                title: String = "取消",
                                style: MGAction.Style = .cancel,
                                config: MGActionConfig? = nil,
                                handler: ((MGAction) -> Void)? = nil) -> MGActionSheetBuilder
    {
        guard isShow else { return self }
        let action = MGAction(title: title, subTitle: nil, style: style, config: config, handler: handler)
        actions.append(action)
        return self
    }

    @discardableResult
    public func addActions(_ acs: [MGAction]) -> MGActionSheetBuilder {
        actions.append(contentsOf: acs)
        return self
    }
    
    @discardableResult
    public func setBackgroundColor(_ color: UIColor) -> MGActionSheetBuilder {
        backgroundColor = color
        return self
    }
    
    @discardableResult
    public func setBottomSheetCornerRadius(_ radius: CGFloat) -> MGActionSheetBuilder {
        bottomSheetCornerRadius = radius
        return self
    }
    
    @discardableResult
    public func setTitleViewHeight(_ height: CGFloat) -> MGActionSheetBuilder {
        titleViewHeight = height
        return self
    }
    
    @discardableResult
    public func setBottomInset(_ inset: CGFloat) -> MGActionSheetBuilder {
        bottomInset = inset
        return self
    }
    
    @discardableResult
    public func setTitleView(_ view: MGTitleViewType?) -> MGActionSheetBuilder {
        titleView = view
        return self
    }

    @discardableResult
    public func build() -> MGActionSheet {
        let alertController = MGActionSheet(actions: actions)
        alertController.bottomSheetCornerRadius = bottomSheetCornerRadius
        alertController.backgroundColor = backgroundColor
        alertController.titleViewHeight = titleViewHeight
        alertController.titleView = titleView ?? MGTitleView()
        alertController.bottomInset = bottomInset
        alertController.show()
        
        return alertController
    }
}
