# Used by "mix format"
[
  inputs: ["{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}"],
  import_deps: [:protobuf],
  locals_without_parens: [
    proto_id: 1,
    proto_module: 1
  ]
]
