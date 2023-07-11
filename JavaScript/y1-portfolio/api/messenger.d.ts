declare namespace api.messenger {
  function addArea(parameters: { name: string }): Promise<{ status: string }>;
  function changeArea(parameters: {
    areaId: number;
    name: string;
  }): Promise<{ status: string }>;
  function deleteArea(parameters: {
    areaId: number;
  }): Promise<{ status: string }>;
  function addAccountToArea(parameters: {
    accountId: number;
    areaId: number;
  }): Promise<{ status: string }>;
  function deleteAccountFromArea(parameters: {
    accountId: number;
    areaId: number;
  }): Promise<{ status: string }>;
  function sendMessage(parameters: {
    areaId: number;
    text: string;
  }): Promise<{ status: string }>;
}
