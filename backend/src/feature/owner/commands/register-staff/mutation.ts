import { z } from "zod";
import { builder } from "../../builder";

const RegisterStaffInput = builder.inputType("RegisterStaffInput", {
  fields: (t) => ({
    email: t.string({
      required: true,
      validate: { schema: z.string().email() },
    }),
    name: t.string({
      required: true,
      validate: { schema: z.string().trim().min(1).max(100) },
    }),
  }),
});

builder.mutationField("registerStaff", (t) =>
  t.boolean({
    args: {
      input: t.arg({ type: RegisterStaffInput, required: true }),
    },
    resolve: () => {
      throw new Error("registerStaff is not implemented yet");
    },
  }),
);
