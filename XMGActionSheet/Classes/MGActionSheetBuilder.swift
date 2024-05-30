
public class MGActionSheetBuilder {
    private var actions: [MGAction] = []

    public init() {}

    @discardableResult
    public func addAction(_ isShow: Bool = true,
                          title: String,
                          subtitle: String? = nil,
                          style: MGAction.Style,
                          config: MGActionConfig? = nil,
                          isEnable: Bool = true,
                          handler: ((MGAction) -> Void)? = nil) -> MGActionSheetBuilder
    {
        guard isShow else { return self }
        let action = MGAction(title: title, subTitle: subtitle, style: style, config: config, handler: handler)
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
    public func build() -> MGActionSheet {
        let alertController = MGActionSheet(actions: actions)
        alertController.bottomSheetCornerRadius = 10
        alertController.show()
        return alertController
    }
}
