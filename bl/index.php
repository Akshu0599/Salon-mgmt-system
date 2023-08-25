<?php 
include_once("db_connect.php");
?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>phpzag.com : Demo Create Bootstrap Cards with PHP and MySQL</title>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
<?php include('container.php');?>
<div class="container">	
	<h2>Create Bootstrap Cards with PHP and MySQL</h2>
	<div class="row">
		<div class="col-lg-3 col-sm-6">
			<?php
			$sql = "SELECT id, name, image, description, address, website, facebook, gplus, twitter FROM cards";
			$resultset = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));			
			while( $record = mysqli_fetch_assoc($resultset) ) {
			?>
            <div class="card hovercard">
                <div class="cardheader">               
					<div class="avatar">
						<img alt="" src="<?php echo $record['image']; ?>">
					</div>
				 </div>
                <div class="card-body info">
                    <div class="title">
                        <a href="#"><?php echo $record['name']; ?></a>
                    </div>
					<div class="desc"> <a target="_blank" href="<?php echo $record['website']; ?>"><?php echo $record['website']; ?></a></div>		
                    <div class="desc"><?php echo $record['description']; ?></div>      
					<div class="desc"><?php echo $record['address']; ?></div>								
                </div>
                <div class="card-footer bottom">
                    <a class="btn btn-primary btn-twitter btn-sm" href="<?php echo $record['twitter']; ?>">
                        <i class="fa fa-twitter"></i>
                    </a>
                    <a class="btn btn-danger btn-sm" rel="publisher"
                       href="<?php echo $record['gplus']; ?>">
                        <i class="fa fa-google-plus"></i>
                    </a>
                    <a class="btn btn-primary btn-sm" rel="publisher"
                       href="<?php echo $record['facebook']; ?>">
                        <i class="fa fa-facebook"></i>
                    </a>                    
                </div>
            </div>
			<?php } ?>
        </div>
	</div>	
	<div style="margin:50px 0px 0px 0px;">
		<a class="btn btn-default read-more" style="background:#3399ff;color:white" href="http://www.phpzag.com/create-bootstrap-cards-with-php-and-mysql/">Back to Tutorial</a>		
	</div>
</div>
<?php include('footer.php');?>
