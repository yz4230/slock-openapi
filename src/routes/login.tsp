import "@typespec/http";
import "../models.tsp";
import "../namespace.tsp";

using Http;

namespace SlockService;

model LoginRequest {
  name: string;
  password: string;
}

model LoginResponse extends OkResponse {
  user: User;
  token: string;
}

@post
@route("/login")
@tag("auth")
op login(@body request: LoginRequest): LoginResponse | UnauthorizedResponse;
