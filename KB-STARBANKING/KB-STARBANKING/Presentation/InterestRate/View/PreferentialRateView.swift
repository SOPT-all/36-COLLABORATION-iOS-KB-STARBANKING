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

    private lazy var interestRateCollectionView = RateViewController().createCollectionView()
    
    private let preferLabel = UILabel().then {
        $0.text = "우대이율"
        $0.font = .font(.title2_18_semibold)
        $0.textColor = .kbBlack
    }

    private let cautionLabel = UILabel().then {
        $0.text = "이율정보는 조회시점 현재를 기준으로 조회된 \n내용이며 만기 시에 최종 확정됩니다."
        $0.font = .font(.body3_14_light)
        $0.textColor = .gray6
        $0.numberOfLines = 2
    }

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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        addSubviews(preferLabel, interestRateCollectionView, cautionLabel, caution2Label)
    }

    private func setLayout() {
        preferLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(46)
            $0.leading.equalToSuperview().inset(23)
        }

        interestRateCollectionView.snp.makeConstraints {
            $0.top.equalTo(preferLabel.snp.bottom).offset(17)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(260)
        }
        
        cautionLabel.snp.makeConstraints {
            $0.top.equalTo(interestRateCollectionView.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(40)
        }
        
        caution2Label.snp.makeConstraints {
            $0.top.equalTo(cautionLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.bottom.equalToSuperview().inset(40)
        }
    }
}
