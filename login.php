<?php

session_start();
include_once 'database.php';


if (isset($_POST['submit'])) {
  $email = $_POST['email'];
  $password = $_POST['password'];

  $sql = "SELECT * FROM user WHERE email ='".$email."' and password = '".$password."' ";
              $result = $conn->query($sql);

              if ($result->num_rows > 0) {
               // output data of each row
                 while($row = $result->fetch_assoc()) {
                  $_SESSION['role'] = $row['role'];
                  //$_SESSION['user'] = $row['fname']." ".$row['lname'];
                   }

                   $sql2 = "SELECT * FROM ".$_SESSION['role']." WHERE email ='".$email."'";
                    $result2 = $conn->query($sql2);
                    if ($result2->num_rows > 0) {
                        while($row2 = $result2->fetch_assoc()) {
                          $_SESSION['user'] = $row2['fname']." ".$row2['lname'];
                          //$_SESSION['uid'] = $row2['pid'];
                          if($_SESSION['role']=='Student'){
                            $_SESSION['uid']=$row2['sid'];
                          }else if($_SESSION['role']=='Parent'){
                            $_SESSION['uid']=$row2['pid'];
                          }else if($_SESSION['role']=='Teacher'){
                            $_SESSION['uid']=$row2['tid'];
                          }
                        }
                    }

                    header("Location: index.php");
                              }else{echo "<p style='width:100%;text-align;center'>Введен неправельный логин или пароль</p>";}
}

?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Вход</title><title>Панель администратора</title><link rel="icon" href="../img/favicon2.png">
  <!-- Адаптация под браузер -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Настройка шрифта -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Иконки -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Стиль страницы -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- ПРоверка -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

  <!-- Поддержка HTML5 Shim и Respond.js IE8 для элементов HTML5 и медиа-запросов -->
  <!-- ВНИМАНИЕ: Respond.js не работает, если вы просматриваете страницу через файл:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Шрифт от Google -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page bg-green">
<div class="login-box">
  <div class="login-logo">
    <a href="../"><b>SMS</b>Login</a><br>
    <small style="text-align: center;font-size:40% !important"><b>Автоматизированная система классного руководителя</b></small>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Авторизируйтесь, чтобы войти в систему</p>

    <form  method="post">
      <div class="form-group has-feedback">
        <input name="email" type="email" class="form-control" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input name="password" type="password" class="form-control" placeholder="Пароль">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
       
        <!-- /.col -->
        <div class="col-xs-12">
          <button name="submit" value="submit" type="submit" class="btn btn-success btn-block btn-flat">Вход</button>
        </div>
        <!-- /.col -->
      </div>
    </form>


   
    <!-- /.social-auth-links -->

   <br>
    

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>
</body>
</html>
