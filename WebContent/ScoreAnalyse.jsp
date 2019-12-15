<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="sms.bean.*" %>
<%@ page import="sms.dao.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>成绩分析</title>
<link type="text/css" rel="stylesheet" href="css/index.css">
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/echarts.js" type="text/javascript"></script>
<script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
</head>
<body>
	<%
			Student s = (Student)request.getSession().getAttribute("student");
			//Teacher t = (Teacher)request.getSession().getAttribute("teacher");
			if(s == null){
				response.sendRedirect("notlogin.jsp");
			}
		%>
		<div class="main">
			<div class="navigation">
				<span>欢迎回来! 
					<%
						if(s != null){
							out.print(s.getName());
						}
					%>
					同学
				</span>
				<a class="exit" href="/StudentMS/LogoutServlet"><span>退出登录</span></a>
			</div>
			<table class="table" style="margin:0 auto;width:90%">
				<tr>
					<td style="width:20%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='index_Student.jsp'">公告</button>	</td>
					<td style="width:20%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='ChoiceCourse.jsp'">选课</button></td>
					<td style="width:20%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='StudentCourses.jsp'">课表查询</button></td>
					<td style="width:20%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='MyGrade.jsp'">成绩查询</button></td>
					<td style="width:20%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='ScoreAnalyse.jsp'">成绩分析</button></td>
				</tr>
			</table>
			<%
				String sid = s.getId();
				int courseNumber = StudentSql.courseNumber(sid);	//学生选课书
				int notNullCourseNumber = StudentSql.notNullCourseNumber(sid);	//有成绩的课程数
				int totalGrade = StudentSql.totalGrade(sid);	//总成绩
				int creditNumber = StudentSql.creditNumber(sid);	//总学分
				int notNullCreditNumber = StudentSql.notNullCreditNumber(sid);	//有成绩的总学分
				List<int[]> list = StudentSql.getCS(sid);		//学分成绩的数组
				double averageScore = -1;
				int[] array = new int[2];
				double thisAverageScore = -1;
				
				//计算加权平均分
				if(list != null){
					averageScore = 0;
					for(int i = 0; i < list.size(); i++){
						array = list.get(i);
						averageScore += ((double)array[0]/notNullCreditNumber) * array[1];
					}
				}
				
				//计算课程平均分
				if(notNullCourseNumber != 0){
					thisAverageScore = (double)totalGrade / notNullCourseNumber;
				}
				
			%>
			<div>
				<table class="table" style="margin-top:20px;">
					<tr>
						<th style="text-align:center">选课数</th><th style="text-align:center">总学分</th style="text-align:center"><th style="text-align:center">课程平均分</th><th style="text-align:center">加权平均分</th>
					</tr>
					<tr>
						<td style="text-align:center"><%if(courseNumber == 0){
								out.print("无");
							}
						else{
							out.print(courseNumber);
						}
							%>
						</td>
						<td style="text-align:center"><%if(creditNumber == 0){
								out.print("无");
							}
							else{
								out.print(creditNumber);
							}
							%>
						</td>
						<td style="text-align:center"><%
								if(thisAverageScore != -1){
									out.print(thisAverageScore);
								}else{
									out.print("无");
								}
							%>
						</td>
						<td style="text-align:center"><%
							if(averageScore == -1){
								out.print("无");
							}
							else{
								out.print(averageScore);
							}
							%>
						
					</tr>
				</table>
			</div>
			<div>
				<div id="scoreAnalyse" style="width:600px;height:600px;margin:0 auto;">
				</div>
				<script type="text/javascript">
					var myChart = echarts.init(document.getElementById('scoreAnalyse'));
					var url = 'ScoreAnalyseServlet?sid=<%=sid %>';
					$.getJSON(url).done(function(json){
						//console.log(json);
						
						
						//console.log(cname);
						//console.log(score);
						
						//console.log(len);
						//console.log(json);
						
						//var array = new Array(json.)
						console.log(json);
						
						option = {
								
								
							    title: {
							        text: '各科成绩',
							        left: 'center',
							        top: 20,
							        textStyle: {
							            color: '#ccc'
							        }
							    },

							    tooltip : {
							        trigger: 'item',
							        formatter: "{a} <br/>{b} : {c} ({d}%)"
							    },

							    visualMap: {
							        show: false,
							        min: 80,
							        max: 600,
							        inRange: {
							            colorLightness: [0, 1]
							        }
							    },
							    series : [
							        {
							            name:'成绩',
							            type:'pie',
							            radius : '55%',
							            center: ['50%', '50%'],
							            data: json.sort(function (a, b) { return a.value - b.value; }),
							            roseType: 'radius',
							            label: {
							                normal: {
							                    textStyle: {
							                        color: 'rgba(255, 255, 255, 0.3)'
							                    }
							                }
							            },
							            labelLine: {
							                normal: {
							                    lineStyle: {
							                        color: 'rgba(255, 255, 255, 0.3)'
							                    },
							                    smooth: 0.2,
							                    length: 10,
							                    length2: 20
							                }
							            },
							            itemStyle: {
							                normal: {
							                	color: 'rgba(255, 0, 0)',
							                    shadowBlur: 200,
							                    shadowColor: 'rgba(0, 0, 0, 0.5)'
							                }
							            },

							            animationType: 'scale',
							            animationEasing: 'elasticOut',
							            animationDelay: function (idx) {
							                return Math.random() * 200;
							            }
							        }
							    ]
							};
						myChart.setOption(option);
					});
				</script>
			</div>	
		</div>
</body>
</html>