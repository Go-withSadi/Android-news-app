<?php include('session.php'); ?>
<?php include('public/menubar.php'); ?>
<style>
div.ex1 {
    margin-bottom: 8px;
}
</style>

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
	$sql_query = "SELECT nid, news_title, news_description, news_image, content_type, video_id FROM tbl_news WHERE nid = ?";
		
	$stmt = $connect->stmt_init();
	if($stmt->prepare($sql_query)) {	
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
				$data['news_image'],
				$data['content_type'],
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
  $protocol_type = $settings_row['protocol_type'];

  define("ONESIGNAL_APP_ID", $onesignal_app_id);
  define("ONESIGNAL_REST_KEY", $onesignal_rest_api_key);

  $cat_qry = "SELECT * FROM tbl_fcm_template ORDER BY message";
  $cat_result = mysqli_query($connect, $cat_qry); 
 

  if (isset($_POST['submit'])) {

        $cat_id = $_POST['cat_id'];;
        $cat_name = '';
	    $external_link = false;

        if ($data['content_type'] == 'youtube') {
          $big_image = 'https://img.youtube.com/vi/'.$data['video_id'].'/mqdefault.jpg';
        } else {
          $big_image = $protocol_type.$_SERVER['SERVER_NAME'].dirname($_SERVER['REQUEST_URI']).'/upload/'.$data['news_image'];
          //$big_image = $protocol_type.'10.0.2.2/android_news_app/upload/'.$data['news_image'];
        }

        $content = array(
                         "en" => $_POST['notification_msg']                                                 
                         );

        $fields = array(
                        'app_id' => ONESIGNAL_APP_ID,
                        'included_segments' => array('All'),                                            
                        'data' => array("foo" => "bar","cat_id"=> $cat_id,"cat_name"=>$cat_name, "external_link"=>$external_link),
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
        
        $_SESSION['msg'] = "Congratulations, push notification sent...";
        header("Location:manage-news.php");
        exit; 

  }
  
?>

<?php
    $value = $data['news_description'];
    if (strlen($value) > 100)
    $value = substr($value, 0, 97) . '...';
?>

	<section class="content">

        <ol class="breadcrumb">
            <li><a href="dashboard.php">Dashboard</a></li>
            <li><a href="push-notification.php">Manage Notification</a></li>
            <li class="active">Send Notification</a></li>
        </ol>

        <div class="container-fluid">

            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                	<form method="post" enctype="multipart/form-data">
	                	<div class="card">
	                        <div class="header">
	                            <h2>SEND NOTIFICATION</h2>
	                        </div>
	                        <div class="body">

	                        	<div class="row clearfix">

	                        		<input type="hidden" name="cat_id" id="cat_id" value="<?php echo $data['nid']; ?>" required>
	                        		<input type="hidden" name="notification_title" id="notification_title" value="<?php echo $data['news_title']; ?>" required>
	                        		<input type="hidden" name="notification_msg" id="notification_msg" value='<?php echo $value; ?>' required>

			                        <div class="form-group col-sm-12">
			                            <div class="font-12">Title *</div>
			                            <div class="form-line">
			                            	<p><?php echo $data['news_title']; ?></p>
			                            </div>
			                       	</div>

			                       	<div class="form-group col-sm-12">
			                            <div class="font-12">Message *</div>
			                            <div class="form-line">
			                            	<?php echo $value; ?>
			                            </div>
			                       	</div>

			                       	<div class="col-sm-6">
			                       		<div class="font-12 ex1">Image *</div>
                                        <div class="form-group">
                                        	<?php if ($data['content_type'] == 'youtube') { ?>
                                        		<input type="file" class="dropify-image" data-max-file-size="1M" data-allowed-file-extensions="jpg jpeg png gif" data-default-file="https://img.youtube.com/vi/<?php echo $data['video_id'];?>/mqdefault.jpg" data-show-remove="false" disabled/>
                                        	<?php } else { ?>
                                            	<input type="file" class="dropify-image" data-max-file-size="1M" data-allowed-file-extensions="jpg jpeg png gif" data-default-file="upload/<?php echo $data['news_image']; ?>" data-show-remove="false" disabled/>
                                        	<?php } ?>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                		<button class="btn bg-blue waves-effect pull-right" type="submit" name="submit">SEND NOW</button>
                            		</div>
										
		                       	</div>
		                    </div>
		                </div>
                	</form>
                </div>
            </div>
        </div>

    </section>

<?php include('public/footer.php'); ?>