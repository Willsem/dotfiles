[
    (error_kw)
    (rpc_kw)
    (service_kw)
    (message_kw)
    (const_kw)
    (typed_kw)
    (bus_kw)
    (key_kw)
    (idempotent_kw)
    (module_kw)
    (component_kw)
] @keyword

(dto_name) @type

(rpc_name) @function

(field_name) @property

(const_name) @constant

[
    "{"
    "}"
    "["
    "]"
    "("
    ")"
] @punctuation.bracket

[
    "="
    (optional)
] @operator

[
    (key_type)
    (scalar)
    "map"
] @type.builtin

(int) @number
(string) @string
(comment) @string.special
(non_signed_comment) @comment
(annotation_comment) @comment
(annotation_prefix) @string.special
