// グローバル変数初期化
function init() {
  // 初期設定実行済判定
  if (null !== quicksort) {
    // 初期設定実行済
    return
  }
  // metamask起動判定
  if (typeof web3 === 'undefined') {
    document.write("Please install MetaMask.")
    return
  }
  // 接続情報取得
  window.web3 = new Web3(web3.currentProvider)
  if (0 === web3.eth.accounts.length) {
    document.write("Please login to your MetaMask!")
    return
  }
  // ネットワーク確認
  var state = web3.currentProvider.publicConfigStore._state
  if ('3' !== state["networkVersion"]) {
    document.write("Please connect the Ropsten Test Network.")
    return
  }
  // コントラクトインスタンス設定
  gQuicSort = window.web3.eth.contract(ABI_QUICKSORT).at(ADDRESS_QUICKSORT)
}