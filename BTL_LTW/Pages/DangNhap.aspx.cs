using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LTW.Pages
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.UrlReferrer != null && !string.IsNullOrEmpty(Request.QueryString["user"])) {
                LoiSaiTaiKhoan.InnerText = "Sai tên tài khoản hoặc mật khẩu";
                txtTenDangNhap.Value = Request.QueryString["user"];
            }
            if (!string.IsNullOrEmpty(Request.QueryString["do"]) && Request.QueryString["do"].Equals("out"))
            {
                Session.Abandon();
            }
        }
    }
}