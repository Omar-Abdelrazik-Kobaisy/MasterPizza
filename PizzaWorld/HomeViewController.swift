//
//  HomeViewController.swift
//  PizzaWorld
//
//  Created by Omar on 13/09/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var sliderCollectionView: UICollectionView!
    var sliderTimer : Timer?
    var slides : [Int] = [1,2,3,4,5]
    var currentSlides = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        sliderCollectionView.registerCell(cellClass: SliderCell.self)
        sliderTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrollToNextItem), userInfo: nil, repeats: true)
    }
    @objc func scrollToNextItem(){
        let next = currentSlides + 1;
        currentSlides = next % slides.count
        sliderCollectionView.scrollToItem(at: IndexPath(row: currentSlides, section: 0), at: .centeredHorizontally, animated: true)
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
//        cell.stackView.numberOfStarts = {
//            num in
//            cell.rate.text = String(num)
//        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}
