<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
     

      <!-- search form (Optional) -->
     
      </form>
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header"> Панель навигации</li>
        <!-- Optionally, you can add icons to the links -->
        <!-- <li class="active"><a href="#"><i class="fa fa-link"></i> <span>Link</span></a></li>
        <li><a href="#"><i class="fa fa-link"></i> <span>Another Link</span></a></li>-->
        <li id="stat"><a href="./"><i class="fa fa-bar-chart-o"></i> <span>Статистика</span> </a></li>

        <?php if($_SESSION['role']=='Teacher'){ ?>
        <li id="new"><a href="./student.php"><i class="fa fa-users"></i> <span>Студенты</span> </a></li>
        <li id="teacher"><a href="./teacher.php"><i class="fa  fa-black-tie"></i> <span>Учителя</span> </a></li>
        <li id="parent"><a href="./parent.php"><i class="fa  fa-female"></i> <span>Родители</span> </a></li>
        <li id="subject"><a href="./subject.php"><i class="fa fa-book"></i> <span>Предметы</span> </a></li>
        <li id="class"><a href="./class.php"><i class="fa fa-bank"></i> <span>Классы</span> </a></li>
        <li id="schedule"><a href="./schedule.php"><i class="fa fa-calendar-o"></i> <span>Расписание</span> </a></li>
        <li id="attendance"><a href="./attendance.php"><i class="fa  fa-check"></i> <span>Посещаемость</span> </a></li>
        <li id="exam"><a href="./exam.php"><i class="fa fa-line-chart"></i> <span>Экзамены</span> </a></li>
         <li id="examresults"><a href="./examresults.php"><i class="fa fa-graduation-cap"></i> <span>Результаты экзаменов</span> </a></li>
        <li id="user"><a href="./user.php"><i class="fa fa-user-plus"></i> <span>Пользователи</span> </a></li>
        <li id="notice"><a href="./notice.php"><i class="fa fa-envelope-o"></i> <span>Уведомления</span> </a></li>
      <?php }elseif ($_SESSION['role']=='Parent') {
          ?>
      <li id="student-par"><a href="./student-par.php"><i class="fa fa-users"></i> <span>Студенты</span> </a></li>
      <li id="notice-role"><a href="./notice-role.php"><i class="fa fa-envelope-o"></i> <span>Уведомления</span> </a></li>
      <li id="examresults-par"><a href="./examresults-par.php"><i class="fa fa-graduation-cap"></i> <span>Результаты экзаменов</span> </a></li>
          <?php

      }elseif ($_SESSION['role']=='Student') { ?>

      <li id="notice-role"><a href="./notice-role.php"><i class="fa fa-envelope-o"></i> <span>Уведомления</span> </a></li>
      <li id="examresults-stu"><a href="./examresults-stu.php"><i class="fa fa-graduation-cap"></i> <span>Результаты экзаменов</span> </a></li>   
      <li id="schedule-stu"><a href="./schedule-stu.php"><i class="fa fa-calendar-o"></i> <span>Расписание</span> </a></li>

<?php

      }?>
      


      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>