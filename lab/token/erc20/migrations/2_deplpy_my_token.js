const MyToken = artifacts.require('./MyToken.sol')

module.exports = (deployer) => {
    const initialSupply = 50000e18

    //パラメーターを渡すとmigrate時にエラーが起きる
    //deployer.deploy(MyToken, initialSupply)
    
    deployer.deploy(MyToken)
}