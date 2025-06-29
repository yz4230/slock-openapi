import "@typespec/http";

using Http;

@service(#{ title: "Slock Service" })
@useAuth(BearerAuth)
namespace SlockService;

model User {
  id: string;
  name: string;
  email: string;
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
@tag("auth")
op login(@body request: LoginRequest): LoginResponse;

model RegisterRequest {
  name: string;
  email: string;
  password: string;
}

model RegisterResponse {
  user: User;
  token: string;
}

@post
@route("/register")
@tag("auth")
op register(@body request: RegisterRequest): RegisterResponse;

@get
@route("/me")
@tag("auth")
op me(): User;

model Channel {
  @visibility(Lifecycle.Read)
  id: string;

  name: string;
  description?: string;
  isDirect: boolean;
  createdAt: utcDateTime;
  updatedAt: utcDateTime;
}

model ListChannelsResponse {
  items: Channel[];
}

@get
@route("/list-channels")
@tag("channels")
op listChannels(): ListChannelsResponse;

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

model Message {
  @visibility(Lifecycle.Read)
  id: string;

  userId: string;
  channelId: string;
  threadId?: string;
  content: string;
  createdAt: utcDateTime;
  updatedAt: utcDateTime;
}

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
