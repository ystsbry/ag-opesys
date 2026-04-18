import { DurableObject } from "cloudflare:workers";
import { Hono } from "hono";
import { createYoga } from "graphql-yoga";
import { staffSchema, ownerSchema } from "./schema";

export class MyDurableObject extends DurableObject {
  async fetch(_request: Request): Promise<Response> {
    return new Response("Hello from Durable Object");
  }
}

type Bindings = {
  MY_DO: DurableObjectNamespace;
};

const app = new Hono<{ Bindings: Bindings }>();

const staffYoga = createYoga({ schema: staffSchema, graphqlEndpoint: "/graphql/staff" });
const ownerYoga = createYoga({ schema: ownerSchema, graphqlEndpoint: "/graphql/owner" });

app.on(["GET", "POST"], "/graphql/staff", async (c) => {
  return staffYoga.handle({ request: c.req.raw, ...c.env });
});

app.on(["GET", "POST"], "/graphql/owner", async (c) => {
  return ownerYoga.handle({ request: c.req.raw, ...c.env });
});

app.get("/health", (c) => {
  return c.json({ status: "ok" });
});

export default app;
