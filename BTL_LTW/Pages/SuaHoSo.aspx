<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuaHoSo.aspx.cs" Inherits="BTL_LTW.Pages.SuaHoSo" %>
<%@ Import Namespace="BTL_LTW" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chỉnh sửa hồ sơ</title>
    <link rel="stylesheet" href="../CSS/SuaHoSo.css" />
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
        
        <div class="dropdown">
            <img src="<%= sM.AvatarUrl%>" alt="avatar" id="img-avatar-user" />
            <div class="dropdown-content">
                <a href="TrangCaNhan.aspx?user=<%=sM.MemberName %>" class="dropdown-item">Trang cá nhân</a>
                <a href="#" class="dropdown-item">Chỉnh sửa hồ sơ</a>
<%
    if (sM.MemberType == 1)
    {
%>
                <a href="#" class="dropdown-item">Admin</a>
<%
    }
%>
                <a class="dropdown-item" id="btnDangXuat">Đăng xuất</a>
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

        <div class="form-doi-thong-tin">
            <form method="post" action="XuLy_SuaHoSo.aspx" enctype="multipart/form-data" runat="server">
                <% BTL_LTW.Class.Member sM = Session[Global.MEMBER] as BTL_LTW.Class.Member;%>
                <h1>Chỉnh sửa hồ sơ</h1>
                <img src="<%=sM.AvatarUrl %>" alt="avatar"/>
                <label for="file-anh">Đổi ảnh</label>
                <input type="file" id="file-anh" name="file-anh" />
                <label for="txtTenDangNhap">Tên đăng nhập</label>
                <input type="text" id="txtTenDangNhap" name="txtTenDangNhap" />
                <label for="txtTenDangNhap" id="LoiRongTenDangNhap" class="Loi">Bạn phải nhập tên đăng nhập</label>
                <label for="txtTenDangNhap" id="LoiSaiTaiKhoan"></label>
                <label for="txtMatKhauCu">Mật khẩu cũ</label>
                <input type="text" id="txtMatKhauCu" name="txtMatKhauCu" />
                <label for="txtMatKhauCu" id="LoiRongMatKhauCu" class="Loi">Bạn phải nhập mật khẩu cũ</label>
                <label for="txtMatKhauMoi">Mật khẩu mới</label>
                <input type="text" id="txtMatKhauMoi" name="txtMatKhauMoi" />
                <label for="txtNhapLaiMatKhauMoi">Nhập lại mật khẩu mới</label>
                <input type="text" id="txtNhapLaiMatKhauMoi" name="txtNhapLaiMatKhauMoi" />
                <label for="txtNhapLaiMatKhauMoi" id="LoiLapLaiMatKhau" class="Loi">Nhập lại mật khẩu không đúng</label>
                <button type="button" id="btnHuySuaHoSo" onclick="window.location.href='TrangCaNhan.aspx?user=<%=sM.MemberName %>'">Hủy</button>
                <button type="submit" id="btnXacNhanSuaHoSo">Xác nhận</button>
            </form>
        </div>
    </div>

    <script src="../JS/SuaHoSo.js"></script>
</body>
</html>
