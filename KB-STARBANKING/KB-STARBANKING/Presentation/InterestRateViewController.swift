//
//  InterestRateViewController.swift
//  KB-STARBANKING
//
//  Created by hyunwoo on 5/14/25.
//

import UIKit

import SnapKit
import Then

class InterestRateViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [titleLabel,cancelButton,accountLabel,blueLineView,accountNumberLabel,accountDivView,durationLabel,durationInfoLabel,newDateLabel,newDateInfoLabel, endDateLabel,endDateInfoLabel,accountDivView2,basicrateLabel,rateinfoLabel,preferLabel,cautionLabel,caution2Label].forEach{
            view.addSubview($0)
        }
        
        [rateTableHeaderStack, rateTableValueStack].forEach {
            view.addSubview($0)
        }
        
        [termTitleLabel, rateTitleLabel].forEach {
            rateTableHeaderStack.addArrangedSubview($0)
        }
                
        [termValueLabel, rateValueLabel].forEach {
            rateTableValueStack.addArrangedSubview($0)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.leading.equalToSuperview().inset(40)
        }

        cancelButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.top.equalToSuperview().inset(70)
            $0.trailing.equalToSuperview().inset(40)
        }

        accountLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(35)
            $0.leading.equalToSuperview().inset(40)
        }
        
        blueLineView.snp.makeConstraints {
            $0.trailing.equalTo(accountLabel.snp.leading).offset(-8)
            $0.top.equalTo(accountLabel.snp.top)
            $0.width.equalTo(3)
            $0.height.equalTo(41)
            }

        accountNumberLabel.snp.makeConstraints {
            $0.top.equalTo(accountLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(40)
        }
        
        accountDivView.snp.makeConstraints {
            $0.top.equalTo(accountNumberLabel.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(329)
            $0.height.equalTo(1)
        }
        
        durationLabel.snp.makeConstraints {
            $0.top.equalTo(accountDivView.snp.bottom).offset(17)
            $0.leading.equalToSuperview().inset(40)
        }
        
        durationInfoLabel.snp.makeConstraints{
            $0.top.equalTo(accountDivView.snp.bottom).offset(17)
            $0.trailing.equalToSuperview().inset(40)
        }
        
        newDateLabel.snp.makeConstraints {
            $0.top.equalTo(durationLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(40)
        }
        
        newDateInfoLabel.snp.makeConstraints{
            $0.top.equalTo(durationLabel.snp.bottom).offset(11)
            $0.trailing.equalToSuperview().inset(40)
        }
        
        endDateLabel.snp.makeConstraints{
            $0.top.equalTo(newDateLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(40)
        }
        
        endDateInfoLabel.snp.makeConstraints{
            $0.top.equalTo(newDateLabel.snp.bottom).offset(11)
            $0.trailing.equalToSuperview().inset(40)
        }
        
        accountDivView2.snp.makeConstraints{
            $0.top.equalTo(accountDivView.snp.bottom).offset(115)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(329)
            $0.height.equalTo(1)
        }
        
        basicrateLabel.snp.makeConstraints {
            $0.top.equalTo(accountNumberLabel.snp.bottom).offset(170)
            $0.leading.equalToSuperview().inset(30)
        }

        rateinfoLabel.snp.makeConstraints {
            $0.top.equalTo(basicrateLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(30)
        }

        preferLabel.snp.makeConstraints {
            $0.top.equalTo(rateTableValueStack.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(40)
        }
     
        cautionLabel.snp.makeConstraints {
            $0.bottom.equalTo(caution2Label.snp.top).offset(-15)
            $0.leading.equalToSuperview().inset(40)
            $0.trailing.equalToSuperview().inset(40)
        }
    
        caution2Label.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(20)
            $0.leading.equalToSuperview().inset(40)
            $0.trailing.equalToSuperview().inset(40)
        }
        rateTableHeaderStack.snp.makeConstraints {
            $0.top.equalTo(rateinfoLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(44)
        }
                
        rateTableValueStack.snp.makeConstraints {
            $0.top.equalTo(rateTableHeaderStack.snp.bottom)
            $0.leading.trailing.equalTo(rateTableHeaderStack)
            $0.height.equalTo(44)
        }
        
    }

    
    private let titleLabel = UILabel().then{
        $0.text = "계좌이율보기"
        $0.font = UIFont(name: "Pretendard-Regular", size: 16)
        $0.textColor = UIColor(named: "KBBlack")
    }
    
    private let accountLabel = UILabel().then{
        $0.text = "KB내맘대로적금"
        $0.font = UIFont(name: "Pretendard-Regular", size: 15)
        $0.textColor = UIColor(named: "KBBlack")
    }
    
    private let blueLineView = UIView().then{
        $0.backgroundColor = UIColor(named: "Blue3")
    }
    
    private let cancelButton = UIButton().then{
        let image = UIImage(named: "ic_close")
        $0.setImage(image, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
    }
    
    private let accountNumberLabel = UILabel().then{
        $0.text = "016703-04-425292"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        $0.textColor = UIColor(named: "KBBlack")
    }
    
    private let accountDivView = UIView().then{
        $0.backgroundColor = UIColor(named: "KBBlack")
        $0.alpha = 0.1
    }
    
    private let durationLabel = UILabel().then{
        $0.text = "계약기간"
        $0.font = UIFont(name: "Pretendard-Light", size: 16)
        $0.textColor = UIColor(named: "KBBlack")
    }
    
    private let durationInfoLabel = UILabel().then{
        $0.text = "12 개월"
        $0.font = UIFont(name: "Pretendard-Light", size: 16)
        $0.textColor = UIColor(named: "KBBlack")
    }
    
    private let newDateLabel = UILabel().then{
        $0.text = "신규일"
        $0.font = UIFont(name: "Pretendard-Light", size: 16)
        $0.textColor = UIColor(named: "KBBlack")
    }
    
    private let newDateInfoLabel = UILabel().then{
        $0.text = "2025.10.23"
        $0.font = UIFont(name: "Pretendard-Light", size: 16)
        $0.textColor = UIColor(named: "KBBlack")
    }
    
    private let endDateLabel = UILabel().then{
        $0.text = "만기일"
        $0.font = UIFont(name: "Pretendard-Light", size: 16)
        $0.textColor = UIColor(named: "Black")
    }
    
    private let endDateInfoLabel = UILabel().then{
        $0.text = "2025.10.23"
        $0.font = UIFont(name: "Pretendard-Light", size: 16)
        $0.textColor = UIColor(named: "Black")
    }
    
    private let accountDivView2 = UIView().then{
        $0.backgroundColor = UIColor(named: "KBBlack")
        $0.alpha = 0.1
    }
    
    private let basicrateLabel = UILabel().then{
        $0.text = "기본이율"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        $0.textColor = UIColor(named: "KBBlack")
    }
    
    private let rateinfoLabel = UILabel().then{
        $0.text = "(연이율, 세전, 단위: %)"
        $0.font = UIFont(name: "Pretendard-Light", size: 13)
        $0.textColor = UIColor(named: "KBBlack")
        $0.alpha = 0.5
    }
    
    private let rateTableHeaderStack = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
        $0.backgroundColor = UIColor(named: "Gray1")
    }
        
    private let rateTableValueStack = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
    }
    
    private let termTitleLabel = UILabel().then {
        $0.text = "적용기간"
        $0.font = UIFont(name: "Pretendard-Light", size: 14)
        $0.textAlignment = .center
        $0.textColor = UIColor(named: "gray6")
    }
        
    private let rateTitleLabel = UILabel().then {
        $0.text = "기본이율"
        $0.font = UIFont(name: "Pretendard-Light", size: 14)
        $0.textAlignment = .center
        $0.textColor = UIColor(named: "gray6")
    }

    private let termValueLabel = UILabel().then {
        $0.text = "2025.04.23~2025.10.22"
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.textAlignment = .center
        $0.textColor = UIColor(named: "Black")
    }
        
    private let rateValueLabel = UILabel().then {
        $0.text = "2.3"
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.textAlignment = .center
        $0.textColor = UIColor(named: "KBBlack")
    }
    
    private let preferLabel = UILabel().then{
        $0.text = "우대이율"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        $0.textColor = UIColor(named: "KBBlack")
    }
    
    private let cautionLabel = UILabel().then{
        $0.text = "이율정보는 조회시점 현재를 기준으로 조회된 \n내용이며 만기 시에 최종 확정됩니다."
        $0.font = UIFont(name: "Pretendard-Light", size: 14)
        $0.textColor = UIColor(named: "gray6")
        $0.numberOfLines = 2
    }
    
    private let caution2Label = UILabel().then{
        $0.text = "중도 해지할 경우 중도해지이율이 적용되므로 \n유의하시기 바랍니다. "
        $0.font = UIFont(name: "Pretendard-Light", size: 14)
        $0.textColor = UIColor(named: "gray6")
        $0.numberOfLines = 2
    }

}
