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
    
    var accountId: Int = 1
    
    private let navigationView = NavigationView(title: "거래내역조회")
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
        fetchTransaction()
    }
    
    private func fetchTransaction() {
        Task {
            do {
                let transaction = try await TransactionService.shared.fetchTransaction(accountId: accountId)
                print("계좌 이름: \(transaction.savingAccountName)")
                print("잔액: \(transaction.totalBalance)")
                print("시작일: \(transaction.startDate), 종료일: \(transaction.endDate)")
                print("D-Day: \(transaction.dDay)")
                print("우대금리: \(transaction.preferentialRate), 최대 적용금리: \(transaction.maxAppliedRate)")
                
                for deposit in transaction.deposits {
                    print("----")
                    print("입금 ID: \(deposit.id), 횟수: \(deposit.count)")
                    print("입금일: \(deposit.depositDate), 입금액: \(deposit.payment)")
                    print("입금 후 잔액: \(deposit.afterPaymentBalance), 적용 금리: \(deposit.appliedRate)")
                }
            } catch {
                print("거래 내역 불러오기 실패: \(error.localizedDescription)")
            }
        }
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
