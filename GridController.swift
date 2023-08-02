//
//  GridController.swift
//  Test123
//
//  Created by shivam kumar on 02/08/23.
//

import UIKit

class GridController: UIViewController {
    
    var numberOfGrid: Int = 0
    let screenWidth = UIScreen.main.bounds.width
    
    let layout = UICollectionViewFlowLayout()
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(GridCell.self, forCellWithReuseIdentifier: "GridCell")
        collectionView.dataSource = self
        collectionView.backgroundColor = .lightGray
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let width = screenWidth/CGFloat(numberOfGrid)
        layout.itemSize = CGSize(width: width, height: 50)
        layout.minimumInteritemSpacing = 0
        self.view.backgroundColor = .white
        self.collectionView.backgroundColor = .blue
        self.view.addSubview(self.collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }

}

extension GridController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfGrid
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfGrid
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else { return UICollectionViewCell() }
        let row = indexPath.section
        let column = indexPath.row
        if row == 0 || row == numberOfGrid - 1 {
            cell.someView.backgroundColor = .systemPink
        } else if column == 0 || column == numberOfGrid - 1 {
            cell.someView.backgroundColor = .systemPink
        } else if column == row {
            cell.someView.backgroundColor = .systemPink
        } else if column + row == numberOfGrid - 1 {
            cell.someView.backgroundColor = .systemPink
        }
        return cell
    }
}

class GridCell: UICollectionViewCell {
    
    lazy var someView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 10
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(someView)
        NSLayoutConstraint.activate([
            someView.topAnchor.constraint(equalTo: self.topAnchor),
            someView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            someView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            someView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
