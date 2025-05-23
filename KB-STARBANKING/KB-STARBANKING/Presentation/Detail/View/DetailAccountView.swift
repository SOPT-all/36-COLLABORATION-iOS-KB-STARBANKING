//
//  DetailAccountView.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/20/25.
//

import UIKit

import SnapKit
import Then

final class DetailAccountView: UIView {
    
    // MARK: - Properties
    
    private let infoStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 12
        $0.alignment = .fill
        $0.distribution = .fillEqually
    }
    
    private let seperatorView = UIView().then {
        $0.backgroundColor = .kbBlack
        $0.alpha = 0.1
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
        addSubviews(infoStackView, seperatorView)
    }
    
    private func setLayout() {
        
        infoStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.horizontalEdges.equalToSuperview().inset(23)
        }
        
        seperatorView.snp.makeConstraints {
            $0.top.equalTo(infoStackView.snp.bottom).offset(19)
            $0.horizontalEdges.equalToSuperview().inset(23)
            $0.height.equalTo(1)
        }
        
    }
    
    func configure(with detail: DetailResponse) {
        let infoData = [
            ("납입회차", "\(detail.depositCount)"),
            ("계좌상태", detail.accountState),
            ("최종거래일", detail.lastTransaction),
            ("계약기간", "\(detail.contractPeriod)")
        ]

        infoData.forEach { title, value in
            let row = createInfoRow(title: title, value: value)
            infoStackView.addArrangedSubview(row)
        }
    }
    
    private func createInfoRow(title: String, value: String) -> UIView {
        let container = UIView()
        
        let infoLabel = UILabel().then {
            $0.text = title
            $0.textColor = .kbBlack
            $0.font = .font(.body1_16_light)
        }
        
        let valueLabel = UILabel().then {
            $0.text = value
            $0.textColor = .kbBlack
            $0.font = .font(.body1_16_light)
            $0.textAlignment = .right
        }
        
        container.addSubviews(
            infoLabel,
            valueLabel
        )
        
        infoLabel.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        
        valueLabel.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
        }
        
        return container
    }
}
