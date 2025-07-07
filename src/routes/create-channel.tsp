import "@typespec/http";
import "../models.tsp";
import "../namespace.tsp";

using Http;

namespace SlockService;

model CreateChannelRequest {
  channel: Create<Channel>;
}

model CreateChannelResponse {
  channel: Channel;
}

@post
@route("/create-channel")
@tag("channels")
op createChannel(@body request: CreateChannelRequest): CreateChannelResponse;
