import "@typespec/http";
import "../namespace.tsp";
import "../models.tsp";

using Http;

namespace SlockService;

@get
@route("/me")
@tag("auth")
op me(): User;
