//
//  DetailInfoView.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/20/25.
//

import UIKit

import SnapKit
import Then

final class DetailInfoView: UIView {
    
    // MARK: - Properties
    
    private let itemStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
    }
    
    private let dividerView = UIView().then {
        $0.backgroundColor = .gray2
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
        addSubviews(
            itemStackView,
            dividerView
        )
    }
    
    private func setLayout() {
        itemStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        dividerView.snp.makeConstraints {
            $0.top.equalTo(itemStackView.snp.bottom).offset(31)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(11)
        }
    }
    
    private func setInfoRows() {
        let infos = ["과세 정보", "대출정보 목록"]
        
        infos.forEach { info in
            let itemView = makeItemView(info: info)
            itemStackView.addArrangedSubview(itemView)
        }
    }
    
    private func makeItemView(info: String) -> UIView {
        let container = UIView()
        
        let texInfoLabel = UILabel().then {
            $0.text = info
            $0.textColor = .kbBlack
            $0.font = .font(.title2_18_semibold)
        }
        
        let arrowDownButton = UIButton().then {
            $0.contentMode = .scaleAspectFit
            $0.setImage(UIImage(named: "ic_arrow_down"), for: .normal)
        }
        
        let seperatorView = UIView().then {
            $0.backgroundColor = .kbBlack
            $0.alpha = 0.1
        }
        
        container.addSubviews(texInfoLabel, arrowDownButton, seperatorView)
        
        texInfoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.bottom.equalToSuperview().inset(22)
            $0.leading.equalToSuperview().offset(23)
            $0.height.equalTo(20)
        }
        
        arrowDownButton.snp.makeConstraints {
            $0.centerY.equalTo(texInfoLabel)
            $0.trailing.equalToSuperview().inset(19)
            $0.size.equalTo(24)
        }
        
        seperatorView.snp.makeConstraints {
            $0.top.equalTo(texInfoLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(23)
            $0.height.equalTo(1)
        }
        
        return container
    }
}
