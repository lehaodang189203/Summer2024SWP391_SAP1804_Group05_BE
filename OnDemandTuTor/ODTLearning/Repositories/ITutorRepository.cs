﻿using ODTLearning.Models;

namespace ODTLearning.Repositories
{
    public interface ITutorRepository 
    {
        public Task<TutorProfileModel> GetTutorProfile(string id);
        public Task<bool> UpdateTutorProfile(string idTutor, TutorProfileToUpdate model);
        public Task<List<TutorListModel>> SearchTutorList(SearchTutorModel model);
    }
}