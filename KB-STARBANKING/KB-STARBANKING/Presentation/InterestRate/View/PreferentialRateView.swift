//
//  PreferentialRateView.swift
//  KB-STARBANKING
//
//  Created by hyunwoo on 5/21/25.
//

import UIKit

import SnapKit
import Then

class PreferentialRateView: UIView {
    
    private var rateData: [PreferentialRate] = []
    private var savingAccountName: String = ""
    
    private let preferLabel = UILabel().then {
        $0.text = "우대이율"
        $0.font = .font(.title2_18_semibold)
        $0.textColor = .kbBlack
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let firstSquareView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray6
        return view
    }()
    
    private let cautionLabel = UILabel().then {
        $0.text = "이율정보는 조회시점 현재를 기준으로 조회된 \n내용이며 만기 시에 최종 확정됩니다."
        $0.font = .font(.body3_14_light)
        $0.textColor = .gray6
        $0.numberOfLines = 2
    }
    
    private let secondSquareView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray6
        return view
    }()
    
    private let caution2Label = UILabel().then {
        $0.text = "중도 해지할 경우 중도해지이율이 적용되므로 \n유의하시기 바랍니다. "
        $0.font = .font(.body3_14_light)
        $0.textColor = .gray6
        $0.numberOfLines = 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(preferLabel, collectionView, firstSquareView, cautionLabel, secondSquareView, caution2Label)
    }
    
    private func setLayout() {
        preferLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(23)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(preferLabel.snp.bottom).offset(17)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(212)
        }
        
        firstSquareView.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(23)
            $0.size.equalTo(3)
        }
        
        cautionLabel.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(22)
            $0.leading.equalTo(firstSquareView.snp.trailing).offset(8)
        }
        
        secondSquareView.snp.makeConstraints {
            $0.top.equalTo(firstSquareView.snp.bottom).offset(36)
            $0.leading.equalToSuperview().offset(23)
            $0.size.equalTo(3)
        }
        
        caution2Label.snp.makeConstraints {
            $0.top.equalTo(cautionLabel.snp.bottom).offset(7)
            $0.leading.equalTo(secondSquareView.snp.trailing).offset(8)
        }
    }
    
    private func setCollectionView() {
        collectionView.register(RateViewCell.self, forCellWithReuseIdentifier: RateViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configure(with interestrate: InterestRateResponse) {
        self.savingAccountName = interestrate.savingAccountName
        self.rateData = interestrate.preferentialRates
        collectionView.reloadData()
    }
}

extension PreferentialRateView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 212)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 23, bottom: 0, right: 23)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}

extension PreferentialRateView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return rateData.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RateViewCell.identifier,
            for: indexPath
        ) as? RateViewCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(savingAccountName: savingAccountName, rate: rateData[indexPath.row])
        
        return cell
    }
}
