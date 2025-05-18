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
    private let addBankView: AddBankView = AddBankView()
    
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
            addBankView
        )
        // 계좌셀 AccountCell
        // 보험공제, 퇴직연금 ExtraAccountView
        // 사업자계좌 조회 바로가기 BusinessAccountView
    }
    
    private func setLayout() {
        totalAccountHeaderView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(19)
            $0.height.equalTo(48)
        }
        
        addBankView.snp.makeConstraints {
            $0.top.equalTo(totalAccountHeaderView.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(24)
        }
    }
}
