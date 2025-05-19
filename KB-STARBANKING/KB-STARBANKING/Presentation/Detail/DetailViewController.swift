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
    private let detailAccountView = DetailAccountView()
    
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
            detailAccountView
        )
        // 정보목록 DetailInfoView
        // 관리하기 ManageAccountView
    }
    
    private func setLayout() {
        detailAccountView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
    }
}

