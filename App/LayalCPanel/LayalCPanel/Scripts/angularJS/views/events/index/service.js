ngApp.service('eventsServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Events/' };



	//Methods
        getEvents(filter) {
            return h({
                url: `${this.basePath}getEvents`,
                method: 'post',
                data: filter
            });
        };

        getItems() {
            return h({
                url: `${this.basePath}getItems?isForFilter=${true}`,
                method: 'get',
            });
        };

        getSurveyQuestionsforUpdateEventSurvey(id) {
            return h({
                url: `${this.basePath}getSurveyQuestionsforUpdateEventSurvey?id=${id}`,
                method: 'get',
            });
        };


        getEventEmployees(id) {
            return h({
                url: `${this.basePath}getEventEmployees?id=${id}`,
                method: 'get',
            });
        };
        
		//save event  
        saveChange(event) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:event
			});
		};

	    
        saveChangeEventSurveyQuestions(qus) {

            return h({
                url: `${this.basePath}saveChangeEventSurveyQuestions`,
                method: 'post',
                data: qus
            });
        };

	    

	};
	return new funcs();
}]);