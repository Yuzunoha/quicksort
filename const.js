/* globals */
let gQuickSort

/* addresses */
const ADDRESS_QUICKSORT = '0x53a660f743a7f95f75cc7f708f850edaa0f04200'

/* ABIs */
const ABI_QUICKSORT = `[
	{
		"constant": false,
		"inputs": [],
		"name": "quicksort",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "who",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "length",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "timestamp",
				"type": "uint256"
			}
		],
		"name": "QuickSortCompleted",
		"type": "event"
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
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "who",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "length",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "timestamp",
				"type": "uint256"
			}
		],
		"name": "SetRandomCompleted",
		"type": "event"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getMyArray",
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
]`