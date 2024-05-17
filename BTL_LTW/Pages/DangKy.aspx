<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Đăng kí.aspx.cs" Inherits="BTL_LTW.Pages.Đăng_kí" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng ký</title>
    <link rel="stylesheet" href="../CSS/DangNhap_DangKy.css" />
</head>
<body>
    <form id="form1" runat="server" method="post" action="XyLy_DangKy.aspx">
        <div class="form-dang-ky">
            <h1>Đăng ký</h1>
            <label for="txtTenDangNhap">Tên Đăng Nhập</label>
            <input type="text" id="txtTenDangNhap" name="txtTenDangNhap" runat="server"/>
            <label id="LoiRongTxtTenDangNhap">Bạn phải nhập tên đăng nhập</label>
            <label for="txtMatKhau">Mật Khẩu</label>
            <input type="text" id="txtMatKhau" name="txtMatKhau" />
            <label id="LoiRongTxtMatKhau">Bạn phải nhập mật khẩu</label>
            <label for="txtNhapLaiMatKhau">Nhập Lại Mật Khẩu</label>
            <input type="text" id="txtNhapLaiMatKhau" name="txtNhapLaiMatKhau" />
            <label id="LoiLapLaiTxtMatKhau">Nhập lại mật khẩu không đúng</label>
            <label id="LoiSaiTaiKhoan" runat="server"></label>
            <button type="submit" id="btnDangKy" name="btnDangKy">Đăng ký</button>
            <p>Đã có tài khoản? <a href="DangNhap.aspx">Đăng nhập</a></p>
        </div>
    </form>

    <script src="../JS/DangKy.js"></script>
</body>
</html>
