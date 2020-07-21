const MyToken = artifacts.require("MyToken");
const assert = require('assert');

contract("MyToken", function (){
    //コインベースのアカウントに100億トークン入ったか確認
    it("accounts[0] own 10000000000 MOC", async function(){
        var instance = await MyToken.deployed();
        return instance.balanceOf("0xcf55542d580f40cA9218101846EF1427f50dB58b").then((balance) => {
            assert.equal(balance, 10000000000, "accounts[0] not have 10000000000 MOC");
        });
    });
    //他のアドレスはトークンを保持していないか
    it("accounts[1] own 0 MOC", async function(){
        var instance = await MyToken.deployed();
        return instance.balanceOf("0x8a738D6e0Bea8310CeD3222203615A5203b97087").then((balance) => {
            assert.equal(balance, 0, "0x8a738D6e0Bea8310CeD3222203615A5203b97087 not have MOC");
        });
    });
})