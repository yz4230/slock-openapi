import "@typespec/http";

using Http;

@service(#{ title: "Slock Service" })
@useAuth(BearerAuth)
namespace SlockService;

model User {
  id: string;
  name: string;
}

model LoginRequest {
  name: string;
  password: string;
}

model LoginResponse {
  user: User;
  token: string;
}

@post
@route("/login")
op login(@body request: LoginRequest): LoginResponse;

@get
@route("/me")
op me(): User;

model Channel {
  @visibility(Lifecycle.Read)
  id: string;

  name: string;
  description?: string;
  isDirect: boolean;
}

model ListChannelsResponse {
  items: Channel[];
}

@get
@route("/list-channels")
op listChannels(): ListChannelsResponse;

model CreateChannelRequest {
  channel: Create<Channel>;
}

model CreateChannelResponse {
  channel: Channel;
}

@post
@route("/create-channel")
op createChannel(@body request: CreateChannelRequest): CreateChannelResponse;

model Message {
  @visibility(Lifecycle.Read)
  id: string;

  userId: string;
  channelId: string;
  threadId?: string;
  content: string;
}

model ListMessagesResponse {
  items: Message[];
  topCursor?: string;
  bottomCursor?: string;
}

@get
@route("/list-messages")
op listMessages(
  @query channelId: string,
  @query threadId?: string,
  @query topCursor?: string,
  @query bottomCursor?: string,
): ListMessagesResponse;
