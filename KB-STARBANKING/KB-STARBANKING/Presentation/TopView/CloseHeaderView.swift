//
//  CloseHeaderView.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/22/25.
//

import UIKit

import SnapKit
import Then

final class CloseHeaderView: UIView {
    
    // MARK: - Properties
    
    private let headerView = UIView().then {
        $0.backgroundColor = .kbWhite
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.font = .font(.body1_16_light)
        $0.textColor = .kbBlack
    }
    
    private let xButton = UIButton().then {
        $0.setImage(.icClose, for: .normal)
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
        addSubview(headerView)
        headerView.addSubviews(titleLabel, xButton)
    }
    
    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(19)
        }
        
        xButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-19)
            $0.size.equalTo(24)
        }
    }
}
