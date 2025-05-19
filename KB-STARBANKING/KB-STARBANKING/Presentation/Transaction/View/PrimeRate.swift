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
    
    private let paymentTopView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray3
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "1회차"
        label.font = .font(.body2_15_semibold)
        label.textColor = .color(.kbBlack)
        return label
    }()
    
    private let firstDividerView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.color(.gray5).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2025.04월분"
        label.textColor = .color(.gray6)
        label.font = .font(.body3_14_medium)
        return label
    }()
    
    private let paymentBottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .color(.gray1)
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    
    private let paymentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 11
        return stackView
    }()
    
    private let placeLabel: UILabel = {
        let label = UILabel()
        label.text = "돈암동"
        label.textColor = .color(.gray6)
        label.font = .font(.body3_14_light)
        return label
    }()
    
    private let secondDividerView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.color(.gray5).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let newLabel: UILabel = {
        let label = UILabel()
        label.text = "신규"
        label.textColor = .gray6
        label.font = .font(.body3_14_light)
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
        setPaymentItems()
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
            paymentTopView,
            paymentBottomView,
            
            suggestionLabel,
            suggestionButton,
            referenceLabel
        )
        
        paymentTopView.addSubviews(countLabel, firstDividerView, dateLabel)
        paymentBottomView.addSubviews(paymentStackView,  placeLabel, secondDividerView, newLabel)
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
        
        paymentTopView.snp.makeConstraints {
            $0.top.equalTo(subDescriptionLabel.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(44)
        }
        
        countLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        firstDividerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(countLabel.snp.trailing).offset(9)
            $0.width.equalTo(1)
            $0.height.equalTo(15)
        }
        
        dateLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(firstDividerView.snp.trailing).offset(9)
        }
        
        paymentBottomView.snp.makeConstraints {
            $0.top.equalTo(paymentTopView.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(220)
        }
        
        paymentStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(154)
        }
        
        placeLabel.snp.makeConstraints {
            $0.top.equalTo(paymentStackView.snp.bottom).offset(16)
            $0.trailing.equalTo(secondDividerView.snp.leading).offset(-9)
        }
        
        secondDividerView.snp.makeConstraints {
            $0.centerY.equalTo(placeLabel)
            $0.trailing.equalTo(newLabel.snp.leading).offset(-9)
            $0.width.equalTo(1)
            $0.height.equalTo(15)
        }
        
        newLabel.snp.makeConstraints {
            $0.centerY.equalTo(placeLabel)
            $0.trailing.equalToSuperview().offset(-20)
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
    
    private func setPaymentItems() {
        let items: [(String, String)] = [
            ("납입일자", "2025.04.23"),
            ("납입금액", "10,000 원"),
            ("납입 후 잔액", "10,000 원"),
            ("적금방식", "1일 1회 직접 입금"),
            ("적용금리", "연 6.00%")
        ]
        
        items.forEach { title, value in
            let hStack = UIStackView()
            hStack.axis = .horizontal
            hStack.distribution = .equalSpacing
            hStack.widthAnchor.constraint(equalToConstant: 295).isActive = true
            
            let titleLabel = UILabel()
            titleLabel.text = title
            titleLabel.font = .font(.body2_15_light)
            titleLabel.textColor = .color(.gray6)
            
            let valueLabel = UILabel()
            valueLabel.text = value
            valueLabel.font = .font(.body2_15_regular)
            valueLabel.textColor = .color(.kbBlack)
            valueLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            
            hStack.addArrangedSubview(titleLabel)
            hStack.addArrangedSubview(valueLabel)
            
            paymentStackView.addArrangedSubview(hStack)
        }
    }
    
}
