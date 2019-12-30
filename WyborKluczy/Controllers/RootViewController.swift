//
//  RootViewController.swift
//  WyborKluczy
//
//  Created by Krystian Bujak on 29/12/2019.
//  Copyright © 2019 Booyac IT. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class RootViewController: UIViewController {
    private let button = UIButton()
    private let publicKeyLabel = UILabel()
    private let privateKeyLabel = UILabel()

    private let viewModel: RootViewModel

    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
        [button, publicKeyLabel, privateKeyLabel].forEach { view.addSubview($0) }

        setupLayouts()
        setupStyles()
        setupActions()
    }
}

private extension RootViewController {
    func setupLayouts() {
        button.autoAlignAxis(.vertical, toSameAxisOf: view)
        button.autoPinEdge(.bottom, to: .bottom, of: view, withOffset: -150)
        button.autoSetDimension(.height, toSize: 50)
        button.autoSetDimension(.width, toSize: 150)

        publicKeyLabel.autoPinEdge(.top, to: .top, of: view, withOffset: 100)
        publicKeyLabel.autoPinEdge(.left, to: .left, of: view, withOffset: 10)

        privateKeyLabel.autoPinEdge(.top, to: .top, of: publicKeyLabel, withOffset: 50)
        privateKeyLabel.autoPinEdge(.left, to: .left, of: view, withOffset: 10)
    }

    func setupStyles() {
        view.backgroundColor = .white
        button.setTitle("Generate keys", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray

        publicKeyLabel.text = "KPub: not generated"
        privateKeyLabel.text = "KPriv: not generated"

        publicKeyLabel.font = UIFont.boldSystemFont(ofSize: 12)
        privateKeyLabel.font = UIFont.boldSystemFont(ofSize: 12)
    }

    func setupActions() {
        button.addTarget(self, action: #selector(generateKeys), for: .primaryActionTriggered)
        viewModel.handler = { [weak self] in
            guard let n = self?.viewModel.n, let e = self?.viewModel.e, let d = self?.viewModel.d else { return }
            DispatchQueue.main.async {
                self?.publicKeyLabel.text = "KPub: {\(e), \(n)}"
                self?.privateKeyLabel.text = "KPriv: {\(d), \(n)}"
            }
        }
    }

    @objc func generateKeys() {
        viewModel.generateKeys()
    }
}
