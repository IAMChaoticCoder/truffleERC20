const ERC20 = artifacts.require("ERC20");

module.exports = function (deployer) { //deployer, network, accounts
    deployer.deploy(ERC20("Woofcoin","WOOF")).then(function (instance) {
        //  contract expects  (string memory name, string memory symbol) public 
        //mint 100 tokens to address
        //function mint(address _account, uint256 _amount) public onlyOwner 
        instance.mint(0xD67B25cC1b0b4e7287d363D7825c96A48653de88, 100).then(function () {
                    
                console.log("Tokens successfully minted. - You are on your way.");
                    
            }).catch(function(err){

                console.log("error: " +err);
            });
    }).catch(function(err){
        console.log("Deploy Failed " + err);
    });

};
