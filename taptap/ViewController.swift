//
//  ViewController.swift
//  taptap
//
//  Created by MyachinGarpix on 17.03.2023.
//

import UIKit

class ViewController: UIViewController {
    var snap: UISnapBehavior!
    
    lazy var animator:  UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: self.view)
    }()
    
    lazy var rec: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.center = self.view.center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 20
        view.layer.backgroundColor = UIColor.systemCyan.cgColor
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(rec)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        view.addGestureRecognizer(tap)
    }

    @objc func tap(_ sender: UITapGestureRecognizer? = nil){
        guard let sender = sender else { return }
        
        if (snap != nil) {
        animator.removeBehavior(snap)
        }
        
        snap = UISnapBehavior(item: self.rec, snapTo: sender.location(in: self.view))
        animator.addBehavior(snap)
    }
}

