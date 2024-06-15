﻿namespace ODTLearning.Models
{
    public class TutorListModel
    {
        public string? FirstName { get; set; }

        public string? LastName { get; set; }

        public string? Gmail { get; set; }

        public DateOnly? Birthdate { get; set; }

        public string? Gender { get; set; }

        public object Field { get; set; }
    }
}