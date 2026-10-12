#!/bin/bash
Project 05 - User Data script
Runs automatically the first time the instance starts (as root, so no sudo needed)

# 1. Install the Apache web server
dnf install -y httpd

# 2. Start Apache now
systemctl start httpd

# 3. Make Apache start again after every reboot
systemctl enable httpd

# 4. Write a custom web page
cat > /var/www/html/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>My First Cloud Server</title>
  <style>
    * { box-sizing: border-box; }
    body {
      margin: 0;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      font-family: Arial, Helvetica, sans-serif;
      color: white;
      text-align: center;
      background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
    }
    .card {
      background: rgba(255, 255, 255, 0.1);
      padding: 40px;
      border-radius: 20px;
      max-width: 520px;
      width: 90%;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
    }
    .cloud { font-size: 70px; animation: float 3s ease-in-out infinite; }
    @keyframes float {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-15px); }
    }
    h1 { margin: 10px 0; }
    .name { color: #ffd166; }
    .badge {
      display: inline-block;
      background: #ff9900;
      color: #111;
      font-weight: bold;
      padding: 6px 14px;
      border-radius: 20px;
      margin: 10px 0;
    }
    ul { list-style: none; padding: 0; text-align: left; }
    li { background: rgba(255, 255, 255, 0.12); margin: 8px 0; padding: 10px 14px; border-radius: 10px; }
    #clock { font-size: 22px; margin: 15px 0; }
    button {
      background: #06d6a0;
      border: none;
      padding: 12px 24px;
      border-radius: 10px;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
    }
    button:hover { background: #05b384; }
  </style>
</head>
<body>
  <div class="card">
    <div class="cloud">&#9729;&#65039;</div>
    <h1>Hello! I'm <span class="name">Egene joshua</span></h1>
    <div class="badge">Running on AWS EC2</div>
    <p>This page was built <b>automatically</b> by a User Data script. Nobody logged in!</p>
    <ul>
      <li>&#9989; Server installed itself</li>
      <li>&#9989; Web page created itself</li>
      <li>&#128640; Cloud Computing Course: Assignment 05</li>
    </ul>
    <div id="clock"></div>
    <button onclick="changeColor()">Surprise me!</button>
  </div>

  <script>
    function updateClock() {
      document.getElementById("clock").textContent = "Your time: " + new Date().toLocaleTimeString();
    }
    setInterval(updateClock, 1000);
    updateClock();

    function changeColor() {
      var a = Math.floor(Math.random() * 360);
      var b = (a + 60) % 360;
      document.body.style.background = "linear-gradient(135deg, hsl(" + a + ",60%,25%), hsl(" + b + ",60%,35%))";
    }
  </script>
</body>
</html>
EOF


