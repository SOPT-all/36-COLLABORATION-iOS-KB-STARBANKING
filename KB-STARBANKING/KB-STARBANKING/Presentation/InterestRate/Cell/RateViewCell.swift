//
//  RateViewCell.swift
//  KB-STARBANKING
//
//  Created by hyunwoo on 5/16/25.
//

import UIKit

import SnapKit
import Then

class RateViewCell: UICollectionViewCell {
    
    private let yellowTop = UIView().then {
        $0.layer.cornerRadius = 11
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        $0.backgroundColor = .yellow2
    }
    
    private let imageView = UIImageView()
    
    private let nameLabel = UILabel().then {
        $0.font = .font(.body3_14_medium)
        $0.textColor = .kbBlack
        $0.numberOfLines = 2
        $0.lineBreakMode = .byWordWrapping
    }
    
    private let grayBottom = UIView().then {
        $0.layer.cornerRadius = 11
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        $0.backgroundColor = .gray1
    }
    
    private let rateLabel = UILabel().then {
        $0.font = .font(.caption1_13_light)
        $0.text = "우대이율"
        $0.textColor = .kbBlack
        $0.textAlignment = .left
        $0.alpha = 0.4
    }
    
    private let rateValueLabel = UILabel().then {
        $0.font = .font(.caption1_13_light)
        $0.textAlignment = .right
        $0.textColor = .kbBlack
    }
    
    private let periodLabel = UILabel().then {
        $0.font = .font(.caption1_13_light)
        $0.text = "기간"
        $0.textColor = .kbBlack
        $0.textAlignment = .left
        $0.alpha = 0.4
    }
    
    private let periodValueLabel = UILabel().then {
        $0.font = .font(.caption1_13_light)
        $0.textAlignment = .right
        $0.textColor = .kbBlack
    }
    
    private let goButton = UIButton().then {
        $0.setTitle("보러가기", for: .normal)
        $0.titleLabel?.font = .font(.caption1_13_light)
        $0.backgroundColor = .kbWhite
        $0.setTitleColor(.kbBlack, for: .normal)
        $0.layer.cornerRadius = 4
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(yellowTop, grayBottom)
        yellowTop.addSubviews(nameLabel, imageView)
        grayBottom.addSubviews(rateLabel, rateValueLabel, periodLabel, periodValueLabel, goButton)
    }
    
    private func setLayout() {
        yellowTop.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(95)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(136)
            $0.height.equalTo(40)
        }
        
        imageView.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(4)
            $0.bottom.equalToSuperview().inset(4)
            $0.size.equalTo(50)
        }
        
        grayBottom.snp.makeConstraints {
            $0.top.equalTo(yellowTop.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(117)
        }
        
        rateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(12)
        }
        
        rateValueLabel.snp.makeConstraints {
            $0.centerY.equalTo(rateLabel)
            $0.trailing.equalToSuperview().offset(-12)
        }
        
        periodLabel.snp.makeConstraints {
            $0.top.equalTo(rateLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(12)
        }
        
        periodValueLabel.snp.makeConstraints {
            $0.centerY.equalTo(periodLabel)
            $0.trailing.equalToSuperview().offset(-12)
        }
        
        goButton.snp.makeConstraints {
            $0.top.equalTo(periodLabel.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(136)
            $0.height.equalTo(31)
        }
    }
}

extension RateViewCell {
    func dataBind(savingAccountName: String, rate: PreferentialRate) {
        let imageName = "imgCard\(rate.id)"
        
        imageView.image = UIImage(named: imageName)
        nameLabel.text = "\(savingAccountName)\n\(rate.name)"
        rateValueLabel.text = "\(rate.rate)"
        periodValueLabel.text = "\(rate.startDate.toMonthDayFormat()) ~ \(rate.endDate.toMonthDayFormat())"
    }
}
