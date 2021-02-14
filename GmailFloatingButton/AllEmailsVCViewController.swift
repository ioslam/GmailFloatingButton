//
//  AllEmailsVCViewController.swift
//  GmailFloatingButton
//
//  Created by Eslam Mohamed on 09/02/2021.
//

import UIKit

class AllEmailsVCViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var composeButton: UIButton!
    
    @IBOutlet weak var composeBtnWidthConstraints: NSLayoutConstraint!
    var lastContentOffset: CGFloat = 0
    @IBOutlet weak var buttonsStackView: UIStackView!
    
    @IBOutlet weak var topViewHeightConstraints: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        buttonsStackView.makeThatShadow()
        navigationController?.navigationBar.backgroundColor = .lightGray
        self.navigationController?.hidesBarsOnSwipe = true
            self.navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor:UIColor.black,
                NSAttributedString.Key.font: UIFont(name: "Avenir Next Bold", size: 18)!
            ]
            self.navigationController?.navigationBar.topItem?.title = "Inbox"
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if tableView.contentOffset.y == 0 {
            print("be555555")
        }
        else {
            print("on Top 🔱")
        }
    }
   
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if tableView.contentOffset.y == 0 {
            print("be555555")
        }
        else {
            print("on Topsss 🔱")
            //self.navigationController?.isNavigationBarHidden = false
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
}

extension AllEmailsVCViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "This email has found you"
        return cell
    }
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("-------------------")
        print(self.lastContentOffset)
        print(scrollView.contentOffset.y)
        print("-------------------")
        if scrollView.contentOffset.y == -44{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                self.animateWhenOnTop(in: 0.3)
            }
        }
        if self.lastContentOffset < scrollView.contentOffset.y {
            self.composeBtnWidthConstraints.constant = 48
            topViewHeightConstraints.constant = 0
            self.composeButton.isHidden = true
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
        } else if self.lastContentOffset > scrollView.contentOffset.y {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                self.animateWhenOnTop(in: 0.3)
            }
        } else {
            
        }
    }
    
    fileprivate func animateWhenOnTop(in time: TimeInterval) {
        self.composeButton.isHidden = false
        self.composeBtnWidthConstraints.constant = 104
        topViewHeightConstraints.constant = 0
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        UIView.animate(withDuration: time) {
            self.view.layoutIfNeeded()
        }
    }

    
}
