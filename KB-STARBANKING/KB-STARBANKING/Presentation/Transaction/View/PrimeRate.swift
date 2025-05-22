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
        label.font = .font(.subtitle1_18_semibold)
        label.textColor = .kbBlack
        label.numberOfLines = 2
        return label
    }()
    
    private let subDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.body3_14_light)
        label.textColor = .gray6
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
        label.font = .font(.body2_15_semibold)
        label.textColor = .kbBlack
        return label
    }()
    
    private let firstDividerView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.gray5.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray6
        label.font = .font(.body3_14_medium)
        return label
    }()
    
    private let paymentBottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray1
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
        label.textColor = .gray6
        label.font = .font(.body3_14_light)
        return label
    }()
    
    private let secondDividerView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.gray5.cgColor
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
        label.textColor = .kbBlack
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
        label.textColor = .gray6
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
        self.backgroundColor = .kbWhite
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
    
    func configure(with transaction: TransactionResponse) {
        guard let firstDeposit = transaction.deposits.first else { return }
        
        descriptionLabel.text = makeDescriptionText(rate: transaction.preferentialRate)
        subDescriptionLabel.text = makeSubDescriptionText(endDate: transaction.endDate, maxRate: transaction.maxAppliedRate)
        countLabel.text = makeCountText(firstDeposit.count)
        updateDateLabel(with: firstDeposit.depositDate)
        updatePaymentItems(deposit: firstDeposit)
    }
    
    private func makeDescriptionText(rate: String) -> String {
        return "현재 적용 중인 우대금리는\n연 \(rate)%에요"
    }
    
    private func formatDate(_ dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy.MM.dd"
        inputFormatter.locale = Locale(identifier: "ko_KR")
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yy년 M월 d일"
        outputFormatter.locale = Locale(identifier: "ko_KR")
        
        if let date = inputFormatter.date(from: dateString) {
            return outputFormatter.string(from: date)
        }
        
        return dateString
    }
    
    private func makeSubDescriptionText(endDate: String, maxRate: String) -> String {
        return """
        \(formatDate(endDate))까지 123,900원 모을 수 있어요.
        해당 상품의 최고 적용금리는 연 \(maxRate)%입니다.
        """
    }
    
    private func makeCountText(_ count: Int) -> String {
        return "\(count)회차"
    }
    
    private func updateDateLabel(with date: String) {
        dateLabel.text = "\(date.prefix(7))월분"
    }
    
    private func updatePaymentItems(deposit: Deposits) {
        let items: [(String, String)] = [
            ("납입일자", deposit.depositDate),
            ("납입금액", "\(deposit.payment) 원"),
            ("납입 후 잔액", "\(deposit.afterPaymentBalance) 원"),
            ("적금방식", "1일 1회 직접 입금"),
            ("적용금리", "연 \(deposit.appliedRate)%")
        ]
        
        items.forEach { title, value in
            let hStack = UIStackView()
            hStack.axis = .horizontal
            hStack.distribution = .equalSpacing
            hStack.widthAnchor.constraint(equalToConstant: 295).isActive = true
            
            let titleLabel = UILabel()
            titleLabel.text = title
            titleLabel.font = .font(.body2_15_light)
            titleLabel.textColor = .gray6
            
            let valueLabel = UILabel()
            valueLabel.font = .font(.body2_15_regular)
            valueLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            
            if title == "납입금액", let range = value.range(of: "\(deposit.payment)") {
                let attributed = NSMutableAttributedString(string: value)
                attributed.addAttribute(.foregroundColor, value: UIColor.blue1, range: NSRange(range, in: value))
                valueLabel.attributedText = attributed
            } else {
                valueLabel.text = value
                valueLabel.textColor = .kbBlack
            }
            
            hStack.addArrangedSubviews(titleLabel, valueLabel)
            paymentStackView.addArrangedSubview(hStack)
        }
    }
}
