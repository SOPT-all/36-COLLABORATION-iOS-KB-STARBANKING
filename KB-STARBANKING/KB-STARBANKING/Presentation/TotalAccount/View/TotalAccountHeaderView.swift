//
//  TotalAccountHeaderView.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/17/25.
//

import UIKit

import SnapKit
import Then

final class TotalAccountHeaderView: UIView {
    
    // MARK: - Properties
    
    private let backButton = UIButton().then {
        $0.contentMode = .scaleAspectFit
        $0.setImage(UIImage(named: "ic_arrow_left"), for: .normal)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "전체계좌조회"
        $0.font = .font(.body1_16_light)
        $0.textColor = .kbBlack
    }
    
    private let homeButton = UIButton().then {
        $0.contentMode = .scaleAspectFit
        $0.setImage(UIImage(named: "ic_home"), for: .normal)
    }
    
    private let menuButton = UIButton().then {
        $0.contentMode = .scaleAspectFit
        $0.setImage(UIImage(named: "ic_menu"), for: .normal)
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
            backButton,
            titleLabel,
            homeButton,
            menuButton)
    }
    
    private func setLayout() {
        backButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(backButton.snp.trailing).offset(1)
            $0.width.equalTo(83)
            $0.height.equalTo(22)
            $0.centerY.equalToSuperview()
        }
        
        homeButton.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(158)
            $0.size.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        
        menuButton.snp.makeConstraints {
            $0.leading.equalTo(homeButton.snp.trailing).offset(18)
            $0.size.equalTo(24)
            $0.centerY.equalToSuperview()
        }
    }
}
