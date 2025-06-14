-- Yazi 初始化配置文件
-- 位置: ~/.config/yazi/init.lua

-- 自定义 linemode: 显示 yyyy-MM-dd HH:mm:ss 格式的修改时间
function Linemode:custom_mtime()
    local time = math.floor(self._file.cha.mtime or 0)
    if time == 0 then
        return ui.Line("")
    end

    -- 格式化时间为 yyyy-MM-dd HH:mm:ss
    local formatted_time = os.date("%Y-%m-%d %H:%M:%S", time)
    return ui.Line(formatted_time)
end

-- 可选：同时显示文件大小和自定义时间格式
function Linemode:size_and_mtime()
    local time = math.floor(self._file.cha.mtime or 0)
    local time_str = ""
    if time > 0 then
        time_str = os.date("%Y-%m-%d %H:%M:%S", time)
    end

    local size = self._file:size()
    local size_str = size and ya.readable_size(size) or "-"

    return ui.Line(string.format("%s %s", size_str, time_str))
end
