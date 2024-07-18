﻿
using ODTLearning.Models;
using System.Runtime.ConstrainedExecution;
using Microsoft.EntityFrameworkCore;
using ODTLearning.DAL;
using static System.Runtime.InteropServices.JavaScript.JSType;
using ODTLearning.BLL.Helpers;
using ODTLearning.DAL.Entities;


namespace ODTLearning.BLL.Repositories
{
    public class AdminRepository : IAdminRepository
    {
        private readonly DbminiCapstoneContext _context;

        public AdminRepository(DbminiCapstoneContext context)
        {
            _context = context;
        }

        MyLibrary myLib = new MyLibrary();

        public async Task<ApiResponse<bool>> DeleteAccount(string id)
        {
            var exsitAccount = await _context.Accounts.FirstOrDefaultAsync(a => a.Id == id);

            if (exsitAccount == null)
            {
                return new ApiResponse<bool>
                {
                    Success = false,
                    Message = "Không tìm thấy người dùng"
                };
            }

            var tutor = await _context.Tutors.FirstOrDefaultAsync(x => x.IdAccount == id);

            if (tutor != null)
            {
                var educationalQualifications = await _context.EducationalQualifications.Where(x => x.IdTutor == tutor.Id).ToListAsync();

                if (educationalQualifications.Any())
                {
                    _context.EducationalQualifications.RemoveRange(educationalQualifications);
                }

                var requestLearnings = await _context.RequestLearnings.Where(x => x.IdTutor == tutor.Id).ToListAsync();

                if (requestLearnings.Any())
                {
                    _context.RequestLearnings.RemoveRange(requestLearnings);
                }

                var tutorSubjects = await _context.TutorSubjects.Where(x => x.IdTutor == tutor.Id).ToListAsync();

                if (tutorSubjects.Any())
                {
                    _context.TutorSubjects.RemoveRange(tutorSubjects);
                }

                var complaints = await _context.Complaints.Where(x => x.IdTutor == tutor.Id).ToListAsync();

                if (complaints.Any())
                {
                    _context.Complaints.RemoveRange(complaints);
                }

                var classRequests = await _context.ClassRequests.Include(x => x.IdRequestNavigation).Where(x => x.IdTutor == tutor.Id).ToListAsync();

                if (classRequests.Any())
                {
                    foreach (var x in classRequests)
                    {
                        if (x.IdRequestNavigation.Status.ToLower() == "đang diễn ra")
                        {
                            return new ApiResponse<bool>
                            {
                                Success = false,
                                Message = "Người dùng đang có lớp học. Không thể xóa."
                            };
                        }
                    }

                    _context.ClassRequests.RemoveRange(classRequests);
                }
                var rents = await _context.Rents.Where(x => x.IdTutor == tutor.Id).ToListAsync();

                if (rents.Any())
                {
                    _context.Rents.RemoveRange(rents);
                }

                var reviews = await _context.Reviews.Where(x => x.IdTutor == tutor.Id).ToListAsync();

                if (reviews.Any())
                {
                    _context.Reviews.RemoveRange(reviews);
                }

                var services = await _context.Services.Where(x => x.IdTutor == tutor.Id).ToListAsync();

                if (services.Any())
                {
                    _context.Services.RemoveRange(services);

                    foreach (var service in services)
                    {
                        var dates = await _context.Dates.Where(x => x.IdService == service.Id).ToListAsync();

                        if (dates.Any())
                        {
                            _context.Dates.RemoveRange(dates);

                            foreach (var date in dates)
                            {
                                var timeSlots = await _context.TimeSlots.Where(x => x.IdDate == date.Id).ToListAsync();

                                if (timeSlots.Any())
                                {
                                    _context.TimeSlots.RemoveRange(timeSlots);

                                    foreach (var timeSlot in timeSlots)
                                    {
                                        var bookings = await _context.Bookings.Where(x => x.IdTimeSlot == timeSlot.Id).ToListAsync();

                                        if (bookings.Any())
                                        {
                                            _context.Bookings.RemoveRange(bookings);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                _context.Tutors.Remove(tutor);
            }

            var complaints2 = await _context.Complaints.Where(x => x.IdAccount == id).ToListAsync();

            if (complaints2.Any())
            {
                _context.Complaints.RemoveRange(complaints2);
            }

            var refreshTokens = await _context.RefreshTokens.Where(x => x.IdAccount == id).ToListAsync();

            if (refreshTokens.Any())
            {
                _context.RefreshTokens.RemoveRange(refreshTokens);
            }

            var reviews2 = await _context.Reviews.Where(x => x.IdAccount == id).ToListAsync();

            if (reviews2.Any())
            {
                _context.Reviews.RemoveRange(reviews2);
            }
            var notifi = await _context.Notifications.Where(x => x.IdAccount == id).ToListAsync();

            if (notifi.Any())
            {
                _context.Notifications.RemoveRange(notifi);
            }
            var transactions = await _context.Transactions.Where(x => x.IdAccount == id).ToListAsync();

            if (transactions.Any())
            {
                _context.Transactions.RemoveRange(transactions);
            }

            var rents2 = await _context.Rents.Where(x => x.IdAccount == exsitAccount.Id).ToListAsync();

            if (rents2.Any())
            {
                _context.Rents.RemoveRange(rents2);
            }

            var requests = await _context.Requests.Where(x => x.IdAccount == id).ToListAsync();

            if (requests.Any())
            {
                _context.Requests.RemoveRange(requests);

                foreach (var request in requests)
                {
                    if (request.Status.ToLower() == "đang diễn ra")
                    {
                        return new ApiResponse<bool>
                        {
                            Success = false,
                            Message = "người dùng đang có lớp học. Không thể xóa."
                        };
                    }
                    var requestLearnings2 = await _context.RequestLearnings.Where(x => x.IdRequest == request.Id).ToListAsync();

                    if (requestLearnings2.Any())
                    {
                        _context.RequestLearnings.RemoveRange(requestLearnings2);
                    }

                    var classRequests2 = await _context.ClassRequests.Where(x => x.IdRequest == request.Id).ToListAsync();

                    if (classRequests2.Any())
                    {
                        _context.ClassRequests.RemoveRange(classRequests2);
                    }
                }
            }

            var bookings2 = await _context.Bookings.Where(x => x.IdAccount == exsitAccount.Id).ToListAsync();

            if (bookings2.Any())
            {
                foreach (var x in bookings2)
                {
                    if (x.Status.ToLower() == "đang diễn ra")
                    {
                        return new ApiResponse<bool>
                        {
                            Success = false,
                            Message = "người dùng đang có lớp học. Không thể xóa."
                        };
                    }
                }
                _context.Bookings.RemoveRange(bookings2);
            }

            _context.Accounts.Remove(exsitAccount);

            await _context.SaveChangesAsync();

            return new ApiResponse<bool>
            {
                Success = true,
                Message = "Xóa người dùng thành công"
            };
        }

        public async Task<ApiResponse<List<ListAllStudent>>> GetListStudent()
        {
            try
            {
                var ListStudent = await _context.Accounts
                   .Where(t => t.Roles == "Học sinh")
                    .Select(t => new ListAllStudent
                    {
                        id = t.Id,
                        email = t.Email,
                        password = t.Password,
                        date_of_birth = t.DateOfBirth,
                        fullName = t.FullName,
                        gender = t.Gender,
                        phone = t.Phone,
                        roles = t.Roles,
                    }).ToListAsync();
                return new ApiResponse<List<ListAllStudent>>
                {
                    Success = true,
                    Message = "Lấy danh sách học sinh thành công",
                    Data = ListStudent
                };
            }
            catch (Exception ex)
            {
                // Ghi lại lỗi nếu cần thiết
                Console.WriteLine($"Error in GetListsToConfirm: {ex.Message}");

                return new ApiResponse<List<ListAllStudent>>
                {
                    Success = false,
                    Message = "Đã xảy ra lỗi trong quá trình lấy danh sách gia sư",
                    Data = null
                };
            }
        }

        public async Task<ApiResponse<List<ListAllTutor>>> GetListTutor()
        {
            try
            {
                var listTutors = await _context.Accounts
                    .Where(a => a.Roles.ToLower() == "gia sư")
                    .Include(a => a.Tutor)
                        .ThenInclude(t => t.TutorSubjects)
                            .ThenInclude(ts => ts.IdSubjectNavigation)
                    .Include(a => a.Tutor)
                        .ThenInclude(t => t.EducationalQualifications)
                    .Select(a => new ListAllTutor
                    {
                        Id = a.Id,
                        Avatar = a.Avatar,
                        FullName = a.FullName,
                        Date_of_birth = a.DateOfBirth.HasValue ? a.DateOfBirth.Value.ToString("yyyy-MM-dd") : null,
                        Gender = a.Gender,
                        SpecializedSkills = a.Tutor.SpecializedSkills,
                        Experience = a.Tutor.Experience,
                        Subjects = string.Join("; ", a.Tutor.TutorSubjects.Select(ts => ts.IdSubjectNavigation.SubjectName)),
                        Qualifications = a.Tutor.EducationalQualifications.Select(eq => new Qualification
                        {
                            IdQualifications = eq.Id,
                            QualificationName = eq.QualificationName,
                            Img = eq.Img,
                            Type = eq.Type
                        }).ToList(),
                        Introduction = a.Tutor.Introduction,
                        Rating = a.Tutor.Reviews.Any() ? a.Tutor.Reviews.Average(r => r.Rating).Value.ToString("0.00") : "N/A"
                    }).ToListAsync();

                return new ApiResponse<List<ListAllTutor>>
                {
                    Success = true,
                    Message = "Lấy danh sách gia sư thành công",
                    Data = listTutors
                };
            }
            catch (Exception ex)
            {
                // Log the error if needed
                Console.WriteLine($"Error in GetListTutor: {ex.Message}");

                return new ApiResponse<List<ListAllTutor>>
                {
                    Success = false,
                    Message = "Đã xảy ra lỗi trong quá trình lấy danh sách gia sư",
                };
            }
        }



        public async Task<ApiResponse<List<ViewRequestOfStudent>>> GetListRequestPending()
        {
            try
            {
                var ListRequestPending = await _context.Requests
                    .Include(t => t.IdAccountNavigation)
                    .Include(t => t.IdClassNavigation)
                    .Include(t => t.IdSubjectNavigation)
                    .Where(t => t.Status == "Đang duyệt")
                    .Select(t => new ViewRequestOfStudent
                    {
                        IdRequest = t.Id,
                        Title = t.Title,
                        Price = t.Price,
                        Class = t.IdClassNavigation.ClassName,
                        TimeStart = t.TimeStart.HasValue ? t.TimeStart.Value.ToString("HH:mm") : null, // Convert TimeOnly? to string
                        TimeEnd = t.TimeEnd.HasValue ? t.TimeEnd.Value.ToString("HH:mm") : null, // Convert TimeOnly? to string
                        TimeTable = t.TimeTable,
                        TotalSessions = t.TotalSession,
                        Subject = t.IdSubjectNavigation.SubjectName,
                        FullName = t.IdAccountNavigation.FullName,
                        Description = t.Description,
                        Status = t.Status,
                        LearningMethod = t.LearningMethod,
                    }).ToListAsync();
                return new ApiResponse<List<ViewRequestOfStudent>>
                {
                    Success = true,
                    Message = "Lấy danh sách yêu cầu chưa duyệt thành công",
                    Data = ListRequestPending
                };
            }
            catch (Exception ex)
            {
                // Ghi lại lỗi nếu cần thiết
                Console.WriteLine($"Error in GetListRequestPending: {ex.Message}");

                return new ApiResponse<List<ViewRequestOfStudent>>
                {
                    Success = false,
                    Message = "Đã xảy ra lỗi trong quá trình lấy danh sách yêu cầu",
                    Data = null
                };
            }
        }
        public async Task<ApiResponse<List<ViewRequestOfStudent>>> GetListRequestApproved()
        {
            try
            {
                var ListRequestPending = await _context.Requests
                    .Include(t => t.IdAccountNavigation)
                    .Include(t => t.IdClassNavigation)
                    .Include(t => t.IdSubjectNavigation)
.Where(t => t.Status == "Đã duyệt")
                    .Select(t => new ViewRequestOfStudent
                    {
                        IdRequest = t.Id,
                        Title = t.Title,
                        Price = t.Price,
                        Class = t.IdClassNavigation.ClassName,
                        TimeStart = t.TimeStart.HasValue ? t.TimeStart.Value.ToString("HH:mm") : null, // Convert TimeOnly? to string
                        TimeEnd = t.TimeEnd.HasValue ? t.TimeEnd.Value.ToString("HH:mm") : null, // Convert TimeOnly? to string
                        TimeTable = t.TimeTable,
                        TotalSessions = t.TotalSession,
                        Subject = t.IdSubjectNavigation.SubjectName,
                        FullName = t.IdAccountNavigation.FullName,
                        Description = t.Description,
                        Status = t.Status,
                        LearningMethod = t.LearningMethod,
                    }).ToListAsync();
                return new ApiResponse<List<ViewRequestOfStudent>>
                {
                    Success = true,
                    Message = "Lấy danh sách đã duyệt thành công",
                    Data = ListRequestPending
                };
            }
            catch (Exception ex)
            {
                // Ghi lại lỗi nếu cần thiết
                Console.WriteLine($"Error in GetListRequestPending: {ex.Message}");

                return new ApiResponse<List<ViewRequestOfStudent>>
                {
                    Success = false,
                    Message = "Đã xảy ra lỗi trong quá trình lấy danh sách yêu cầu",
                    Data = null
                };
            }
        }
        public async Task<ApiResponse<List<ViewRequestOfStudent>>> GetListRequestReject()
        {
            try
            {
                var ListRequestPending = await _context.Requests
                    .Include(t => t.IdAccountNavigation)
                    .Include(t => t.IdClassNavigation)
                    .Include(t => t.IdSubjectNavigation)
                    .Where(t => t.Status == "Từ chối")
                    .Select(t => new ViewRequestOfStudent
                    {
                        IdRequest = t.Id,
                        Title = t.Title,
                        Price = t.Price,
                        Class = t.IdClassNavigation.ClassName,
                        TimeStart = t.TimeStart.HasValue ? t.TimeStart.Value.ToString("HH:mm") : null, // Convert TimeOnly? to string
                        TimeEnd = t.TimeEnd.HasValue ? t.TimeEnd.Value.ToString("HH:mm") : null, // Convert TimeOnly? to string
                        TimeTable = t.TimeTable,
                        TotalSessions = t.TotalSession,
                        Subject = t.IdSubjectNavigation.SubjectName,
                        FullName = t.IdAccountNavigation.FullName,
                        Description = t.Description,
                        Status = t.Status,
                        LearningMethod = t.LearningMethod,
                    }).ToListAsync();
                return new ApiResponse<List<ViewRequestOfStudent>>
                {
                    Success = true,
                    Message = "Lấy danh sách yêu cầu bị từ chối thành công",
                    Data = ListRequestPending
                };
            }
            catch (Exception ex)
            {
                // Ghi lại lỗi nếu cần thiết
                Console.WriteLine($"Error in GetListRequestPending: {ex.Message}");

                return new ApiResponse<List<ViewRequestOfStudent>>
                {
                    Success = false,
                    Message = "Đã xảy ra lỗi trong quá trình lấy danh sách yêu cầu",
                    Data = null
                };
            }
        }
        //public async Task<ApiResponse<object>> ViewRent(string Condition)
        //{
        //    var rent = _context.Rents.AsQueryable();

        //    DateTime? date = null;

        //    if (Condition.ToLower() == "1 tuần")
        //    {
        //        date = DateTime.Now.AddDays(-7);
        //    }
        //    if (Condition.ToLower() == "1 tháng")
        //    {
        //        date = DateTime.Now.AddMonths(-1);
        //    }

        //    if (date != null)
        //    {
        //        rent = rent.Where(x => x.CreateDate >= date);
        //    }

        //    var data = rent.Include(x => x.IdRequestNavigation).ThenInclude(x => x.IdSubjectNavigation)
        //                   .Include(x => x.IdRequestNavigation).ThenInclude(x => x.IdAccountNavigation)
        //                   .Join(_context.Accounts, r => r.IdTutor, a => a.Id, (r, a) => new
        //                   {
        //                       User = new
        //                       {
        //                           Name = r.IdRequestNavigation.IdAccountNavigation.FullName,
        //                           Email = r.IdRequestNavigation.IdAccountNavigation.Email,
        //                           DateOfBirth = r.IdRequestNavigation.IdAccountNavigation.DateOfBirth,
        //                           Gender = r.IdRequestNavigation.IdAccountNavigation.Gender,
        //                           Avatar = r.IdRequestNavigation.IdAccountNavigation.Avatar,
        //                           Address = r.IdRequestNavigation.IdAccountNavigation.Address,
        //                           Phone = r.IdRequestNavigation.IdAccountNavigation.Phone
        //                       },
        //                       Subject = r.IdRequestNavigation.IdSubjectNavigation.SubjectName,
        //                       Price = r.Price,
        //                       CreateDate = r.CreateDate,
        //                       Tutor = new
        //                       {
        //                           Name = a.FullName,
        //                           Email = a.Email,
        //                           DateOfBirth = a.DateOfBirth,
        //                           Gender = a.Gender,
        //                           Avatar = a.Avatar,
        //                           Address = a.Address,
        //                           Phone = a.Phone
        //                       },
        //                   }).ToList();

        //    return new ApiResponse<object>
        //    {
        //        Success = true,
        //        Message = "Thành công",
        //        Data = data
        //    };
        //}

        public async Task<ApiResponse<object>> GetAllComplaint()
        {
            var complaints = await _context.Complaints.Include(x => x.IdAccountNavigation)
                                               .Include(x => x.IdTutorNavigation).ThenInclude(x => x.IdAccountNavigation)
                                               .Select(c => new
                                               {
                                                   User = new
                                                   {
                                                       Id = c.IdAccountNavigation.Id,
                                                       FullName = c.IdAccountNavigation.FullName,
                                                       Email = c.IdAccountNavigation.Email,
                                                       Date_of_birth = c.IdAccountNavigation.DateOfBirth,
                                                       Gender = c.IdAccountNavigation.Gender,
                                                       Avatar = c.IdAccountNavigation.Avatar,
                                                       Address = c.IdAccountNavigation.Address,
                                                       Phone = c.IdAccountNavigation.Phone,
                                                       Roles = c.IdAccountNavigation.Roles
                                                   },

                                                   Description = c.Description,

                                                   Tutor = new
                                                   {
                                                       Id = c.IdTutorNavigation.IdAccountNavigation.Id,
                                                       FullName = c.IdTutorNavigation.IdAccountNavigation.FullName,
                                                       Email = c.IdTutorNavigation.IdAccountNavigation.Email,
                                                       Date_of_birth = c.IdTutorNavigation.IdAccountNavigation.DateOfBirth,
                                                       Gender = c.IdTutorNavigation.IdAccountNavigation.Gender,
                                                       Avatar = c.IdTutorNavigation.IdAccountNavigation.Avatar,
                                                       Address = c.IdTutorNavigation.IdAccountNavigation.Address,
                                                       Phone = c.IdTutorNavigation.IdAccountNavigation.Phone,
                                                       Roles = c.IdTutorNavigation.IdAccountNavigation.Roles
                                                   }


                                               }).ToListAsync();


            if (!complaints.Any())
            {
                return new ApiResponse<object>
                {
                    Success = true,
                    Message = "Không có khiếu nại nào"
                };
            }

            return new ApiResponse<object>
            {
                Success = true,
                Message = "Thành công",
                Data = complaints
            };
        }
        public async Task<ApiResponse<object>> GetAllReview()
        {
            var complaints = await _context.Reviews.Include(x => x.IdAccountNavigation)
                                               .Include(x => x.IdTutorNavigation).ThenInclude(x => x.IdAccountNavigation)
                                               .Select(c => new
                                               {
                                                   User = new
                                                   {
                                                       Id = c.IdAccountNavigation.Id,
                                                       FullName = c.IdAccountNavigation.FullName,
                                                       Email = c.IdAccountNavigation.Email,
                                                       Date_of_birth = c.IdAccountNavigation.DateOfBirth,
                                                       Gender = c.IdAccountNavigation.Gender,
                                                       Avatar = c.IdAccountNavigation.Avatar,
                                                       Address = c.IdAccountNavigation.Address,
                                                       Phone = c.IdAccountNavigation.Phone,
                                                       Roles = c.IdAccountNavigation.Roles
                                                   },

                                                   c.Rating,
                                                   c.Feedback,

                                                   Tutor = new
                                                   {
                                                       Id = c.IdTutorNavigation.IdAccountNavigation.Id,
                                                       FullName = c.IdTutorNavigation.IdAccountNavigation.FullName,
                                                       Email = c.IdTutorNavigation.IdAccountNavigation.Email,
                                                       Date_of_birth = c.IdTutorNavigation.IdAccountNavigation.DateOfBirth,
                                                       Gender = c.IdTutorNavigation.IdAccountNavigation.Gender,
                                                       Avatar = c.IdTutorNavigation.IdAccountNavigation.Avatar,
                                                       Address = c.IdTutorNavigation.IdAccountNavigation.Address,
                                                       Phone = c.IdTutorNavigation.IdAccountNavigation.Phone,
                                                       Roles = c.IdTutorNavigation.IdAccountNavigation.Roles
                                                   }


                                               }).ToListAsync();


            if (!complaints.Any())
            {
                return new ApiResponse<object>
                {
                    Success = true,
                    Message = "Không có khiếu nại nào"
                };
            }

            return new ApiResponse<object>
            {
                Success = true,
                Message = "Thành công",
                Data = complaints
            };
        }
        public async Task<ApiResponse<object>> GetAllTransaction()
        {
            var transactions = _context.Transactions.Include(x => x.IdAccountNavigation).Select(x => new
            {
                Id = x.Id,
                Amount = x.Amount,
                CreateDate = x.CreateDate,
                Status = x.Status,
                User = new
                {
                    Id = x.IdAccountNavigation.Id,
                    FullName = x.IdAccountNavigation.FullName,
                    Email = x.IdAccountNavigation.Email,
                    Date_of_birth = x.IdAccountNavigation.DateOfBirth,
                    Gender = x.IdAccountNavigation.Gender,
                    Avatar = x.IdAccountNavigation.Avatar,
                    Address = x.IdAccountNavigation.Address,
                    Phone = x.IdAccountNavigation.Phone,
                    Roles = x.IdAccountNavigation.Roles
                }
            }).ToList();

            if (!transactions.Any())
            {
                return new ApiResponse<object>
                {
                    Success = true,
                    Message = "Không có giao dịch nào"
                };
            }

            return new ApiResponse<object>
            {
                Success = true,
                Message = "Thành công",
                Data = transactions
            };
        }

        //public async Task<ApiResponse<object>> GetRevenueByMonth(int year)
        //{
        //    var rents = await _context.Rents.Where(x => x.CreateDate.Year == year).GroupBy(x => x.CreateDate.Month).Select(x => new
        //    {                
        //        Name = $"Tháng {x.Key}" ,
        //        Data = x.Sum(r => r.Price)
        //    }).ToListAsync();

        //    if (!rents.Any())
        //    {
        //        return new ApiResponse<object>
        //        {
        //            Success = true,
        //            Message = $"Không có việc thuê nào trong năm {year}"
        //        };
        //    }
        //    return new ApiResponse<object>
        //    {
        //        Success = true,
        //        Message = "Thành công",
        //        Data = rents
        //    };
        //}

        //public async Task<ApiResponse<object>> GetRevenueByWeek(int month, int year)
        //{
        //    var rents = _context.Rents.Where(x => x.CreateDate.Month == month && x.CreateDate.Year == year);

        //    if (!rents.Any())
        //    {
        //        return new ApiResponse<object>
        //        {
        //            Success = true,
        //            Message = $"Không có việc thuê nào trong {month}/{year}"
        //        };
        //    }

        //    var data = new List<object>();
        //    float price1 = 0;
        //    float price2 = 0;
        //    float price3 = 0;
        //    float price4 = 0;

        //    foreach (var x in rents)
        //    {
        //        if (x.CreateDate.Day <= 7)
        //        {
        //            price1 += (float) x.Price;
        //        }
        //        else if (x.CreateDate.Day > 7 && x.CreateDate.Day <= 14)
        //        {
        //            price2 += (float) x.Price;
        //        }
        //        else if (x.CreateDate.Day > 14 && x.CreateDate.Day <= 21)
        //        {
        //            price3 += (float) x.Price;
        //        }
        //        else 
        //        {
        //            price4 += (float) x.Price;
        //        }
        //    }

        //    var week1 = new
        //    {
        //        Name = "Tuần 1",
        //        Data = price1
        //    };

        //    var week2 = new
        //    {
        //        Name = "Tuần 2",
        //        Data = price2
        //    };

        //    var week3 = new
        //    {
        //        Name = "Tuần 3",
        //        Data = price3
        //    };

        //    var week4 = new
        //    {
        //        Name = "Tuần 4",
        //        Data = price4
        //    };

        //    data.Add(week1);
        //    data.Add(week2);
        //    data.Add(week3);
        //    data.Add(week4);

        //    return new ApiResponse<object>
        //    {
        //        Success = true,
        //        Message = "Thành công",
        //        Data = data
        //    };
        //}

        public async Task<ApiResponse<object>> GetRevenueByMonth(int year)
        {
            var transactions = await _context.Transactions.Where(x => x.CreateDate.Year == year).GroupBy(x => x.CreateDate.Month).Select(x => new
            {
                Name = $"Tháng {x.Key}",
                Data = x.Sum(r => r.Amount)
            }).ToListAsync();

            if (!transactions.Any())
            {
                return new ApiResponse<object>
                {
                    Success = true,
                    Message = $"Không có giao dịch nào trong năm {year}"
                };
            }
            return new ApiResponse<object>
            {
                Success = true,
                Message = "Thành công",
                Data = transactions
            };
        }

        public async Task<ApiResponse<object>> GetRevenueByWeek(int month, int year)
        {
            var transactions = _context.Transactions.Where(x => x.CreateDate.Month == month && x.CreateDate.Year == year);

            if (!transactions.Any())
            {
                return new ApiResponse<object>
                {
                    Success = true,
                    Message = $"Không có giao dịch nào trong {month}/{year}"
                };
            }

            var data = new List<object>();
            float price1 = 0;
            float price2 = 0;
            float price3 = 0;
            float price4 = 0;

            foreach (var x in transactions)
            {
                if (x.CreateDate.Day <= 7)
                {
                    price1 += (float)x.Amount;
                }
                else if (x.CreateDate.Day > 7 && x.CreateDate.Day <= 14)
                {
                    price2 += (float)x.Amount;
                }
                else if (x.CreateDate.Day > 14 && x.CreateDate.Day <= 21)
                {
                    price3 += (float)x.Amount;
                }
                else
                {
                    price4 += (float)x.Amount;
                }
            }

            var monthData = "";

            if (month < 10)
            {
                monthData = $"0{month}";
            }
            else
            {
                monthData = $"{month}";
            }

            var lastDay = new DateTime(year, month, 1).AddMonths(1).AddDays(-1).Day;

            var week1 = new
            {
                Name = "Tuần 1",
                Date = $"01/{monthData}/{year} - 07/{monthData}/{year}",
                Revenue = price1,
                Month = month,
                Year = year
            };

            var week2 = new
            {
                Name = "Tuần 2",
                Date = $"08/{monthData}/{year} - 14/{monthData}/{year}",
                Revenue = price2,
                Month = month,
                Year = year
            };

            var week3 = new
            {
                Name = "Tuần 3",
                Date = $"15/{monthData}/{year} - 21/{monthData}/{year}",
                Revenue = price3,
                Month = month,
                Year = year
            };

            var week4 = new
            {
                Name = "Tuần 4",
                Date = $"22/{monthData}/{year} - {lastDay}/{monthData}/{year}",
                Revenue = price4,
                Month = month,
                Year = year
            };

            data.Add(week1);
            data.Add(week2);
            data.Add(week3);
            data.Add(week4);

            return new ApiResponse<object>
            {
                Success = true,
                Message = "Thành công",
                Data = data
            };
        }

        public async Task<ApiResponse<object>> GetRevenueByYear(int year)
        {
            var data = new List<object>();

            for (int month = 1; month <= 12; month++)
            {
                var transactions = _context.Transactions.Where(x => x.CreateDate.Month == month && x.CreateDate.Year == year);

                float price1 = 0;
                float price2 = 0;
                float price3 = 0;
                float price4 = 0;

                foreach (var x in transactions)
                {
                    if (x.CreateDate.Day <= 7)
                    {
                        price1 += (float)x.Amount;
                    }
                    else if (x.CreateDate.Day > 7 && x.CreateDate.Day <= 14)
                    {
                        price2 += (float)x.Amount;
                    }
                    else if (x.CreateDate.Day > 14 && x.CreateDate.Day <= 21)
                    {
                        price3 += (float)x.Amount;
                    }
                    else
                    {
                        price4 += (float)x.Amount;
                    }
                }

                var monthData = "";

                if (month < 10)
                {
                    monthData = $"0{month}";
                }
                else
                {
                    monthData = $"{month}";
                }

                var lastDay = new DateTime(year, month, 1).AddMonths(1).AddDays(-1).Day;

                var week1 = new
                {
                    Name = "Tuần 1",
                    Date = $"01/{monthData}/{year} - 07/{monthData}/{year}",
                    Revenue = price1,
                    Month = month,
                    Year = year
                };

                var week2 = new
                {
                    Name = "Tuần 2",
                    Date = $"08/{monthData}/{year} - 14/{monthData}/{year}",
                    Revenue = price2,
                    Month = month,
                    Year = year
                };

                var week3 = new
                {
                    Name = "Tuần 3",
                    Date = $"15/{monthData}/{year} - 21/{monthData}/{year}",
                    Revenue = price3,
                    Month = month,
                    Year = year
                };

                var week4 = new
                {
                    Name = "Tuần 4",
                    Date = $"22/{monthData}/{year} - {lastDay}/{monthData}/{year}",
                    Revenue = price4,
                    Month = month,
                    Year = year
                };

                data.Add(week1);
                data.Add(week2);
                data.Add(week3);
                data.Add(week4);
            }

            return new ApiResponse<object>
            {
                Success = true,
                Message = "Thành công",
                Data = data
            };
        }

        public async Task<ApiResponse<object>> GetRevenueThisMonth()
        {
            var now = DateTime.Now;

            var transactions = await _context.Transactions.Where(x => x.CreateDate.Year == now.Year && x.CreateDate.Month == now.Month).ToListAsync();

            if (!transactions.Any())
            {
                return new ApiResponse<object>
                {
                    Success = true,
                    Message = "không có giao dịch nào trong tháng này"
                };
            }

            float? revenue = 0;
            foreach (var x in transactions)
            {
                revenue += x.Amount;
            }

            return new ApiResponse<object>
            {
                Success = true,
                Message = "Thành công",
                Data = revenue
            };
        }

        public async Task<ApiResponse<int>> GetAmountStudent()
        {
            var count = _context.Accounts.Count(x => x.Roles.ToLower() == "học sinh");

            return new ApiResponse<int>
            {
                Success = true,
                Message = "Thành công",
                Data = count
            };
        }

        public async Task<ApiResponse<int>> GetAmountTutor()
        {
            var count = _context.Accounts.Count(x => x.Roles.ToLower() == "gia sư");

            return new ApiResponse<int>
            {
                Success = true,
                Message = "Thành công",
                Data = count
            };
        }

        public async Task<ApiResponse<object>> GetRevenueToday()
        {
            var revenue = await _context.Transactions.Where(x => DateOnly.FromDateTime(x.CreateDate) == DateOnly.FromDateTime(DateTime.Now)).SumAsync(x => x.Amount);

            if (revenue == 0)
            {
                return new ApiResponse<object>
                {
                    Success = true,
                    Message = "không có giao dịch nào trong tháng này",
                    Data = revenue
                };
            }

            return new ApiResponse<object>
            {
                Success = true,
                Message = "Thành công",
                Data = revenue
            };
        }
    }
}