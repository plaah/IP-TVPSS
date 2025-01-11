<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
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
        
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        .form-container h3 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #1a202c;
        }
        .form-group {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #4a5568;
        }
        .form-group input, .form-group select {
            width: 48%;
            padding: 10px;
            border: 1px solid #e2e8f0;
            border-radius: 5px;
            outline: none;
        }
        .form-group input:focus, .form-group select:focus {
            border-color: #3182ce;
        }
        .form-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .form-actions button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-actions .save-btn {
            background-color: #4c6ef5;
            color: #fff;
        }
        .form-actions .cancel-btn {
            background-color: #a0aec0;
            color: #fff;
        }
        
        .form-actions .delete-btn {
            background-color: #e53e3e;
            color: #fff;
        }

    </style>
</head>
<body>
   <div class="container">
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
                    <li class="menu-item"><a href="LogoutServlet">Log Out</a></li>
                </ul>
            </div>
            <div class="logout">
                <a href="#">Log out</a>
            </div>
        </div>
        
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
            
               <div class="content">
                  <div class="form-container">
                      <h3>Edit User Information</h3>
                  <div class="form-group">
                     <div>
                     <label for="user-id">User ID: #888888</label>
                     </div>
                     <div>
                     <label for="user-type">Type of User: School</label>
                     <select id="user-type">
                     <option>Please select the user type</option>
                     </select>
                     </div>
                  </div>
                  <div class="form-group">
                     <div>
                     <label for="name">Name: Thia Thaqif</label>
                     <input id="name" placeholder="Name" type="text"/>
                     </div>
                     <div>
                     <label for="email">Email: thiathaqif@gmail.com</label>
                     <input id="email" placeholder="Email" type="email"/>
                     </div>
                  </div>
                  <div class="form-group">
                     <div>
                     <label for="school-name">School Name: SMK Taman University</label>
                     <input id="school-name" placeholder="School Name" type="text"/>
                     </div>
                     <div>
                     <label for="phone-number">Phone Number: +60111992332</label>
                        <div style="display: flex; align-items: center;">
                        <select style="width: 20%; margin-right: 10px;">
                        <option value="+60">+60</option>
                        </select>
                        <input id="phone-number" placeholder="Phone Number" style="width: 80%;" type="text"/>
                        </div>
                     </div>
                  </div>
                  <div class="form-actions">
                  <button class="save-btn">Save</button>
                  <button class="delete-btn">Delete User</button>
                  <button class="cancel-btn">Cancel</button>
                  </div>
                  </div>
              </div>
        </div>
   </div>
</body>
</html>