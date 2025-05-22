//
//  InfoView.swift
//  KB-STARBANKING
//
//  Created by hyunwoo on 5/21/25.
//
import UIKit

import SnapKit
import Then

class InfoView: UIView {

    private let accountLabel = UILabel().then {
        $0.font = .font(.body2_15_light)
        $0.textColor = .kbBlack
    }
    
    private let blueLineView = UIView().then {
        $0.backgroundColor = .blue3
    }

    private let accountNumberLabel = UILabel().then {
        $0.font = .font(.title2_18_semibold)
        $0.textColor = .kbBlack
    }
    
    private let accountDivView = UIView().then {
        $0.backgroundColor = .kbBlack
        $0.alpha = 0.1
    }
    
    private let durationLabel = UILabel().then {
        $0.text = "계약기간"
        $0.font = .font(.body1_16_light)
        $0.alpha = 0.6
        $0.textColor = .kbBlack
    }
    
    private let durationInfoLabel = UILabel().then {
        $0.font = .font(.body1_16_light)
        $0.alpha = 0.8
        $0.textColor = .kbBlack
    }
    
    private let newDateLabel = UILabel().then {
        $0.text = "신규일"
        $0.font = .font(.body1_16_light)
        $0.alpha = 0.6
        $0.textColor = .kbBlack
    }
    
    private let newDateInfoLabel = UILabel().then {
        $0.font = .font(.body1_16_light)
        $0.alpha = 0.8
        $0.textColor = .kbBlack
    }
    
    private let endDateLabel = UILabel().then {
        $0.text = "만기일"
        $0.font = .font(.body1_16_light)
        $0.alpha = 0.6
        $0.textColor = .kbBlack
    }
    
    private let endDateInfoLabel = UILabel().then {
        $0.font = .font(.body1_16_light)
        $0.alpha = 0.8
        $0.textColor = .kbBlack
    }
    
    private let accountDivView2 = UIView().then {
        $0.backgroundColor = .kbBlack
        $0.alpha = 0.1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUI() {
        addSubviews(
            accountLabel,
            blueLineView,
            accountNumberLabel,
            accountDivView,
            durationLabel,
            durationInfoLabel,
            newDateLabel,
            newDateInfoLabel,
            endDateLabel,
            endDateInfoLabel,
            accountDivView2
        )
    }
    
    private func setLayout() {
        accountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalToSuperview().inset(40)
        }
        
        accountNumberLabel.snp.makeConstraints {
            $0.top.equalTo(accountLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(40)
        }

        blueLineView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(19)
            $0.top.equalTo(accountLabel)
            $0.width.equalTo(3)
            $0.height.equalTo(41)
        }
        
        accountDivView.snp.makeConstraints {
            $0.top.equalTo(accountNumberLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }
        
        durationLabel.snp.makeConstraints {
            $0.top.equalTo(accountDivView.snp.bottom).offset(17)
            $0.leading.equalToSuperview().inset(23)
        }
        
        durationInfoLabel.snp.makeConstraints {
            $0.centerY.equalTo(durationLabel)
            $0.trailing.equalToSuperview().inset(23)
        }
        
        newDateLabel.snp.makeConstraints {
            $0.top.equalTo(durationLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(23)
        }
        
        newDateInfoLabel.snp.makeConstraints {
            $0.centerY.equalTo(newDateLabel)
            $0.trailing.equalToSuperview().inset(23)
        }
        
        endDateLabel.snp.makeConstraints {
            $0.top.equalTo(newDateLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(23)
        }
        
        endDateInfoLabel.snp.makeConstraints {
            $0.centerY.equalTo(endDateLabel)
            $0.trailing.equalToSuperview().inset(23)
        }
        
        accountDivView2.snp.makeConstraints {
            $0.top.equalTo(endDateLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(329)
            $0.height.equalTo(1)
        }
    }
    
    func configure(with interestrate: InterestRateResponse){
        accountLabel.text = makeAccountText(name: interestrate.savingAccountName)
        accountNumberLabel.text = makeAccountNumberText(number: interestrate.accountNumber)
        durationInfoLabel.text = makeDurationText(duration: interestrate.contractPeriod)
        newDateInfoLabel.text = makeNewDateText(newDate: interestrate.startDate)
        endDateInfoLabel.text = makeEndDateText(endDate: interestrate.endDate)
    }
    
    private func makeAccountText(name: String) -> String {
        return "\(name)"
    }
    
    private func makeAccountNumberText(number: String) -> String {
        return "\(number)"
    }
    
    private func makeDurationText(duration: Int) -> String {
        return "\(duration)개월"
    }
    
    private func makeNewDateText(newDate: String) -> String {
        return "\(newDate)"
    }
    
    private func makeEndDateText(endDate: String) -> String {
        return "\(endDate)"
    }
}
