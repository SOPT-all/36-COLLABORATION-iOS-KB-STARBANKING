//
//  NavigationView.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/17/25.
//

import UIKit

import SnapKit
import Then

final class NavigationView: UIView {
    
    var onBackButtonTapped: (() -> Void)?
    
    // MARK: - Properties
    
    private let navigationView = UIView().then {
        $0.backgroundColor = .kbWhite
    }
    
    private let backButton = UIButton().then {
        $0.setImage(.icArrowLeft, for: .normal)
        $0.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.font = .font(.body1_16_light)
        $0.textColor = .kbBlack
    }
    
    private let homeButton = UIButton().then {
        $0.setImage(.icHome, for: .normal)
    }
    
    private let menuButton = UIButton().then {
        $0.setImage(.icMenu, for: .normal)
    }
    
    // MARK: - Life Cycle
    
    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        
        setUI()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setting
    
    private func setUI() {
        addSubview(navigationView)
        navigationView.addSubviews(backButton,
                                   titleLabel,
                                   homeButton,
                                   menuButton)
    }
    
    private func setLayout() {
        navigationView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        backButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(19)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(backButton.snp.trailing).offset(4)
        }
        
        menuButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-19)
            $0.size.equalTo(24)
        }
        
        homeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(menuButton.snp.leading).offset(-18)
            $0.size.equalTo(24)
        }
    }
    
    @objc private func backButtonTapped() {
        onBackButtonTapped?()
    }
}
