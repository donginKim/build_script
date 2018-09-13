angular.module('albums', ['ngResource']).
factory('Albums', function ($resource) {
    return $resource('api/search');
}).
factory('Albums2', function ($resource) {
    return $resource('api/searchTwo');
}).
factory('Albums3', function ($resource) {
    return $resource('api/searchThree');
}).
factory('Album', function ($resource) {
    return $resource('api/search/:id', {id: '@id'});
});

function AlbumsController($scope, Albums, Albums2, Albums3, Album) {
    function list() {
        $scope.albums = Albums.query();
        $scope.albums2 = Albums2.query();
        $scope.albums3 = Albums3.query();
        console.log($scope.albums)
    }

    function clone (obj) {
        return JSON.parse(JSON.stringify(obj));
    }

    $scope.init = function() {
        list();
    };
}



