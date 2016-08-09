# simple-sso
#### 由nginx(openresty) + redis + lua开发的基于token的单点登录，这只是一个中间件，完成单点登录的部分功能：

* 设置跨域访问
* 设置需要验证token的URL
* token有效性检查
* http请求的反向代理

#### 代码结构简要说明：
* sso.conf - sso虚拟主机，需要被nginx主配置包含
* config.lua - 配置redis以及路由校验的例外
* cors.lua - 跨域设置
* auth.lua - 完成请求的token验证

> 注意： token的生成与存储，是在后置服务器中用户注册和登录的接口里
