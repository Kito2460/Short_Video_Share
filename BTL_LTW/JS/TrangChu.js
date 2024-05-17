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
    if (txtSearch.value.trim() != "") {
        var timkiem = "TrangTimKiem.aspx?tim=" + txtSearch.value.trim();
        window.location.href = timkiem;

    }
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