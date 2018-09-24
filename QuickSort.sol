pragma solidity ^0.4.24;
contract QuickSort {
  mapping(address => uint[]) private mOwnArray;
  event QuickSortComplete(
    address indexed who,
    uint indexed length,
    uint indexed timestamp
  );
  function _getPivot(uint a, uint b, uint c) private pure returns(uint) {
    if(a > b){
      if(b > c){
        return b;
      }else{
        return a > c ? c : a;
      }
    }else{
      if(a > c){
        return a;
      }else{
        return b > c ? c : b;
      }
    }
  }
  function _swap(uint[] a, uint l, uint r) private pure {
    uint t = a[l];
    a[l] = a[r];
    a[r] = t;
  }
  function _quicksort_core(uint[] a, uint left, uint right) private pure {
    if(right <= left){
      return;
    }
    uint l = left;
    uint r = right;
    uint p = _getPivot(a[l], a[l + 1], a[r]);
    while(true){
      while(a[l] < p){
        l++;
      }
      while(p < a[r]){
        r--;
      }
      if(r <= l){
        break;
      }
      _swap(a, l, r);
      l++;
      r--;
    }
    _quicksort_core(a, left, l - 1);
    _quicksort_core(a, r + 1, right);
  }
  function _quicksort(uint[] a) private pure returns(uint[]) {
    _quicksort_core(a, 0, a.length - 1);
    return a;
  }
  function _bytes32ArrayToUintArray(bytes32[] _bytes32Array) private pure returns(uint[]) {
    uint lenIn = _bytes32Array.length;
    uint lenOut = lenIn * 32;
    uint[] memory ret = new uint[](lenOut);
    uint cnt = 0;
    for(uint i = 0; i < lenIn; i++){
      for(uint j = 0; j < 32; j++){
        ret[cnt++] = uint(_bytes32Array[i][j]);
      }
    }
    return ret;
  }
  function _getRandomUintArray(uint len) private view returns(uint[]) {
    uint nowLocal = now;
    address msgSender = msg.sender;
    uint times = 1 + uint(len / 32);
    bytes32[] memory bytes32Array = new bytes32[](times);
    uint i;
    for(i = 0; i < times; i++){
      uint seed = i + 1234567890;
      bytes32Array[i] = keccak256(seed, nowLocal, msgSender);
    }
    uint[] memory buf = _bytes32ArrayToUintArray(bytes32Array);
    uint[] memory ret = new uint[](len);
    for(i = 0; i < len; i++){
      ret[i] = buf[i];
    }
    return ret;
  }
  function getMyArray() external view returns(uint[]) {
    return mOwnArray[msg.sender];
  }
  function setRandom(uint len) external {
    uint[] storage mArray = mOwnArray[msg.sender];
    mArray.length = 0;
    uint[] memory randomUintArray = _getRandomUintArray(len);
    for(uint i = 0; i < len; i++){
      mArray.push(randomUintArray[i]);
    }
  }
  function quicksot() external {
    address msgSender = msg.sender;
    uint[] storage mArray = mOwnArray[msgSender];
    uint len = mArray.length;
    uint[] memory b = new uint[](len);
    uint i;
    for(i = 0; i < len; i++){
      b[i] = mArray[i];
    }
    _quicksort(b);
    for(i = 0; i < len; i++){
      mArray[i] = b[i];
    }
    emit QuickSortComplete(msgSender, len, now);
  }
}