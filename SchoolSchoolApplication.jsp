<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School Application List</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9fbff;
        }
        .sidebar {
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 240px;
            position: fixed;
            height: 100%;
            top: 0;
            left: 0;
            padding: 20px 10px;
        }

        .sidebar h3 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 18px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin: 10px 0;
        }

        .sidebar ul li a {
            text-decoration: none; /* Menghilangkan garis bawah */
            color: #000; /* Warna teks hitam */
            display: block; /* Memperbaiki area klik */
            padding: 10px 20px;
            border-radius: 6px;
        }

        .sidebar ul li a:hover, .sidebar ul li a.active {
            background-color: #eef4ff;
            color: #347ae2; /* Warna biru hanya saat hover atau aktif */
        }

        .main {
            margin-left: 260px;
            padding: 20px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header h1 {
            font-size: 24px;
            color: #2a2a2a;
        }
        .header input {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
            margin-left: 10px;
        }
        .application-list {
            margin-top: 20px;
        }
        .application-card {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            justify-content: space-between;
        }
        .application-details {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .application-icon {
            background-color: #eef4ff;
            padding: 10px;
            border-radius: 50%;
            font-size: 18px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #347ae2;
        }
        .application-info {
            line-height: 1.6;
        }
        .application-info h3 {
            margin: 0;
            font-size: 16px;
            color: #2a2a2a;
        }
        .application-info p {
            margin: 0;
            font-size: 14px;
            color: #888;
        }
        .application-status {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .status-label {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            text-align: center;
        }
        .status-cancelled {
            background-color: #fbe9e9;
            color: #e53e3e;
        }
        .status-completed {
            background-color: #e6ffe6;
            color: #2db92d;
        }
        .progress-container {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .progress-bar {
            width: 80px;
            height: 6px;
            background-color: #eee;
            border-radius: 3px;
            position: relative;
            overflow: hidden;
        }
        .progress-bar span {
            display: block;
            height: 100%;
            background-color: #347ae2;
        }
        .user-photo {
            border-radius: 50%;
            width: 40px;
            height: 40px;
        }
        .options-btn {
            font-size: 18px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h3>Johor TVPSS Management</h3>
        <ul>
            <li><a href="SchoolController?action=Dashboard">Dashboard</a></li>
            <li><a href="SchoolController?action=SchoolInformation">School Information</a></li>
            <li><a href="SchoolController?action=Equipment">Equipment</a></li>
            <li><a href="SchoolController?action=Program">Program</a></li>
            <li><a href="SchoolController?action=YoutubeLink" >YouTube Link</a></li>
            <li><a href="SchoolController?action=ApplyUpgrade">Apply Upgrade</a></li>
            <li><a href="SchoolController?action=Application" class="active">Status Application</a></li>
            <li><a href="SchoolController?action=Logout">Log out</a></li>
        </ul>
    </div>
    <div class="main">
        <div class="header">
            <h1>Status Application</h1>
            <input type="text" placeholder="Search for anything">
        </div>
        <div class="application-list">
            <div class="application-card">
                <div class="application-details">
                    <div class="application-icon">⭐</div>
                    <div class="application-info">
                        <h3>Upgrade Level</h3>
                        <p>#402325 Opened 10 days ago by Yash Ghori</p>
                    </div>
                </div>
                <div class="application-status">
                    <span class="status-label status-cancelled">Cancelled</span>
                    <span class="status-label status-completed">Completed</span>
                    <div class="progress-container">
                        <div class="progress-bar"><span style="width: 10%;"></span></div>
                        <span>10%</span>
                    </div>
                    <img class="user-photo" src="user-photo.jpg" alt="User Photo">
                    <div class="options-btn">⋮</div>
                </div>
            </div>

            <!-- Repeat cards for other applications -->
        </div>
    </div>
</body>
</html>