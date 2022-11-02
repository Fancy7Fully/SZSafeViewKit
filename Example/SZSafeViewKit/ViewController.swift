//
//  ViewController.swift
//  SZSafeViewKit
//
//  Created by Fancy7Fully on 10/26/2022.
//  Copyright (c) 2022 Fancy7Fully. All rights reserved.
//

import UIKit
import SZSafeViewKit

class ViewController: UIViewController {
  
  let stackView = UIStackView()
  let imageViewButton = UIButton()
  let labelButton = UIButton()
  let textViewButton = UIButton()
  let uibuttonButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
      
    view.backgroundColor = .white
    setupUI()
  }

  private func setupUI() {
    stackView.axis = .vertical
    stackView.spacing = 2.0
    stackView.distribution = .fillEqually
    stackView.alignment = .center
    stackView.addArrangedSubview(imageViewButton)
    stackView.addArrangedSubview(labelButton)
    stackView.addArrangedSubview(textViewButton)
    stackView.addArrangedSubview(uibuttonButton)
    view.addSubview(stackView)
    stackView.backgroundColor = .white
    
    imageViewButton.setTitle("For UIImageView", for: [])
    imageViewButton.addTarget(self, action: #selector(didTapImageViewButton), for: .touchUpInside)
    imageViewButton.setTitleColor(.black, for: [])
    
    labelButton.setTitle("For UILabel", for: [])
    labelButton.addTarget(self, action: #selector(didTapLabelButton), for: .touchUpInside)
    labelButton.setTitleColor(.black, for: [])
    
    textViewButton.setTitle("For UITextView", for: [])
    textViewButton.addTarget(self, action: #selector(didTapTextViewButton), for: .touchUpInside)
    textViewButton.setTitleColor(.black, for: [])
    
    uibuttonButton.setTitle("For UIButton", for: [])
    uibuttonButton.addTarget(self, action: #selector(didTapButtonButton), for: .touchUpInside)
    uibuttonButton.setTitleColor(.black, for: [])
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
      stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
      stackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
    ])
  }
  
  @objc private func didTapImageViewButton() {
    let vc = ExampleViewController(contentView: UIImageView(image: UIImage(named: "Image")), comparisonView: UIImageView(image: UIImage(named: "Image")))
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc private func didTapLabelButton() {
    let safe = UILabel()
    safe.backgroundColor = .red
    safe.text = "Safe UILabel"
    let unsafe = UILabel()
    unsafe.backgroundColor = .red
    unsafe.text = "Unsafe UILabel"
    let vc = ExampleViewController(contentView: safe, comparisonView: unsafe)
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc private func didTapTextViewButton() {
    let v = UITextView()
    v.backgroundColor = .green
    v.textColor = .black
    v.text = "This is safe view"
    v.isUserInteractionEnabled = false
    v.isScrollEnabled = false
    v.setContentHuggingPriority(UILayoutPriority(1.0), for: .horizontal)
    
    var unsafeView: UITextView = UITextView()
    unsafeView = UITextView()
    unsafeView.backgroundColor = .gray
    unsafeView.textColor = .black
    unsafeView.text = "This is unsafe view"
    unsafeView.isUserInteractionEnabled = false
    unsafeView.isScrollEnabled = false
    unsafeView.setContentHuggingPriority(UILayoutPriority(1.0), for: .horizontal)
    
    let vc = ExampleViewController(contentView: v, comparisonView: unsafeView)
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc private func didTapButtonButton() {
    let sampleButton = UIButton()
    sampleButton.setTitleColor(.black, for: [])
    sampleButton.backgroundColor = .cyan
    sampleButton.setTitle("Safe Button", for: [])
    sampleButton.addTarget(self, action: #selector(tapSafe), for: .touchUpInside)
    
    let unsafeButton = UIButton()
    unsafeButton.setTitleColor(.black, for: [])
    unsafeButton.backgroundColor = .cyan
    unsafeButton.setTitle("Unsafe Button", for: [])
    unsafeButton.addTarget(self, action: #selector(tapUnsafe), for: .touchUpInside)
    
    let vc = ExampleViewController(contentView: sampleButton, comparisonView: unsafeButton)
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc private func tapSafe() {
    print("safe tapped")
  }
  
  @objc private func tapUnsafe() {
    print("unsafe tapped")
  }
}

