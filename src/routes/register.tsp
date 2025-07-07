import "@typespec/http";
import "../namespace.tsp";
import "../models.tsp";

using Http;

namespace SlockService;

model RegisterRequest {
  name: string;
  displayName: string;
  email: string;
  password: string;
}

model RegisterResponse extends CreatedResponse {
  user: User;
  token: string;
}

model RegisterFailedResponse extends BadRequestResponse {
  message: string;
}

@post
@route("/register")
@tag("auth")
op register(
  @body request: RegisterRequest,
): RegisterResponse | RegisterFailedResponse;
