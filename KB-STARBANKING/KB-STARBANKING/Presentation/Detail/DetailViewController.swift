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
            detailAccountView,
            detailInfoView,
            manageAccountView
        )
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }
        
        detailAccountView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(185)
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
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}
