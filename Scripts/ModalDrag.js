
var searchCustomModal = document.getElementById('searchCustomModal');
var searchCustomHeader = document.getElementById('searchCustomHeader');
var isDragging = false;
var currentX;
var currentY;
var initialX;
var initialY;
var xOffset = 0;
var yOffset = 0;

function searchCustomOpenModal() {
    //searchCustomModal.style.display = 'block';
    //// Căn giữa modal
    //const rect = searchCustomModal.getBoundingClientRect();
    //xOffset = (window.innerWidth - rect.width) / 2;
    //yOffset = (window.innerHeight - rect.height) / 2;
    //searchCustomSetPosition(xOffset, yOffset);


    searchCustomModal.style.display = 'block';
    // Lấy kích thước của modal
    const rect = searchCustomModal.getBoundingClientRect();
    // Đặt vị trí modal gần phía trên của trang
    xOffset = (window.innerWidth - rect.width) / 2;
    yOffset = 200; // Đặt modal cách đỉnh trang 50px, có thể thay đổi giá trị này

    searchCustomSetPosition(xOffset, yOffset);
}

function searchCustomCloseModal() {
    searchCustomModal.style.display = 'none';
}

function searchCustomSetPosition(x, y) {
    searchCustomModal.style.left = x + 'px';
    searchCustomModal.style.top = y + 'px';
}

// Xử lý kéo thả
searchCustomHeader.onmousedown = function (e) {
    isDragging = true;
    initialX = e.clientX - xOffset;
    initialY = e.clientY - yOffset;

    document.onmousemove = function (e) {
        if (isDragging) {
            e.preventDefault();
            currentX = e.clientX - initialX;
            currentY = e.clientY - initialY;

            xOffset = currentX;
            yOffset = currentY;

            searchCustomSetPosition(currentX, currentY);
        }
    };

    document.onmouseup = function () {
        isDragging = false;
        document.onmousemove = null;
        document.onmouseup = null;
    };
};