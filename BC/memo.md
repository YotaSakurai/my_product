#関数修飾詞について
*可視性修飾詞
    *private
        コントラクト内の別の関数からのみ呼び出される。
    *internal
        そのコントラクトを継承したコントラクトからも呼び出すことができる。
    *public
        コントラクト内部・外部どちらからでも呼び出すことが出来る。
    *external
        コントラクト外からのみ呼び出すことができる。
*状態修飾詞
    コントラクト外部から呼び出された場合はガスは必要ないが、コントラクト内にある別の関数から呼び出されるとガスが必要になる。
    *view
        関数が動作しても、なんのデータも保存または変更されない。
    *pure
        関数がブロックチェーンにデータを保存しないだけではなく、ブロックチェーンからデータを読み込むこともない事を表して言いる。

まとめてこんなことも可能
'''
function test() external view onlyOwner anotherModifier { /* ... */ }
'''

*payble修飾詞
    この修飾詞を付けると関数でEtherを受け取ることができるようになる。
    '''
    contract OnlineStore {
  function buySomething() external payable {
    // Check to make sure 0.001 ether was sent to the function call:
    require(msg.value == 0.001 ether);
    // If so, some logic to transfer the digital item to the caller of the function:
    transferThing(msg.sender);
  }
}
    '''
    msg.valueはコントラクトにどのくらいEtherが送られたかを見るための方法。
    etherは組込み単位。
*onlyOwner
    公式じゃないが便利なコントラクトなので皆使用しているカスタムの修飾詞

    '''
    /**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address public owner;

  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() public {
    owner = msg.sender;
  }


  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }


  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }

}
    '''