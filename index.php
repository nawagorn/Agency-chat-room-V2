<?php 
// เชื่อมต่อฐานข้อมูล
require_once 'connect.php';

$room_code_error = "";
$show_name_form = false;
$id = "";  // ตัวแปรเก็บ id ของห้อง

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['room_code'])) {
        // ตรวจสอบรหัสห้อง
        $room_code = $_POST['room_code'];

        // ตรวจสอบรหัสห้องในฐานข้อมูล
        $sql = "SELECT * FROM RoomDetails WHERE room_code = '$room_code'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            // ถ้ารหัสห้องถูกต้อง, ส่งไปหน้ากรอกชื่อ
            $row = $result->fetch_assoc();
            $id = $row['id'];   // เก็บ id ห้อง
            header("Location: name.php?room_code=" . urlencode($room_code) . "&id=" . urlencode($id));
            exit();
        } else {
            // ถ้ารหัสห้องไม่ถูกต้อง
            $room_code_error = "รหัสห้องไม่ถูกต้อง กรุณาลองใหม่";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>กรอกรหัสห้อง</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<header class="header">
        <div class="header-logo-container">
            <img src="https://bangkok.traffy.in.th/assets/ic_traffy1-3adc9d55.png" alt="Logo 1" class="header-logo">
            <img src="https://bangkok.traffy.in.th/assets/ic_traffy2-b99cb1d3.png" alt="Logo 2" class="header-logo">
            <img src="https://bangkok.traffy.in.th/assets/ic_bangkok-5e09ba9f.png" alt="Logo 3" class="header-logo">
        </div>
</header>

    <form method="POST" action="">
        <label for="room_code">รหัสห้อง</label>
        <input type="password" id="room_code" name="room_code" placeholder="กรอกรหัสห้อง" required>
        <button type="submit">ยืนยัน</button>

        <?php if ($room_code_error): ?>
            <p style="color: red;"><?php echo $room_code_error; ?></p>
        <?php endif; ?>
    </form>
</body>
</html>
