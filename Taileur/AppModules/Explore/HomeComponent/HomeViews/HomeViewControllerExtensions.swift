//
//  HomeViewControllerExtensions.swift
//  Taileur
//
//  Created by Engineer 144 on 18/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit


	extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIViewControllerTransitioningDelegate{
		func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
			switch indexPath.section {
			case 0:
				return CGSize(width: collectionView.frame.width, height: 200)
			case 1:
				return CGSize(width: collectionView.frame.width, height: 105)
			case 2:
				let lay = collectionViewLayout as! UICollectionViewFlowLayout
				let width =  (collectionView.frame.width / 2) - lay.minimumInteritemSpacing
				return CGSize(width: width, height:  280)
			default:
				return CGSize(width: collectionView.frame.width, height: 100)
			}
		}
		
		func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
			switch section {
			case 0:
				return 1
			case 1 :
				return 1
			case 2 :
				
				return data.count
			default:
				return 1
			}
		}
		
		func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
			switch indexPath.section {
			case 0:
				let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCell", for: indexPath) as! TopCell
				cell.coverView.backgroundColor = .lightGray
				cell.coverView.addShadow()
				cell.itemImage.image = #imageLiteral(resourceName: "lady")
				return cell
			case 1:
				let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MiddleCell", for: indexPath) as! MiddleCell
				cell.delegate = self
				return cell
			case 2:
				let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomCellCollectionViewCell", for: indexPath) as! BottomCellCollectionViewCell
				let product = data[indexPath.item]
				cell.itemImage.image = product.image
				cell.itemName.text = product.name
				cell.categoryLabel.text = product.category
				cell.itemPrice.text = product.price
				return cell
			default:
				let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCell", for: indexPath) as! TopCell
				return cell
			}
		}
		
		func numberOfSections(in collectionView: UICollectionView) -> Int {
			return 3
		}
		
		func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
			switch indexPath.section {
			case 1:
				let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewHeader", for: indexPath) as! HomeViewCollectionViewHeader
				headerView.viewTitle.text = "Featured Designers"
				return headerView
			case 2 :
				let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewHeader", for: indexPath) as! HomeViewCollectionViewHeader
				headerView.viewTitle.text = "Whats Hot"
				return headerView
			default:
				return UICollectionReusableView()
			}
		}
		
		func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
			switch section {
			case 1 , 2:
				return CGSize(width: collectionView.frame.width - 20, height: 35)
			default:
				return CGSize(width: 0, height: 0)
			}
		}
		
		func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
			switch indexPath.section {
			case 2:
				let cell = collectionView.cellForItem(at: indexPath) as! BottomCellCollectionViewCell
				cell.backgroundColor = 	UIColor(white: 0.9, alpha: 1)
				
			default:
				break
			}
			
		}
		
		func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
			switch indexPath.section {
			case 2:
				let cell = collectionView.cellForItem(at: indexPath) as! BottomCellCollectionViewCell
				cell.backgroundColor = 	.white
			default: break
				
			}
		}
		
		func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
			guard let _delegate = self.delegate else { return  }
			_delegate.collectionViewSelected(indexPath,cell : collectionView.cellForItem(at: indexPath),modelData : 0 as AnyObject)
		}
		
		
		func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
			guard let originFrame = selectedCell.superview?.convert(selectedCell.frame, to: nil) else {
				return transition
			}
			transition.originFrame = originFrame
			transition.presenting = true
			selectedCell.isHidden = true
			return transition
		}
		
		func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
			transition.presenting = false
			return transition
		}
		
	}
	



