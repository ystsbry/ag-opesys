import { neon, neonConfig } from "@neondatabase/serverless";
import { drizzle } from "drizzle-orm/neon-http";
import * as schema from "./schema";

export function createDb(databaseUrl: string, neonProxyUrl?: string) {
  if (neonProxyUrl) {
    neonConfig.fetchEndpoint = neonProxyUrl;
  }

  const client = neon(databaseUrl);
  return drizzle(client, { schema });
}

export type Database = ReturnType<typeof createDb>;
