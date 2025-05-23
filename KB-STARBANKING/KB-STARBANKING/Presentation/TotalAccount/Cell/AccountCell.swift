//
//  AccountCell.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/19/25.
//

import UIKit

import SnapKit
import Then

final class AccountCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private let nameLabel = UILabel().then {
        $0.font = .font(.body1_16_light)
        $0.textColor = .kbBlack
    }
    
    private let accountNumberLabel = UILabel().then {
        $0.font = .font(.body2_15_semibold)
        $0.textColor = .kbBlack
    }
    
    private let copyButton = UIButton().then {
        $0.setImage(.icCopy, for: .normal)
    }
    
    private let newLabel = UILabel().then {
        $0.font = .font(.body3_14_light)
        $0.textColor = .gray6
    }
    
    private let newDateLabel = UILabel().then {
        $0.font = .font(.body2_15_regular)
        $0.textColor = .gray6
    }
    
    private let endLabel = UILabel().then {
        $0.font = .font(.body3_14_light)
        $0.textColor = .gray6
    }
    
    private let endDateLabel = UILabel().then {
        $0.font = .font(.body2_15_regular)
        $0.textColor = .gray6
    }
    
    private let DdayLabel = UILabel().then {
        $0.font = .font(.body2_15_light)
        $0.textColor = .gray6
    }
    
    // moneyLabel과 연동
    private let balanceLabel = UILabel().then {
        $0.font = .font(.title2_18_semibold)
        $0.textColor = .kbBlack
    }
    
    private let wonLabel = UILabel().then {
        $0.font = .font(.title2_18_light)
        $0.textColor = .kbBlack
    }
    
    private let moreButton = UIButton().then {
        $0.setImage(.icMenuVert, for: .normal)
    }
    
    private let depositButton = UIButton().then {
        $0.setTitle("입금", for: .normal)
        $0.setTitleColor(.kbBlack, for: .normal)
        $0.titleLabel?.font = .font(.body3_14_light)
        $0.backgroundColor = .gray3
        $0.layer.cornerRadius = 2
    }
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setting
    func configure(with account: Account) {
        nameLabel.text = account.name
        accountNumberLabel.text = account.accountNumber
        newLabel.text = "신규일"
        newDateLabel.text = account.startDate
        endLabel.text = "만기일"
        endDateLabel.text = account.endDate
        DdayLabel.text = account.dDay
        updateBalanceLabel(with: account.accountBalance)
        wonLabel.text = "원"
    }
    
    private func updateBalanceLabel(with balance: Int) {
        let formatted = NumberFormatter.localizedString(from: NSNumber(value: balance), number: .decimal)
        balanceLabel.text = formatted
    }
    
    private func setStyle() {
        contentView.layer.cornerRadius = 6
        contentView.backgroundColor = .kbWhite
        contentView.layer.borderColor = UIColor.gray4.cgColor
        contentView.layer.borderWidth = 1
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.08
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.masksToBounds = false
    }
    
    private func setUI() {
        contentView.addSubviews(
            nameLabel, accountNumberLabel, copyButton,
            newLabel, newDateLabel, endLabel, endDateLabel, DdayLabel,
            moreButton, balanceLabel, wonLabel, depositButton
        )
    }
    
    private func setLayout() {
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(26)
            $0.leading.equalToSuperview().offset(18)
        }
        
        accountNumberLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
            $0.leading.equalTo(nameLabel)
        }
        
        copyButton.snp.makeConstraints {
            $0.centerY.equalTo(accountNumberLabel)
            $0.leading.equalTo(accountNumberLabel.snp.trailing).offset(3)
            $0.size.equalTo(24)
        }
        
        newLabel.snp.makeConstraints {
            $0.top.equalTo(accountNumberLabel.snp.bottom).offset(19)
            $0.leading.equalTo(nameLabel)
        }
        
        newDateLabel.snp.makeConstraints {
            $0.centerY.equalTo(newLabel)
            $0.leading.equalTo(newLabel.snp.trailing).offset(10)
        }
        
        endLabel.snp.makeConstraints {
            $0.top.equalTo(newDateLabel.snp.bottom).offset(3)
            $0.leading.equalTo(nameLabel)
        }
        
        endDateLabel.snp.makeConstraints {
            $0.centerY.equalTo(endLabel)
            $0.leading.equalTo(endLabel.snp.trailing).offset(10)
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17)
            $0.trailing.equalToSuperview().inset(17)
            $0.size.equalTo(24)
        }
        
        balanceLabel.snp.makeConstraints {
            $0.top.equalTo(moreButton.snp.bottom).offset(110)
            $0.trailing.equalToSuperview().inset(36)
        }
        
        wonLabel.snp.makeConstraints {
            $0.centerY.equalTo(balanceLabel)
            $0.leading.equalTo(balanceLabel.snp.trailing).offset(1)
            $0.trailing.equalToSuperview().inset(18)
        }
        
        depositButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(26)
            $0.leading.trailing.equalToSuperview().inset(19) 
            $0.height.equalTo(38)
        }
    }
}
