

<%
    if (session == null || session.getAttribute("adminsession") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard - Admin</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
        <link href="styles/admin.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="script/sidebar.js"></script>
    </head>
    <body>
        <div class="sidebar">
            <div class="sidebar-logo">
                Strike The Frog
            </div>
            <ul class="sidebar-menu">
                <a href="./Dashboard?action=home">
                    <li class="sidebar-menu-item">
                        <img src="assets/icon/admin/home-icon.png" alt="home-icon">
                        <p>Home</p>
                    </li>
                </a>
                <a href="./Dashboard?action=user">
                    <li class="sidebar-menu-item">
                        <img src="assets/icon/admin/user-icon.png" alt="user-icon">
                        <p>User</p>
                    </li>
                </a>
                <li class="sidebar-menu-item" id="championship-menu-item">
                    <img src="assets/icon/admin/tournament-icon.png" alt="tournament-icon">
                    Championship
                    <div class="dropdown-arrow"></div>
                    <ul class="dropdown-menu">
                        <a href="./Dashboard?action=round"><li class="dropdown-menu-item">Round</li></a>
                        <a href="./Dashboard?action=match"><li class="dropdown-menu-item">Match</li></a>
                        <a href="./Dashboard?action=tournament"><li class="dropdown-menu-item">Tournament</li></a>
                        <a href="./Dashboard?action=table"><li class="dropdown-menu-item">Table</li></a>
                    </ul>
                </li>
                <a href="./Dashboard?action=logout">
                    <li class="sidebar-menu-item">
                        <img src="assets/icon/admin/user-icon.png" alt="user-icon">
                        <p>Logout</p>
                    </li>
                </a>
            </ul>
        </div>

        <div class="main-content">
            <div class="header">
                <h1 class="header-title">Trang chủ</h1>
            </div>

            <div class="page-content">
                <div class="content-section">
                    <h2>Liên kết nhanh</h2>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                        <a href="./Dashboard?action=user" class="nav-link">Quản lý người dùng</a>
                        <a href="./Dashboard?action=table" class="nav-link">Quản lý bàn đấu</a>
                        <a href="./Dashboard?action=round" class="nav-link">Quản lý vòng đấu</a>
                        <a href="./Dashboard?action=match" class="nav-link">Quản lý trận đấu</a>
                        <a href="./Dashboard?action=tournament" class="nav-link">Quản lý giải đấu</a>
                        <a href="./Dashboard?action=transaction" class="nav-link">Quản lý giao dịch</a>
                    </div>
                </div>

                <div class="content-section">
                    <h2>Tổng quan giải đấu</h2>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                        <div class="stats-card">
                            <h3>Số lượng giải đấu</h3>
                            <p class="stats-value text-blue-600">12</p>
                        </div>
                        <div class="stats-card">
                            <h3>Số lượng người chơi</h3>
                            <p class="stats-value text-green-600">150</p>
                        </div>
                        <div class="stats-card">
                            <h3>Giải đấu đã kết thúc</h3>
                            <p class="stats-value text-purple-600">8</p>
                        </div>
                        <div class="stats-card">
                            <h3>Giải đấu sắp diễn ra</h3>
                            <p class="stats-value text-orange-600">4</p>
                        </div>
                    </div>
                </div>

                <div class="content-section">
                    <h2>Thống kê người chơi</h2>
                    <div class="charts-container">
                        <div class="chart-container">
                            <h3 class="chart-title">Số lượng người chơi theo giải đấu</h3>
                            <canvas id="playerChart"></canvas>
                        </div>
                    </div>
                </div>

                <div class="content-section">
                    <h2>Các giải đấu đang diễn ra</h2>
                    <ul class="tournament-list">
                        <li>
                            <span class="tournament-name">Giải đấu VN Open Tour</span>
                            <span class="tournament-date">Ngày bắt đầu: 2024-05-01</span>
                        </li>
                        <li>
                            <span class="tournament-name">Giải đấu Hà Nội mở rộng</span>
                            <span class="tournament-date">Ngày bắt đầu: 2024-05-15</span>
                        </li>
                        <li>
                            <span class="tournament-name">Giải đấu Hồ Chí Minh</span>
                            <span class="tournament-date">Ngày bắt đầu: 2024-06-01</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <script>
            // Dữ liệu biểu đồ
            const playerData = {
                labels: ['VN Open Tour', 'Hà Nội mở rộng', 'Hồ Chí Minh'],
                datasets: [{
                        label: 'Số lượng người chơi',
                        data: [120, 100, 150],
                        backgroundColor: 'rgba(37, 99, 235, 0.7)',
                        borderColor: 'rgba(37, 99, 235, 1)',
                        borderWidth: 1
                    }]
            };

            const chartOptions = {
                responsive: true,
                plugins: {
                    legend: {position: 'top'}
                },
                scales: {
                    y: {beginAtZero: true}
                }
            };

            const playerChartCtx = document.getElementById('playerChart').getContext('2d');
            new Chart(playerChartCtx, {
                type: 'bar',
                data: playerData,
                options: chartOptions
            });


        </script>
    </body>
</html>