//
//  AccountView.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/19/25.
//

import UIKit

final class AccountView: UIView {
    
    // MARK: - Properties
    
    private var accounts: [Account] = []
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setDelegate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setting
    private func setUI() {
        addSubview(collectionView)
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
    
    public func updateAccounts(_ accounts: [Account]) {
        self.accounts = accounts
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension AccountView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountCell.identifier, for: indexPath) as? AccountCell else {
            return UICollectionViewCell()
        }
        
        let account = accounts[indexPath.item]
        cell.configure(with: account)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension AccountView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 여기에 셀 선택 시 동작 작성
    }
}
