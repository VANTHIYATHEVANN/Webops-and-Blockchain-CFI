// Function to connect to MetaMask and get provider and signer
async function getProviderAndSigner() {
  // Check if MetaMask is installed
  if (typeof window.ethereum !== 'undefined') {
    // Create a new ethers provider using MetaMask's provider
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    
    try {
      // Request access to the user's MetaMask account
      await window.ethereum.request({ method: 'eth_requestAccounts' });
      
      // Get the signer from the provider (user's MetaMask account)
      const signer = provider.getSigner();
      
      return { provider, signer };
    } catch (err) {
      console.error('Error connecting to MetaMask:', err);
    }
  } else {
    console.error('MetaMask not found. Please install it and try again.');
  }
}

// Function to interact with the smart contract
async function interactWithContract() {
  try {
    // Replace 'YOUR_CONTRACT_ADDRESS' with the actual address of your smart contract
    const contractAddress = 'YOUR_CONTRACT_ADDRESS';
    const contractABI = [
      // Replace with your contract's ABI (JSON format)
      // Example: { "constant": false, "inputs": [{ "name": "_value", "type": "uint256" }], "name": "setValue", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" },
      // { "constant": true, "inputs": [], "name": "getValue", "outputs": [{ "name": "", "type": "uint256", "value": "0" }], "payable": false, "stateMutability": "view", "type": "function" }
    ];

    // Connect to MetaMask and get provider and signer
    const { provider, signer } = await getProviderAndSigner();

    // Create a new ethers contract instance
    const contract = new ethers.Contract(contractAddress, contractABI, signer);

    // Get the input value from the UI
    const inputValue = parseInt(document.getElementById('inputValue').value);

    // Perform the contract function call (e.g., setValue)
    await contract.setValue(inputValue);

    // Display success message
    document.getElementById('output').innerText = `Value set to: ${inputValue}`;
  } catch (error) {
    console.error('Error interacting with the contract:', error);
    document.getElementById('output').innerText = 'Error occurred. Check the console for details.';
  }
}

// Attach the interaction function to the "Set Value" button
document.getElementById('setValueBtn').addEventListener('click', interactWithContract);
