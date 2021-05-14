//
//  ViewController.swift
//  LectorTarjetas
//
//  Created by edeluz on 04/03/21.
//

import UIKit

class ViewController: UIViewController, CardIOPaymentViewControllerDelegate {

    @IBOutlet weak var respuesta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CardIOUtilities.preload()
    }

    @IBAction func abrirAction(_ sender: Any) {
        let cardIOVC = CardIOPaymentViewController(paymentDelegate: self)
        cardIOVC?.collectCardholderName = true
        cardIOVC?.guideColor = UIColor.red
        cardIOVC?.modalPresentationStyle = .formSheet
        present(cardIOVC!, animated: true, completion: nil)
    }
    
    func userDidCancel(_ paymentViewController: CardIOPaymentViewController!) {
        paymentViewController?.dismiss(animated: true, completion: nil)
    }
    
    func userDidProvide(_ cardInfo: CardIOCreditCardInfo!, in paymentViewController: CardIOPaymentViewController!) {
        if let info = cardInfo {
            let datos = """
            Nombre: \(String(describing: info.cardholderName))
            Numero Tarjerta: \(String(describing: info.cardNumber))
            Fecha Expiración: \(info.expiryMonth)/\(info.expiryYear)
            cvv: \(String(describing: info.cvv))
            """
            self.respuesta.text = datos
        }
        paymentViewController?.dismiss(animated: true, completion: nil)
    }
    
}

