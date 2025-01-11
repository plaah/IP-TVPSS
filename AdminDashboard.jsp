<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            background-color: #f7f9fc;
            color: #333;
        }

        .container {
            display: flex;
            width: 100%;
        }

        /* Sidebar Styling */
        .sidebar {
            width: 250px;
            background-color: #ffffff;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 20px;
            height: 100vh;
        }

        .sidebar .logo h2 {
            font-size: 18px;
            color: #0d6efd;
        }

        .sidebar .menu {
            margin-top: 30px;
        }

        .sidebar .menu ul {
            list-style-type: none;
        }

        .sidebar .menu-item {
            padding: 10px 15px;
            margin: 10px 0;
            color: #333;
            cursor: pointer;
            border-radius: 8px;
            text-align: left;
            transition: all 0.3s;
        }

        .sidebar .menu-item:hover,
        .sidebar .menu-item.active {
            background-color: #eaf1ff;
            color: #0d6efd;
        }

        .sidebar .logout {
            margin-top: 20px;
        }

        .sidebar .logout a {
            text-decoration: none;
            color: #ff4d4f;
            font-weight: bold;
            padding: 10px;
            display: inline-block;
            border: 1px solid #ff4d4f;
            border-radius: 5px;
            text-align: center;
            transition: all 0.3s;
        }

        .sidebar .logout a:hover {
            background-color: #ff4d4f;
            color: #ffffff;
        }

        /* Header Styling */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: #ffffff;
            border-bottom: 1px solid #ddd;
        }

        .header .search-bar input {
            padding: 10px;
            width: 250px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .header .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .header .user-avatar {
            width: 40px;
            height: 40px;
            background-color: #ddd;
            border-radius: 50%;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
        }

        .dashboard-title {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .card {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .card h3 {
            margin-bottom: 15px;
        }

        .card table {
            width: 100%;
            border-collapse: collapse;
        }

        .card table th,
        .card table td {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <aside class="sidebar">
            <h2>Johor TVPSS</h2>
            <nav>
                <ul>
                    <li class="menu-item active"><a href="AdminDashboardServlet">Dashboard</a></li>
                    <li class="menu-item"><a href="UserManagementServlet">User Management</a></li>
                    <li class="menu-item"><a href="AdminSchoolInfoServlet">School Information</a></li>
                    <li class="menu-item"><a href="AdminEquipmentServlet">Equipment</a></li>
                    <li class="menu-item"><a href="AdminProgramServlet">Program</a></li>
                    <li class="menu-item"><a href="AdminYoutubeLinkServlet">YouTube Link</a></li>
                    <li class="menu-item"><a href="LogoutServlet">Log Out</a></li>
                </ul>
            </nav>
        </aside>

        <!-- Main Content -->
        <div class="main-content">
            <div class="header">
                <div class="search-bar">
                    <input type="text" placeholder="Search for anything...">
                </div>
                <div class="user-info">
                    <span>Thia Malaysia</span>
                    <div class="user-avatar"></div>
                </div>
            </div>
            <div class="dashboard-title">Admin Dashboard</div>
            <div class="card">
                <h3>Previous Activity</h3>
                <table>
                    <tr>
                        <th>Task</th>
                        <th>Status</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                    </tr>
                    <tr>
                        <td>Update School Information</td>
                        <td>Completed</td>
                        <td>25/9/2023</td>
                        <td>29/9/2023</td>
                    </tr>
                    <tr>
                        <td>Adding User (23)</td>
                        <td>Canceled</td>
                        <td>25/9/2023</td>
                        <td>29/9/2023</td>
                    </tr>
                </table>
            </div>
            <div class="card">
                <h3>Total Users</h3>
                <!-- Placeholder for charts -->
            </div>
            <div class="card">
                <h3>Program Progress</h3>
                <div class="progress-bar">
                    <div class="progress" style="width: 70%;"></div>
                </div>
            </div>
		</div>
    </div>

    <script src="charts.js"></script> <!-- Add JavaScript for charts -->

</body>
</html>