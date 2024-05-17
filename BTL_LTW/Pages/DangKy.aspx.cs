using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LTW.Pages
{
    public partial class Đăng_kí : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.UrlReferrer != null && !string.IsNullOrEmpty(Request.QueryString["user"]))
            {
                LoiSaiTaiKhoan.InnerText = "Đã tồn tại tài khoản này";
                txtTenDangNhap.Value = Request.QueryString["user"];
            }
        }
    }
}