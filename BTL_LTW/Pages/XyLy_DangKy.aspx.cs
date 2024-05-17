using BTL_LTW.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LTW.Pages
{
    public partial class XyLy_DangKy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dlstMember = Application[Global.MEMBER_LIST] as List<Member>;
            foreach(var m in dlstMember)
            {
                if (m.MemberName.Equals(Request.Form["txtTenDangNhap"]))
                {
                    Response.Redirect("DangKy.aspx?user=" + Request.Form["txtTenDangNhap"]);
                    break;
                }
            }

            Member member = new Member
            {
                MemberName = Request.Form["txtTenDangNhap"],
                Password = Request.Form["txtMatKhau"],
                AvatarUrl = "../Images/DefaultAvatar.jpg",
                ListFollow = new List<string> { },
                MemberType = 0,
            } ;

            dlstMember.Add(member);
            Session[Global.MEMBER] = member;
            Response.Redirect("TrangChu.aspx");
        }
    }
}