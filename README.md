<p align="center">
  <img src="https://github.com/CodeEditApp/CodeEdit/assets/806104/4ad9a29c-d9c6-44b4-88b3-0944b75fc81e" height="128">
  <h1 align="center">RandomUser</h1>
</p>

iOS Project implemented with Clean Layered Architecture and MVVM. (Can be used as Template project by replacing item name “Movie”). **More information in medium post**: <a href="https://tech.olx.com/clean-architecture-and-mvvm-on-ios-c9d167d9f5b3">Medium Post about Clean Architecture + MVVM</a>

[![Build Status](https://img.shields.io/badge/platforms-iOS%20%7C%20tvOS%20%7C%20macOS%20%7C%20watchOS-green.svg)](https://github.com/Jinxiansen/SwiftUI)
[![Swift](https://img.shields.io/badge/Swift-5.1-orange.svg)](https://swift.org)
[![Xcode](https://img.shields.io/badge/Xcode-11.0-blue.svg)](https://developer.apple.com/xcode)
[![Xcode](https://img.shields.io/badge/macOS-15.0-blue.svg)](https://developer.apple.com/macOS)
[![MIT](https://img.shields.io/badge/licenses-MIT-red.svg)](https://opensource.org/licenses/MIT)

## The Clean Architecture

This sample project is inspired on [The Clean Architecture](https://8thlight.com/blog/uncle-bob/2012/08/13/the-clean-architecture.html) by Uncle Bob.

Its main goal is to follow the [SOLID principles](https://en.wikipedia.org/wiki/SOLID) in order to keep the software well organised, testable, easy to maintain and more importantly easy to extend/change.

As explained in the posts above and in [the book](https://www.amazon.com/Clean-Architecture-Craftsmans-Software-Structure/dp/0134494164), databases, network clients and frameworks are abstracted in the upper layers (Entities, Data and Domain layers) and should not be imported/referenced into them, instead they should be injected in the App level as dependencies through the interfaces exposed by the upper layers.

## Modules

In this sample app we have the following modules/layers:

### DependencyAssembly

Framework responsible for linking the Interfaces to the `Factories`. This should only the referenced/used in the `App Module`.

### Entities

Top level module. This should not have access to any other module in the system and must be the simplest possible.

### Data

Responsible for exposing a few Interfaces for external plugins implementations such as databases, memory caches, network, bluetooth, etc. This should not reference any concrete class related to these. It also contains the `Repositories` which are another abstraction for the use of the plugins mentioned above. This module can only access `Entities` layer, nothing else.

### Domain

This module exposes `UseCases` to process business logic using the [Command Pattern](https://en.wikipedia.org/wiki/Command_pattern). The use cases must be simple and have only one responsibility. They usually communicate with `Repositories` from the `Data layer` through Interfaces. Ideally `UseCases` would return `DataStructures` instead of `Entities` to the lower layers, since these could contain UI-specific data which isn't part of the `Entities` layer.

![Alt text](README_FILES/clean-architecture.png?raw=true "Clean Architecture Layers")

## Layers
* **Domain Layer** = Entities + Use Cases + Repositories Interfaces
* **Data Repositories Layer** = Repositories Implementations + API (Network) + Persistence DB
* **Presentation Layer (MVVM)** = ViewModels + Views

## App

In this layer we have all the code that's specific to the platform of development. In this sample project the platform is iOS, furthermore a concrete implementation of the `CacheInterface` exposed by the `Data layer` was implemented in the `App layer` using `UserDefaults` as the persistence choice, for example.
This layer may have `ViewModels`, `Coordinators`, `ViewControllers`, `Views`, third party frameworks and, finally, is also responsible for setting up the dependency graph for the project by linking all the interfaces to their respective concrete classes.

## Visual examples of the App

### List - Random Users

<center><img src="https://github.com/jgallenrenau/Randomuser/blob/develop//README_FILES/ShowListAndPagination.gif" align="center" /></center>

### Search and Detail - Random Users

<center><img src="https://github.com/jgallenrenau/Randomuser/blob/develop/README_FILES/SearchUser.gif" align="center" /></center>

### DarkMode - Random Users

<center><img src="https://github.com/jgallenrenau/Randomuser/blob/develop/README_FILES/Darkmode.gif" align="center" /></center>

## Tests

For the Tests we have also isolated them for each layer. Where we have the data tests, the domain tests and finally the Presentation data.

## Getting Started

### Prerequisites
- Xcode 15.0.1
- iOS 17
- Swift 5.9

### Installing

The project uses Swift Package Manager for dependency management. Just open `RandomUser.xcodeproj`, select the target `RandomUser` target and run it.

For testing just only have to run:

- DataTest
- DomainTest
- Presentation Test

### Tasks under construction

I am creating two layers in the repository layer. One will be the one that will call the repository, the Network layer
and the other layer, the layer called "Persistence", where we will have a CRUD manager for data management.
All of this stored in "Set" data sets (since access to these, since they are not ordered, is O(1).

In this branch we have a preview of what was mentioned (it does not compile)

 - feature/SaveData
