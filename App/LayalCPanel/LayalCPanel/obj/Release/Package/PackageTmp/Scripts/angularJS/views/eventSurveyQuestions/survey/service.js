ngApp.service('eventSurveyQuestionsServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/EventSurveyQuestions/' };



	//Methods
        getEventSurvey(id) {
            return h({
                url: `${this.basePath}getEventSurvey?id=${id}`,
                method: 'get',
            });
        };
        getEvent(eventId) {
            return h({
                url: `${this.basePath}getEvent?eventId=${eventId}`,
                method: 'get',
            });
        }
		//save eventSurveyQuestion  
        saveChange(eventSurvey) {
			return h({
			    url: `${this.basePath}saveChangeEventSurveyAnswerer`,
				method: 'post',
				data:eventSurvey
			});
		};



	};
	return new funcs();
}]);