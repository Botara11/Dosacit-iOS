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




class Result35: UIViewController{
    
  
    @IBOutlet var abiertaZonaAlta: UILabel!
    @IBOutlet var abiertaZonaMedia: UILabel!
    @IBOutlet var abiertaZonaBja: UILabel!
    
    @IBOutlet var porcenAlta: UILabel!
    @IBOutlet var porcenMedia: UILabel!
    @IBOutlet var porcenBaja: UILabel!
    
    @IBOutlet var caudalesAdmAlta: UILabel!
    @IBOutlet var caudalesAdmMedia: UILabel!
    @IBOutlet var caudalesAdmBaja: UILabel!
    
    @IBOutlet var variacionCaudal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        abiertaZonaAlta.text="\(newItemB.numeroBoquillasAbiertasAlta)"
        abiertaZonaMedia.text="\(newItemB.numeroBoquillasAbiertasMedia)"
        abiertaZonaBja.text="\(newItemB.numeroBoquillasAbiertasBaja)"
        porcenAlta.text="\(newItemB.porcentajeVegetacionAlta)"
        porcenMedia.text="\(newItemB.porcentajeVegetacionMedia)"
        porcenBaja.text="\(newItemB.porcentajeVegetacionBaja)"
        variacionCaudal.text="\(newItemB.variacionCaudalAdmisible)"
        
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
            var intervaloCaudalAdmisible = [0.3,1.2,0.3,1.2,0.3,1.2] as [Double]
            intervaloCaudalAdmisible[0] = fetchResults[0].intervaloCaudalAdmisible0
            intervaloCaudalAdmisible[1] = fetchResults[0].intervaloCaudalAdmisible1
            intervaloCaudalAdmisible[2] = fetchResults[0].intervaloCaudalAdmisible2
            intervaloCaudalAdmisible[3] = fetchResults[0].intervaloCaudalAdmisible3
            intervaloCaudalAdmisible[4] = fetchResults[0].intervaloCaudalAdmisible4
            intervaloCaudalAdmisible[5] = fetchResults[0].intervaloCaudalAdmisible5
            caudalesAdmAlta.text="\(intervaloCaudalAdmisible[0]) - \(intervaloCaudalAdmisible[1])"
            caudalesAdmMedia.text="\(intervaloCaudalAdmisible[2]) - \(intervaloCaudalAdmisible[3])"
            caudalesAdmBaja.text="\(intervaloCaudalAdmisible[4]) - \(intervaloCaudalAdmisible[5])"
            
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
