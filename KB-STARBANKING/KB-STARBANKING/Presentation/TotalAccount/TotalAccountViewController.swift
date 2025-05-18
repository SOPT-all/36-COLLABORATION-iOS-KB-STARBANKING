//
//  TotalAccountViewController.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/17/25.
//

import UIKit

class TotalAccountViewController: UIViewController {
    
    // MARK: - Properties
    
    private let totalAccountHeaderView = TotalAccountHeaderView()
    private let addBankView = AddBankView()
    private let depositHeader = SectionHeaderView(title: "예금 · 적금", backgroundColor: .blue2, isDeposit: true)
    private let accountView = AccountViewController()
    
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
    }
    
    private func setUI() {
        view.addSubviews(
            totalAccountHeaderView,
            addBankView,
            depositHeader,
            accountView.view
        )
        // 사업자계좌 조회 바로가기 BusinessAccountView
    }
    
    private func setLayout() {
        totalAccountHeaderView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(44)
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
            $0.height.equalTo(44)
        }
        
        accountView.view.snp.makeConstraints {
            $0.top.equalTo(depositHeader.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.height.equalTo(516)
        }
    }
}
