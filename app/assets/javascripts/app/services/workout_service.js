angular.module('workout.services', [])
  .factory('WorkoutService', function ($resource) {
      return $resource('/workouts/:id', {'query': {method: 'GET', isArray: false}});
  });
