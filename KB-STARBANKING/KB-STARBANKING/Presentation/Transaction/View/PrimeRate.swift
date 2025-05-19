//
//  PrimeRate.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/16/25.
//

import UIKit

import SnapKit

class PrimeRate: UIView {
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "현재 적용 중인 우대금리는\n연 6.00%에요"
        label.font = .font(.subtitle1_18_light)
        label.textColor = .color(.kbBlack)
        label.numberOfLines = 2
        return label
    }()
    
    private let subDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "25년 10월 23일까지 123,900원 모을 수 있어요.\n해당 상품의 최고 적용금리는 연 8.00%입니다."
        label.font = .font(.body3_14_light)
        label.textColor = .color(.gray6)
        label.numberOfLines = 2
        return label
    }()
    
    private let suggestionLabel: UILabel = {
        let label = UILabel()
        label.text = "*놓치고 있는 금리가 있어요!"
        label.font = .font(.body3_14_medium)
        label.textColor = .color(.kbBlack)
        return label
    }()
    
    private let suggestionButton: UIButton = {
        let button = UIButton()
        button.setImage(.imgBanner, for: .normal)
        return button
    }()
    
    private let referenceLabel: UILabel = {
        let label = UILabel()
        label.text = "*최고 적용금리 8.00% = 기본금리 2.50% + 퀴즈 풀이 시 5.50%p"
        label.font = .font(.caption2_12_light)
        label.textColor = .color(.gray6)
        return label
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle(){
        self.backgroundColor = .color(.kbWhite)
    }
    
    private func setUI() {
        addSubviews(
            descriptionLabel,
            subDescriptionLabel,
            suggestionLabel,
            suggestionButton,
            referenceLabel
        )
    }
    
    private func setLayout() {
        descriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(38)
            $0.leading.equalToSuperview().offset(20)
        }
        
        subDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(20)
        }
        
        suggestionLabel.snp.makeConstraints {
            $0.top.equalTo(subDescriptionLabel.snp.bottom).offset(320)
            $0.leading.equalToSuperview().offset(20)
        }
        
        suggestionButton.snp.makeConstraints {
            $0.top.equalTo(suggestionLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(54)
        }
        
        referenceLabel.snp.makeConstraints {
            $0.top.equalTo(suggestionButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
        }
    }
}
