<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<style>
    input{float:left}
</style>
<body>
    <form action="<?php echo U('Cycle/updateDevice');?>" method="POST">
          <ul>
              <li>设备编码：<input type="text" name="device_sn" value=""></li>
              <li>气体浓度：<input type="text" name="concentration" value=""></li>
              <li>设备电量：<input type="text" name="electricity" value=""></li>
              <li>设备温度：<input type="text" name="temperature" value=""></li>
              <li>设备湿度：<input type="text" name="humidity" value=""></li>
          </ul>
        <input type="submit" value="提交">
    </form>
</body>
</html>