//
//  TestViewController.swift
//  IssueTableViewDismiss0110
//
//  Created by Yuan Zhou on 2020/01/10.
//  Copyright © 2020 ZhouyuanWork, Inc. All rights reserved.
//

import UIKit

protocol TestViewControllerDelegate: class {
    func dismissController(_ controller: TestViewController)
}

class TestViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    weak var delegate: TestViewControllerDelegate?

    deinit {
        NSLog("deinit")
        print("-")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        view.backgroundColor = UIColor.black.withAlphaComponent(0.25)
    }
}

extension TestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
}

extension TestViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.modalTransitionStyle = .crossDissolve

        // dismiss from presenting view-controller
        self.delegate?.dismissController(self)

        /*
        // dismiss from(within) self
        NSLog("start to dismiss")
        dismiss(animated: false) {
            NSLog("dismissed")
        }
         */
    }
}
