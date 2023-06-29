({
  async addCurrency({ name }) {
    console.log({ method: 'portfolio.addCurrency', name });
    return { status: 'ok' };
  },

  async addExchange({ name }) {
    console.log({ method: 'portfolio.addExchange', name });
    return { status: 'ok' };
  },

  async addWallet({ name, exchangeId }) {
    console.log({ method: 'portfolio.addWallet', name, exchangeId });
    return { status: 'ok' };
  },

  async addAsset({ name, currencyId, symbol }) {
    console.log({ method: 'portfolio.addAsset', name, currencyId, symbol });
    return { status: 'ok' };
  },

  async addRate({ timestamp, baseAssetId, quoteAssetId, unit, rate }) {
    console.log({
      method: 'portfolio.addRate',
      timestamp,
      baseAssetId,
      quoteAssetId,
      unit,
      rate,
    });
    return { status: 'ok' };
  },

  async deleteRate({ rateId }) {
    console.log({
      method: 'portfolio.deleteRate',
      rateId,
    });
    return { status: 'ok' };
  },

  async addOperation({
    timestamp,
    type,
    walletId,
    baseAssetId,
    quoteAssetId,
    quantity,
    sum,
  }) {
    console.log({
      method: 'portfolio.addOperation',
      timestamp,
      type,
      walletId,
      baseAssetId,
      quoteAssetId,
      quantity,
      sum,
    });
    return { status: 'ok' };
  },

  async changeOperation({
    operationId,
    walletId,
    baseAssetId,
    quoteAssetId,
    quantity,
    sum,
  }) {
    console.log({
      method: 'portfolio.changeOperation',
      operationId,
      walletId,
      baseAssetId,
      quoteAssetId,
      quantity,
      sum,
    });
    return { status: 'ok' };
  },

  async deleteOperation({ operationId }) {
    console.log({
      method: 'portfolio.deleteOperation',
      operationId,
    });
    return { status: 'ok' };
  },
});
