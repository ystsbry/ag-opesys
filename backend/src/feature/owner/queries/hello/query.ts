import { z } from "zod";
import { builder } from "../../builder";

builder.queryField("hello", (t) =>
  t.string({
    args: {
      name: t.arg.string({
        required: false,
        validate: { schema: z.string().trim().min(1).max(50) },
      }),
    },
    resolve: (_root, { name }) =>
      `Hello${name ? `, ${name}` : ""} from Owner GraphQL on Hono + Yoga`,
  }),
);
