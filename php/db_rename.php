<?php
$con=mysqli_connect("localhost","root","root","arkivat");
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$result = mysqli_query($con,"SELECT * FROM omeka_files  WHERE archive_filename  LIKE '%.djvu'");

while($row = mysqli_fetch_array($result)) {
	//echo $row['item_id'] . " " . $row['archive_filename'];
//	echo getcwd() . '/../pamje/' . $row['archive_filename'];
	rename( getcwd() . '/../pamje/' . $row['archive_filename'],  
			getcwd() . '/../pamje/' . $row['item_id'] . '.djvu');
	echo PHP_EOL;
}

mysqli_close($con);
