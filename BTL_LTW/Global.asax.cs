using BTL_LTW.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace BTL_LTW
{
    public class Global : System.Web.HttpApplication
    {
        public const string MEMBER_LIST = "MenberList";
        public const string MEMBER = "Member";

        public const string VIDEO_LIST = "VideoList";
        protected void Application_Start(object sender, EventArgs e)
        {
            Application[MEMBER_LIST] = createAListOfMember();

            Application[VIDEO_LIST] = createAListOfVideo();
        }
        private List<Member> createAListOfMember()
        {
            return new List<Member>()
            {
                new Member{MemberName="user1", Password="pass1", AvatarUrl="../Images/avatar.jpg", MemberType = 0, ListFollow= new List<string> {"user2", "user3"} }
                , new Member{MemberName="user2", Password="pass2", AvatarUrl="../Images/avatar2.jpg", MemberType = 0, ListFollow=new List<string> {"user1"}}
                , new Member{MemberName="user3", Password="pass3", AvatarUrl="../Images/avatar3.png", MemberType = 1, ListFollow=new List<string> {"user1"}}
            };
        }

        private List<Video> createAListOfVideo()
        {
            return new List<Video>()
            {
                new Video{ID = "1",VideoUrl ="../Videos/ConMeo.mp4", Title="ConMeo", NguoiDang="user1"}
                , new Video{ID="2", VideoUrl ="../Videos/ConCho.mp4", Title="ConCho", NguoiDang="user2"}
                , new Video{ID="3", VideoUrl ="../Videos/ConCho.mp4", Title="ConCho", NguoiDang="user1"}
            };
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session[MEMBER] = new Member { };
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}