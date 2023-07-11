declare namespace api.portfolio {
  function addCurrency(parameters: {
    name: string;
  }): Promise<{ status: string }>;
  function addExchange(parameters: {
    name: string;
  }): Promise<{ status: string }>;
  function addWallet(parameters: {
    name: string;
    exchangeId: number;
  }): Promise<{ status: string }>;
  function addAsset(parameters: {
    name: string;
    currencyId: number;
    symbol: string;
  }): Promise<{ status: string }>;
  function addRate(parameters: {
    timestamp: string;
    baseAssetId: number;
    quoteAssetId: number;
    unit: number;
    rate: number;
  }): Promise<{ status: string }>;
  function deleteRate(parameters: {
    rateId: number;
  }): Promise<{ status: string }>;
  function addOperation(parameters: {
    timestamp: string;
    type: string;
    walletId: number;
    baseAssetId: number;
    quoteAssetId: number;
    quantity: number;
    sum: number;
  }): Promise<{ status: string }>;
  function changeOperation(parameters: {
    operationId: number;
    walletId: number;
    baseAssetId: number;
    quoteAssetId: number;
    quantity: number;
    sum: number;
  }): Promise<{ status: string }>;
  function deleteOperation(parameters: {
    operationId: number;
  }): Promise<{ status: string }>;
}
