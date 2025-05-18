//
//  RateViewController.swift
//  KB-STARBANKING
//
//  Created by hyunwoo on 5/16/25.
//

import UIKit

import SnapKit
import Then

class RateViewController: UIViewController {
    
    final let InterItemSpacing: CGFloat = 10
    final let cellHeight: CGFloat = 212
    final let cellWidth: CGFloat = 160
    
    private var rateData = RateData.dummy()
    
    private let preferLabel = UILabel().then{
        $0.text = "우대이율"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        $0.textColor = UIColor(named: "KBBlack")
    }
    
    private lazy var layout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
//        $0.minimumLineSpacing = 16
//        $0.minimumInteritemSpacing = 12
//        $0.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
        $0.backgroundColor = .white
        }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(collectionView)
        view.backgroundColor = .white
        setLayout()
        register()
        setDelegate()
    }
    
    private func setLayout() {

        [preferLabel,collectionView].forEach {
            view.addSubview($0)
        }
        
        preferLabel.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(preferLabel.snp.bottom).offset(15)
            $0.height.equalTo(cellHeight)
        }
    }
    
    private func register() {
        collectionView.register(
            RateViewCell.self,
            forCellWithReuseIdentifier: RateViewCell.identifier)
    }
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension RateViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return InterItemSpacing
    }
}

extension RateViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rateData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RateViewCell.identifier, for: indexPath) as?
                RateViewCell else {
                return UICollectionViewCell()
            }
        cell.dataBind(rateData[indexPath.item])
        return cell
    }
}

