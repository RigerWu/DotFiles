-- lua/plugins/rip-substitute.lua
return {
  "chrisgrieser/nvim-rip-substitute",
  -- 建议添加 event 或 cmd 触发加载
  -- event = "VeryLazy",
  -- cmd = "RipSubstitute",
  keys = {
    -- 将 g/ 映射到 Normal 和 Visual 模式下启动替换
    {
      "g/",
      function()
        require("rip-substitute").sub()
      end,
      mode = { "n", "x" }, -- n=Normal, x=Visual
      desc = "Rip Substitute (区域/文件替换)",
    },
  },
}
