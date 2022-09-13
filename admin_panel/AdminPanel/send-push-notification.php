<?php include('session.php'); ?>
<?php include('public/menubar.php'); ?>

<?php

	if (isset($_GET['id'])) {
		$ID = $_GET['id'];
	} else {
		$ID = "";
	}
			
	// create array variable to handle error
	$error = array();
			
	// create array variable to store data from database
	$data = array();
		
	// get data from reservation table
	$sql_query = "SELECT nid, news_title, news_description, content_type, news_image, video_id FROM tbl_news WHERE nid = ?";
		
	$stmt = $connect->stmt_init();
	if ($stmt->prepare($sql_query)) {	
		// Bind your variables to replace the ?s
		$stmt->bind_param('s', $ID);
		// Execute query
		$stmt->execute();
		// store result 
		$stmt->store_result();
		$stmt->bind_result(
			$data['nid'], 
      $data['news_title'],
			$data['news_description'],
			$data['content_type'],
			$data['news_image'],
			$data['video_id']
		);
		$stmt->fetch();
		$stmt->close();
	}
			
?>

<?php
  $setting_qry    = "SELECT * FROM tbl_settings where id = '1'";
  $setting_result = mysqli_query($connect, $setting_qry);
  $settings_row   = mysqli_fetch_assoc($setting_result);

  $onesignal_app_id = $settings_row['onesignal_app_id']; 
  $onesignal_rest_api_key = $settings_row['onesignal_rest_api_key']; 

  define("ONESIGNAL_APP_ID", $onesignal_app_id);
  define("ONESIGNAL_REST_KEY", $onesignal_rest_api_key);

  //'filters' => array(array('Area' => '=', 'value' => 'ALL')),

  function get_cat_name($cat_id) {
    //global $mysqli;
    $cat_qry = "SELECT * FROM tbl_news WHERE nid = '".$cat_id."'";
    $cat_result = mysqli_query($connect, $cat_qry); 
    $cat_row = mysqli_fetch_assoc($cat_result); 
     
    return $cat_row['news_title'];

  }

  $cat_qry = "SELECT * FROM tbl_news ORDER BY news_title";
  $cat_result = mysqli_query($connect, $cat_qry); 
 

  if (isset($_POST['submit'])) {

     if ($_POST['external_link']!="") {
        $external_link = $_POST['external_link'];
     } else {
        $external_link = false;
     } 

     if ($_POST['cat_id'] != 0) {
        $cat_name = get_cat_name($_POST['cat_id']);
     } else {
        $cat_name = '';
     }    
         
        if ($data['content_type'] == 'youtube') {
			$big_image = 'http://img.youtube.com/vi/'.$data['video_id'].'/mqdefault.jpg';
        } else {
        	$big_image = 'http://'.$_SERVER['SERVER_NAME'] . dirname($_SERVER['REQUEST_URI']).'/upload/'.$data['news_image'];
        }

        $content = array(
                         "en" => $_POST['notification_msg']                                                 
                         );

        $fields = array(
                        'app_id' => ONESIGNAL_APP_ID,
                        'included_segments' => array('All'),                                            
                        'data' => array("foo" => "bar","cat_id"=>$_POST['cat_id'],"cat_name"=>$cat_name,"external_link"=>$external_link),
                        'headings'=> array("en" => $_POST['notification_title']),
                        'contents' => $content,
                        'big_picture' => $big_image         
                        );

        $fields = json_encode($fields);
        print("\nJSON sent:\n");
        print($fields);

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json; charset=utf-8',
                                                   'Authorization: Basic '.ONESIGNAL_REST_KEY));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);

        $response = curl_exec($ch);
        curl_close($ch);        
        
        $_SESSION['msg'] = "";
        header("Location:manage-news.php");
        exit; 

  }
  
?>

	<section class="content">

        <ol class="breadcrumb">
            <li><a href="dashboard.php">Dashboard</a></li>
            <li><a href="manage-news.php">Manage News</a></li>
            <li class="active">Push Notification</a></li>
        </ol>

        <div class="container-fluid">

        	<form id="form_validation" action="" name="addeditcategory" method="post" enctype="multipart/form-data">
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                	<div class="card">
                        <div class="header">
                            <h2>PUSH NOTIFICATION</h2>
                        </div>
                        <div class="body">

                        	<div class="row clearfix">

                        	<input type="hidden" class="form-control" name="cat_id" id="cat_id" value="<?php echo $data['nid']; ?>" required>

                        	<div class="form-group col-sm-12">
                                <div class="font-12">Title *</div>
                                <div class="form-line">
                                    <input type="text" class="form-control" name="notification_title" id="notification_title" placeholder="Title" value="<?php echo $data['news_title']; ?>" required >
                                </div>                        		
                        	</div>

                        	<div class="form-group col-sm-12">
                        		<div class="font-12">Message *</div>
                                <div class="form-line">
                                    <input type="text" class="form-control" name="notification_msg" id="notification_msg" placeholder="Message" value="<?php echo $data['news_description']; ?>" required>
                                </div> 
                            </div>

                            <div class="form-group col-sm-12">
            								<?php if ($data['content_type'] == 'youtube') { ?>
            									<p><img style="max-width:30%" src="https://img.youtube.com/vi/<?php echo $data['video_id'];?>/mqdefault.jpg" ></p>
            					            <?php } else { ?>
            					            	<p><img style="max-width:30%" src="upload/<?php echo $data['news_image'];?>" ></p>
            					            <?php } ?>
            					      </div>

					                  <div class="col-sm-12">
                                <button class="btn bg-blue waves-effect pull-right" type="submit" name="submit">SEND NOW</button>
                            </div>
							
							</div>
                        	</div>
                        </div>
                    </div>
                </div>
            	</form>

            </div>
            
        </div>

    </section>

<?php include('public/footer.php'); ?>