import { DurableObject } from "cloudflare:workers";
import { Hono } from "hono";
import { createYoga } from "graphql-yoga";
import { schema } from "./schema";

export class MyDurableObject extends DurableObject {
  async fetch(request: Request): Promise<Response> {
    return new Response("Hello from Durable Object");
  }
}

type Bindings = {
  MY_DO: DurableObjectNamespace;
};

const app = new Hono<{ Bindings: Bindings }>();

const yoga = createYoga({ schema });

app.on(["GET", "POST"], "/graphql", async (c) => {
  return yoga.handle(c.req.raw, c.env);
});

app.get("/health", (c) => {
  return c.json({ status: "ok" });
});

export default app;
