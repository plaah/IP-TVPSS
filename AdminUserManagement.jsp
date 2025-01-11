<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <style>
        /* Styling similar to dashboard */
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

        .main-content {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: #ffffff;
            border-bottom: 1px solid #ddd;
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

        .search-filter {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .search-filter input,
        .search-filter select {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .user-list {
            width: 100%;
            border-collapse: collapse;
        }

        .user-list th,
        .user-list td {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .user-list th {
            background-color: #f0f4f8;
        }

        .btn {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            text-align: center;
        }

        .btn.add {
            background-color: #0d6efd;
            color: #ffffff;
        }

        .btn.edit {
            background-color: #ffffff;
            color: #0d6efd;
            border: 1px solid #0d6efd;
        }

        .btn.generate {
            background-color: #28a745;
            color: #ffffff;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .pagination {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }

        .pagination button {
            border: none;
            padding: 10px 15px;
            background-color: #ddd;
            border-radius: 5px;
            cursor: pointer;
        }

        .pagination button:hover {
            background-color: #bbb;
        }
    </style>

</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="logo">
                <h2>Johor TVPSS Management System</h2>
            </div>
            <div class="menu">
                <ul>
                    <li class="menu-item"><a href="AdminDashboardServlet">Dashboard</a></li>
                    <li class="menu-item active"><a href="UserManagementServlet">User Management</a></li>
                    <li class="menu-item"><a href="AdminSchoolInfoServlet">School Information</a></li>
                    <li class="menu-item"><a href="AdminEquipmentServlet">Equipment</a></li>
                    <li class="menu-item"><a href="AdminProgramServlet">Program</a></li>
                    <li class="menu-item"><a href="AdminYoutubeLinkServlet">YouTube Link</a></li>
                    <li class="menu-item"><a href="AdminLogoutServlet">Log Out</a></li>
                </ul>
            </div>
            <div class="logout">
                <a href="#">Log out</a>
            </div>
        </div>
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
            <div class="dashboard-title">User Management / User List</div>
            <div class="card">
                <div class="search-filter">
                    <input type="text" placeholder="Search by User Name or Email">
                    <div>
                        <select>
                            <option value="all">Filter by User Type</option>
                            <option value="admin">Admin</option>
                            <option value="school">School</option>
                            <option value="state">State</option>
                            <option value="student">Student</option>
                        </select>
                        <input type="date">
                    </div>
                    <button class="btn add" onclick="window.location.href='addUser.jsp'">+ Add New User</button>
                </div>
                <table class="user-list">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>User Name</th>
                            <th>User Type</th>
                            <th>Email</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#666666</td>
                            <td>Liz Wong Wan Qi</td>
                            <td>Admin</td>
                            <td>lizwong@gmail.com</td>
                            <td><button class="btn edit" onclick="window.location.href='editUser.jsp'">Edit</button></td>
                        </tr>
                        <tr>
                            <td>#888888</td>
                            <td>Thia Thaqif</td>
                            <td>School</td>
                            <td>thiathaqif@gmail.com</td>
                            <td><button class="btn edit" onclick="window.location.href='editUser.jsp'">Edit</button></td>
                        </tr>
                        <tr>
                            <td>#683868</td>
                            <td>Irdina Fatini</td>
                            <td>Student</td>
                            <td>irdinafatini@gmail.com</td>
                            <td><button class="btn edit" onclick="window.location.href='editUser.jsp?userId=683868'">Edit</button></td>
                        </tr>
                    </tbody>
                </table>
                <div class="pagination">
                    <button>Previous</button>
                    <span>Showing 1 to 6 of 3000 entries</span>
                    <button>Next</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>