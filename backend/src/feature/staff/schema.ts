import { builder } from "./builder";

import "./queries/hello/query";

builder.queryType({});

export const staffSchema = builder.toSchema();
