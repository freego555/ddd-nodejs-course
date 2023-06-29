({
  async addArea({ name }) {
    console.log({ method: 'messenger.addArea', name });
    return { status: 'ok' };
  },

  async changeArea({ areaId, name }) {
    console.log({ method: 'messenger.changeArea', areaId, name });
    return { status: 'ok' };
  },

  async deleteArea({ areaId }) {
    console.log({ method: 'messenger.deleteArea', areaId });
    return { status: 'ok' };
  },

  async addAccountToArea({ accountId, areaId }) {
    console.log({ method: 'messenger.addAccountToArea', accountId, areaId });
    return { status: 'ok' };
  },

  async deleteAccountFromArea({ accountId, areaId }) {
    console.log({
      method: 'messenger.deleteAccountFromArea',
      accountId,
      areaId
    });
    return { status: 'ok' };
  },

  async sendMessage({ areaId, text }) {
    console.log({ method: 'messenger.sendMessage', areaId, text });
    return { status: 'ok' };
  },
});
