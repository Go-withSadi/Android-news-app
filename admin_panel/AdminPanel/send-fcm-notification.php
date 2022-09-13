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
  $sql_query = "SELECT id, title, message, image, link FROM tbl_fcm_template WHERE id = ?";
    
  $stmt = $connect->stmt_init();
  if ($stmt->prepare($sql_query)) { 
    // Bind your variables to replace the ?s
    $stmt->bind_param('s', $ID);
    // Execute query
    $stmt->execute();
    // store result 
    $stmt->store_result();
    $stmt->bind_result(
      $data['id'],
      $data['title'],
      $data['message'],
      $data['image'],
      $data['link']
    );
    $stmt->fetch();
    $stmt->close();
  }
      
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
                  <form method="post" action="push-services.php">
                    <div class="card">
                          <div class="header">
                              <h2>SEND NOTIFICATION</h2>
                          </div>
                          <div class="body">

                            <div class="row clearfix">

                              <div class="form-group col-sm-12">
                                  <div class="font-12">Title *</div>
                                  <div class="form-line">
                                      <input type="text" class="form-control" name="title" id="title" placeholder="Title" value="<?php echo $data['title']; ?>" required>
                                  </div>
                              </div>

                              <div class="form-group col-sm-12">
                                  <div class="font-12">Message *</div>
                                  <div class="form-line">
                                      <input type="text" class="form-control" name="message" id="message" placeholder="Message" value="<?php echo $data['message']; ?>" required>
                                  </div>
                              </div>

                              <div class="col-sm-6">
                                  <div class="form-group">
                                      <input type="file" class="dropify-image" data-max-file-size="1M" data-allowed-file-extensions="jpg jpeg png gif" data-default-file="upload/notification/<?php echo $data['image']; ?>" data-show-remove="false" disabled/>
                                  </div>
                              </div>

                              <div class="form-group col-sm-12">
                                  <div class="font-12">Url (Optional)</div>
                                  <div class="form-line">
                                      <input type="text" class="form-control" name="link" id="link" placeholder="http://www.google.com" value="<?php echo $data['link']; ?>" >
                                  </div>
                              </div>

                              <input type="hidden" name="id" id="id" value="0" />
                              <input type="hidden" name="image" id="image" value="<?php echo $data['image']; ?>" />

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