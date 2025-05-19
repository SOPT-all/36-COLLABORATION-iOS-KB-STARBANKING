//
//  NavigationView.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/16/25.
//

import UIKit

import SnapKit

class NavigationView: UIView {
    
    private let navigationView = UIView()
    
    private let arrowBackIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .icArrowLeft
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "거래내역조회"
        label.font = .font(.body1_16_light)
        return label
    }()
    
    private let homeIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .icHome
        return imageView
    }()
    
    private let menuIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .icMenu
        return imageView
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
        addSubview(navigationView)
        navigationView.addSubviews(arrowBackIconView, titleLabel, homeIconView, menuIconView)
    }
    
    private func setLayout() {
        navigationView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        arrowBackIconView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(19)
            $0.size.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(arrowBackIconView.snp.trailing).offset(4)
        }
        
        menuIconView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-19)
            $0.size.equalTo(24)
        }
        
        homeIconView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(menuIconView.snp.leading).offset(-18)
            $0.size.equalTo(24)
        }
    }
}
