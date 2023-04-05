<?php
$mysqli = new mysqli("localhost","ronytraders_gt5g","ronytraders_gt5g","ronytraders_gt5g");


// Check connection
if ($mysqli -> connect_errno) {
  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
  exit();
}


$sqlUsers = "SELECT * FROM `users`";
$Users = $mysqli -> query($sqlUsers);


    while ($Usersvalue = $Users -> fetch_object()) {
         $id = $Usersvalue->id;
            $sql4user = "UPDATE `users` SET `checkin`=1 WHERE id='$id'";
            $mysqli->query($sql4user);
        }




$sqlFirst = "SELECT * FROM `package_buys`  WHERE `status`='Active'";
$package_buysFirst = $mysqli -> query($sqlFirst);


    while ($valueFirst = $package_buysFirst -> fetch_object()) {
        $id = $valueFirst->id;
        $nowDate =  strtotime(date('Y-m-d h:i'));
        $endDate =  strtotime($valueFirst->endDate);
        if($nowDate>$endDate){
            $sql1Up = "UPDATE package_buys SET `status`='Deactive' WHERE id='$id'";
            $mysqli->query($sql1Up);
        }

    }


$sql = "SELECT * FROM `package_buys`  WHERE `status`='Active'";
$package_buys = $mysqli -> query($sql);


    while ($value = $package_buys -> fetch_object()) {


      echo   $id = $value->id;
      echo '<br>';




            $userid = $value->userid;
            $sql3 = "SELECT * FROM `users` WHERE `id`='$userid'";
            $sql3Query = $mysqli -> query($sql3);
            $user = $sql3Query -> fetch_assoc();

            $earn = $value->earn;

            $receiveable = $user['receiveable'];

            if(!$receiveable){
                $receiveable = 0;
            }

            $nowReceiveAble = $receiveable+$earn;


            $sql4Up = "UPDATE users SET `receiveable`='$nowReceiveAble' WHERE id='$userid'";
            $mysqli->query($sql4Up);



}









?>
