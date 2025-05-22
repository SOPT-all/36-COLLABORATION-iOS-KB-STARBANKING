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
                    
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else { return }
                        self.accountInfo.configure(with: transaction)
//                        self.primeRate.configure(with: transaction)
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
