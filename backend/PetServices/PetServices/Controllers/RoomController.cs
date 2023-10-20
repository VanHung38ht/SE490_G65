﻿using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PetServices.DTO;
using PetServices.Models;

namespace PetServices.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoomController : ControllerBase
    {
        private PetServicesContext _context;
        private IMapper _mapper;
        private readonly IConfiguration _configuration;

        public RoomController(PetServicesContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
        }

        [HttpGet("GetAllRoom")]
        public async Task<ActionResult> GetAllRoom()
        {
            var rooms = await _context.Rooms.ToListAsync();
            return Ok(_mapper.Map<List<RoomDTO>>(rooms));
        }

        [HttpPost("AddRoom")]
        public async Task<IActionResult> AddRoom(RoomDTO roomDTO)
        {
            try
            {
                var newRoom = new Room
                {
                    RoomName = roomDTO.RoomName,
                    Desciptions = roomDTO.Desciptions,
                    Picture = roomDTO.Picture,
                    Price = roomDTO.Price,
                    Slot = roomDTO.Slot,
                    Status = true,
                };

                await _context.Rooms.AddAsync(newRoom);
                await _context.SaveChangesAsync();

                return Ok(_mapper.Map<RoomDTO>(newRoom));
            }
            catch (Exception ex)
            {
                return BadRequest($"Đã xảy ra lỗi: {ex.Message}");
            }
        }

        [HttpPut("UpdateRoom")]
        public async Task<ActionResult> UpdateRoom(RoomDTO roomDTO, int roomId)
        {
            try
            {
                var room = await _context.Rooms.FirstOrDefaultAsync(p => p.RoomId == roomId);
                if (room == null)
                {
                    return BadRequest("Không tìm thấy phòng bạn chọn.");
                }

                room.RoomName = roomDTO.RoomName;
                room.Desciptions = roomDTO.Desciptions;
                room.Picture = roomDTO.Picture;
                room.Price = roomDTO.Price;
                room.Slot = roomDTO.Slot;

                _context.Entry(room).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                await _context.SaveChangesAsync();

                return Ok(room);
            }
            catch (Exception ex)
            {
                return BadRequest($"Đã xảy ra lỗi: {ex.Message}");
            }
        }

        [HttpPut("ChangeStatusRoom")]
        public async Task<ActionResult> ChangeStatusRoom(int RoomId, bool status)
        {
            try
            {
                var room = await _context.Rooms.FirstOrDefaultAsync(p => p.RoomId == RoomId);
                if (room == null)
                {
                    return BadRequest("Không tìm thấy phòng cần thay đổi.");
                }

                room.Status = status;

                _context.Entry(room).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                await _context.SaveChangesAsync();

                return Ok(room);
            }
            catch (Exception ex)
            {
                return BadRequest($"Đã xảy ra lỗi: {ex.Message}");
            }
        }
    }
}
