//
//  ManageAccountView.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/20/25.
//

import UIKit

import SnapKit
import Then

final class ManageAccountView: UIView {
    
    var onInterestRateTapped: (() -> Void)?
    
    // MARK: - Properties
    
    private let manageLabel = UILabel().then {
        $0.text = "관리하기"
        $0.textColor = .kbBlack
        $0.font = .font(.title2_18_semibold)
    }
    
    private let itemStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
    }
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setInfoRows()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setting
    
    private func setUI() {
        addSubviews(manageLabel, itemStackView)
    }
    
    private func setLayout() {
        manageLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(7)
            $0.horizontalEdges.equalToSuperview()
        }
        
        itemStackView.snp.makeConstraints {
            $0.top.equalTo(manageLabel.snp.bottom).offset(1)
            $0.horizontalEdges.equalToSuperview()
        }
    }
    
    private func setInfoRows() {
        let infos = ["상품안내", "계좌이율 보기", "자동이체 등록",
                     "상품만기 알림서비스 신청/해지", "자동재예치(재가입)/통지여부", "만기예금 편리입금 서비스"]
        
        for (index, info) in infos.enumerated() {
            let isLast = index == infos.count - 1
            let infoView = makeItemView(info: info, isLast: isLast)
            itemStackView.addArrangedSubview(infoView)
        }
    }
    
    private func makeItemView(info: String, isLast: Bool) -> UIView {
        let container = UIView()
        
        let texInfoLabel = UILabel().then {
            $0.text = info
            $0.textColor = .kbBlack
            $0.font = .font(.body1_16_light)
        }
        
        let arrowRightButton = UIButton().then {
            $0.contentMode = .scaleAspectFit
            $0.setImage(.icArrowRight, for: .normal)
            $0.tag = info.hashValue
            $0.addTarget(self, action: #selector(arrowTapped(_:)), for: .touchUpInside)
        }
        
        let seperatorView = UIView().then {
            $0.backgroundColor = .kbBlack
            $0.alpha = isLast ? 0 : 0.1
        }
        
        container.addSubviews(
            texInfoLabel,
            arrowRightButton,
            seperatorView
        )
        
        container.snp.makeConstraints {
            $0.height.equalTo(60)
        }
        
        texInfoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(19)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(22)
        }
        
        arrowRightButton.snp.makeConstraints {
            $0.centerY.equalTo(texInfoLabel)
            $0.trailing.equalToSuperview()
            $0.size.equalTo(24)
        }
        
        seperatorView.snp.makeConstraints {
            $0.top.equalTo(texInfoLabel.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        return container
    }
    
    @objc private func arrowTapped(_ sender: UIButton) {
        if sender.tag == "계좌이율 보기".hashValue {
            onInterestRateTapped?()
        }
    }
}
