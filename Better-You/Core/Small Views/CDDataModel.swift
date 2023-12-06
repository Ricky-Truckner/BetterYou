//
//  CDDataModel.swift
//  BetterYou2
//
//  Created by Daniel Hernandez on 9/28/23.
//

import Foundation
import CoreData
class cddatamodel:ObservableObject{
    
    let container : NSPersistentContainer
    @Published var saveBrakfastEntity: [BreakfastEntity] = []
    @Published var saveLunchEntity: [LunchEntity] = []
    @Published var saveValueEntity: [ValueEntity] = []
    
    
    init() {
        container = NSPersistentContainer(name: "FoodClass")
        container.loadPersistentStores{(descrp,error) in
            if let error = error {
                print("error loading data \(error)")
            }
        }
        fechData()
    }
    func fechData() {
        let requestone = NSFetchRequest<BreakfastEntity>(entityName: "BreakfastEntity")
        let requesttwo = NSFetchRequest<LunchEntity>(entityName: "LunchEntity")
        let requestthree = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        do {
           saveBrakfastEntity = try container.viewContext.fetch(requestone)
           saveLunchEntity = try container.viewContext.fetch(requesttwo)
           saveValueEntity = try container.viewContext.fetch(requestthree)
        } catch let error {
            print("error fetching data \(error)")
        }
    }
    func addBreakfast(icon:String, name:String, ingredients:String, fat:CGFloat, protein: CGFloat, carbs: CGFloat) {
        let newmeal = BreakfastEntity(context: container.viewContext)
        newmeal.icon = icon
        newmeal.name = name
        newmeal.ingredients = ingredients
        newmeal.fat = Float(fat)
        newmeal.protein = Float(protein)
        newmeal.carbs = Float(carbs)
        saveData()
    }
    
    func addLunch(icon:String, name:String, ingredients:String, fat:CGFloat, protein: CGFloat, carbs: CGFloat) {
        let newmeal = BreakfastEntity(context: container.viewContext)
        newmeal.icon = icon
        newmeal.name = name
        newmeal.ingredients = ingredients
        newmeal.fat = Float(fat)
        newmeal.protein = Float(protein)
        newmeal.carbs = Float(carbs)
        saveData()
        
    }
    
    func addValue(fat:CGFloat, protein:CGFloat, carbs:CGFloat) {
        let newValue = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        do {
            let results = try container.viewContext.fetch(newValue)
            if let entity = results.first {
                entity.fat += Float(fat)
                entity.protein += Float(protein)
                entity.carbs += Float(carbs)
            } else {
                let newValue = ValueEntity(context: container.viewContext)
                newValue.fat = Float(fat)
                newValue.protein = Float(protein)
                newValue.carbs = Float(carbs)
            }
            saveData()
            saveData()
            
        } catch {
            print("\(error)")
        }
    }
    
    func addringcalories(calories:CGFloat) {
        let newcal = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        do {
            let results = try container.viewContext.fetch(newcal)
            if let entity = results.first {
                entity.ring += Float(Int(calories))
            }
            } catch  {
                print("\(error)")
            }
            saveData()
            fechData()
        }
    
    func addmealTaggle(meal:BreakfastEntity) {
        meal.addmeal.toggle()
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fechData()
        } catch {
            print("save data failed \(error)")
        }
    }
}
