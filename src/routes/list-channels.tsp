import "@typespec/http";
import "../models.tsp";
import "../namespace.tsp";

using Http;

namespace SlockService;

model ListChannelsResponse {
  items: Channel[];
}

@get
@route("/list-channels")
@tag("channels")
op listChannels(): ListChannelsResponse;
