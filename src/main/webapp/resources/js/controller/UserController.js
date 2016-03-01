uamApp.controller('UserController', ['$scope', '$http', function ($scope, $http) {
    var url = "http://localhost:8080/UserAccountManagement";
    var self = this;
    var user = {
        id: null,
        firstName: "",
        lastName: "",
        email: "",
        phone: "",
        address: "",
        city: "",
        state: "",
        zip: ""
    };

    self.users = [];
    $scope.addUpdateBtn = "Add";

    this.getUserList = function () {
        $http.get(url + '/users').success(function (data) {
            $scope.users = data;
        });
    };

    this.getUser = function (userId) {
        $http.get(url + '/user/' + userId).success(function (data) {
            self.user = angular.copy(data);
            $scope.addUpdateBtn = "Update";
        });
    };

    this.deleteUser = function (userId) {
        $http.delete(url + '/user/delete/' + userId).success(function (data) {
            self.user = angular.copy(data);
            self.getUserList();
            self.clearForm();
        });
    };

    $scope.submit = function (isValid) {
        $scope.submitted = true;
        $('.form-control').addClass("submitted");
        if (isValid) {
            $http.post(url + '/user/save', self.user).success(function () {
                self.getUserList();
                self.clearForm();
            });
        }
    };

    this.clearForm = function () {
        self.user = {
            id: null,
            firstName: "",
            lastName: "",
            email: "",
            phone: "",
            address: "",
            city: "",
            state: "",
            zip: ""
        };
        $('.form-control').removeClass("submitted");
        $scope.addUpdateBtn = "Add";
        $scope.user.$setPristine();
        $scope.submitted = false;
    };

    this.sortBy = function(sortField){
        $http.get(url + '/users/sort-by/' + sortField).success(function (data) {
            $scope.users = data;
        });
    }

    self.getUserList();

}]);