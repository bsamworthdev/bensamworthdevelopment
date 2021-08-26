var myApp = angular.module('myApp', ['ngRoute', 'ngAnimate']);

myApp.config(['$locationProvider', function($locationProvider) {
    $locationProvider.hashPrefix('');
}]);

myApp.config(function($routeProvider) {


    $routeProvider

        .when('/', {
        templateUrl: 'pages/home.html',
        controller: 'homeController'
    })

    .when('/portfolio', {
        templateUrl: 'pages/portfolio.html',
        controller: 'portfolioController'
    })

    .when('/about', {
        templateUrl: 'pages/about.html',
        controller: 'aboutController'
    })

    .when('/contact', {
        templateUrl: 'pages/contact.html',
        controller: 'contactController'
    })
});

myApp.controller('homeController', ['$scope', '$log', function($scope, $log) {
    $scope.name = 'Main';
}]);

myApp.controller('portfolioController', ['$scope', '$log', function($scope, $log) {
    $scope.name = 'Portfolio';
}]);

myApp.controller('aboutController', ['$scope', '$log', function($scope, $log) {
    $scope.name = 'About';
}]);

myApp.controller('contactController', ['$scope', '$log', function($scope, $log) {
    $scope.name = 'Contact';
}]);

onload = function() {
    //myJS.setupTestimonial(true);
}

myApp.testimonialTimeGap = 10

myApp.testimonials = [{
        id: 0,
        statement: 'Ben was contracted by Bronx to develop an online spares ordering system. ' +
            'He followed the brief and added his own creative touch, to provide a simple, easy ' +
            'interface for our clients to engage and order spares via this cleverly executed software. ' +
            'I would highly recommend Ben for your web and software development.',
        author: '- Bronx Group Pty Ltd'
    },
    {
        id: 1,
        statement: 'Ben has designed and improved the nursery website. ' +
            'He has supported us to make improvements and news updates. He has' +
            ' listened to our requirements.',
        author: '- Playpals Nursery'
    },
    {
        id: 2,
        statement: 'Ben provided excellent service for my new business. He created a bespoke ' +
            'website and still maintains this for me. It is bright, inviting and informative. ' +
            'Exactly what I wanted.',
        author: '- Groovy Little Movers'
    }
];

myApp.testimonialId = 0;

myApp.controller('testimonialController', function($scope, $interval, $filter) {
    //Initiate the Timer object.
    $scope.Timer = null;

    //Timer start function.
    $scope.StartTimer = function() {
        //Set the Timer start message.
        $scope.statement = myApp.testimonials[myApp.testimonialId].statement;
        $scope.author = myApp.testimonials[myApp.testimonialId].author;
        $scope.animate = true;

        //Initialize timer
        $scope.Timer = $interval(function() {
            $scope.incrementTestimonial();
            $scope.animate = false;
            $interval(function() {
                $scope.statement = myApp.testimonials[myApp.testimonialId].statement;
                $scope.author = myApp.testimonials[myApp.testimonialId].author;
                $scope.animate = true;
            }, 300);
        }, myApp.testimonialTimeGap * 1000);
    };

    //Timer stop function.
    $scope.StopTimer = function() {

        //Cancel the Timer.
        if (angular.isDefined($scope.Timer)) {
            $interval.cancel($scope.Timer);
        }
    };

    $scope.restartTimer = function() {
        $scope.StopTimer();
        $scope.StartTimer();
    }

    $scope.incrementTestimonial = function() {
        myApp.testimonialId++;
        if (myApp.testimonialId > myApp.testimonials.length - 1) {
            myApp.testimonialId = 0;
        }
    }

    $scope.nextTestimonial = function() {
        $scope.incrementTestimonial();
        $scope.animate = false;
        $interval(function() {
            $scope.restartTimer();
        }, 300);
    }

    $scope.StopTimer();
    $scope.StartTimer();
});