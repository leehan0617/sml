/**
 * 
 */
var app = angular.module('app', []);

app.directive("login", function() {
    return {
            restrict: "C",
            transclude: true,
            templateUrl: "login.jsp"
    }
});

app.directive("sign", function() {
    return {
            restrict: "C",
            transclude: true,
            templateUrl: "sign.jsp"
    }
});