angular.module('Microservice', ['albums', 'errors', 'ngRoute']).
config(function ($locationProvider, $routeProvider) {

        $routeProvider.when('/errors', {
            controller: 'ErrorsController',
            templateUrl: 'templates/errors.html'
        });
        $routeProvider.otherwise({
            controller: 'AlbumsController',
            templateUrl: 'templates/albums.html'
        });
    }
);