﻿using System;
using System.Collections.Generic;

namespace PetServices.Models
{
    public partial class PartnerInfo
    {
        public PartnerInfo()
        {
            Accounts = new HashSet<Account>();
        }

        public int PartnerInfoId { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? Phone { get; set; }
        public string? Province { get; set; }
        public string? District { get; set; }
        public string? Commune { get; set; }
        public string? Address { get; set; }
        public string? Descriptions { get; set; }
        public string? CardNumber { get; set; }
        public string? ImagePartner { get; set; }
        public string? ImageCertificate { get; set; }

        public virtual ICollection<Account> Accounts { get; set; }
    }
}
