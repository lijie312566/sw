<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>双维金叶</title>
		<link rel="stylesheet" type="text/css" href="/right/Public/admin/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="/right/Public/admin/css/index.css"/>
		<script type="text/javascript" src="/right/Public/admin/js/jquery-3.1.0.js" ></script>
		<script type="text/javascript" src="/right/Public/admin/js/index.js" ></script>

	</head>

		<div class="header">
			<img src="img/logo.png"/>
			<span>双维科技信息管理平台</span>
		</div>
		<div class="content content1 clearfix">
			<div class="con_left">
				<ul>
					<li class="actives">
						<a href="index.html">
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
					<li>
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
				<img src="img/quit.png" class="quit"/>
			</div>
			<div class="con_middle">
				<div class="title">
					<table border="none" cellspacing="" cellpadding="" class="table_top">
						<tr>
							<th class="actives w">温度</th>
							<th class="s">湿度</th>
							<th class="p">PH3</th>
							<th class="c">CO</th>
						</tr>
					</table>
				</div>
				<table border="none" cellspacing="" cellpadding="" class="table">
					<tr>
						<th>设备编码</th>
						<th>在线状态</th>
						<th>数据</th>
						<th>自定义信息</th>
					</tr>
                    <?php if(is_array($data)): foreach($data as $key=>$vo): ?><tr>
                            <td><img src="/right/Public/admin/img/square.png"/><?php echo ($vo['device_sn']); ?></td>
                            <td>在线</td>

                            <td class="concentration"><?php echo ($vo['concentration']); ?></td>
                            <td class="electricity"><?php echo ($vo['electricity']); ?></td>
                            <td class="temperature"><?php echo ($vo['temperature']); ?></td>
                            <td class="humidity"><?php echo ($vo['humidity']); ?></td>
                            <td>Ax1010214578512</td>
                        </tr><?php endforeach; endif; ?>
				</table>
			</div>

			<div class="con_right">
					<div class="code">
						<span>设备编码：</span>
						<input type="text" name="" id="" value="" placeholder="Arno管理的设备" class="btn"/>
					</div>
					<div class="run clearfix">
						<span class="run_states">运行状态：</span>
						<!-- <select class="run_in" name="" id=""></select> -->
						<div class="run_in clearfix">
							<select name="" id="">
								<option value="">在线</option>
								<option value="">报警</option>
								<option value="">电量低</option>
								<option value="">离线</option>
							</select>
						</div>
					</div>
					<div class="date clearfix">
						<span class="run_states">数据：</span>
						<div class="date_in">
							<i class="clearfix">
								<select class="fh_datas" name="" id="">
									<option value="">></option>
									<option value=""><</option>
									<option value="">=</option>
								</select>
							</i>
							<i>
								<span></span>
								<span>℃</span>
							</i>
						</div>
					</div>
					
					<div class="run mes">
						<span>自定义信息：</span>
						<input type="text" name="" id="" value="" placeholder="Arno管理的设备" class="btn"/>
					</div>
					<input type="button" name="" id="" value="查询设备" class="search"/>
					<input type="button" name="" id="" value="添加设备" class="add_sb"onclick="showAll('#manage_model')"/>
					<input type="button" name="" id="" value="历史数据" class="history_data" onclick="showAll('#model')"/>
				<!--</div>-->
			</div>
		</div>


		<div id="mask" class="mask"></div> 
<div>
    <form action="<?php echo U('Cycle/index');?>" method="POST">
        <div id="model" class="model">
            <img src="/right/Public/admin/img/tc_close.png" alt="" class="tc_close">
            <h2>历史数据</h2>
            <ul>
                <li class="input_dx">
                    <label for="">起止时间：</label>
                    <b>from</b><span><input type="text" name="starting_point" id="test1"><img src="/right/Public/admin/img/watch.png"></span>
                    <b>to</b><span><input type="text" name="end" id="test2"><img src="/right/Public/admin/img/watch.png"></span>
                </li>
                <li class="jg_dx">
                    <label for="">间隔：</label>
                    <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
                    <input type="text" name="interval">
                    <b>&nbsp;&nbsp;&nbsp;&nbsp;</b>
                    <select name="time">
                        <option value="3">秒</option>
                        <option value="2">分钟</option>
                        <option value="1">小时</option>
                    </select>
                </li>
            </ul>
            <div class="sear_cancle">
                <input type="submit" class="search_butt" value="查询">

                <a href="###" class="cancle_butt">取消</a>
            </div>
        </div>
        </form>
</div>


        <div>
            <div id="manage_model" class="manage_model">
                <img src="/right/Public/admin/img/tc_close.png" alt="" class="tc_close">
                <h2>添加设备</h2>
                <ul>
                    <li class="input_dx">
                        <label for="">设备编码：</label>
                        <input type="text">
                    </li>
                    <li class="input_dx">
                        <label for="">自定义信息：</label>
                        <input type="text">
                    </li>
                    <li class="input_dx">
                        <label for="">添加关联人：</label>
                        <input type="text">
                        <a href="#" class="add_sb_sear">查询</a>
                    </li>
                </ul>
                <div class="box_add_glr clearfix">
                    <ul class="box_glr_left">
                        <li>张三</li>
                        <li>张三</li>
                        <li>张三</li>
                        <li>张三</li>
                    </ul>
                    <a href="###" class="glr_right_jt"><img src="" alt=""></a>
                    <a href="###" class="glr_left_jt"><img src="" alt=""></a>
                    <ul class="box_glr_right">
                        <li>张三</li>
                        <li>张三</li>
                        <li>张三</li>
                        <li>张三</li>
                    </ul>
                </div>
                <div class="manage_sear_cancle" style="margin-top:10px;">
                    <a href="###" class="manage_search_butt">确定</a>
                    <a href="###" class="manage_cancle_butt">取消</a>
                </div>
            </div>
        </div>
    </body>
    <style>
        .electricity{display: none;}
        .temperature{display: none;}
        .humidity{display: none;}
    </style>
    <script>
        $(function(){

            $('.w').click(function(){
                $('.electricity').hide();
                $('.concentration').show();
                $('.temperature').hide();
                $('.humidity').hide();
            })
            $('.s').click(function(){
                $('.electricity').show();
                $('.concentration').hide();
                $('.temperature').hide();
                $('.humidity').hide();
            })
            $('.p').click(function(){
                $('.electricity').hide();
                $('.concentration').hide();
                $('.temperature').show();
                $('.humidity').hide();
            })
            $('.c').click(function(){
                $('.electricity').hide();
                $('.concentration').hide();
                $('.temperature').hide();
                $('.humidity').show();
            })
        })
    </script>
    <script src="/right/Public/admin/js/src/laydate.js"></script> <!-- 改成你的路径 -->
<script>
    //执行一个laydate实例
    laydate.render({
      elem: '#test1', //指定元素
      type: 'datetime'
    });
    laydate.render({
      elem: '#test2', //指定元素
      type: 'datetime'
    });
</script>
	<script type="text/javascript">
        $(".table_top tr th").click(function(){
            console.dir(1);
            $(this).addClass("actives").siblings().removeClass("actives");
        })
	$(".tc_close").click(function(){
		$(".model,#mask,.manage_model").hide();
	})
    //兼容火狐、IE8
    function showMask(){
        $("#mask").css("height",$(document).height());
        $("#mask").css("width",$(document).width());
        $("#mask").show();
    }
    //让指定的DIV始终显示在屏幕正中间
    function letDivCenter(divName){
        var top = ($(window).height() - $(divName).height())/2;
        var left = ($(window).width() - $(divName).width())/2;
        var scrollTop = $(document).scrollTop();
        var scrollLeft = $(document).scrollLeft();
        $(divName).css( { position : 'absolute', 'top' : top + scrollTop, left : left + scrollLeft } ).show();
    }
    function showAll(divName){
        showMask();
        letDivCenter(divName);
    }
</script>
</html>