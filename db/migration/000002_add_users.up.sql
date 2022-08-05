CREATE TABLE "users" (
  "username" varchar(256) PRIMARY KEY,
  "hashed_password" varchar(512) NOT NULL,
  "full_name" varchar(256) NOT NULL,
  "email" varchar(256) UNIQUE NOT NULL,
  "password_changed_at" timestamptz NOT NULL DEFAULT '0001-01-01 00:00:00Z',
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

ALTER TABLE "accounts" ADD FOREIGN KEY ("owner") REFERENCES "users" ("username");

-- CREATE UNIQUE INDEX ON "accounts" ("owner", "currency");
ALTER table "accounts" ADD CONSTRAINT "owner_currency_key" UNIQUE ("owner", "currency");
