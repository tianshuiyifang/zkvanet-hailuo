@echo off 
rem 关闭自动输出
:begin
rem 接收输入
set input=
set /p input=请输入生成war包的名称(如：self.war):
jar -cvf  %input%  *
pause  打包完成。 