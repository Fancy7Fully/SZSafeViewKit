//
//  ExampleViewController.swift
//  SZSafeViewKit_Example
//
//  Created by Zhiyuan Zhou on 10/31/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import SZSafeViewKit

class ExampleViewController: UIViewController {
  
  let contentView: UIView
  
  let comparisonView: UIView
  
  let stackView = UIStackView()
  
  init(contentView: UIView, comparisonView: UIView) {
    self.contentView = contentView
    self.comparisonView = comparisonView
    
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(stackView)
    view.backgroundColor = .white
    
    stackView.axis = .vertical
    stackView.spacing = 2.0
    stackView.distribution = .fillEqually
    stackView.alignment = .center
    let safeLabel = UILabel()
    safeLabel.text = "Safe example below"
    let unsafeLabel = UILabel()
    unsafeLabel.text = "Unsafe comparison below"
    
    stackView.addArrangedSubview(safeLabel)
    stackView.addArrangedSubview(SZSafeViewContainer(content: contentView))
    stackView.addArrangedSubview(unsafeLabel)
    stackView.addArrangedSubview(comparisonView)
    view.addSubview(stackView)
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
      stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
      stackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
    ])
  }
}
