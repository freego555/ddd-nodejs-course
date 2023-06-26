CREATE TABLE "Role" (
  "roleId" bigint generated always as identity,
  "name" varchar NOT NULL
);

ALTER TABLE "Role" ADD CONSTRAINT "pkRole" PRIMARY KEY ("roleId");
CREATE UNIQUE INDEX "akRoleName" ON "Role" ("name");

CREATE TABLE "Account" (
  "accountId" bigint generated always as identity,
  "login" varchar(64) NOT NULL,
  "password" varchar NOT NULL
);

ALTER TABLE "Account" ADD CONSTRAINT "pkAccount" PRIMARY KEY ("accountId");
CREATE UNIQUE INDEX "akAccountLogin" ON "Account" ("login");

CREATE TABLE "AccountRole" (
  "accountId" bigint NOT NULL,
  "roleId" bigint NOT NULL
);

ALTER TABLE "AccountRole" ADD CONSTRAINT "pkAccountRole" PRIMARY KEY ("accountId", "roleId");
ALTER TABLE "AccountRole" ADD CONSTRAINT "fkAccountRoleAccount" FOREIGN KEY ("accountId") REFERENCES "Account" ("accountId") ON DELETE CASCADE;
ALTER TABLE "AccountRole" ADD CONSTRAINT "fkAccountRoleRole" FOREIGN KEY ("roleId") REFERENCES "Role" ("roleId") ON DELETE CASCADE;

CREATE TABLE "Area" (
  "areaId" bigint generated always as identity,
  "name" varchar NOT NULL,
  "ownerId" bigint NOT NULL
);

ALTER TABLE "Area" ADD CONSTRAINT "pkArea" PRIMARY KEY ("areaId");
CREATE UNIQUE INDEX "akAreaName" ON "Area" ("name");
ALTER TABLE "Area" ADD CONSTRAINT "fkAreaOwner" FOREIGN KEY ("ownerId") REFERENCES "Account" ("accountId");

CREATE TABLE "AreaAccount" (
  "areaId" bigint NOT NULL,
  "accountId" bigint NOT NULL
);

ALTER TABLE "AreaAccount" ADD CONSTRAINT "pkAreaAccount" PRIMARY KEY ("areaId", "accountId");
ALTER TABLE "AreaAccount" ADD CONSTRAINT "fkAreaAccountArea" FOREIGN KEY ("areaId") REFERENCES "Area" ("areaId") ON DELETE CASCADE;
ALTER TABLE "AreaAccount" ADD CONSTRAINT "fkAreaAccountAccount" FOREIGN KEY ("accountId") REFERENCES "Account" ("accountId") ON DELETE CASCADE;

CREATE TABLE "Message" (
  "messageId" bigint generated always as identity,
  "areaId" bigint NOT NULL,
  "fromId" bigint NOT NULL,
  "text" varchar NOT NULL
);

ALTER TABLE "Message" ADD CONSTRAINT "pkMessage" PRIMARY KEY ("messageId");
ALTER TABLE "Message" ADD CONSTRAINT "fkMessageArea" FOREIGN KEY ("areaId") REFERENCES "Area" ("areaId");
ALTER TABLE "Message" ADD CONSTRAINT "fkMessageFrom" FOREIGN KEY ("fromId") REFERENCES "Account" ("accountId");

CREATE TABLE "Session" (
  "sessionId" bigint generated always as identity,
  "accountId" bigint NOT NULL,
  "token" varchar NOT NULL,
  "ip" inet NOT NULL,
  "data" jsonb NOT NULL
);

ALTER TABLE "Session" ADD CONSTRAINT "pkSession" PRIMARY KEY ("sessionId");
ALTER TABLE "Session" ADD CONSTRAINT "fkSessionAccount" FOREIGN KEY ("accountId") REFERENCES "Account" ("accountId");
CREATE UNIQUE INDEX "akSessionToken" ON "Session" ("token");


-- Portfolio database structure

CREATE TABLE "Currency" (
  "currencyId" bigint generated always as identity,
  "name" varchar(255) NOT NULL
);

ALTER TABLE "Currency" ADD CONSTRAINT "pkCurrency" PRIMARY KEY ("currencyId");
CREATE UNIQUE INDEX "akCurrencyName" ON "Currency" ("name");

CREATE TABLE "Exchange" (
  "exchangeId" bigint generated always as identity,
  "name" varchar(255) NOT NULL
);

ALTER TABLE "Exchange" ADD CONSTRAINT "pkExchange" PRIMARY KEY ("exchangeId");
CREATE UNIQUE INDEX "akExchangeName" ON "Exchange" ("name");

CREATE TABLE "Wallet" (
  "walletId" bigint generated always as identity,
  "exchangeId" bigint NOT NULL,
  "name" varchar(255) NOT NULL
);

ALTER TABLE "Wallet" ADD CONSTRAINT "pkWallet" PRIMARY KEY ("walletId");
ALTER TABLE "Wallet" ADD CONSTRAINT "fkWalletExchange" FOREIGN KEY ("exchangeId") REFERENCES "Exchange" ("exchangeId");
CREATE UNIQUE INDEX "akWalletName" ON "Wallet" ("name");

CREATE TABLE "Asset" (
  "assetId" bigint generated always as identity,
  "currencyId" bigint,
  "name" varchar(255) NOT NULL,
  "symbol" varchar(10)
);

ALTER TABLE "Asset" ADD CONSTRAINT "pkAsset" PRIMARY KEY ("assetId");
ALTER TABLE "Asset" ADD CONSTRAINT "fkAssetCurrency" FOREIGN KEY ("currencyId") REFERENCES "Currency" ("currencyId");
CREATE UNIQUE INDEX "akAssetName" ON "Asset" ("name");
CREATE UNIQUE INDEX "akAssetSymbol" ON "Asset" ("symbol");

CREATE TABLE "Rate" (
  "timestamp" timestamp NOT NULL,
  "baseAssetId" bigint NOT NULL,
  "quoteAssetId" bigint NOT NULL,
  "unit" bigint DEFAULT 1 NOT NULL,
  "rate" numeric NOT NULL
);

ALTER TABLE "Rate" ADD CONSTRAINT "pkRate" PRIMARY KEY ("timestamp", "baseAssetId", "quoteAssetId");
ALTER TABLE "Rate" ADD CONSTRAINT "fkRateBaseAsset" FOREIGN KEY ("baseAssetId") REFERENCES "Asset" ("assetId");
ALTER TABLE "Rate" ADD CONSTRAINT "fkRateQuoteAsset" FOREIGN KEY ("quoteAssetId") REFERENCES "Asset" ("assetId");
ALTER TABLE "Rate" ADD CONSTRAINT "RateUnit_Minimum" CHECK ("unit" >= 1);
ALTER TABLE "Rate" ADD CONSTRAINT "RateRate_Minimum" CHECK ("rate" > 0);

CREATE TYPE "operationType" AS ENUM ('buy', 'sell');
CREATE TABLE "Operation" (
  "operationId" bigint generated always as identity,
  "timestamp" timestamp NOT NULL,
  "type" "operationType" NOT NULL,
  "walletId" bigint NOT NULL,
  "baseAssetId" bigint NOT NULL,
  "quoteAssetId" bigint NOT NULL,
  "quantity" numeric NOT NULL,
  "sum" numeric NOT NULL
);

ALTER TABLE "Operation" ADD CONSTRAINT "pkOperation" PRIMARY KEY ("operationId");
ALTER TABLE "Operation" ADD CONSTRAINT "fkOperationWallet" FOREIGN KEY ("walletId") REFERENCES "Wallet" ("walletId");
ALTER TABLE "Operation" ADD CONSTRAINT "fkOperationBaseAsset" FOREIGN KEY ("baseAssetId") REFERENCES "Asset" ("assetId");
ALTER TABLE "Operation" ADD CONSTRAINT "fkOperationQuoteAsset" FOREIGN KEY ("quoteAssetId") REFERENCES "Asset" ("assetId");
ALTER TABLE "Operation" ADD CONSTRAINT "OperationQuantity_Minimum" CHECK ("quantity" > 0);
ALTER TABLE "Operation" ADD CONSTRAINT "OperationSum_Minimum" CHECK ("sum" >= 0);
