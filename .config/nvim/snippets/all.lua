-- These are automatically available once loaded, but setting them
-- again explicitly prevents diagnostic warnings while editing
-- this file.
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("snipdemo", t("loaded!!")),

  s({ trig = "console", name = "Console code block", desc = "Insert a code block with console syntax highlighting" }, {
    t({ "```console", "% " }),
    i(1),
    t({ "", "```" }),
  }),

  s({ trig = "md-details", name = "Details element", dscr = "Insert a details element to show/hide markdown content" }, {
    t({ "<details>", "  <summary>Show/Hide " }),
    i(1),
    t({ "</summary>", "" }),
    i(2),
    t({ "", "</details>" }),
  }),
}
