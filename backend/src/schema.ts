import { createSchema } from "graphql-yoga";

export const staffSchema = createSchema({
  typeDefs: /* GraphQL */ `
    type Query {
      hello: String!
    }
  `,
  resolvers: {
    Query: {
      hello: () => "Hello from Staff GraphQL on Hono + Yoga on Cloudflare Workers",
    },
  },
});

export const ownerSchema = createSchema({
  typeDefs: /* GraphQL */ `
    type Query {
      hello: String!
    }
  `,
  resolvers: {
    Query: {
      hello: () => "Hello from Owner GraphQL on Hono + Yoga on Cloudflare Workers",
    },
  },
});
