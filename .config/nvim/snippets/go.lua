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
    },
    {
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
    }
  ),

  s(
    {
      trig = "impstateid",
      name = "Import State ID Func (Multi-Part Key)",
      desc = "Insert an ImportStateIdFunc for a resource with a multi-part key",
    },
    {
      t({ "func testAcc" }),
      i(1),
      t({
        "ImportStateIdFunc(resourceName string) resource.ImportStateIdFunc {",
        "\treturn func(s *terraform.State) (string, error) {",
        "\t\trs, ok := s.RootModule().Resources[resourceName]",
        "\t\tif !ok {",
        '\t\t\treturn "", fmt.Errorf("Not found: %s", resourceName)',
        "\t\t}",
        "",
        '\t\treturn fmt.Sprintf("%s,%s", rs.Primary.Attributes["',
      }),
      i(2),
      t({
        '"], rs.Primary.Attributes["'
      }),
      i(3),
      t({
        '"]), nil',
        "\t}",
        "}",
      }),
    }
  ),
}
