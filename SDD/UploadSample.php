<!DOCTYPE html>
<html>
<head>
</head>
<body>
  <form>
    <label for = "id"><b>id</b></label>
    <input type = "text" placeholder = "Enter client id" name = "client_id" required>

    <label for = "sample">Select a file:</label>
    <input type = "file" id="myfile" name = "myfile"><br><br>

    <button type = "submit" class="btn btn-default" name = "submit" value = "submit">Submit</button>
  </form>
</body>
</html>

<?php
if(isset($_POST['submit']))
{
  echo("X");
  $client_id = $_POST['client_id'];
  echo($client_id);

  $url = 'localhost';
  $username = 'root';
  $password = '';
  $conn = mysqli_connect($url, $username, $password, 'dna');
  if(!$conn){
    die('Could not Connect My Sql:' .mysqli_error());
  }

  $file = $_FILES['file']['tmp_name'];
  $handle = fopen($file, "r");
  $c = 0;

  while(($filesop = fgetcsv($handle, 1000, ",")) !== false)
  {
    $PHV_status = $filesop[1];
    $PPARA = $filesop[2];
    $NOS3 = $filesop[3];
    $COL1A1 = $filesop[4];
    $VDR = $filesop[5];
    $ACTN3 = $filesop[6];
    $BDNF = $filesop[7];
    $COL5A1 = $filesop[8];
    $COL2A1 = $filesop[9];
    $AMPD1 = $filesop[10];
    $AGT = $filesop[11];

    $sql = "INSERT INTO sample(client_id, PHV_status, PPARA, NOS3, COL1A1, VDR, ACTN3, BDNF, COL5A1, COL2A1, AMPD1, AGT) VALUES ('$client_id','$PHV_status', '$PPARA', '$NOS3', '$COL1A1', '$VDR', '$ACTN3', '$BDNF', '$COL5A1', '$COL2A1', '$AMPD1', '$AGT')";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_execute($stmt);

    $c = $c + 1;
  }
  if(mysqli_query($conn, $sql)){
    echo "success";
  } 
  else
  {
    echo "Sorry! Unable to impo.";
  }
}
?>
