//
//  TotalAccountViewController.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/17/25.
//

import UIKit

class TotalAccountViewController: UIViewController {
    
    // MARK: - Properties
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let totalAccountHeaderView = TotalAccountHeaderView()
    private let addBankView = AddBankView()
    private let depositHeader = SectionHeaderView(title: "예금 · 적금", backgroundColor: .blue2, isDeposit: true)
    private let accountView = AccountViewController()
    private let insuranceHeader = SectionHeaderView(title: "보험 · 공제", backgroundColor: .gray3, isDeposit: false)
    private let retirementHeader = SectionHeaderView(title: "퇴직연금", backgroundColor: .gray3, isDeposit: false)
    private let businessAccountView = BusinessAccountView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    // MARK: - UI Setting
    
    private func setStyle() {
        view.backgroundColor = .kbWhite
        scrollView.showsVerticalScrollIndicator = false
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            totalAccountHeaderView,
            addBankView,
            depositHeader,
            accountView.view,
            insuranceHeader,
            retirementHeader,
            businessAccountView
        )
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        totalAccountHeaderView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(19)
            $0.height.equalTo(48)
        }
        
        addBankView.snp.makeConstraints {
            $0.top.equalTo(totalAccountHeaderView.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(24)
        }
        
        depositHeader.snp.makeConstraints {
            $0.top.equalTo(addBankView.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        accountView.view.snp.makeConstraints {
            $0.top.equalTo(depositHeader.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.height.equalTo(516)
        }
        
        insuranceHeader.snp.makeConstraints {
            $0.top.equalTo(accountView.view.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        retirementHeader.snp.makeConstraints {
            $0.top.equalTo(insuranceHeader.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        businessAccountView.snp.makeConstraints {
            $0.top.equalTo(retirementHeader.snp.bottom).offset(23)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(44)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}
