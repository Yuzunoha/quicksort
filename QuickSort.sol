pragma solidity ^0.4.24;
contract SimpleStore {
  uint[] private mArray;
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
  function getArray() external view returns(uint[]) {
    return mArray;
  }
  function setRandom(uint len) external {
    mArray.length = 0;
    for(uint i = 0; i < len; i++){
      uint n = len - 1 - i;
      mArray.push(n);
    }
  }
  function quicksot() external {
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
  }
}