using BTL_LTW.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LTW.Pages
{
    public partial class XuLy_DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dlstMember = Application[Global.MEMBER_LIST] as List<Member>;
            foreach(var m in dlstMember)
            {
                if (m.MemberName.Equals(Request.Form["txtTenDangNhap"]))
                {
                    if (m.Password.Equals(Request.Form["txtMatKhau"])) { 
                        Session[Global.MEMBER] = m;
                        Response.Redirect("TrangChu.aspx");
                        break;
                    }
                }
            }
            Response.Redirect("DangNhap.aspx?user=" + Request.Form["txtTenDangNhap"]);
        }
    }
}