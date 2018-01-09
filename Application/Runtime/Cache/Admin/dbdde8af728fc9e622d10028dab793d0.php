<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>数据查询2</title>
		<link rel="stylesheet" type="text/css" href="/right/Public/admin/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="/right/Public/admin/css/index.css"/>
		<script type="text/javascript" src="/right/Public/admin/js/jquery-3.1.0.js" ></script>
		<script type="text/javascript" src="/right/Public/admin/js/index.js" ></script>
	</head>
	<body>
		<div class="header">
			<img src="img/logo.png"/>
			<span>双维科技信息管理平台</span>
		</div>
		<div class="content content3 clearfix">
			<div class="con_left">
				<ul>
					<li>
						<a href="<?php echo U('Equipment/index');;?>">
							<img src="/right/Public/admin/img/device2.png"/>
							<span>设备列表</span>
						</a>
					</li>
					<li>
						<a href="map.html">
							<img src="/right/Public/admin/img/position1.png"/>
							<span>地图地理</span>
						</a>
					</li>
					<li class="actives">
						<a href="<?php echo U('Cycle/index');?>">
							<img src="/right/Public/admin/img/date1.png"/>
							<span>数据展示</span>
						</a>
					</li>
					<li>
						<a href="manage.html">
							<img src="/right/Public/admin/img/set1.png"/>
							<span>系统管理</span>
						</a>
					</li>
				</ul>
				<img src="/right/Public/admin/img/quit.png" class="quit"/>
			</div>
			<div class="con_middle date_search_t">
				<div class="titles">
					<ul class="clearfix">
						<!-- <li>
							<a href="#" class="actives">重新查询</a>
						</li> -->
						<li>
							<a class="actives" href="#">另存为Excel</a>
						</li>
						<li>
							<a class="actives" href="#">切换至曲线</a>
						</li>
					</ul>
				</div>

				<div>
					<div class="one">
						<table border="none" cellspacing="" cellpadding="" class="table">

							<tr>
								<th>设备编码</th>
								<?php if(is_array($arrayshift)): foreach($arrayshift as $key=>$vo): ?><th><?php echo ($key); ?></th><?php endforeach; endif; ?>
							</tr>
							<tr>
								<th>自定义信息</th>
								<?php if(is_array($data)): foreach($data as $key=>$vo): ?><th><?php echo ($vo[$key]); ?></th><?php endforeach; endif; ?>
							</tr>

							<?php if(is_array($data)): foreach($data as $key=>$vo): ?><tr>
									<td><?php echo ($key); ?></td>
									<?php if(is_array($vo)): $i = 0; $__LIST__ = $vo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$f): $mod = ($i % 2 );++$i;?><td><?php echo ($vo[$key]['concentration']); ?> >> <?php echo ($vo[$key]['temperature']); ?> >> <?php echo ($vo[$key]['humidity']); ?></td><?php endforeach; endif; else: echo "" ;endif; ?>


								</tr><?php endforeach; endif; ?>




						</table>
						<div class="page">
							<ul class="clearfix">
								<li><?php echo ($page); ?></li>

							</ul>
						</div>
					</div>
					<div class="one two">
						<img src="/right/Public/admin/img/line_chart.png"/>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>