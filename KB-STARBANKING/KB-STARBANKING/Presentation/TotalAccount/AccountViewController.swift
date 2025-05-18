//
//  AccountViewController.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/19/25.
//

import UIKit

final class AccountViewController: UIViewController {
    
    // MARK: - Properties
    
    private let dummyData = [
           ("KB맑은하늘적금", "512601-01-250726", "2025.04.23", "2025.10.23 (D-183)", "10,000"),
           ("KB내맘대로적금(정액)", "016703-04-425292", "2025.04.23", "2025.10.23 (D-183)", "10,000")
       ]
    
    public let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 345, height: 252)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .kbWhite
        return collectionView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setDelegate()
    }
    
    // MARK: - UI Setting
    private func setUI() {
        view.addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(520)
        }
    }
    
    private func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AccountCell.self, forCellWithReuseIdentifier: AccountCell.identifier)
    }
}

// MARK: - UICollectionViewDataSource

extension AccountViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountCell.identifier, for: indexPath) as? AccountCell else {
            return UICollectionViewCell()
        }
        
        let data = dummyData[indexPath.item]
        cell.configure(
            name: data.0,
            account: data.1,
            newDate: data.2,
            endDate: data.3,
            dday: data.3.components(separatedBy: " ").last ?? "",
            balance: data.4
        )
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension AccountViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 여기에 셀 선택 시 동작 작성
    }
}
