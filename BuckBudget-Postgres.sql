CREATE TABLE "transactions" (
  "transaction_id" BIGSERIAL PRIMARY KEY,
  "account_id" bigint,
  "category_id" bigint,
  "transaction_type" varchar NOT NULL,
  "date" timestamptz NOT NULL,
  "amount" bigint NOT NULL,
  "merchant" varchar,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "accounts" (
  "account_id" BIGSERIAL PRIMARY KEY,
  "username" varchar NOT NULL,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "categories" (
  "category_id" BIGSERIAL PRIMARY KEY,
  "title" varchar NOT NULL,
  "planned" bigint,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "transactions" ("account_id");

CREATE INDEX ON "transactions" ("category_id");

COMMENT ON COLUMN "transactions"."transaction_type" IS 'debit or credit';

ALTER TABLE "transactions" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("account_id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("category_id");
