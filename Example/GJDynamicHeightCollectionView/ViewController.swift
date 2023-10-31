//
//  ViewController.swift
//  GJDynamicCollectionView
//
//  Created by dlrjswns on 10/30/2023.
//  Copyright (c) 2023 dlrjswns. All rights reserved.
//

import UIKit
import GJDynamicHeightCollectionView

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    model.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GJDynamicCollectionViewCell.identifier, for: indexPath) as? GJDynamicCollectionViewCell ?? GJDynamicCollectionViewCell()
    cell.configureUI(with: model[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GJDynamicFooterView.identifier, for: indexPath) as? GJDynamicFooterView ?? GJDynamicFooterView()
    return footer
  }
  
  private var model: [String] = ["안녕", "안녕\n안녕"]
  private var count = 0
  
  private let button: UIButton = {
    let button = UIButton()
    button.setTitle("Add GJDynamicCollectionView Cell", for: .normal)
    button.setTitleColor(.black, for: .normal)
    return button
  }()
  
  private lazy var collectionView: GJDynamicHeightCollectionView = {
    let collectionView = GJDynamicHeightCollectionView()
    collectionView.register(GJDynamicCollectionViewCell.self, forCellWithReuseIdentifier: GJDynamicCollectionViewCell.identifier)
    collectionView.register(GJDynamicFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: GJDynamicFooterView.identifier)
    collectionView.dataSource = self
    collectionView.delegate = self
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  private func configureUI() {
    _ = [button, collectionView].map {
      $0.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview($0)
    }
    
    button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    button.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    button.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    collectionView.topAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
    button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
    
  }
  
  @objc private func didTappedButton() {
    collectionView.performBatchUpdates {
      model.insert("Dynamic CollectionViewCell \(count)", at: 0)
      collectionView.insertItems(at: [IndexPath(row: 0, section: 0)])
    }
    count += 1
  }
  
}

final class GJDynamicCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "GJDynamicCollectionViewCell"
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.textAlignment = .center
    label.numberOfLines = 0
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureUI() {
    contentView.backgroundColor = .systemPink
    contentView.layer.masksToBounds = true
    contentView.layer.cornerRadius = 20
    
    contentView.addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
  
  func configureUI(with model: String) {
    titleLabel.text = model
  }
}

final class GJDynamicFooterView: UICollectionReusableView {
  static let identifier = "GJDynamicFooterView"
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.text = "GJDynamicCollectionView Last Position"
    label.textAlignment = .center
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureUI() {
    addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
}
