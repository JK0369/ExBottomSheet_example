//
//  ViewController.swift
//  ExBottomSheet
//
//  Created by 김종권 on 2023/02/02.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 12
    }
    private let button1 = UIButton(type: .system).then {
        $0.setTitle("touch pass 바텀시트 오픈", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.setTitleColor(.blue, for: .normal)
    }
    private let button2 = UIButton(type: .system).then {
        $0.setTitle("touch block 바텀시트 오픈", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.setTitleColor(.blue, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        [button1, button2].forEach(stackView.addArrangedSubview(_:))
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.centerX.equalToSuperview()
        }
        
        button1.addTarget(self, action: #selector(tap1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(tap2), for: .touchUpInside)
    }
    
    @objc private func tap1() {
        let bottomSheetViewController = BottomSheetViewController(isTouchPassable: true, contentViewController: MyViewController())
        present(bottomSheetViewController, animated: true)
    }
    
    @objc private func tap2() {
        let bottomSheetViewController = BottomSheetViewController(isTouchPassable: false, contentViewController: MyViewController())
        present(bottomSheetViewController, animated: true)
    }
}

// ScrollableViewController: 클라이언트 코드에서 해당 프로토콜에 명시된 인터페이스에 접근
final class MyViewController: UIViewController, ScrollableViewController {
    private let tableView = SelfSizingTableView(maxHeight: UIScreen.main.bounds.height * 0.7).then {
        $0.allowsSelection = false
        $0.backgroundColor = UIColor.clear
        $0.separatorStyle = .none
        $0.bounces = true
        $0.showsVerticalScrollIndicator = true
        $0.contentInset = .zero
        $0.indicatorStyle = .black
        $0.estimatedRowHeight = 34.0
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    var scrollView: UIScrollView {
        tableView
    }
        
    init() {
        super.init(nibName: nil, bundle: nil)
        setUpView()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tableView.dataSource = self
    }
}

extension MyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "cell\(indexPath.row)"
        return cell
    }
}
