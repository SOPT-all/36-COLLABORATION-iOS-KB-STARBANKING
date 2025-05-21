//
//  TransactionViewController.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/15/25.
//

import UIKit

import SnapKit
import Then

class TransactionViewController: UIViewController {
    
    private let navigationView = NavigationView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let accountInfo = AccountInfo()
    private let primeRate = PrimeRate()
    
    private let emptyView = UIView().then {
        $0.backgroundColor = .gray1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        view.backgroundColor = .kbWhite
        scrollView.showsVerticalScrollIndicator = false
    }
    
    private func setUI() {
        view.addSubviews(navigationView, scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(accountInfo, emptyView, primeRate)
    }
    
    private func setLayout(){
        navigationView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(-40)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom).offset(18)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalTo(scrollView)
        }
        
        accountInfo.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(329)
        }
        
        emptyView.snp.makeConstraints {
            $0.top.equalTo(accountInfo.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(11)
        }
        
        primeRate.snp.makeConstraints {
            $0.top.equalTo(emptyView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(524)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
}
