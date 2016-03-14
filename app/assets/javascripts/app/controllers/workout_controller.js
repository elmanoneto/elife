angular.module('workout.controller', [])
  .controller('WorkoutController', function ($scope, WorkoutService) {

    WorkoutService.query(function (data) {
      $scope.workouts = data;
    });

    $scope.$watch('workouts', function(){
      calculateTotalTime();
    }, true);

    $scope.add = function (time, date, type) {
      var data = {
        time: time.getHours()+'h'+time.getMinutes(),
        date: date,
        type: type
      }

      WorkoutService.save(data, function (data) {
        $scope.workouts.push(data.success);
        $scope.time = '';
        $scope.date = '';
        $scope.type = '';
      });
    }

    $scope.remove = function (id, index) {
      WorkoutService.delete({id: id}, function (data) {
        $scope.workouts.splice(index, 1);
      });
    }

    function calculateTotalTime() {
      var hours = 0;
      var minutes = 0;

      for (i in $scope.workouts) {
        if ($scope.workouts[i].time) {
          hours += parseInt($scope.workouts[i].time.substring(0, $scope.workouts[i].time.indexOf("h")));
          minutes += parseInt($scope.workouts[i].time.substr($scope.workouts[i].time.indexOf("h") + 1));

          if (minutes == 60) {
            minutes = 0;
            hours += 1;
          }
        }
      }

      $scope.total = "Tempo total de exercícios: "+hours+"h"+minutes+"."
    }
  });
