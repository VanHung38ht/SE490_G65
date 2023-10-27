﻿using System;
using System.Collections.Generic;

namespace PetServices.Models
{
    public partial class Room
    {
        public Room()
        {
            Bookings = new HashSet<Booking>();
        }

        public int RoomId { get; set; }
        public string? RoomName { get; set; }
        public string? Desciptions { get; set; }
        public bool? Status { get; set; }
        public string? Picture { get; set; }
        public double? Price { get; set; }
        public int? RoomCategoriesId { get; set; }
        public int? Slot { get; set; }
        public int? RoomServicesId { get; set; }

        public virtual RoomCategory? RoomCategories { get; set; }
        public virtual RoomService? RoomServices { get; set; }

        public virtual ICollection<Booking> Bookings { get; set; }
    }
}
