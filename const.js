/* addresses */
const ADDRESS_QUICKSORT = '0x752c4b2b237a87b93f45db5c52e40d4de7c781b8';

/* ABIs */
const ABI_QUICKSORT = [
	{
		"constant": false,
		"inputs": [],
		"name": "quicksot",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "len",
				"type": "uint256"
			}
		],
		"name": "setRandom",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getArray",
		"outputs": [
			{
				"name": "",
				"type": "uint256[]"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	}
];