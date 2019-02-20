//
//  DayHistoryPaymentVC.swift
//  FixPayment
//
//  Created by Anton Skorodumov on 20/02/2019.
//  Copyright © 2019 chameleon production. All rights reserved.
//

import UIKit

class DayHistoryPaymentVC: BaseViewController {

    @IBOutlet weak var tvDayHistory: UITableView!
    
    fileprivate var pays: [DayHistoryVM] = []
    
    fileprivate let manager: TodayPaymentManager = ServiceLocator.resolve(TodayPaymentManager.self)
    fileprivate let keyboardManager: KeyboardManager = ServiceLocator.resolve(KeyboardManager.self)
    
    @IBOutlet weak var tfPayment: UITextField!
    @IBOutlet weak var lblTodayLeftAmmountTitle: UILabel!
    @IBOutlet weak var lblTodayLeftAmmount: UILabel!
        @IBOutlet weak var constrToolBarBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardManager.delegate = self
        tvDayHistory.dataSource = self
        tvDayHistory.register(cell: DayHistoryCell.self)
        pays = DayHistoryVM.dataWith(pays: manager.todayPaymentsList())
        tvDayHistory.reloadData()
        lblTodayLeftAmmountTitle.text = "Осталось на сегодня"
        lblTodayLeftAmmount.text = String(manager.todayLeftAmmount())
        navigationItem.title = "Дневные расходы"
    }
    
    @IBAction func onAddPayment(_ sender: Any) {
        let payment = Int(tfPayment.text ?? "") ?? 0
        manager.register(payment: payment)
        pays.append(DayHistoryVM(value: payment))
        lblTodayLeftAmmount.text = String(manager.todayLeftAmmount())
        tfPayment.text = ""
        tvDayHistory.reloadData()
        view.endEditing(true)
    }
    
}

extension DayHistoryPaymentVC: KeyboardManagerDelegate {
    
    func onKeyboardWillShow(keyboardSize: CGSize) {
        constrToolBarBottom.constant = keyboardSize.height
        view.layoutIfNeeded()
    }
    
    func onKeyboardWillHide(keyboardSize: CGSize) {
        constrToolBarBottom.constant = 0
        view.layoutIfNeeded()
    }
    
}

extension DayHistoryPaymentVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: DayHistoryCell.self)
        let vm = pays[indexPath.row]
        cell.lblName.text = vm.title
        cell.lblValue.text = vm.value
        return cell
    }
    
}
