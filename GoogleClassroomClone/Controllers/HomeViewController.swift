//
//  SideBarViewController.swift
//  GoogleClassroomClone
//
//  Created by Hua Son Tung on 11/07/2021.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didTapSideButton()
}

class HomeViewController: UIViewController {

    weak var delegate: HomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBlue
    }
    
    @objc func didTapSideButton() {
        delegate?.didTapSideButton()
    }
}
