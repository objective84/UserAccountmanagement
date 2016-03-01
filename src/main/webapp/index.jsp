<!doctype html>
<html ng-app="UserAccountManagement" ng-controller="UserController as controller">

<head>
    <title>User Account Management</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
          integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/app.css" type="text/css"/>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/controller/UserController.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/lib/jquery-2.2.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/lib/angular-ui/dist/mask.js"></script>
    <!--<link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>-->
    <link href='https://fonts.googleapis.com/css?family=Noto+Sans' rel='stylesheet' type='text/css'>
</head>
<body class="uam">
<div class="container">
    <div class="col-md-12">
        <form name="user" class="user-form" ng-submit="submit(user.$valid)" novalidate>
            <input type="hidden" id="user-id" ng-model="controller.user.id">
            <div class="row">
                <div class="col-sm-6 form-group"
                     ng-class="{ 'has-error' : user.firstName.$invalid &&
                                     !user.firstName.$pristine && submitted }">
                    <label for="first-name" class="form-control-label">First Name</label>
                    <input type="text" name="firstName" id="first-name" class="form-control"
                           ng-model="controller.user.firstName" placeholder="First Name" required>
                    <p ng-show="user.firstName.$invalid && !user.name.$pristine && submitted "
                       class="help-block">Required</p>
                </div>
                <div class="col-sm-6 form-group"
                     ng-class="{ 'has-error' : user.lastName.$invalid && !user.lastName.$pristine && submitted }">
                    <label for="last-name" class="form-control-label">Last Name</label>
                    <input type="text" name="lastName" id="last-name" class="form-control"
                           ng-model="controller.user.lastName" placeholder="Last Name" required>
                    <p ng-show="user.lastName.$invalid && !user.name.$pristine && submitted "
                       class="help-block">Required</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 form-group"
                     ng-class="{ 'has-error' : user.email.$invalid && !user.email.$pristine && submitted }">
                    <label for="email" class="form-control-label">Email Address</label>
                    <input type="email" name="email" id="email" class="form-control"
                           ng-model="controller.user.email" placeholder="Email Address" required>
                    <div role="alert">
                        <p ng-show="user.email.$invalid && submitted"
                           class="help-block">Enter a valid email</p>
                    </div>
                </div>
                <div class="col-sm-6 form-group">
                    <%--ng-class="{ 'has-error' : user.phone.$error. && !user.phone.$pristine && submitted }"--%>
                    <label for="phone" class="form-control-label">Phone Number</label>
                    <input type="text" name="phone" id="phone" class="form-control" ng-minlength="10"
                           ng-model="controller.user.phone"
                           ng-pattern=" /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/"
                           ui-mask="(999) 999-9999"
                           placeholder="(000) 000-0000">
                    <div role="alert">
                        <p ng-show="user.phone.$error.pattern && submitted"
                           class="help-block">Enter a valid phone number</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label for="address" class="form-control-label">Address</label>
                        <input type="text" id="address" class="form-control"
                               ng-model="controller.user.address"
                               placeholder="Street Address">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-xs-12 form-group">
                    <label for="city" class="form-control-label">City</label>
                    <input type="text" id="city" class="form-control"
                           ng-model="controller.user.city"
                           placeholder="City">
                </div>
                <div class="col-sm-3 col-xs-4 form-group">
                    <label for="state" class="form-control-label">State</label>
                    <input type="text" id="state" class="form-control"
                           ng-model="controller.user.state"
                           placeholder="State">
                </div>
                <div class="col-sm-3 col-xs-8 form-group">
                    <label for="zip" class="form-control-label">Zip Code</label>
                    <input type="text" id="zip" class="form-control"
                           ng-model="controller.user.zip"
                           placeholder="Zipcode">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 ">
                    <button type="submit" class="btn btn-primary pull-right" id="add-update-btn">
                        {{addUpdateBtn}}
                    </button>
                    <button type="button" class="btn btn-link pull-right" ng-click="controller.clearForm()">
                        Cancel
                    </button>
                </div>
            </div>
        </form>
    </div>


    <div class="col-sm-12">
        <table class="table">
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
                <td>
                    <button class="btn btn-default" ng-click="controller.getUser(user.id)">Edit</button>
                    <button class="btn btn-default" ng-click="controller.deleteUser(user.id)">Delete</button>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>