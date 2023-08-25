<?php 
include('includes/dbconnection.php');
session_start();
error_reporting(0);
include('includes/dbconnection.php');
if(isset($_POST['submit']))
  {

    $name=$_POST['name'];
    $email=$_POST['email'];
    $adate=$_POST['adate'];
    $atime=$_POST['atime'];
    $phone=$_POST['phone'];
    $aptnumber = mt_rand(100000000, 999999999);
    $remark = "";
    $status ="";
    $sid=$_POST['sids'];
    $sidnew="";
    
    for($i=0;$i<count($sid);$i++){
        $sidnew = $sid[$i];
        mysqli_query($con,"INSERT INTO tblappointmentdetails (aid,sid) values ($aptnumber,'".$sidnew."')") or die(mysqli_error());
            echo "Data added success fully!";
          }
 
  
  if ($con->query($sql) === TRUE)
  {
    echo "success";
  } else
  {
    echo "Error: " . $sql . "<br>" . $con->error;
  } 
 if ($con->connect_error) {die("Connection failed: " . $con->connect_error);}
    
    $query="INSERT INTO tblappointment(AptNumber,Name,Email,PhoneNumber,AptDate,AptTime,Remark,Status) VALUES($aptnumber,'$name','$email',$phone,'$adate','$atime','$remark','$status')";
    

if ($con->query($query) === TRUE) 
{
    echo "New record created successfully";
    $ret=mysqli_query($con,"select AptNumber from tblappointment where Email='$email' and  PhoneNumber='$phone'");

    $result=mysqli_fetch_array($ret);

    $_SESSION['aptno']=$result['AptNumber'];
    
    echo "<script>window.location.href='thank-you.php'</script>";
} else {
    echo "Error: " . $sql . "<br>" . $con->error;
}
  }

?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Your Perfect</title>
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Prata&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/style1.css">

  </head>
  <body>
    <?php include_once('includes/header.php');?>

    <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate pb-5">
            <h2 class="mb-0 bread">Appointment Page</h2>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.php">Home <i class="ion-ios-arrow-forward"></i></a></span> Appointment Page<span> <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>
  <br>    
    
  <section class="ftco-section ftco-no-pt ftco-booking" >
    <div class="container">
      <div class="row justify-content-center pb-3">
        <div class="col-md-10 heading-section text-center ftco-animate">
          <h2 class="mb-4">Make An Appointment</h2>
          <p>
              <a href="search-appointment.php" class="btn btn-outline-primary float-right">Check Status</a>
            </p>
              
        </div>
      </div>
        <form action="" method="post" class="appointment-form">
            <div class="row justify-content-center pb-3">
              <div class="col-sm-12" >
                <div class="form-group">
                  <input type="text" class="form-control" id="name" placeholder="Name" name="name" required="true" >
                </div>
              </div>
              <div class="col-sm-12">
                <div class="form-group">
                  <input type="email" class="form-control" id="appointment_email" placeholder="Email" name="email" required="true">
                </div>
              </div>
              <div class="col-sm-12">
                <div class="form-group">
                  <div id="datepicker" class="input-group date" data-date-format="dd-mm-yyyy">
                  <input class="form-control" type="text" id="adate" placeholder="Date" name="adate" required="true">
                 <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                </div>
                </div>    
              </div>
              <div class="col-sm-12">
                <div class="form-group">
                  <input type="text" class="form-control appointment_time" placeholder="Time" name="atime" id='atime' required="true">
                  </div>
                </div>
                <div class="col-sm-12">
                  <div class="form-group">
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone" required="true" maxlength="10" pattern="[0-9]+">
                  </div>
                </div>
                </div>
                <div class="tables ">              
                  <div class="table-responsive bs-example widget-shadow">
                    <h4>Which services You Want?</h4>
                      <table class="table table-bordered"> <thead> <tr> <th>#</th> <th>Service Name</th> <th>Service Price</th> <th>Action</th> </tr> </thead> <tbody>
                  <?php
                    $ret=mysqli_query($con,"select *from  tblservices");
                    $cnt=1;
                    while ($row=mysqli_fetch_array($ret)) {

                  ?>

                <tr> 
                <th scope="row"><?php echo $cnt;?></th> 
                  <td><?php  echo $row['ServiceName'];?></td> 
                    <td><?php  echo $row['Cost'];?></td> 
                      <td><input type="checkbox" name="sids[]" value="<?php  echo $row['ID'];?>" ></td>
                        </tr>
                        <?php 
                        $cnt=$cnt+1;
                        }?>
                      </tbody> </table>
                  <div class="form-group ">
                    <center>
                      <input type="submit" name="submit" value="Make an Appointment" class="btn btn-outline-primary p-3 px-5 py-4 ml-md-2">
                    </center>
                      
                  </div>
                  
             </form>

  </section>


    <?php include 'includes/footer.php'; ?>

  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
  <script src="js/date.js"></script> 
  <script src="js/time.js"></script> 
  </body>
</html>
