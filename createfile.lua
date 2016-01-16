--文件存在返回1，不存在就生成文件并返回0，用于mei的检测
package.path = package.path .. ';/home/www/lua/function/?.lua'
require("common")
local args = ngx.req.get_uri_args()
local imei = args["m"]
local aa = ngx.md5(imei)
local webpath = "/home/www/lua/static/"
local path = ""
for i=1,6,2
do
   path = path..string.sub(aa,i,i+1).."/"
end
path = webpath..path
local filename = string.sub(aa,6)..".html"
if file_exists(path..filename) then
  ngx.say("1")
  ngx.exit(200)
end

os.execute("mkdir -p "..path)
local file = io.open(path..filename,"w");
file:close();
ngx.say(0)
