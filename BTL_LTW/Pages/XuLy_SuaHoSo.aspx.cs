using BTL_LTW.Class;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LTW.Pages
{
    public partial class XuLy_SuaHoSo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BTL_LTW.Class.Member sM = Session[Global.MEMBER] as BTL_LTW.Class.Member;

            HttpPostedFile file = Request.Files["file-anh"];
            string tenDangNhap = Request.Form["txtTenDangNhap"];
            string matKhauCu = Request.Form["txtMatKhauCu"];
            string matKhauMoi = Request.Form["txtMatKhauMoi"];

            var dlstMember = Application[Global.MEMBER_LIST] as List<Member>;
            foreach (var m in dlstMember)
            {
                if (tenDangNhap.Equals(sM.MemberName))
                {
                    if (matKhauCu.Equals(sM.Password)){
                        if (matKhauMoi != null && !string.IsNullOrEmpty(matKhauMoi))
                        {
                            m.Password = matKhauMoi;
                        }

                        if (file != null && file.ContentLength > 0)
                        {
                            string a = "1";
                            string fileNameWithoutExtension = Path.GetFileNameWithoutExtension(file.FileName);
                            string fileExtension = Path.GetExtension(file.FileName);
                            string filePath = Server.MapPath("~/Images") + "\\" + fileNameWithoutExtension + fileExtension;
                            while (File.Exists(filePath))
                            {
                                fileNameWithoutExtension = fileNameWithoutExtension + a;
                                filePath = Server.MapPath("~/Images") + "\\" + fileNameWithoutExtension + fileExtension;

                            }
                            file.SaveAs(filePath);
                            m.AvatarUrl = "../Images/" + fileNameWithoutExtension + fileExtension;
                        
                        }
                        Session[Global.MEMBER] = m;
                        Response.Redirect("TrangCaNhan.aspx?user=" + m.MemberName);
                    }   
                }
            }
            Response.Redirect("SuaHoSo.aspx?loi=true");
        }
    }
}