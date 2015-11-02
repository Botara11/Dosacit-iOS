//
//  Result34.swift
//  DosAp
//
//  Created by Alvaro Serneguet on 24/10/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//


import UIKit
import Foundation
import CoreData




class Result34: UIViewController{

    @IBOutlet var volumenAp: UILabel!
    @IBOutlet var anchoTrabajo: UILabel!
    
    @IBOutlet var velocidadAv: UILabel!
    @IBOutlet var caudalTotal: UILabel!
    @IBOutlet var caudalSector: UILabel!
    @IBOutlet var totalBoquillas: UILabel!
    
    @IBOutlet var cerradasAlta: UILabel!
    @IBOutlet var cerradasBaja: UILabel!
    
    
    
override func viewDidLoad() {
    super.viewDidLoad()
    
    volumenAp.text="\(newItem.volumenAplicacionLHA)"
    anchoTrabajo.text="\(newItem.anchoCalle)"
    velocidadAv.text="\(newItemB.velocidadAvance)"
    totalBoquillas.text="\(newItemB.numeroTotalBoquillas)"
    cerradasAlta.text="\(newItemB.numeroBoquillasCerradasAlta)"
    cerradasBaja.text="\(newItemB.numeroBoquillasCerradasBaja)"
    let fetchRequest = NSFetchRequest(entityName: "B1")
    if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
        
        caudalTotal.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
        caudalSector.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
        
    }
    /*
    
    newItemB.numeroTotalBoquillas
    newItemB.velocidadAvance
    newItemC.velocidadAvance
    newItem.volumenAplicacionLHA
    newItemB.volumenApp
    newItem.anchoCalle
    newItemB.anchoCalle
    
    newItemB.numeroBoquillasCerradasAlta
    newItemB.numeroBoquillasCerradasBaja
    newItemB.numeroBoquillasAbiertasAlta
    newItemB.numeroBoquillasAbiertasMedia
    newItemB.numeroBoquillasAbiertasBaja
    newItemB.porcentajeVegetacionAlta
    newItemB.porcentajeVegetacionMedia
    newItemB.porcentajeVegetacionBaja
    
    let fetchRequest = NSFetchRequest(entityName: "B1")
    if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
        IntervaloCaudalAdmisibleAlta.text = String(format:"%.2f",fetchResults[0].caudalLiquidoBoquillaAlta)
        IntervaloCaudalAdmisibleMedia.text = String(format:"%.2f",fetchResults[0].caudalLiquidoBoquillaMedia)
        IntervaloCaudalAdmisibleBaja.text = String(format:"%.2f",fetchResults[0].caudalLiquidoBoquillaBaja)
        VariacionText.text = String(format:"%.0f",round(fetchResults[0].variacionCaudalAdmisible * 100))
        VariacionCaudal.value = (fetchResults[0].variacionCaudalAdmisible as NSNumber).floatValue * 100
        println("\(fetchResults[0].variacionCaudalAdmisible)")
    }
    */
    
}


override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!){

}


}
