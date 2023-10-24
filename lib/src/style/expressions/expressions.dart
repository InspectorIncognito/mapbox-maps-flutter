part of mapbox_maps_flutter;

class Expressions {
  /// Binds expressions to named variables, which can then be referenced in
  /// the result expression using ["var", "variable_name"].
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const let = "let";

  /// References variable bound using "let".
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const varExpression = "var";

  /// Provides a literal array or object value.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const literal = "literal";

  /// Asserts that the input is an array (optionally with a specific item
  /// type and length).  If, when the input expression is evaluated, it is
  /// not of the asserted type, then this assertion will cause the whole
  /// expression to be aborted.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const array = "array";

  /// Retrieves an item from an array.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const at = "at";

  /// Determines whether an item exists in an array or a substring exists in
  /// a string.
  ///
  /// Sdk Support:
  ///   basic functionality with js
  static const inExpression = "in";

  /// Selects the first output whose corresponding test condition evaluates
  /// to true, or the fallback value otherwise.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const caseExpression = "case";

  /// Selects the output whose label value matches the input value, or the
  /// fallback value if no match is found. The input can be any expression
  /// (e.g. `["get", "building_type"]`). Each label must be either:
  /// * a single literal value; or
  /// * an array of literal values, whose values must be all strings or all
  /// numbers (e.g. `[100, 101]` or `["c", "b"]`). The input matches if any
  /// of the values in the array matches, similar to the `"in"`
  /// operator.Each label must be unique. If the input type does not match
  /// the type of the labels, the result will be the fallback value.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const match = "match";

  /// Evaluates each expression in turn until the first non-null value is
  /// obtained, and returns that value.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const coalesce = "coalesce";

  /// Produces discrete, stepped results by evaluating a piecewise-constant
  /// function defined by pairs of input and output values ("stops"). The
  /// `input` may be any numeric expression (e.g., `["get", "population"]`).
  /// Stop inputs must be numeric literals in strictly ascending order.
  /// Returns the output value of the stop just less than the input, or the
  /// first output if the input is less than the first stop.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const step = "step";

  /// Produces continuous, smooth results by interpolating between pairs of
  /// input and output values ("stops"). The `input` may be any numeric
  /// expression (e.g., `["get", "population"]`). Stop inputs must be
  /// numeric literals in strictly ascending order. The output type must be
  /// `number`, `array<number>`, or `color`.Interpolation types:-
  /// `["linear"]`: interpolates linearly between the pair of stops just
  /// less than and just greater than the input.- `["exponential", base]`:
  /// interpolates exponentially between the stops just less than and just
  /// greater than the input. `base` controls the rate at which the output
  /// increases: higher values make the output increase more towards the
  /// high end of the range. With values close to 1 the output increases
  /// linearly.- `["cubic-bezier", x1, y1, x2, y2]`: interpolates using the
  /// cubic bezier curve defined by the given control points.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const interpolate = "interpolate";

  /// Produces continuous, smooth results by interpolating between pairs of
  /// input and output values ("stops"). Works like `interpolate`, but the
  /// output type must be `color`, and the interpolation is performed in the
  /// Hue-Chroma-Luminance color space.
  ///
  /// Sdk Support:
  ///   basic functionality with js
  static const interpolateHcl = "interpolate-hcl";

  /// Produces continuous, smooth results by interpolating between pairs of
  /// input and output values ("stops"). Works like `interpolate`, but the
  /// output type must be `color`, and the interpolation is performed in the
  /// CIELAB color space.
  ///
  /// Sdk Support:
  ///   basic functionality with js
  static const interpolateLab = "interpolate-lab";

  /// Returns mathematical constant ln(2).
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const ln2 = "ln2";

  /// Returns the mathematical constant pi.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const pi = "pi";

  /// Returns the mathematical constant e.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const e = "e";

  /// Returns a string describing the type of the given value.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const typeof = "typeof";

  /// Asserts that the input value is a string. If multiple values are
  /// provided, each one is evaluated in order until a string is obtained.
  /// If none of the inputs are strings, the expression is an error.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const string = "string";

  /// Asserts that the input value is a number. If multiple values are
  /// provided, each one is evaluated in order until a number is obtained.
  /// If none of the inputs are numbers, the expression is an error.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const number = "number";

  /// Asserts that the input value is a boolean. If multiple values are
  /// provided, each one is evaluated in order until a boolean is obtained.
  /// If none of the inputs are booleans, the expression is an error.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const boolean = "boolean";

  /// Asserts that the input value is an object. If multiple values are
  /// provided, each one is evaluated in order until an object is obtained.
  /// If none of the inputs are objects, the expression is an error.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const object = "object";

  /// Returns a `collator` for use in locale-dependent comparison
  /// operations. The `case-sensitive` and `diacritic-sensitive` options
  /// default to `false`. The `locale` argument specifies the IETF language
  /// tag of the locale to use. If none is provided, the default locale is
  /// used. If the requested locale is not available, the `collator` will
  /// use a system-defined fallback locale. Use `resolved-locale` to test
  /// the results of locale fallback behavior.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const collator = "collator";

  /// Returns `formatted` text containing annotations for use in
  /// mixed-format `text-field` entries. For a `text-field` entries of a
  /// string type, following option object's properties are supported: If
  /// set, the `text-font` value overrides the font specified by the root
  /// layout properties. If set, the `font-scale` value specifies a scaling
  /// factor relative to the `text-size` specified in the root layout
  /// properties. If set, the `text-color` value overrides the color
  /// specified by the root paint properties for this layer.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const format = "format";

  /// Returns an `image` type for use in `icon-image`, `*-pattern` entries
  /// and as a section in the `format` expression. If set, the `image`
  /// argument will check that the requested image exists in the style and
  /// will return either the resolved image name or `null`, depending on
  /// whether or not the image is currently in the style. This validation
  /// process is synchronous and requires the image to have been added to
  /// the style before requesting it in the `image` argument.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios
  static const image = "image";

  /// Converts the input number into a string representation using the
  /// providing formatting rules. If set, the `locale` argument specifies
  /// the locale to use, as a BCP 47 language tag. If set, the `currency`
  /// argument specifies an ISO 4217 code to use for currency-style
  /// formatting. If set, the `min-fraction-digits` and
  /// `max-fraction-digits` arguments specify the minimum and maximum number
  /// of fractional digits to include.
  ///
  /// Sdk Support:
  ///   basic functionality with js
  static const numberFormat = "number-format";

  /// Converts the input value to a string. If the input is `null`, the
  /// result is `""`. If the input is a boolean, the result is `"true"` or
  /// `"false"`. If the input is a number, it is converted to a string as
  /// specified by the ["NumberToString"
  /// algorithm](https://tc39.github.io/ecma262/#sec-tostring-applied-to-the-number-type)
  /// of the ECMAScript Language Specification. If the input is a color, it
  /// is converted to a string of the form `"rgba(r,g,b,a)"`, where `r`,
  /// `g`, and `b` are numerals ranging from 0 to 255, and `a` ranges from 0
  /// to 1. Otherwise, the input is converted to a string in the format
  /// specified by the
  /// [`JSON.stringify`](https://tc39.github.io/ecma262/#sec-json.stringify)
  /// function of the ECMAScript Language Specification.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const toStringExpression = "to-string";

  /// Converts the input value to a number, if possible. If the input is
  /// `null` or `false`, the result is 0. If the input is `true`, the result
  /// is 1. If the input is a string, it is converted to a number as
  /// specified by the ["ToNumber Applied to the String Type"
  /// algorithm](https://tc39.github.io/ecma262/#sec-tonumber-applied-to-the-string-type)
  /// of the ECMAScript Language Specification. If multiple values are
  /// provided, each one is evaluated in order until the first successful
  /// conversion is obtained. If none of the inputs can be converted, the
  /// expression is an error.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const toNumber = "to-number";

  /// Converts the input value to a boolean. The result is `false` when then
  /// input is an empty string, 0, `false`, `null`, or `NaN`; otherwise it
  /// is `true`.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const toBoolean = "to-boolean";

  /// Returns a four-element array containing the input color's red, green,
  /// blue, and alpha components, in that order.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const toRgba = "to-rgba";

  /// Converts the input value to a color. If multiple values are provided,
  /// each one is evaluated in order until the first successful conversion
  /// is obtained. If none of the inputs can be converted, the expression is
  /// an error.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const toColor = "to-color";

  /// Creates a color value from red, green, and blue components, which must
  /// range between 0 and 255, and an alpha component of 1. If any component
  /// is out of range, the expression is an error.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const rgb = "rgb";

  /// Creates a color value from red, green, blue components, which must
  /// range between 0 and 255, and an alpha component which must range
  /// between 0 and 1. If any component is out of range, the expression is
  /// an error.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const rgba = "rgba";

  /// Retrieves a property value from the current feature's properties, or
  /// from another object if a second argument is provided. Returns null if
  /// the requested property is missing.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const get = "get";

  /// Tests for the presence of an property value in the current feature's
  /// properties, or from another object if a second argument is provided.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const has = "has";

  /// Gets the length of an array or string.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const length = "length";

  /// Gets the feature properties object.  Note that in some cases, it may
  /// be more efficient to use ["get", "property_name"] directly.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const properties = "properties";

  /// Retrieves a property value from the current feature's state. Returns
  /// null if the requested property is not present on the feature's state.
  /// A feature's state is not part of the GeoJSON or vector tile data, and
  /// must be set programmatically on each feature. Features are identified
  /// by their `id` attribute, which must be an integer or a string that can
  /// be cast to an integer. Note that ["feature-state"] can only be used
  /// with paint properties that support data-driven styling.
  ///
  /// Sdk Support:
  ///   basic functionality with js
  static const featureState = "feature-state";

  /// Gets the feature's geometry type: Point, MultiPoint, LineString,
  /// MultiLineString, Polygon, MultiPolygon.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const geometryType = "geometry-type";

  /// Gets the feature's id, if it has one.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const id = "id";

  /// Gets the current zoom level.  Note that in style layout and paint
  /// properties, ["zoom"] may only appear as the input to a top-level
  /// "step" or "interpolate" expression.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const zoom = "zoom";

  /// Gets the kernel density estimation of a pixel in a heatmap layer,
  /// which is a relative measure of how many data points are crowded around
  /// a particular pixel. Can only be used in the `heatmap-color` property.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const heatmapDensity = "heatmap-density";

  /// Gets the progress along a gradient line. Can only be used in the
  /// `line-gradient` property.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const lineProgress = "line-progress";

  /// Gets the value of a cluster property accumulated so far. Can only be
  /// used in the `clusterProperties` option of a clustered GeoJSON source.
  ///
  /// Sdk Support:
  ///   basic functionality with js
  static const accumulated = "accumulated";

  /// Returns the sum of the inputs.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const plus = "+";

  /// Returns the product of the inputs.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const multiply = "*";

  /// For two inputs, returns the result of subtracting the second input
  /// from the first. For a single input, returns the result of subtracting
  /// it from 0.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const minus = "-";

  /// Returns the result of floating point division of the first input by
  /// the second.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const divide = "/";

  /// Returns the remainder after integer division of the first input by the
  /// second.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const precent = "%";

  /// Returns the result of raising the first input to the power specified
  /// by the second.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const xor = "^";

  /// Returns the square root of the input.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const sqrt = "sqrt";

  /// Returns the base-ten logarithm of the input.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const log10 = "log10";

  /// Returns the natural logarithm of the input.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const ln = "ln";

  /// Returns the base-two logarithm of the input.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const log2 = "log2";

  /// Returns the sine of the input.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const sin = "sin";

  /// Returns the cosine of the input.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const cos = "cos";

  /// Returns the tangent of the input.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const tan = "tan";

  /// Returns the arcsine of the input.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const asin = "asin";

  /// Returns the arccosine of the input.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const acos = "acos";

  /// Returns the arctangent of the input.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const atan = "atan";

  /// Returns the minimum value of the inputs.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const min = "min";

  /// Returns the maximum value of the inputs.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const max = "max";

  /// Rounds the input to the nearest integer. Halfway values are rounded
  /// away from zero. For example, `["round", -1.5]` evaluates to -2.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const round = "round";

  /// Returns the absolute value of the input.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const abs = "abs";

  /// Returns the smallest integer that is greater than or equal to the
  /// input.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const ceil = "ceil";

  /// Returns the largest integer that is less than or equal to the input.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const floor = "floor";

  /// Returns `true` if the input values are equal, `false` otherwise. The
  /// comparison is strictly typed: values of different runtime types are
  /// always considered unequal. Cases where the types are known to be
  /// different at parse time are considered invalid and will produce a
  /// parse error. Accepts an optional `collator` argument to control
  /// locale-dependent string comparisons.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const equal = "==";

  /// Returns `true` if the input values are not equal, `false` otherwise.
  /// The comparison is strictly typed: values of different runtime types
  /// are always considered unequal. Cases where the types are known to be
  /// different at parse time are considered invalid and will produce a
  /// parse error. Accepts an optional `collator` argument to control
  /// locale-dependent string comparisons.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const notEqual = "!=";

  /// Returns `true` if the first input is strictly greater than the second,
  /// `false` otherwise. The arguments are required to be either both
  /// strings or both numbers; if during evaluation they are not, expression
  /// evaluation produces an error. Cases where this constraint is known not
  /// to hold at parse time are considered in valid and will produce a parse
  /// error. Accepts an optional `collator` argument to control
  /// locale-dependent string comparisons.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const larger = ">";

  /// Returns `true` if the first input is strictly less than the second,
  /// `false` otherwise. The arguments are required to be either both
  /// strings or both numbers; if during evaluation they are not, expression
  /// evaluation produces an error. Cases where this constraint is known not
  /// to hold at parse time are considered in valid and will produce a parse
  /// error. Accepts an optional `collator` argument to control
  /// locale-dependent string comparisons.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const smaller = "<";

  /// Returns `true` if the first input is greater than or equal to the
  /// second, `false` otherwise. The arguments are required to be either
  /// both strings or both numbers; if during evaluation they are not,
  /// expression evaluation produces an error. Cases where this constraint
  /// is known not to hold at parse time are considered in valid and will
  /// produce a parse error. Accepts an optional `collator` argument to
  /// control locale-dependent string comparisons.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const largerOrEqual = ">=";

  /// Returns `true` if the first input is less than or equal to the second,
  /// `false` otherwise. The arguments are required to be either both
  /// strings or both numbers; if during evaluation they are not, expression
  /// evaluation produces an error. Cases where this constraint is known not
  /// to hold at parse time are considered in valid and will produce a parse
  /// error. Accepts an optional `collator` argument to control
  /// locale-dependent string comparisons.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const smallerOrEqual = "<=";

  /// Returns `true` if all the inputs are `true`, `false` otherwise. The
  /// inputs are evaluated in order, and evaluation is short-circuiting:
  /// once an input expression evaluates to `false`, the result is `false`
  /// and no further input expressions are evaluated.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const all = "all";

  /// Returns `true` if any of the inputs are `true`, `false` otherwise. The
  /// inputs are evaluated in order, and evaluation is short-circuiting:
  /// once an input expression evaluates to `true`, the result is `true` and
  /// no further input expressions are evaluated.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const any = "any";

  /// Logical negation. Returns `true` if the input is `false`, and `false`
  /// if the input is `true`.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const not = "!";

  /// Returns `true` if the input string is expected to render legibly.
  /// Returns `false` if the input string contains sections that cannot be
  /// rendered without potential loss of meaning (e.g. Indic scripts that
  /// require complex text shaping, or right-to-left scripts if the the
  /// `mapbox-gl-rtl-text` plugin is not in use in Mapbox GL JS).
  ///
  /// Sdk Support:
  ///   basic functionality with js, android
  static const isSupportedScript = "is-supported-script";

  /// Returns the input string converted to uppercase. Follows the Unicode
  /// Default Case Conversion algorithm and the locale-insensitive case
  /// mappings in the Unicode Character Database.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const upcase = "upcase";

  /// Returns the input string converted to lowercase. Follows the Unicode
  /// Default Case Conversion algorithm and the locale-insensitive case
  /// mappings in the Unicode Character Database.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const downcase = "downcase";

  /// Returns a `string` consisting of the concatenation of the inputs. Each
  /// input is converted to a string as if by `to-string`.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const concat = "concat";

  /// Returns the IETF language tag of the locale being used by the provided
  /// `collator`. This can be used to determine the default system locale,
  /// or to determine if a requested locale was successfully loaded.
  ///
  /// Sdk Support:
  ///   basic functionality with js, android, ios, macos
  static const resolvedLocale = "resolved-locale";
}