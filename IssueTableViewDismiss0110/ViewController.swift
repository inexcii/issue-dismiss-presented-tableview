//
//  ViewController.swift
//  IssueTableViewDismiss0110
//
//  Created by Yuan Zhou on 2020/01/10.
//  Copyright © 2020 ZhouyuanWork, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
        vc.modalPresentationStyle = .overFullScreen
        vc.modalPresentationCapturesStatusBarAppearance = true
        vc.delegate = self

//        vc.dismissHandler = { controller in
//            NSLog("start to dismiss")
//            controller.dismiss(animated: false) {
//                NSLog("dismissed")
//                print("----")
//            }
//        }

        present(vc, animated: false, completion: nil)
    }

}

extension ViewController: TestViewControllerDelegate {
    func dismissController(_ controller: TestViewController) {
        NSLog("start to dismiss")
        controller.dismiss(animated: true) {
            NSLog("dismissed")
        }
    }
}

