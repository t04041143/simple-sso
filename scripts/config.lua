--
-- Created by IntelliJ IDEA.
-- User: 04041
-- Date: 2016/7/31
-- Time: 17:56
-- To change this template use File | Settings | File Templates.
--

return {
    ["redis"] = {
        ["host"] = "XX.XX.XX.XX",
        ["port"] = 0000,
        ["password"] = "XXXXXXXXXXXXX",
        ["db"] = 0,
    },
    ["auth"] = {
        ["path"] = {
            ["explicit"] = {},
            ["except"] = {
                ["/api/auth"] = { "POST" },
                ["/api/captcha"] = { "POST" },
                ["^/api/captcha/%d+"] = { "PUT" }
            }
        }
    },
}

