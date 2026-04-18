import { createClient, fetchExchange } from "@urql/core";

const endpoint =
  import.meta.env.VITE_GRAPHQL_ENDPOINT ?? "https://api.local.ag-opesys.dev/graphql/owner";

export const urqlClient = createClient({
  url: endpoint,
  exchanges: [fetchExchange],
});
