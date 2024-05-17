using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LTW.Pages
{
    public partial class XyLy_Follow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BTL_LTW.Class.Member sM = Session[Global.MEMBER] as BTL_LTW.Class.Member;
            bool kiemtra = false;
            foreach (var mf in sM.ListFollow)
            {
                if (mf.Equals(Request.QueryString["user"]))
                {
                    sM.ListFollow.Remove(mf);
                    kiemtra = true;
                    break;
                }
            }
            if (kiemtra == false)
            {
                sM.ListFollow.Add(Request.QueryString["user"]);
            }
            Response.Redirect("TrangCaNhan.aspx?user=" + Request.QueryString["user"]);
        }
    }
}