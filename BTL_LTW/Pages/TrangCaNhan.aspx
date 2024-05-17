<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrangCaNhan.aspx.cs" Inherits="BTL_LTW.Pages.TrangCaNhan" %>
<%@ Import Namespace="BTL_LTW" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang cá nhân</title>
    <link rel="stylesheet" href="../CSS/TrangCaNhan.css" />
</head>
<body>
        <%
        BTL_LTW.Class.Member sM = Session[Global.MEMBER] as BTL_LTW.Class.Member;
        var dlstMember = Application[Global.MEMBER_LIST] as List<BTL_LTW.Class.Member>;
        var dlstVideo = Application[Global.VIDEO_LIST] as List<BTL_LTW.Class.Video>;
    %>
    <header>
        <a href="TrangChu.aspx">
            <img src="../Images/logo.jpg" alt="Trang chu" id="img-logo"/>
        </a>
        <div class="Search">
            <input type="text" id="txtSearch" name="txtSearch" placeholder="Tìm Kiếm ..."/>
            <button type="button" id="btnSearch" name="btnSearch">
                <img src="../Images/Search-icon.png" id="img-search"/>
            </button>
        </div>
        <button type="button" id="btnTaiLen" name="btnTaiLen">Tải lên</button>
        <div class="dropdown">
            <img src="<%= sM.AvatarUrl%>" alt="avatar" id="img-avatar-user" />
            <div class="dropdown-content">
                <a href="TrangCaNhan.aspx?user=<%=sM.MemberName %>" class="dropdown-item">Trang cá nhân</a>
                <a href="SuaHoSo.aspx?user=<%=sM.MemberName %>" class="dropdown-item">Chỉnh sửa hồ sơ</a>
<%
    if (sM.MemberType == 1)
    {
%>
                <a href="#" class="dropdown-item">Admin</a>
<%
    }
%>                <a class="dropdown-item" id="btnDangXuat">Đăng xuất</a>
            </div>
        </div>
        
    </header>

    <div class="main-content">
        <div class="thanh-cong-cu">
            <a href="TrangChu.aspx">Trang chủ</a>
            <a href="TrangCaNhan.aspx?user=<%=sM.MemberName %>">Trang cá nhân</a>
            <a href="DangTheoDoi.aspx">Đang theo dõi</a>
            <a>Đã thích</a>
<%
    foreach(var m in dlstMember) {
        foreach(var fm in sM.ListFollow) {
            if (m.MemberName.Equals(fm)) {
%>
            <a href="TrangCaNhan.aspx?user=<%=m.MemberName %>">
                <img src="<%=m.AvatarUrl %>" alt="avatar" /> <%=m.MemberName %>
            </a>
<%
                break;
            }
        }
    }
%>
        </div>

        <div class="videos">
<%
    int demFollow;
    demFollow = 0;
    foreach(var m in dlstMember) {
        foreach(var mf in m.ListFollow) {
            if (mf.Equals(Request.QueryString["user"])) {
                demFollow++;
            }
        }
    }
    foreach(var m in dlstMember) {
        if (m.MemberName.Equals(Request.QueryString["user"]))
        {
%>
            <div class="profile">
                <img src="<%=m.AvatarUrl %>"/>
                <p><%=m.MemberName %></p>
                <a><%=demFollow %> Follow</a>
                <a><%=m.ListFollow.Count %> Đang follow</a>
                <a>50 thích</a>
<%
    if (m.MemberName.Equals(sM.MemberName))
    {
%>
                <button type="button" onclick="window.location.href='SuaHoSo.aspx?user=<%=sM.MemberName %>'">Chỉnh sửa hồ sơ</button>
<%
    }
    else
    {
        bool kiemtra;
        kiemtra = false;
        foreach (var mf in sM.ListFollow)
        {
            if (mf.Equals(Request.QueryString["user"]))
            {
%>
                <button type="button" id="btnBoFollow" onclick="window.location.href='XyLy_Follow.aspx?user=<%=Request.QueryString["user"] %>'">Bỏ Follow</button>
<%
            kiemtra = true;
            break;
            }
        }

        if(kiemtra == false) {
%>
                <button type="button" id="btnFollow" onclick="window.location.href='XyLy_Follow.aspx?user=<%=Request.QueryString["user"] %>'">Follow</button>
<%
        }
            
        
    }
%>
            </div>
<%
            foreach (var v in dlstVideo)
            {
                if (v.NguoiDang.Equals(Request.QueryString["user"]))
                {


%>
            <div class="video">
                <a href="TrangCaNhan.aspx?user=<%=m.MemberName %>">
                    <img src="<%=m.AvatarUrl %>" alt="avatar" />    <%=m.MemberName %>
                </a>
<%
    if (Request.QueryString["user"].Equals(sM.MemberName) || sM.MemberType == 1) { 
%>
                <div class="form-xoa-video">
                    <p>Bạn thực sự muốn xóa video</p>
                    <button type="button" id="btnHuyXoaVideo">Hủy</button>
                    <button type="button" id="btnXacNhanXoaVideo" onclick="window.location.href='XyLy_XoaVideo.aspx?id=<%=v.ID %>'">Xác nhận</button>
                </div>
                <button type="button" id="btnXoa">Xóa</button>
<%
    }
%>
                <p><%=v.Title %></p>
                <video src="<%=v.VideoUrl %>" controls="controls"></video>
                <button type="button" id="btnThich" name="btnThich">Thích</button>
            </div>
<%

                }
            }
            break;
        }
    }
%>
        </div>  
    </div>
    <footer>
        <p>@2023 YikYok</p>
    </footer>

    <div class="form-dang-xuat">
        <p>Bạn thực sự muốn đăng xuất</p>
        <button type="button" id="btnHuyDangXuat">Hủy</button>
        <button type="button" id="btnXacNhanDangXuat" onclick="window.location.href='DangNhap.aspx?do=out'">Xác nhận</button>
    </div>

    <div class="form-tai-len">
    <form method="post" action="XuLy_ThemVideo.aspx" enctype="multipart/form-data" runat="server">
        <label for="file-video">Chọn video</label>
        <input type="file" id="file-video" name="file-video"/>
        <label for="file-video" id="LoiRongVideo">Bạn phải chọn video</label>
        <label for="txtTitle">Nội dung</label>
        <input type="text" id="txtTitle" name="txtTitle" />
        <button type="button" id="btnHuyTaiLen">Hủy</button>
        <button type="submit" id="btnXacNhanTaiLen">Tải lên</button>
    </form>
</div>

    <script src="../JS/TrangCaNhan.js"></script>
</body>
</html>
