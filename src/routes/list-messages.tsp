import "@typespec/http";
import "../models.tsp";
import "../namespace.tsp";

using Http;

namespace SlockService;

model ListMessagesResponse {
  items: Message[];
  topCursor?: string;
  bottomCursor?: string;
}

@get
@route("/list-messages")
@tag("messages")
op listMessages(
  @query channelId: string,
  @query threadId?: string,
  @query topCursor?: string,
  @query bottomCursor?: string,
): ListMessagesResponse;
