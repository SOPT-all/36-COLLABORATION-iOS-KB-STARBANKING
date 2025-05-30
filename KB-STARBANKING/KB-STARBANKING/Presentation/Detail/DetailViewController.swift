//
//  DetailViewController.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/20/25.
//

import UIKit

import SnapKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var accountId: Int = 1
    
    private let closeHeaderView = CloseHeaderView(title: "계좌상세정보")
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let detailAccountView = DetailAccountView()
    private let detailInfoView = DetailInfoView()
    private let manageAccountView = ManageAccountView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setNavigation()
        fetchDetail()
    }
    
    private func fetchDetail() {
        Task {
            do {
                let detail = try await DetailService.shared.fetchDetail(accountId: accountId)
                detailAccountView.configure(with: detail)
            } catch {
                print("계좌 상세 조회 실패: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - UI Setting
    
    private func setStyle() {
        view.backgroundColor = .kbWhite
        scrollView.showsVerticalScrollIndicator = false
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setUI() {
        view.addSubviews(closeHeaderView, scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            detailAccountView,
            detailInfoView,
            manageAccountView
        )
    }
    
    private func setLayout() {
        closeHeaderView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(closeHeaderView.snp.bottom).offset(18)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalTo(scrollView)
        }
        
        detailAccountView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(143)
        }
        
        detailInfoView.snp.makeConstraints {
            $0.top.equalTo(detailAccountView.snp.bottom).offset(24)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(171)
        }
        
        manageAccountView.snp.makeConstraints {
            $0.top.equalTo(detailInfoView.snp.bottom).offset(31)
            $0.horizontalEdges.equalToSuperview().inset(23)
            $0.height.equalTo(400)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
    
    private func setNavigation() {
        closeHeaderView.onCloseButtonTapped = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        manageAccountView.onInterestRateTapped = { [weak self] in
            guard let self = self else { return }
            let interestRateVC = InterestRateViewController()
            self.navigationController?.pushViewController(interestRateVC, animated: true)
        }
    }
}
