//
//  InterestRateViewController.swift
//  KB-STARBANKING
//
//  Created by hyunwoo on 5/14/25.
//
import UIKit

import SnapKit
import Then

class InterestRateViewController: UIViewController {
    
    var accountId: Int = 1
    
    private let closeHeaderView = CloseHeaderView(title: "계좌이율 보기")
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let infoView = InfoView()
    private let basicRateView = BasicRateView()
    private let preferentialRateView = PreferentialRateView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        fetchInterestRate()
    }
    
    private func fetchInterestRate() {
        Task {
            do{
                let interestRateData = try await InterestRateService.shared.fetchInterestRate(accountId: accountId)
                
                DispatchQueue.main.async {[weak self] in
                    guard let self = self else { return }
                    self.infoView.configure(with: interestRateData)
                    self.basicRateView.configure(with: interestRateData)
                    self.preferentialRateView.configure(with: interestRateData)
                }
            } catch {
                print("거래 실패 : \(error.localizedDescription)")
            }
        }
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
    }
    
    private func setUI() {
        view.addSubviews(closeHeaderView, scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(infoView, basicRateView, preferentialRateView)
    }
    
    private func setLayout() {
        closeHeaderView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(-40)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(closeHeaderView.snp.bottom).offset(18)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }
        
        infoView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(188)
        }
        
        basicRateView.snp.makeConstraints {
            $0.top.equalTo(infoView.snp.bottom).offset(46)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(157)
        }
        
        preferentialRateView.snp.makeConstraints {
            $0.top.equalTo(basicRateView.snp.bottom).offset(46)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(360)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
}
