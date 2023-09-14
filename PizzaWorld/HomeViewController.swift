//
//  HomeViewController.swift
//  PizzaWorld
//
//  Created by Omar on 13/09/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var sliderCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        sliderCollectionView.registerCell(cellClass: SliderCell.self)
    }
}
extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource ,
    UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue( cellClass: SliderCell.self, indexPath: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}
