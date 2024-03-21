//
//  CarCatalog.swift
//  CarsApp
//
//  Created by Abdulaziz Albahar on 1/15/24.
//

import Foundation

/*
 TODO: PART 3
     You are given a class called CarCatalog, with certain variables such as carsAvailable (mapping of CarModel to amount available), favourites (list of CarModels), etc.
     Implement the empty functions throughout this class - favourite(CarModel), getCarAvailability(CarModel), getAvailableCars(), filterCarsBy(brand).
     Some helper functions will already be given. Implement the class initializer to initialize your variables.
 */

class CarCatalog {

    var carsAvailable: [CarModel : Int] // A mapping of the car models to the amount of these models available.
    var displayedCars: [CarModel]
    var favourites: [CarModel]
    
    /*
     TODO: write an initializer that fetches all the car models. For the purposes of this assignment, initialize carsAvailable to a default array of 5-6 car models of your choice, with an arbitrary number representing their amount. Make sure the displayedCars are initialized with all the cars in carsAvailable. Upon launch, the user should have no favourites (empty).
     NOTE: The ids of the cars you provide must be unique, otherwise the app will crash.
    */
    init() {
        var mercedes: CarModel = CarModel(id: "A001", carBrand: CarBrand.Mercedes, modelName: "Model A", topSpeed: 59, color: "Gray", fuel: 28)
        var bmw: CarModel = CarModel(id: "A002", carBrand: CarBrand.BMW, modelName: "Model B", topSpeed: 78, color: "Blue", fuel: 50)
        var toyota: CarModel = CarModel(id: "A003", carBrand: CarBrand.Toyota, modelName: "Model C", topSpeed: 120, color: "Green", fuel: 48)
        var lamborghini: CarModel = CarModel(id: "A004", carBrand: CarBrand.Lamborghini, modelName: "Model D", topSpeed: 195, color: "Black", fuel: 33)
        var porsche: CarModel = CarModel(id: "A005", carBrand: CarBrand.Porsche, modelName: "Model E", topSpeed: 78, color: "Red", fuel: 93)
        var ford: CarModel = CarModel(id: "A006", carBrand: CarBrand.Ford, modelName: "Model F", topSpeed: 65, color: "Pink", fuel: 83)
        self.carsAvailable = [
            mercedes: 52,
            bmw: 99,
            toyota: 51,
            lamborghini: 1,
            porsche: 22,
            ford: 21
        ]
        self.displayedCars = [
            mercedes,
            bmw,
            toyota,
            lamborghini,
            porsche,
            ford
        ]
        self.favourites = []
    }
    
    
    /*
        TODO: implement this function
        This function gets called by the UI whenever the user wants to ADD/REMOVE this car from their favourites list. Change the state of the favourites array to accomplish this.
     */
    func toggleFavourite(car: CarModel) {
        if self.favourites.contains(car) {
            self.favourites.remove(at: self.favourites.firstIndex(of: car)!)
        } else {
            self.favourites.append(car)
        }
 
    }
    
    /*
        TODO: implement this function
        This function gets called by the UI whenever the user wants to view the amount of cars available from a certain model.
     */
    func getCarAvailability(car: CarModel) -> Int {
        if let numAvailable = self.carsAvailable[car] {
            return numAvailable
        } else {
            return 0
        }
    }
    
    /*
        TODO: implement this function
        Set the displayedCars to all the available cars excluding any car that IS NOT of the given brand. In essence, this is the filtering functionality our app uses to display cars of a certain brand.
        NOTE: make sure you handle the case where it's 'none', as it implies that we don't want a filter.
     */
    func filterCarsBy(brand: CarBrand) {
        var filteredArray: [CarModel] = []
        for (car, quantity) in self.carsAvailable {
            if brand == car.carBrand {
                filteredArray.append(car)
            }
            if brand == CarBrand.none {
                filteredArray.append(car)
            }
        }
        self.displayedCars = filteredArray
    }
    
    
    
}
