import { z } from "zod";
import { builder } from "../../builder";

const RegisterStoreInput = builder.inputType("RegisterStoreInput", {
  fields: (t) => ({
    name: t.string({
      required: true,
      validate: { schema: z.string().trim().min(1).max(100) },
    }),
    address: t.string({
      required: true,
      validate: { schema: z.string().trim().min(1).max(200) },
    }),
  }),
});

builder.mutationField("registerStore", (t) =>
  t.boolean({
    args: {
      input: t.arg({ type: RegisterStoreInput, required: true }),
    },
    resolve: () => {
      throw new Error("registerStore is not implemented yet");
    },
  }),
);
