//
//  BusinessAccountView.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/20/25.
//

import UIKit

import SnapKit
import Then

final class BusinessAccountView: UIView {
    
    // MARK: - Properties
    
    private let wonImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "ic_won")
    }
    
    private let shortCutLabel = UILabel().then {
        $0.text = "사업자계좌 조회 바로가기"
        $0.font = .font(.body3_14_medium)
        $0.textColor = .kbBlack
    }
    
    private let companyLabel = UILabel().then {
        $0.text = "KB스타기업뱅킹"
        $0.font = .font(.body3_14_light)
        $0.textColor = .kbBlack
    }
    
    private let arrowRightButton = UIButton().then {
        $0.contentMode = .scaleAspectFit
        $0.setImage(UIImage(named: "ic_arrow_right"), for: .normal)
    }
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setting
    
    private func setUI() {
        addSubviews(
            wonImageView,
            shortCutLabel,
            companyLabel,
            arrowRightButton
        )
    }
    
    private func setLayout() {
        wonImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(23)
        }
        
        shortCutLabel.snp.makeConstraints {
            $0.leading.equalTo(wonImageView.snp.trailing).offset(11)
            $0.centerY.equalToSuperview()
        }
        
        companyLabel.snp.makeConstraints {
            $0.top.equalTo(shortCutLabel.snp.bottom).offset(4)
            $0.leading.equalTo(shortCutLabel)
        }
        
        arrowRightButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
    }
}
