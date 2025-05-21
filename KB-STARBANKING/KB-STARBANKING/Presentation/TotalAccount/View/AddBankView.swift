//
//  AddBankView.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/18/25.
//

import UIKit

import SnapKit
import Then

final class AddBankView: UIView {
    
    // MARK: - Properties
    
    private let plusButton = UIButton().then {
        $0.contentMode = .scaleAspectFit
        $0.setImage(.icPlus, for: .normal)
    }
    
    private let plusLabel = UILabel().then {
        $0.text = "다른금융등록"
        $0.font = .font(.body3_14_light)
        $0.textColor = .kbBlack
    }
    
    private let splitsButton = UIButton().then {
        $0.contentMode = .scaleAspectFit
        $0.setImage(.icSplits, for: .normal)
    }
    
    private let splitsLabel = UILabel().then {
        $0.text = "목록형"
        $0.font = .font(.body3_14_light)
        $0.textColor = .kbBlack
    }
    
    private let scrollButton = UIButton().then {
        $0.contentMode = .scaleAspectFit
        $0.setImage(.icScroll, for: .normal)
    }
    
    private let scrollLabel = UILabel().then {
        $0.text = "순서변경"
        $0.font = .font(.body3_14_light)
        $0.textColor = .kbBlack
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
            plusButton,
            plusLabel,
            splitsButton,
            splitsLabel,
            scrollButton,
            scrollLabel
        )
    }
    
    private func setLayout() {
        plusButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        
        plusLabel.snp.makeConstraints {
            $0.leading.equalTo(plusButton.snp.trailing)
            $0.width.equalTo(73)
            $0.height.equalTo(20)
            $0.centerY.equalToSuperview()
        }
        
        splitsButton.snp.makeConstraints {
            $0.leading.equalTo(plusLabel.snp.trailing).offset(91)
            $0.size.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        
        splitsLabel.snp.makeConstraints {
            $0.leading.equalTo(splitsButton.snp.trailing)
            $0.width.equalTo(37)
            $0.height.equalTo(20)
            $0.centerY.equalToSuperview()
        }
        
        scrollButton.snp.makeConstraints {
            $0.leading.equalTo(splitsLabel.snp.trailing).offset(13)
            $0.size.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        
        scrollLabel.snp.makeConstraints {
            $0.leading.equalTo(scrollButton.snp.trailing).offset(1)
            $0.width.equalTo(49)
            $0.height.equalTo(20)
            $0.centerY.equalToSuperview()
        }
    }
}
