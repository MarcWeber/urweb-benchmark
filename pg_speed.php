<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
  <title>
  </title>
    <meta name="robots" content="index,nofollow" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
</head>
<body>
<?php
  $pg = pg_connect("dbname=simple_table");

  $res = pg_query($pg, "SELECT * FROM uw_st_t");

  while ($row = pg_fetch_row($res)) {
      echo "Id: {$row[0]} S1: {$row[1]} S2: {$row[2]} S3: {$row[3]} S4: {$row[4]}<br/>\n";
  };


?>
</body>
</html>
