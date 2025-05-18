//
//  SectionHeaderView.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/18/25.
//

import UIKit

import SnapKit
import Then

final class SectionHeaderView: UIView {
    
    // MARK: - Properties
    
    private let SectionLabel = UILabel().then {
        $0.font = .font(.body2_15_semibold)
        $0.textColor = .kbBlack
    }
    
    private let moneyLabel = UILabel().then {
        $0.font = .font(.body2_15_semibold)
        $0.textColor = .kbBlack
    }
    
    private let wonLabel = UILabel().then {
        $0.text = "원"
        $0.font = .font(.body1_16_light)
        $0.textColor = .kbBlack
    }
    
    private let arrowUpButton = UIButton().then {
        $0.contentMode = .scaleAspectFit
        $0.setImage(UIImage(named: "ic_arrow_up"), for: .normal)
    }
    
    // MARK: - Life Cycle
    
    init(title: String, backgroundColor: UIColor, isDeposit: Bool) {
        super.init(frame: .zero)
        
        SectionLabel.text = title
        self.backgroundColor = backgroundColor
        
        if isDeposit {
            moneyLabel.text = "10,000"
            moneyLabel.isHidden = false
            wonLabel.isHidden = false
        } else {
            SectionLabel.textColor = .gray6
            moneyLabel.isHidden = true
            wonLabel.isHidden = true
        }
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setting
    
    private func setUI() {
        addSubviews(
            SectionLabel,
            moneyLabel,
            wonLabel,
            arrowUpButton
        )
        
        layer.cornerRadius = 4
        layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMinXMaxYCorner
        ]
        clipsToBounds = true
    }
    
    private func setLayout() {
        SectionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.centerY.equalToSuperview()
        }
        
        moneyLabel.snp.makeConstraints {
            $0.leading.equalTo(SectionLabel.snp.trailing).offset(155)
            $0.centerY.equalToSuperview()
        }
        
        wonLabel.snp.makeConstraints {
            $0.leading.equalTo(moneyLabel.snp.trailing).offset(1)
            $0.centerY.equalToSuperview()
        }
        
        arrowUpButton.snp.makeConstraints {
            $0.leading.equalTo(wonLabel.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
    }
}
