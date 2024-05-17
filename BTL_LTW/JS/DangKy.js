let txtTenDangNhap = document.querySelector("#txtTenDangNhap");
let txtMatKhau = document.querySelector("#txtMatKhau");
let txtNhapLaiMatKhau = document.querySelector("#txtNhapLaiMatKhau");
let btnDangKy = document.querySelector("#btnDangKy");

let LoiRongTxtTenDangNhap = document.querySelector("#LoiRongTxtTenDangNhap");
let LoiRongTxtMatKhau = document.querySelector("#LoiRongTxtMatKhau");
let LoiLapLaiTxtMatKhau = document.querySelector("#LoiLapLaiTxtMatKhau");
let LoiSaiTaiKhoan = document.querySelector("#LoiSaiTaiKhoan");

btnDangKy.addEventListener("click", function () {
    if (txtTenDangNhap.value.trim() == "") {
        event.preventDefault();
        LoiRongTxtTenDangNhap.style.display = "block";
    }
    if (txtMatKhau.value.trim() == "") {
        event.preventDefault();
        LoiRongTxtMatKhau.style.display = "block";
    }
    else if (txtMatKhau.value.trim() != txtNhapLaiMatKhau.value.trim()) {
        event.preventDefault();
        LoiLapLaiTxtMatKhau.style.display = "block";
    }
})

txtTenDangNhap.addEventListener("input", function () {
    LoiRongTxtTenDangNhap.style.display = "none";
    LoiSaiTaiKhoan.innerText = "";
})

txtMatKhau.addEventListener("input", function () {
    LoiRongTxtMatKhau.style.display = "none";
    LoiSaiTaiKhoan.innerText = "";
})

txtNhapLaiMatKhau.addEventListener("input", function () {
    LoiLapLaiTxtMatKhau.style.display = "none";
    LoiSaiTaiKhoan.innerText = "";
})
