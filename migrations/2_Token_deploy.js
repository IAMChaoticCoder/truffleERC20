const ERC20 = artifacts.require("ERC20");

const settings = {
    name: "Woofcoin",
    symbol: "WOOF"
}

const minting = {
    _account: "0x856D4a93B4294783fA204f0106e55cDD178B30b1",    // accounts[1],
    _amount: 100
}


module.exports = function (deployer, network, accounts) { 
   // const contractAddr = accounts[0];
    deployer.deploy(ERC20, settings.name, settings.symbol).then(function (instance) {
        //  contract expects  (string memory name, string memory symbol) public 
        //mint 100 tokens to address
        //function mint(address _account, uint256 _amount) public onlyOwner 
        instance.mint(minting._account, minting._amount).then(function () {
                    
                console.log("Tokens successfully minted. " + minting._account +" has been minted " + minting._amount + " " + settings.name );
                    
            }).catch(function(err){

                console.log("error: " +err);
            });
    }).catch(function(err){
        console.log("Deploy Failed " + err);
    });

};
