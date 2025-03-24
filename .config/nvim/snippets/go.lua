-- These are automatically available once loaded, but setting them
-- again explicitly prevents diagnostic warnings while editing
-- this file.
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s(
    {
      trig = "plancheck",
      name = "Config Plan Check",
      desc = "Insert a ConfigPlanCheck block for Terraform provider acceptance testing",
    }, {
      t({
        "ConfigPlanChecks: resource.ConfigPlanChecks{",
        "\tPreApply: []plancheck.PlanCheck{",
        "\t\tplancheck.ExpectResourceAction(resourceName, plancheck.ResourceAction",
      }),
      i(1),
      t({
        "),",
        "\t},",
        "},",
      }),
    }),
}
