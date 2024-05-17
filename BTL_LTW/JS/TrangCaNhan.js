let btnDangXuat = document.querySelector("#btnDangXuat");
let btnHuyDangXuat = document.querySelector("#btnHuyDangXuat");
let form_dang_xuat = document.querySelector(".form-dang-xuat");

btnDangXuat.addEventListener("click", function () {
    form_dang_xuat.style.display = "block";
})

btnHuyDangXuat.addEventListener("click", function () {
    form_dang_xuat.style.display = "none";
})

let btnSearch = document.querySelector("#btnSearch");
let txtSearch = document.querySelector("#txtSearch");

btnSearch.addEventListener("click", function () {
    if (txtSearch.value.trim() != "")
        window.location.href = "TrangTimKiem.aspx?tim=" + txtSearch.value().trim();
})

let btnXoa = document.querySelectorAll("#btnXoa");
let btnHuyXoaVideo = document.querySelectorAll("#btnHuyXoaVideo");
let form_xoa_video = document.querySelectorAll(".form-xoa-video");

btnXoa.forEach(function (btn) {
    btn.addEventListener("click", function () {
        btn.parentNode.querySelector(".form-xoa-video").style.display = "block";
    })
})

btnHuyXoaVideo.forEach(function (btn) {
    btn.addEventListener("click", function () {
        btn.parentNode.style.display = "none";
    })
})

let btnTaiLen = document.querySelector("#btnTaiLen");
let form_tai_len = document.querySelector(".form-tai-len");
let btnHuyTaiLen = document.querySelector("#btnHuyTaiLen");
let btnXacNhanTaiLen = document.querySelector("#btnXacNhanTaiLen");
let file_video = document.querySelector("file-video");

let LoiRongVideo = document.querySelector("#LoiRongVideo")

btnTaiLen.addEventListener("click", function () {
    form_tai_len.style.display = "block";
})

btnHuyTaiLen.addEventListener("click", function () {
    form_tai_len.style.display = "none";
})

btnXacNhanTaiLen.addEventListener("click", function () {
    if (true) {
        event.preventDefault();
        LoiRongVideo.style.display = "block";
    }
})

file_video.addEventListener("input", function () {
    LoiRongVideo.style.display = "none";
})