import "@typespec/http";
import "../models.tsp";
import "../namespace.tsp";

using Http;

namespace SlockService;

model MeResponse extends OkResponse {
  user: User;
}

@get
@route("/me")
@tag("auth")
op me(): MeResponse | UnauthorizedResponse;
