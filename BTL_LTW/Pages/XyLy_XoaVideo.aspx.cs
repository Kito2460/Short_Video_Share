using BTL_LTW.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LTW.Pages
{
    public partial class XyLy_XoaVideo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dlstVideo = Application[Global.VIDEO_LIST] as List<Video>;
            BTL_LTW.Class.Member sM = Session[Global.MEMBER] as BTL_LTW.Class.Member;
            foreach (var v in dlstVideo)
            {
                if (v.ID.Equals(Request.QueryString["id"]))
                {
                    dlstVideo.Remove(v);
                    break;
                }
            }

            Response.Redirect("TrangCaNhan.aspx?user=" + sM.MemberName);
        }
    }
}