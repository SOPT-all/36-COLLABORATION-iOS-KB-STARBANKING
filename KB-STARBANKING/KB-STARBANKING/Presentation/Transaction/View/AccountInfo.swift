//
//  AccountInfo.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/16/25.
//

import UIKit
import SnapKit

class AccountInfo: UIView {
    
    var onSettingButtonTapped: (() -> Void)?
    
    private let accountNameLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.body1_16_light)
        label.textColor = .kbBlack
        return label
    }()
    
    private let editIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .icPencil
        return imageView
    }()
    
    private let accountNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.title2_18_semibold)
        label.textColor = .kbBlack
        return label
    }()
    
    private lazy var settingButton: UIButton = {
        let button = UIButton()
        button.setImage(.icSettings, for: .normal)
        button.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .kbBlack
        return label
    }()
    
    private let ddaylabel: UILabel = {
        let label = UILabel()
        label.font = .font(.caption3_11_medium)
        label.textAlignment = .center
        label.backgroundColor = .gray8
        label.textColor = .kbWhite
        label.clipsToBounds = true
        label.layer.cornerRadius = 11
        return label
    }()
    
    private let expirationDateProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = .yellow3
        progressView.trackTintColor = .gray1
        progressView.layer.borderColor = UIColor.gray4.cgColor
        progressView.layer.cornerRadius = 5
        progressView.layer.borderWidth = 1
        progressView.clipsToBounds = true
        return progressView
    }()
    
    private let newDateLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.caption2_12_light)
        label.textColor = .gray6
        return label
    }()
    
    private let expirationDateLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.caption2_12_light)
        label.textColor = .gray6
        return label
    }()
    
    private let depositButton: UIButton = {
        let button = UIButton()
        button.setTitle("입금", for: .normal)
        button.setTitleColor(.kbBlack, for: .normal)
        button.titleLabel?.font = .font(.body3_14_light)
        button.backgroundColor = .gray3
        button.layer.cornerRadius = 2
        button.clipsToBounds = true
        return button
    }()
    
    private let expectClosingButton: UIButton = {
        let button = UIButton()
        button.setTitle("해지예상조회", for: .normal)
        button.setTitleColor(.kbBlack, for: .normal)
        button.titleLabel?.font = .font(.body3_14_light)
        button.backgroundColor = .gray3
        button.layer.cornerRadius = 2
        button.clipsToBounds = true
        return button
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
            accountNameLabel,
            editIconView,
            accountNumberLabel,
            settingButton,
            balanceLabel,
            ddaylabel,
            expirationDateProgressView,
            newDateLabel,
            expirationDateLabel,
            depositButton,
            expectClosingButton
        )
    }
    
    private func setLayout() {
        accountNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        editIconView.snp.makeConstraints {
            $0.centerY.equalTo(accountNameLabel)
            $0.leading.equalTo(accountNameLabel.snp.trailing)
            $0.size.equalTo(24)
        }
        
        accountNumberLabel.snp.makeConstraints {
            $0.top.equalTo(accountNameLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(20)
        }
        
        settingButton.snp.makeConstraints {
            $0.top.equalTo(accountNameLabel.snp.centerY)
            $0.trailing.equalToSuperview().offset(-20)
            $0.size.equalTo(25)
        }
        
        balanceLabel.snp.makeConstraints {
            $0.top.equalTo(accountNumberLabel.snp.bottom).offset(50)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        ddaylabel.snp.makeConstraints {
            $0.top.equalTo(balanceLabel.snp.bottom).offset(42)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(48)
            $0.height.equalTo(21)
        }
        
        expirationDateProgressView.snp.makeConstraints {
            $0.top.equalTo(ddaylabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(327)
            $0.height.equalTo(10)
        }
        
        newDateLabel.snp.makeConstraints {
            $0.top.equalTo(expirationDateProgressView.snp.bottom).offset(12)
            $0.leading.equalTo(expirationDateProgressView.snp.leading)
        }
        
        expirationDateLabel.snp.makeConstraints {
            $0.centerY.equalTo(newDateLabel)
            $0.trailing.equalTo(expirationDateProgressView.snp.trailing)
        }
        
        depositButton.snp.makeConstraints {
            $0.top.equalTo(expirationDateLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(164)
            $0.height.equalTo(38)
        }
        
        expectClosingButton.snp.makeConstraints {
            $0.top.equalTo(expirationDateLabel.snp.bottom).offset(30)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalTo(164)
            $0.height.equalTo(38)
        }
    }
    
    func configure(with transaction: TransactionResponse) {
        accountNameLabel.text = transaction.savingAccountName
        accountNumberLabel.text = transaction.accountNumber
        updateBalanceLabel(with: transaction.totalBalance)
        ddaylabel.text = transaction.dDay
        newDateLabel.text = "신규일 \(transaction.startDate)"
        expirationDateLabel.text = "만기일 \(transaction.endDate)"
        
        let progress = calculateProgress(from: transaction.startDate, to: transaction.endDate)
        expirationDateProgressView.setProgress(progress, animated: true)
    }
    
    private func updateBalanceLabel(with balance: Int) {
        let balanceString = String(balance).decimalFormatted
        let unit = " 원"
        let fullText = balanceString + unit
        let attributedText = NSMutableAttributedString(string: fullText)
        attributedText.addAttributes([.font: UIFont.font(.title1_24_light)], range: NSRange(location: 0, length: fullText.count))
        attributedText.addAttribute(.font, value: UIFont.font(.title1_24_semibold), range: NSRange(location: 0, length: balanceString.count))
        balanceLabel.attributedText = attributedText
    }
    
    private func calculateProgress(from startDate: String, to endDate: String) -> Float {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        
        guard
            let startDate = dateformatter.date(from: startDate),
            let endDate = dateformatter.date(from: endDate)
        else {
            return 0
        }
        
        let now = Date()
        let totalInterval = endDate.timeIntervalSince(startDate)
        guard totalInterval > 0 else {
            return 1
        }
        
        let elapsed = now.timeIntervalSince(startDate)
        let progress = Float(elapsed / totalInterval)
        return min(max(progress, 0), 1)
    }
    
    @objc private func settingButtonTapped() {
        onSettingButtonTapped?()
    }
}
