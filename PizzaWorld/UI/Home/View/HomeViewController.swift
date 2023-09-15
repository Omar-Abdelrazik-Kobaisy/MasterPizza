//
//  HomeViewController.swift
//  PizzaWorld
//
//  Created by Omar on 13/09/2023.
//

import UIKit
import RxSwift
class HomeViewController: UIViewController {

    @IBOutlet weak var sliderCollectionView: UICollectionView!
    let viewModel = HomeViewModel()
    var bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        registerCells()
        viewModel.viewDidLoad()
        bind()
    }
    func setupUI(){
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
    }
    func registerCells(){
        sliderCollectionView.registerCell(cellClass: SliderCell.self)
    }
    //subscribe 
    func bind(){
//        viewModel.slideToItemAtIndex = {[weak self]index in
//            self?.sliderCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
//        }
        viewModel.slideToItemAtIndex.subscribe { [weak self]index in
            self?.sliderCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
        }.disposed(by: bag)
    }
}
extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource ,
    UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
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
