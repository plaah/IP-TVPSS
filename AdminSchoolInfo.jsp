<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School Information</title>
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
        
        .content {
            flex: 1;
            padding: 20px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #ffffff;
            padding: 10px 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .header h1 {
            font-size: 18px;
            font-weight: 500;
        }
        .header .search-bar {
            display: flex;
            align-items: center;
        }
        .header .search-bar input {
            padding: 5px 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px;
        }
        .header .search-bar i {
            color: #333;
        }
        .header .user-info {
            display: flex;
            align-items: center;
        }
        .header .user-info img {
            border-radius: 50%;
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }
        .header .user-info span {
            font-size: 14px;
            color: #333;
        }
        .main-content {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .main-content h2 {
            font-size: 18px;
            font-weight: 500;
            margin-bottom: 20px;
        }
        .main-content .search-filter {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .main-content .search-filter input,
        .main-content .search-filter select {
            padding: 5px 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .main-content .table-container {
            overflow-x: auto;
        }
        .main-content table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .main-content table th,
        .main-content table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }
        .main-content table th {
            background-color: #f5f7fa;
            font-weight: 500;
        }
        .main-content table td {
            background-color: #ffffff;
        }
        .main-content table td button {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            background-color: #e0e7ff;
            color: #333;
            cursor: pointer;
        }
        .main-content .pagination {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .main-content .pagination span {
            font-size: 14px;
            color: #333;
        }
        .main-content .pagination button {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            background-color: #e0e7ff;
            color: #333;
            cursor: pointer;
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
                    <li class="menu-item"><a href="UserManagementServlet">User Management</a></li>
                    <li class="menu-item active"><a href="AdminSchoolInfoServlet">School Information</a></li>
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
    <div class="main-content">
     <h2>
      School Information / School List
     </h2>
     <div class="search-filter">
      <input placeholder="Search" type="text"/>
      <select>
       <option>
        Filter
       </option>
      </select>
      <input placeholder="DD/MM/YYYY" type="text"/>
     </div>
     <div class="table-container">
      <table>
       <thead>
        <tr>
         <th>
          School Kod
         </th>
         <th>
          School Name
         </th>
         <th>
          School Version
         </th>
         <th>
          School Address
         </th>
         <th>
         </th>
        </tr>
       </thead>
       <tbody>
        <tr>
         <td>
          JEA1049
         </td>
         <td>
          SMK TAMAN UNIVERSITI
         </td>
         <td>
          1
         </td>
         <td>
          JALAN PENDIDIKAN, TAMAN UNIVERSITI
         </td>
         <td>
          <button class="btn edit" onclick="window.location.href='VersionSchoolEdit.jsp'">Details</button>
         </td>
        </tr>
        <tr>
         <td>
          JEA1050
         </td>
         <td>
          SMK TAMAN BUKIT INDAH
         </td>
         <td>
          1
         </td>
         <td>
          JALAN SRI SKUDAI, TAMAN SRI SKUDAI
         </td>
         <td>
          <button>
           Details
          </button>
         </td>
        </tr>
        <tr>
         <td>
          JEA1051
         </td>
         <td>
          SMK TAMAN MUTIARA RINI 2
         </td>
         <td>
          3
         </td>
         <td>
          JALAN HANG JEBAT, MUTIARA RINI
         </td>
         <td>
          <button>
           Details
          </button>
         </td>
        </tr>
        <tr>
         <td>
          JEA1052
         </td>
         <td>
          SMK TANJUNG PENGELIH
         </td>
         <td>
          2
         </td>
         <td>
          TANJUNG PENGELIH
         </td>
         <td>
          <button>
           Details
          </button>
         </td>
        </tr>
        <tr>
         <td>
          JEA1053
         </td>
         <td>
          SMK TASEK UTARA 2
         </td>
         <td>
          2
         </td>
         <td>
          JALAN TARUKA, KAMPUNG MUAFAKAT
         </td>
         <td>
          <button>
           Details
          </button>
         </td>
        </tr>
        <tr>
         <td>
          JEA1054
         </td>
         <td>
          SMK SRI TEBRAU
         </td>
         <td>
          1
         </td>
         <td>
          JALAN RENTAKA, TAMAN SRI TEBRAU
         </td>
         <td>
          <button>
           Details
          </button>
         </td>
        </tr>
       </tbody>
      </table>
     </div>
     <div class="pagination">
      <span>
       Showing 1 to 6 of 3000 entries
      </span>
      <div>
       <button>
        Previous
       </button>
       <button>
        Next
       </button>
      </div>
     </div>
    </div>
   </div>
        </div>
   </div>
</body>
</html>