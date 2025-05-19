//
//  AccountInfo.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/16/25.
//

import UIKit

import SnapKit

class AccountInfo: UIView {
    
    private let accountNameLabel: UILabel = {
        let label = UILabel()
        label.text = "KB내맘대로적금"
        label.font = .font(.body1_16_light)
        label.textColor = .color(.kbBlack)
        return label
    }()
    
    private let editIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .icPencil
        return imageView
    }()
    
    private let accountNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "016703-04-425292"
        label.font = .font(.title2_18_semibold)
        label.textColor = .color(.kbBlack)
        return label
    }()
    
    private let settingButton: UIButton = {
        let button = UIButton()
        button.setImage(.icSettings, for: .normal)
        return button
    }()
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        let number = "10,000", unit = " 원"
        let fullText = number + unit
        let attributedText = NSMutableAttributedString(string: fullText)
        attributedText.addAttributes([.font: UIFont.font(.title1_24_light)], range: NSRange(location: 0, length: fullText.count))
        attributedText.addAttribute(.font, value: UIFont.font(.title1_24_semibold), range: NSRange(location: 0, length: number.count))
        label.attributedText = attributedText
        return label
    }()
    
    private let ddaylabel: UILabel = {
        let label = UILabel()
        label.text = "D-183"
        label.font = .font(.caption3_11_medium)
        label.textAlignment = .center
        label.backgroundColor = .color(.gray8)
        label.textColor = .kbWhite
        label.clipsToBounds = true
        label.layer.cornerRadius = 11
        return label
    }()
    
    private let expirationDateProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = .color(.yellow3)
        progressView.trackTintColor = .color(.gray1)
        progressView.progress = 0.3
        progressView.layer.borderColor = UIColor.color(.gray4).cgColor
        progressView.layer.cornerRadius = 5
        progressView.layer.borderWidth = 1
        progressView.clipsToBounds = true
        return progressView
    }()
    
    private let newDateLabel: UILabel = {
        let label = UILabel()
        label.text = "신규일 2025.04.23"
        label.font = .font(.caption2_12_light)
        label.textColor = .color(.gray6)
        return label
    }()
    
    private let expirationDateLabel: UILabel = {
        let label = UILabel()
        label.text = "만기일 2025.10.23"
        label.font = .font(.caption2_12_light)
        label.textColor = .color(.gray6)
        return label
    }()
    
    private let depositButton: UIButton = {
        let button = UIButton()
        button.setTitle("입금", for: .normal)
        button.setTitleColor(.color(.kbBlack), for: .normal)
        button.titleLabel?.font = .font(.body3_14_light)
        button.backgroundColor = .color(.gray3)
        button.layer.cornerRadius = 2
        button.clipsToBounds = true
        return button
    }()
    
    private let expectClosingButton: UIButton = {
        let button = UIButton()
        button.setTitle("해지예상조회", for: .normal)
        button.setTitleColor(.color(.kbBlack), for: .normal)
        button.titleLabel?.font = .font(.body3_14_light)
        button.backgroundColor = .color(.gray3)
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
        self.backgroundColor = .color(.kbWhite)
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
}
