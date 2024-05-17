<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="BTL_LTW.Pages.DangNhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="../CSS/DangNhap_DangKy.css"
</head>
<body>
    <form id="form1" method="post" action="XuLy_DangNhap.aspx" runat="server">
        <div class="form-dang-nhap">
            <h1>Đăng nhập</h1>
            <label for="txtTenDangNhap">Tên Đăng Nhập</label>
            <input type="text" id="txtTenDangNhap" name="txtTenDangNhap" runat="server"/>
            <label id="LoiRongTxtTenDangNhap">Bạn phải nhập tên đăng nhập</label>
            <label for="txtMatKhau">Mật Khẩu</label>
            <input type="text" id="txtMatKhau" name="txtMatKhau" />
            <label id="LoiRongTxtMatKhau">Bạn phải nhập mật khẩu</label>
            <label id="LoiSaiTaiKhoan" runat="server"></label>
            <button type="submit" id="btnDangNhap" name="btnDangNhap">Đăng nhập</button>
            <p>Chưa có tài khoản? <a href="DangKy.aspx">Đăng ký</a></p>
        </div>
    </form>

    <script src="../JS/DangNhap.js"></script>
</body>
</html>
