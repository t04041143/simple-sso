---------------------------- 函数声明 ----------------------------

-- 通过头部的token，获取token关联的详细信息
-- 如果没有传，则返回空
function getTokenDetail()
    local tokenObj
    local token = ngx.var.http_authorization;
    if token then
        local red = redis:new()
        local ok, err = red:hgetall('access_token:' .. token)

        if ok[1] then
            tokenObj = ok[1]
        end
    end

    return tokenObj
end

---------------------------- 流程 ----------------------------
local ts = require 'utils'

-- 处理跨域
cors()

-- 清除头部的uid字段，防止伪造
ngx.req.clear_header('uid');

-- 获取token相关的详细信息
local tokenObj = getTokenDetail()

-- 检查uri，确认是否需要授权
--local uri = ngx.var.request_method .. ' ' .. ngx.var.request_uri

-- 如果uri需要授权，那么校验token
if ts.needToAuth(ngx.var.request_uri, ngx.var.request_method) then
    if not tokenObj then
        -- 头部没有token信息
        return ngx.exit(ngx.HTTP_UNAUTHORIZED)
    end
end

-- 通过校验后，如果tokenObj存在，那么设定转发的头部信息
if tokenObj then
    local uid = tokenObj['uid']
    -- 重写uid供服务识别
    ngx.req.set_header("uid", uid)
end