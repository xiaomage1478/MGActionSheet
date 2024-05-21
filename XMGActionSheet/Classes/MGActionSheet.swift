import FloatingBottomSheet

public final class MGActionSheet: UIViewController, FloatingBottomSheetPresentable {
    public var bottomInset: CGFloat {
        Ces.bottomSafeAreaHeight
    }
    
    public var bottomSheetHeight: CGFloat = 300

    public var bottomSheetScrollable: UIScrollView? {
        tableView
    }

    public var bottomSheetInsets: NSDirectionalEdgeInsets {
        .init(top: -24, leading: 0, bottom: 0, trailing: 0)
    }
    
    public var allowsDragToDismiss: Bool {
        false
    }
    
    public var bottomSheetHandleColor: UIColor {
        .clear
    }
    
    public func shouldRespond(to panGestureRecognizer: UIPanGestureRecognizer) -> Bool {
        false
    }
    
    public private(set) var actions: [MGAction]
    
    public init(actions: [MGAction]) {
        self.actions = actions
        super.init(nibName: nil, bundle: nil)
        resortActions()
    }
    
    let cellReuserID = "MGActionCell"
    let cellCancelID = "MGCancelActionCell"
    let maxHeight = Ces.height * 0.7
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MGActionCell.self, forCellReuseIdentifier: cellReuserID)
        tableView.register(MGCancelActionCell.self, forCellReuseIdentifier: cellCancelID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        updateBottomSheetHeight()
        bottomSheetPerformLayout(animated: true)
    }

    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateBottomSheetHeight()
        bottomSheetPerformLayout(animated: true)
    }
    
    private func resortActions() {
        var newActions = actions
        if let cancelIndex = newActions.firstIndex(where: { $0.style == .cancel }) {
            let cancelAction = newActions.remove(at: cancelIndex)
            newActions.append(cancelAction)
            newActions = newActions.filter { $0.style != .cancel } + [cancelAction]
        }
        actions = newActions
    }

    private func setupTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomInset)
        ])
        
        tableView.reloadData()
    }

    private func updateBottomSheetHeight() {
        tableView.layoutIfNeeded()
        let height = bottomInset + tableView.contentSize.height
        tableView.isScrollEnabled = height > maxHeight
        bottomSheetHeight = min(height, maxHeight)
    }
}

extension MGActionSheet: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        actions.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let action = actions[indexPath.row]
        
        let backgroudView = UIView()
        backgroudView.backgroundColor = action.config.selectionBackgroundColor
        
        if action.style == .cancel {
            guard let cancelCell = tableView.dequeueReusableCell(withIdentifier: cellCancelID, for: indexPath) as? MGCancelActionCell else {
                return UITableViewCell()
            }
            cancelCell.selectedBackgroundView = backgroudView
            cancelCell.config(action)
            return cancelCell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuserID, for: indexPath) as? MGActionCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = action.isEnabled ? .default : .none
        cell.selectedBackgroundView = backgroudView
        
        var lastIndex = actions.count - 1
        if let cancelIndex = actions.firstIndex(where: { $0.style == .cancel }) {
            lastIndex = cancelIndex - 1
        }
        
        cell.bottomLine.isHidden = indexPath.row == lastIndex
        cell.config(action)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let action = actions[indexPath.row]
        guard action.isEnabled else { return }
        dismiss(animated: true) {
            action.handle?(action)
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let action = actions[indexPath.row]
        return action.config.isAutoHeight ? UITableView.automaticDimension : max(action.config.actionMinHeight, action.config.actionHeight)
    }
}

public extension MGActionSheet {
    func show() {
        Ces.topViewController?.presentFloatingBottomSheet(self)
    }
}
