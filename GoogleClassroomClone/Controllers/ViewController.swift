//
//  ViewController.swift
//  GoogleClassroomClone
//
//  Created by Hua Son Tung on 11/07/2021.
//

import UIKit

class ViewController: UIViewController {
    
    enum SideBarState {
        case closed
        case opened
    }
    
    private var sideBarState: SideBarState = .closed
    
    let homeViewVC = HomeViewController()
    let sideBarViewVC = SideBarMenuViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Google Lớp học"
        configureNavigationBarItem()
        navigationController?.navigationBar.tintColor = .label
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .done, target: self, action: #selector(didTapSideButton))
        
        addChildVC()
    }
    
    private func configureNavigationBarItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .done, target: self, action: nil)
    }
    
    private func addChildVC() {
        //SideBarMenu
        addChild(sideBarViewVC)
        view.addSubview(sideBarViewVC.view)
        sideBarViewVC.didMove(toParent: self)
        
        //Home view controller
        homeViewVC.delegate = self
        let navVC = UINavigationController(rootViewController: homeViewVC)
        //addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        
    }


}

extension ViewController: HomeViewControllerDelegate {
    @objc func didTapSideButton() {
        //Animate the menu
        //print("did tap")
        
        switch sideBarState {
        
        case .closed:
            //open it
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                self.homeViewVC.view.frame.origin.x = self.homeViewVC.view.frame.width - 100
                
            }, completion: { [weak self] done in
                if done {
                    self?.sideBarState = .opened
                }
            })
        case .opened:
            //close it
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                self.homeViewVC.view.frame.origin.x = 0
                
            }, completion: { [weak self] done in
                if done {
                    self?.sideBarState = .closed
                }
            })
        break
        }
    }
}

