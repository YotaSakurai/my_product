var MyToken = artifacts.require("./MyToken.sol");
// テストの宣言
contract('TestToken', function(accounts) {
// 最初のアカウントに1000 TestTokenが保持されていることをテスト
it("should put 1000 TestToken in the first account", function(){
  return MyToken.deployed().then(function(instance){
    return instance.balanceOf.call(accounts[0]);
  }).then(function(balance){
    assert.equal(balance.valueOf(), 1000, "1000 wasn't in the first account");
  });
 })
})