interface Role {
  name: string;
  roleId?: string;
}

interface Account {
  login: string;
  password: string;
  rolesId: string[];
  accountId?: string;
}

interface Area {
  name: string;
  ownerId: string;
  membersId: string[];
  areaId?: string;
}

interface Message {
  areaId: string;
  fromId: string;
  text: string;
  messageId?: string;
}

interface Session {
  accountId: string;
  token: string;
  ip: string;
  data: string;
  sessionId?: string;
}

interface Currency {
  name: string;
  currencyId?: string;
}

interface Exchange {
  name: string;
  exchangeId?: string;
}

interface Wallet {
  exchangeId: string;
  name: string;
  walletId?: string;
}

interface Asset {
  currencyId: string;
  name: string;
  symbol: string;
  assetId?: string;
}

interface Rate {
  timestamp: string;
  baseAssetId: string;
  quoteAssetId: string;
  unit: number;
  rate: number;
  rateId?: string;
}

interface Operation {
  timestamp: string;
  type: 'buy' | 'sell';
  walletId: string;
  baseAssetId: string;
  quoteAssetId: string;
  quantity: number;
  sum: number;
  operationId?: string;
}
