<!doctype html>
<html ng-app="UserAccountManagement">

    <head>
        <title>User Account Management</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
              integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/app.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/controller/UserController.js"></script>
    </head>
    <body>
        <div class="container">
            <div ng-controller="UserController as controller">
                There are {{users.length}} users.
                <table class="table event-container">
                    <thead>
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tr ng-repeat="user in users">
                        <td>{{user.firstName}}</td>
                        <td>{{user.lastName}}</td>
                        <td>{{user.email}}</td>
                        <td><button class="btn btn-default" ng-click="">Edit</button>
                            <button class="btn btn-default">Delete</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div ng-controller="UserController">

            </div>
        </div>
    </body>
</html>