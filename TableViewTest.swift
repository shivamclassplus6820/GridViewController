//
//  TableViewTest.swift
//  Test123
//
//  Created by shivam kumar on 27/04/23.
//
//
//import UIKit
//
//class TableViewTest: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    
//    weak var delegate: DataTransfer?
//    
//    lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.register(CellTest.self, forCellReuseIdentifier: "cell")
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.backgroundColor = UIColor.blue
//        return tableView
//    }()
//    
//    var dataSource: [String] = ["Test1", "Test2", "Test3", "Test4", "Test5"]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.addSubview(self.tableView)
//        NSLayoutConstraint.activate([
//            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//        ])
//    }
//    
//    deinit {
//        print("removed")
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        dataSource.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellTest else { return UITableViewCell() }
//        cell.textLabel?.text = dataSource[indexPath.row]
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.dismiss(animated: true)
//        delegate?.dataTransfer(data: dataSource[indexPath.row])
//    }
//    
//    
//
//}
//
//class CellTest: UITableViewCell {
//    
//    static let cellId = "cell"
//    
//    
//    
//}
