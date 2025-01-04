<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        /* Reset and General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9fbff;
        }
        ul {
            padding: 0;
        }
        /* Sidebar */
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
        /* Main Content */
        .main {
            margin-left: 270px;
            padding: 20px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .header input[type="text"], .header select, .header input[type="date"], .header button {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
        }
        .header input[type="text"] {
            width: 300px;
        }
        .header button {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            border: none;
        }
        .header button:hover {
            background-color: #45A049;
        }
        /* Dashboard Content */
        .dashboard {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }
        .card {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            display: flex;
            flex-direction: column;
        }
        .card h4 {
            font-size: 16px;
            margin-bottom: 15px;
            color: #347ae2;
        }
        /* Progress Bar Section */
        .progress-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .progress-item span {
            font-size: 14px;
            width: 120px;
            margin-right: 10px;
            color: #555;
        }
        .progress-bar {
            flex-grow: 1;
            height: 10px;
            background-color: #e6e6e6;
            border-radius: 5px;
            position: relative;
        }
        .progress-bar span {
            display: block;
            height: 100%;
            border-radius: 5px;
        }
        .progress-bar .green {
            background-color: #4caf50;
        }
        .progress-bar .orange {
            background-color: #ff9800;
        }
        .progress-bar .blue {
            background-color: #2196f3;
        }
        .progress-bar .purple {
            background-color: #9c27b0;
        }
        .progress-bar .red {
            background-color: #f44336;
        }
        .progress-value {
            font-size: 14px;
            width: 40px;
            margin-left: 10px;
            color: #555;
            text-align: center;
        }
        /* Chart Section */
        .chart-container {
            position: relative;
            height: 200px;
        }
        /* Status Section */
        .status-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        .status-table th, .status-table td {
            text-align: left;
            padding: 10px;
            font-size: 14px;
        }
        .status-table th {
            background-color: #eef4ff;
            font-weight: 600;
        }
        .status-table td {
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h3>School Dashboard</h3>
        <ul>
            <li><a href="SchoolController?action=Dashboard" class="active">Dashboard</a></li>
            <li><a href="SchoolController?action=SchoolInformation">School Information</a></li>
            <li><a href="SchoolController?action=Equipment">Equipment</a></li>
            <li><a href="SchoolController?action=Program">Program</a></li>
            <li><a href="SchoolController?action=YoutubeLink">YouTube Link</a></li>
            <li><a href="SchoolController?action=ApplyUpgrade">Apply Upgrade</a></li>
            <li><a href="SchoolController?action=Application">Status Application</a></li>
            <li><a href="SchoolController?action=Logout">Log out</a></li>
        </ul>
    </div>
    <!-- Main Content -->
    <div class="main">
        <div class="header">
            <input type="text" placeholder="Search for anything...">
            <select>
                <option>Filter</option>
            </select>
            <input type="date">
            <button>Search</button>
        </div>
        <h2>School Dashboard</h2>
        <div class="dashboard">
            <!-- Equipment Section -->
            <div class="card">
                <h4>Equipment</h4>
                <div class="progress-item">
                    <span>Camera</span>
                    <div class="progress-bar"><span class="green" style="width: 70%;"></span></div>
                    <div class="progress-value">7</div>
                </div>
                <div class="progress-item">
                    <span>Green Screen</span>
                    <div class="progress-bar"><span class="orange" style="width: 50%;"></span></div>
                    <div class="progress-value">5</div>
                </div>
                <div class="progress-item">
                    <span>Microphone</span>
                    <div class="progress-bar"><span class="blue" style="width: 80%;"></span></div>
                    <div class="progress-value">8</div>
                </div>
                <div class="progress-item">
                    <span>Web Cam</span>
                    <div class="progress-bar"><span class="purple" style="width: 60%;"></span></div>
                    <div class="progress-value">6</div>
                </div>
                <div class="progress-item">
                    <span>Tripod</span>
                    <div class="progress-bar"><span class="red" style="width: 30%;"></span></div>
                    <div class="progress-value">3</div>
                </div>
            </div>
            <!-- Program Section -->
            <div class="card">
                <h4>Program</h4>
                <div class="chart-container">
                    <canvas id="programChart"></canvas>
                </div>
            </div>
            <!-- Status Section -->
            <div class="card">
                <h4>Status</h4>
                <table class="status-table">
                    <thead>
                        <tr>
                            <th>Type</th>
                            <th>Count</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Pending Requests</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td>Accepted Requests</td>
                            <td>3</td>
                        </tr>
                        <tr>
                            <td>Rejected Requests</td>
                            <td>2</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        // Program Chart
        const ctx = document.getElementById('programChart').getContext('2d');
        const programChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [
                    {
                        label: 'Achieved',
                        data: [3, 5, 8, 10, 13, 15],
                        borderColor: '#4CAF50',
                        backgroundColor: 'rgba(76, 175, 80, 0.2)',
                        fill: true
                    },
                    {
                        label: 'Target',
                        data: [4, 6, 9, 11, 14, 16],
                        borderColor: '#FF9800',
                        backgroundColor: 'rgba(255, 152, 0, 0.2)',
                        fill: true
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });
    </script>
</body>
</html>
