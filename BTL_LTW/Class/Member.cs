using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_LTW.Class
{
    public class Member
    {
        public string MemberName { get; set; }

        public string Password { get; set; }

        public string AvatarUrl { get; set; }

        public int MemberType { get; set; }

        public List<string> ListFollow { get; set; }
    }
}