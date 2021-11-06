%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["lib/"]
      },
      checks: [
        {Credo.Check.Readability.ModuleNames, files: %{excluded: ["lib/futu/protobuf/"]}},
        {Credo.Check.Warning.IoInspect, files: %{excluded: ["lib/mix/"]}}
      ]
    }
  ]
}
