ngApp.service('eventSurveyQuestionTypesServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/EventSurveyQuestionTypes/' };



	//Methods
        getEventSurveyQuestionTypes(filter) {
            return h({
                url: `${this.basePath}getEventSurveyQuestionTypes?take=${filter.take}&skip=${filter.skip}`,
                method: 'get',
            });
        };

     

		//save eventSurveyQuestionType  
        saveChange(eventSurveyQuestionType) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:eventSurveyQuestionType
			});
		};



	};
	return new funcs();
}]);