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
    
    private let sectionLabel = UILabel().then {
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
        $0.setImage(.icArrowUp, for: .normal)
    }
    
    // MARK: - Life Cycle
    
    init(title: String, backgroundColor: UIColor, isDeposit: Bool) {
        super.init(frame: .zero)
        
        setUI(title: title, backgroundColor: backgroundColor, isDeposit: isDeposit)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setting
    
    private func setUI(title: String, backgroundColor: UIColor, isDeposit: Bool) {
        addSubviews(
            sectionLabel,
            moneyLabel,
            wonLabel,
            arrowUpButton
        )
        
        // 조건에 따른 UI 설정
        sectionLabel.text = title
        self.backgroundColor = backgroundColor
        
        // 예적금의 경우, moneyLabel 보이도록 설정
        configureIsDeposit(isDeposit)
        
        // 왼쪽 상하단에만 모서리 둥글기 적용
        layer.cornerRadius = 4
        layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMinXMaxYCorner
        ]
        clipsToBounds = true
    }
    
    func configure(with totalAccount: TotalAccountResponse) {
        moneyLabel.text = String(totalAccount.totalAccountBalance).decimalFormatted
    }
    
    private func configureIsDeposit(_ isDeposit: Bool) {
        if isDeposit {
            moneyLabel.isHidden = false
            wonLabel.isHidden = false
        } else {
            sectionLabel.textColor = .gray6
            moneyLabel.isHidden = true
            wonLabel.isHidden = true
        }
    }
    
    private func setLayout() {
        sectionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.centerY.equalToSuperview()
        }
        
        moneyLabel.snp.makeConstraints {
            $0.leading.equalTo(sectionLabel.snp.trailing).offset(155)
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
