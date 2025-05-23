//
//  TotalAccountViewController.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/17/25.
//

import UIKit

class TotalAccountViewController: UIViewController {
    
    // MARK: - Properties
    
    private let navigationView = NavigationView(title: "전체계좌조회")
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let addBankView = AddBankView()
    
    private let depositHeader = SectionHeaderView(title: "예금 · 적금", backgroundColor: .blue2, isDeposit: true)
    private let accountView = AccountView()
    
    private let insuranceHeader = SectionHeaderView(title: "보험 · 공제", backgroundColor: .gray3, isDeposit: false)
    private let retirementHeader = SectionHeaderView(title: "퇴직연금", backgroundColor: .gray3, isDeposit: false)
    
    private let businessAccountView = BusinessAccountView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        fetchTotalAccount()
    }
    
    private func fetchTotalAccount() {
        Task {
            do {
                let response = try await TotalAccountService.shared.fetchTotalAccount()
                
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.accountView.updateAccounts(response.accounts)
                    self.depositHeader.configure(with: response)
                }
                
            } catch {
                print("전체 계좌 불러오기 실패: \(error.localizedDescription)")
            }
        }
    }
    
    
    // MARK: - UI Setting
    
    private func setStyle() {
        view.backgroundColor = .kbWhite
        scrollView.showsVerticalScrollIndicator = false
    }
    
    private func setUI() {
        view.addSubviews(navigationView, scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            addBankView,
            depositHeader,
            accountView,
            insuranceHeader,
            retirementHeader,
            businessAccountView
        )
    }
    
    private func setLayout() {
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
        
        addBankView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(24)
        }
        
        depositHeader.snp.makeConstraints {
            $0.top.equalTo(addBankView.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        accountView.snp.makeConstraints {
            $0.top.equalTo(depositHeader.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.height.equalTo(516)
        }
        
        insuranceHeader.snp.makeConstraints {
            $0.top.equalTo(accountView.snp.bottom).offset(14)
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
            $0.bottom.equalToSuperview().inset(50)
        }
    }
}
