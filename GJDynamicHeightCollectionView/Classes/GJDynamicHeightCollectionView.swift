
import UIKit

@available(iOS 13.0, *)
open class GJDynamicHeightCollectionView: UICollectionView {

  public init(frame: CGRect = .zero) {
    super.init(frame: frame, collectionViewLayout: UICollectionViewCompositionalLayout { sec, env -> NSCollectionLayoutSection? in
      let item = NSCollectionLayoutItem(
        layoutSize: .init(
          widthDimension: .fractionalWidth(1),
          heightDimension: .estimated(.zero)
        )
      )
      let group = NSCollectionLayoutGroup.horizontal(
        layoutSize: .init(
          widthDimension: .fractionalWidth(1),
          heightDimension: .estimated(.zero)
        ), subitems: [item]
      )
      let section = NSCollectionLayoutSection(group: group)
      let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionElementKindSectionFooter, alignment: .bottom)
      section.boundarySupplementaryItems = [footer]
      return section
    })
    configureUI()
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureUI() {
    backgroundColor = .clear
  }
}

