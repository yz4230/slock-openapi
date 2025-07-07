import "@typespec/http";

using Http;

@service(#{ title: "Slock Service" })
@useAuth(BearerAuth)
namespace SlockService;
