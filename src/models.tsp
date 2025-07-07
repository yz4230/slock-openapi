model WithTimestamp {
  @visibility(Lifecycle.Read)
  createdAt: utcDateTime;

  @visibility(Lifecycle.Read)
  updatedAt: utcDateTime;
}

model User extends WithTimestamp {
  id: string;
  name: string;
  displayName: string;
  email: string;
}

model Channel extends WithTimestamp {
  @visibility(Lifecycle.Read)
  id: string;

  name: string;
  description: string;
  isDirect: boolean;
}

model Message extends WithTimestamp {
  @visibility(Lifecycle.Read)
  id: string;

  userId: string;
  channelId: string;
  threadId?: string;
  content: string;
}
