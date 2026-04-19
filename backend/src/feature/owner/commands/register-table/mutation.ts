import { z } from "zod";
import { builder } from "../../builder";

const RegisterTableInput = builder.inputType("RegisterTableInput", {
  fields: (t) => ({
    name: t.string({
      required: true,
      validate: { schema: z.string().trim().min(1).max(50) },
    }),
    capacity: t.int({
      required: true,
      validate: { schema: z.number().int().min(1).max(100) },
    }),
  }),
});

builder.mutationField("registerTable", (t) =>
  t.boolean({
    args: {
      input: t.arg({ type: RegisterTableInput, required: true }),
    },
    resolve: () => {
      throw new Error("registerTable is not implemented yet");
    },
  }),
);
