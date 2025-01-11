<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        /* General Reset */
        body, html {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f5f5f5;
        }

        .login-container {
            display: flex;
            max-width: 900px;
            width: 100%;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .image-container {
            flex: 1;
            background: linear-gradient(145deg, #9ecbff, #628cd1);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .illustration {
            position: relative;
            width: 100%;
            height: 100%;
        }

        .monitor {
            background: #2b2b35;
            width: 70%;
            height: 40%;
            margin: 0 auto;
            border-radius: 10px;
        }

        .screen {
            background: #aac8ff;
            width: 60%;
            height: 25%;
            position: absolute;
            top: 30%;
            left: 20%;
            border-radius: 5px;
        }

        .keyboard {
            background: #333333;
            width: 80%;
            height: 10%;
            position: absolute;
            bottom: 20%;
            left: 10%;
            border-radius: 5px;
        }

        .form-container {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        h1 {
            margin: 0;
            color: #333;
            font-size: 24px;
        }

        p {
            margin: 10px 0;
            color: #666;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-size: 14px;
            color: #555;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 4px rgba(0, 123, 255, 0.5);
        }

        .checkbox-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 14px;
        }

        button {
            padding: 10px;
            background: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background: #0056b3;
        }

        .back-link {
            display: block;
            margin-top: 15px;
            text-align: center;
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="image-container">
            <div class="illustration">
                <div class="monitor"></div>
                <div class="keyboard"></div>
                <div class="screen"></div>
            </div>
        </div>
        <div class="form-container">
            <h1>Welcome back, User</h1>
            <p>Welcome back! Please enter your details.</p>
            
            <% 
                String error = request.getParameter("error");
                if ("invalid".equals(error)) {
            %>
                <p class="error-message">Invalid email or password. Please try again.</p>
            <% 
                }
            %>
            
            <form action="SchoolController" method="POST">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required placeholder="Enter your email">
                
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
                
                <div class="checkbox-forgot">
                    <input type="checkbox" id="terms" name="terms">
                    <label for="terms">Terms & Conditions</label>
                    <a href="#">Forgot Password</a>
                </div>
                
                <button type="submit">Log in</button>
            </form>
            <a href="#" class="back-link">back to the homepage</a>
        </div>
    </div>
</body>
</html>
