ngApp.service('eventSurveyQuestionsServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/EventSurveyQuestions/' };



	//Methods
        geSurveyDefaultQuestions(filter) {
            return h({
                url: `${this.basePath}getDefaultQuestions`,
                method: 'get',
            });
        };

        getItems() {
            return h({
                url: `${this.basePath}getItems`,
                method: 'get',
            });
        };
     

		//save eventSurveyQuestion  
        saveChange(eventSurveyQuestion) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:eventSurveyQuestion
			});
		};



	};
	return new funcs();
}]);