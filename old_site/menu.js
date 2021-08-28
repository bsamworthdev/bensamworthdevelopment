myApp.directive('isActiveNav', ['$location', function($location) {
    return {
        restrict: 'A',
        link: function(scope, element) {
            scope.location = $location;
            scope.$on('$locationChangeSuccess', function(event) {
                if ('#' + $location.url() === element[0].attributes['href'].nodeValue) {
                    element.parent().addClass('selectedMenuItem');
                } else {
                    element.parent().removeClass('selectedMenuItem');
                }
            });
        }
    };
}]);