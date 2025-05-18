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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 11 
        contentView.backgroundColor = .gray1
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static let identifier = "RateViewCell"
    
    private let imageView = UIImageView()
    
    private let nameLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
        $0.textColor = .kbBlack
        $0.numberOfLines = 2
        $0.lineBreakMode = .byWordWrapping
    }
    
    private let rateLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Light", size: 13)
        $0.text = "우대이율"
        $0.textColor = .kbBlack
        $0.textAlignment = .left
        $0.alpha = 0.4
    }
    
    private let rateValueLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Light", size: 13)
        $0.textAlignment = .right
        $0.textColor = .kbBlack
    }
    
    private let periodLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Light", size: 13)
        $0.text = "기간"
        $0.textColor = .kbBlack
        $0.textAlignment = .left
        $0.alpha = 0.4
    }
    
    private let periodValueLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Light", size: 13)
        $0.textAlignment = .right
        $0.textColor = .kbBlack
    }
    
    private let goButton = UIButton().then {
        $0.setTitle("보러가기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Light", size: 13)
        $0.backgroundColor = .kbWhite
        $0.setTitleColor(.kbBlack, for: .normal)
        $0.layer.cornerRadius = 4
    }
    
    private func setLayout() {
        let yellowTop = UIView().then {
            $0.layer.cornerRadius = 11
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            $0.backgroundColor = .yellow2
        }
        contentView.addSubview(yellowTop)
        
        [nameLabel,imageView].forEach {
            yellowTop.addSubview($0)
        }
        
        [rateLabel,rateValueLabel,periodLabel,periodValueLabel,goButton].forEach {
            contentView.addSubview($0)
        }
        
        yellowTop.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(90)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(10)
            $0.trailing.lessThanOrEqualTo(imageView.snp.leading).offset(-8)
            $0.width.equalTo(136)
            $0.height.equalTo(40)
        }
        
        imageView.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(3)
            $0.bottom.equalToSuperview().inset(3)
            $0.width.height.equalTo(50)
        }
        rateLabel.snp.makeConstraints {
            $0.top.equalTo(yellowTop.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(12)
        }
                
        rateValueLabel.snp.makeConstraints {
            $0.centerY.equalTo(rateLabel)
            $0.trailing.equalToSuperview().inset(12)
        }
                
        periodLabel.snp.makeConstraints {
            $0.top.equalTo(rateLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(12)
        }
                
        periodValueLabel.snp.makeConstraints {
            $0.centerY.equalTo(periodLabel)
            $0.trailing.equalToSuperview().inset(12)
        }
        
        goButton.snp.makeConstraints {
            $0.top.equalTo(periodLabel.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(31)
        }
        
    }
}

extension RateViewCell {
    func dataBind(_ rateData: RateData){
        imageView.image = rateData.image
        nameLabel.text = rateData.title
        rateValueLabel.text = rateData.rate
        periodValueLabel.text = rateData.period
    }
    
    func smartSplitTitle(_ title: String) -> String {
        if title.contains("우대이율") {
            let parts = title.components(separatedBy: "우대이율")
            return parts[0] + "\n우대이율"
        }
        return title
    }
}
