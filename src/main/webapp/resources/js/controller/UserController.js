App.controller('UserController', ['$scope', function($scope, $http) {
    var url = "http://localhost:8080/UserAccountManagement";
    var self = this;
    self.user ={
        id: null,
        firstName: "",
        lastName: "",
        email: "",
        password: ""
    }
    self.users =[];

    this.getUserList = function() {
        $http.get(url + '/users').success(function (data) {
            $scope.users = data;
        });
    }

    this.getUser = function(userId){
        http.get(url + 'user/' + userId).success(function(data){
           self.user = angular.copy(data);
        });
    }

    this.updateUser = function(){
        $http.put(url + '/user/save', self.user).success(function(){

        })
    }

}]);