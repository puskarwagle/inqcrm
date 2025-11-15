<!DOCTYPE html>
<html>
<head>
<title>Table Counts</title>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>

<h2>Table Counts</h2>

<table>
  <tr>
    <th>Table</th>
    <th>Count</th>
  </tr>
  <?php
  $file = fopen("table_counts.txt", "r");
  if ($file) {
      while (($line = fgets($file)) !== false) {
          $parts = explode(": ", trim($line));
          if (count($parts) == 2) {
              echo "<tr>";
              echo "<td>" . htmlspecialchars($parts[0]) . "</td>";
              echo "<td>" . htmlspecialchars($parts[1]) . "</td>";
              echo "</tr>";
          }
      }
      fclose($file);
  }
  ?>
</table>

</body>
</html>
