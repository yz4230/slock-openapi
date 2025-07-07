import "@typespec/http";
import "../models.tsp";
import "../namespace.tsp";

using Http;

namespace SlockService;

@get
@route("/me")
@tag("auth")
op me(): User;
