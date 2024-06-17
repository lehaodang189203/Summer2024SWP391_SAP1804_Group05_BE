﻿using Microsoft.EntityFrameworkCore;
using ODTLearning.Entities;
using ODTLearning.Helpers;
using ODTLearning.Models;
using System.Globalization;

namespace ODTLearning.Repositories
{
    public class StudentRepository : IStudentRepository
    {
        private readonly DbminiCapstoneContext _context;
        public StudentRepository(DbminiCapstoneContext context)
        {
            _context = context;
        }

        public async Task<ApiResponse<bool>> CreateRequestLearning(string IDAccount, RequestLearningModel model)
        {
            // Tìm sinh viên theo IdStudent
            var student = await _context.Accounts
                                  .Include(s => s.Requests)
                                  .FirstOrDefaultAsync(s => s.Id == IDAccount);

            if (student == null)
            {
                return new ApiResponse<bool>
                {
                    Success = false,
                    Message = "Không tìm thấy học sinh nào"
                };
            }

            // Tìm LearningModel theo tên
            var Class = await _context.Classes
                                              .FirstOrDefaultAsync(cl => cl.ClassName== model.Class);

            if (Class == null)
            {
                return new ApiResponse<bool>
                {
                    Success = false,
                    Message = "Không tìm thấy lớp nào với tên này. Vui lòng chọn lớp 10,11,12"
                };
            }
            var subjectModel = await _context.Subjects
                                              .FirstOrDefaultAsync(lm => lm.SubjectName== model.Subject);

            if (subjectModel == null)
            {
                return new ApiResponse<bool>
                {
                    Success = false,
                    Message = "Không tìm thấy môn học nào với tên này"
                };
            }

            // Validate và phân tích chuỗi thời gian để đảm bảo nó có định dạng đúng
            TimeOnly? parsedTimeStart = null;
            TimeOnly? parsedTimeEnd = null;
            if (!string.IsNullOrEmpty(model.TimeStart))
            {
                if (TimeOnly.TryParseExact(model.TimeStart, "HH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out var time))
                {
                    parsedTimeStart = time;
                }
                else
                {
                    return new ApiResponse<bool>
                    {
                        Success = false,
                        Message = "Ngày bắt đầu sai định dạng hh:mm"
                    };
                }
            }
            if (!string.IsNullOrEmpty(model.TimeEnd))
            {
                if (TimeOnly.TryParseExact(model.TimeEnd, "HH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out var time))
                {
                    parsedTimeEnd = time;
                }
                else
                {
                    return new ApiResponse<bool>
                    {
                        Success = false,
                        Message = "Ngày kết thúc sai định dạng hh:mm"
                    };
                }
            }

            // Tạo một đối tượng Request mới từ model
            var requestOfStudent = new Request
            {
                Id = Guid.NewGuid().ToString(),
                Title = model.Title,
                Price = model.Price,
                Description = model.Description,
                Status = "Pending",
                LearningMethod = model.LearningMethod,
                IdAccount = IDAccount, // Đảm bảo ID tài khoản được đặt
                IdSubject = subjectModel.Id,
                IdClass = Class.Id // Đảm bảo thuộc tính này được đặt
            };

            // Thêm Request vào context
            await _context.Requests.AddAsync(requestOfStudent);
            await _context.SaveChangesAsync();

            // Tạo một đối tượng Schedule mới nếu có thông tin về lịch trình
            if (model.Date.HasValue && parsedTimeStart.HasValue && parsedTimeEnd.HasValue)
            {
                var schedule = new Schedule
                {
                    Id = Guid.NewGuid().ToString(),
                    Date = model.Date.Value,
                    TimeStart = parsedTimeStart.Value,
                    TimeEnd = parsedTimeEnd.Value,
                    IdService = null, // Placeholder, thay bằng ID dịch vụ thực tế
                    IdRequest = requestOfStudent.Id,
                };

                // Thêm Schedule vào context
                await _context.Schedules.AddAsync(schedule);
                await _context.SaveChangesAsync();
            }

            return new ApiResponse<bool>
            {
                Success = true,
                Message = "Tạo yêu cầu thành công",
            };
        }



        public async Task<Request> UpdateRequestLearning(string requestId, RequestLearningModel model)
        {
            // Tìm request theo requestId
            var requestToUpdate = await _context.Requests
                                          .Include(r => r.Schedules)
                                          .FirstOrDefaultAsync(r => r.Id == requestId);

            if (requestToUpdate == null)
            {
                throw new ArgumentException("Request not found");
            }

            // Cập nhật các thuộc tính của request từ model
            requestToUpdate.Title = model.Title ?? requestToUpdate.Title;
            requestToUpdate.Price = model.Price ?? requestToUpdate.Price;
            requestToUpdate.Description = model.Description ?? requestToUpdate.Description;
            requestToUpdate.IdSubject = model.Subject ?? requestToUpdate.IdSubject;

            // Validate and parse the time string to ensure it is in the correct format
            TimeSpan? parsedTime = null;
            if (!string.IsNullOrEmpty(model.TimeStart))
            {
                if (TimeSpan.TryParseExact(model.TimeStart, "hh\\:mm", CultureInfo.InvariantCulture, TimeSpanStyles.None, out var time))
                {
                    parsedTime = time;
                }
                else
                {
                    throw new ArgumentException("Invalid time format. Use HH:mm.");
                }
            }

            if (!string.IsNullOrEmpty(model.TimeEnd))
            {
                if (TimeSpan.TryParseExact(model.TimeEnd, "hh\\:mm", CultureInfo.InvariantCulture, TimeSpanStyles.None, out var time))
                {
                    parsedTime = time;
                }
                else
                {
                    throw new ArgumentException("Invalid time format. Use HH:mm.");
                }
            }
            // Cập nhật schedule nếu có thông tin về lịch trình
            if (model.Date.HasValue && parsedTime.HasValue)
            {
                var scheduleToUpdate = requestToUpdate.Schedules.FirstOrDefault();
                if (scheduleToUpdate != null)
                {
                    scheduleToUpdate.Date = model.Date.Value;
                   // scheduleToUpdate.Time = parsedTime.Value;
                   // scheduleToUpdate.ID_Service = "ServiceID1"; // Placeholder, replace with actual service ID
                }
                else
                {
                    // Tạo mới schedule nếu chưa tồn tại
                    var newSchedule = new Schedule
                    {
                        Id = Guid.NewGuid().ToString(),
                        Date = model.Date.Value,
                       // Time = parsedTime.Value,
                       // ID_Service = "ServiceID1", // Placeholder, replace with actual service ID
                        //ID_Request = requestToUpdate.Id,
                    };
                    await _context.Schedules.AddAsync(newSchedule);
                }
            }

            // Lưu các thay đổi vào context
            await _context.SaveChangesAsync();

            return requestToUpdate;
        }
        public async Task<bool> DeleteRequestLearning(string requestId)
        {
            // Tìm request theo requestId
            var requestToDelete = await _context.Requests
                                          .Include(r => r.Schedules)
                                          .FirstOrDefaultAsync(r => r.Id == requestId);

            if (requestToDelete == null)
            {
                throw new ArgumentException("Request not found");
            }

            // Xóa các schedules liên quan
            if (requestToDelete.Schedules != null)
            {
                _context.Schedules.RemoveRange(requestToDelete.Schedules);
            }

            // Xóa request
            _context.Requests.Remove(requestToDelete);
            await _context.SaveChangesAsync();

            return true; // Trả về true nếu việc xóa thành công
        }

        public async Task<List<Request>> GetPendingApproveRequests()
        {
            return _context.Requests
                           .Where(r => r.Status == "pending approve")
                           .Include(r => r.IdAccountNavigation)
                           .Include(r => r.IdClassNavigation )
                           .ToList();
        }

        // Hàm lấy tất cả các Requests có trạng thái "approved"
        public async Task<List<Request>> GetApprovedRequests()
        {
            return _context.Requests
                           .Where(r => r.Status == "approved")
                           .Include(r => r.IdAccountNavigation)
                           .Include(r => r.IdClassNavigation)
                           .ToList();
        }

        //get profile student
        public async Task<object> GetStudentProfile(string id)
        {
            var account = await _context.Accounts.SingleOrDefaultAsync(x => x.Id == id && x.Roles == "Student");

            if (account == null)
            {
                return null;
            }            

            //dua vao model            
            return new
            {
                Id = id,
                Gmail = account.Email,
                FullName = account.FullName,
                Birthdate = account.DateOfBirth,
                Gender = account.Gender,                
                Avatar = account.Avatar,
                Address = account.Address,
                Phone = account.Phone,
                AccountBalance = account.AccountBalance
            };
        }

        public async Task<bool> UpdateStudentProfile(string id, StudentProfileToUpdateModel model)
        {
            var user = await _context.Accounts.SingleOrDefaultAsync(x => x.Id == id && x.Roles == "Student");

            if (user == null)
            {
                return false;
            }
             
            user.FullName = model.FullName;
            user.Email = model.Email;
            user.DateOfBirth = model.DateOfBirth;
            user.Gender = model.Gender;
            user.Address = model.Address;
            user.Phone = model.Phone;

            await _context.SaveChangesAsync();
            return true;
        }

        
    }
}


