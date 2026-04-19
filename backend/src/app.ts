import { Hono } from "hono";
import { createYoga } from "graphql-yoga";
import { staffSchema } from "./feature/staff/schema";
import { ownerSchema } from "./feature/owner/schema";

const app = new Hono();

const staffYoga = createYoga({ schema: staffSchema, graphqlEndpoint: "/graphql/staff" });
const ownerYoga = createYoga({ schema: ownerSchema, graphqlEndpoint: "/graphql/owner" });

app.on(["GET", "POST"], "/graphql/staff", (c) => staffYoga.handle(c.req.raw));
app.on(["GET", "POST"], "/graphql/owner", (c) => ownerYoga.handle(c.req.raw));

app.get("/health", (c) => c.json({ status: "ok" }));

export default app;
