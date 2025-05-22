//
//  BasicRateView.swift
//  KB-STARBANKING
//
//  Created by hyunwoo on 5/21/25.
//
import UIKit

import SnapKit
import Then

class BasicRateView: UIView {
    
    private let basicrateLabel = UILabel().then {
        $0.text = "기본이율"
        $0.font = .font(.title2_18_semibold)
        $0.textColor = .kbBlack
    }
    
    private let rateinfoLabel = UILabel().then {
        $0.text = "(연이율, 세전, 단위: %)"
        $0.font = .font(.caption1_13_light)
        $0.textColor = .kbBlack
        $0.alpha = 0.5
    }
    
    private let rateTableHeaderStack = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .center
        $0.backgroundColor = .gray1
    }
    
    private let rateTableValueStack = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .center
    }
    
    private let termTitleLabel = UILabel().then {
        $0.text = "적용기간"
        $0.font = .font(.body3_14_light)
        $0.textAlignment = .center
        $0.textColor = .gray6
    }
    
    private let rateTitleLabel = UILabel().then {
        $0.text = "기본이율"
        $0.font = .font(.body3_14_light)
        $0.textAlignment = .center
        $0.textColor = .gray6
    }
    
    private let termValueLabel = UILabel().then {
        $0.text = "2025.04.23~2025.10.22"
        $0.font = .font(.body3_14_light)
        $0.textAlignment = .center
        $0.textColor = .kbBlack
    }
    
    private let rateValueLabel = UILabel().then {
        $0.text = "2.3"
        $0.font = .font(.body3_14_light)
        $0.textAlignment = .center
        $0.textColor = .kbBlack
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUI() {
        addSubviews(basicrateLabel, rateinfoLabel, rateTableHeaderStack, rateTableValueStack)
        rateTableHeaderStack.addArrangedSubviews(termTitleLabel, rateTitleLabel)
        rateTableValueStack.addArrangedSubviews(termValueLabel, rateValueLabel)
    }
    
    private func setLayout() {
        basicrateLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(23)
        }
        
        rateinfoLabel.snp.makeConstraints {
            $0.top.equalTo(basicrateLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(23)
        }
        
        rateTableHeaderStack.snp.makeConstraints {
            $0.top.equalTo(rateinfoLabel.snp.bottom).offset(6)
        }
        
        rateTableValueStack.snp.makeConstraints {
            $0.top.equalTo(rateTableHeaderStack.snp.bottom)
        }
        
        [rateTableHeaderStack, rateTableValueStack].forEach {
            $0.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.width.equalTo(329)
                $0.height.equalTo(44)
            }
        }
        
        termTitleLabel.snp.makeConstraints {
            $0.width.equalTo(230)
        }
        
        rateTitleLabel.snp.makeConstraints {
            $0.width.equalTo(99)
        }
        
        termValueLabel.snp.makeConstraints {
            $0.width.equalTo(230)
        }
        
        rateValueLabel.snp.makeConstraints {
            $0.width.equalTo(99)
        }
    }
}
