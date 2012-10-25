<?

// Daniel Shiffman
// May 2006
// Upload JPG file to server
// Thanks to Shawn Van Every's wiki: (https://itp.nyu.edu/~sve204/cgi-bin/wiki/wiki.pl?FormUploads)

$form = $_POST['form'];
if ($form == "true")
{
  echo "Uploading. . . ";
  $uploadfilename = "whatever.jpg";
  $uploaddir = '/';
  $uploadfile = $uploaddir . $uploadfilename;
  $uploadrelativefile = 'http://dannewoo.com/itp/itp_halloween/' . $uploadfilename;

  $filetype = $_FILES['bytes']['type'];
  $filesize = $_FILES['bytes']['size'];
  $error = false;

  if ($filetype != "image/jpeg") {
    $error = true;
    echo "\nFile is not a JPEG!";
  } 
  else if ($filesize > 1000000) {
    $error = true;
    echo "\nFile is too big!";
  }

  if (!$error && move_uploaded_file($_FILES['bytes']['tmp_name'], $uploadfile))
  {
    echo "\nupload ok";
  }
  else
  {
    echo "\nerror.";
  }
}