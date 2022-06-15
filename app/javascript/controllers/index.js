// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HeatController from "./heat_controller.js"
application.register("heat", HeatController)

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import IndexFilterController from "./index_filter_controller.js"
application.register("index-filter", IndexFilterController)

import MapController from "./map_controller.js"
application.register("map", MapController)

import MapManyController from "./map_many_controller.js"
application.register("map-many", MapManyController)
