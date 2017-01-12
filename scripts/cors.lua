function cors()
    if ngx.req.get_method() == "OPTIONS" then
        -- 增加响应头中的跨域设置
        ngx.header["Content-Type"] = 'application/json;charset=utf-8'
        ngx.header["Access-Control-Allow-Origin"] = '*'
        ngx.header["Access-Control-Allow-Methods"] = 'GET, POST, PUT, DELETE, OPTIONS, HEAD'
        ngx.header["Access-Control-Allow-Headers"] = 'content-type'
        return ngx.exit(ngx.HTTP_OK)
    end
end