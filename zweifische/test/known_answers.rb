# source: https://www.schneier.com/code/ecb_ival.txt

ENC_TABLE_256 = [
	{
		KEY: "0000000000000000000000000000000000000000000000000000000000000000",
		PT: "00000000000000000000000000000000",
		CT: "57FF739D4DC92C1BD7FC01700CC8216F"
	},
	{
		KEY: "0000000000000000000000000000000000000000000000000000000000000000",
		PT: "57FF739D4DC92C1BD7FC01700CC8216F",
		CT: "D43BB7556EA32E46F2A282B7D45B4E0D"
	},
	{
		KEY: "57FF739D4DC92C1BD7FC01700CC8216F00000000000000000000000000000000",
		PT: "D43BB7556EA32E46F2A282B7D45B4E0D",
		CT: "90AFE91BB288544F2C32DC239B2635E6"
	},
	{
		KEY: "D43BB7556EA32E46F2A282B7D45B4E0D57FF739D4DC92C1BD7FC01700CC8216F",
		PT: "90AFE91BB288544F2C32DC239B2635E6",
		CT: "6CB4561C40BF0A9705931CB6D408E7FA"
	},
	{
		KEY: "90AFE91BB288544F2C32DC239B2635E6D43BB7556EA32E46F2A282B7D45B4E0D",
		PT: "6CB4561C40BF0A9705931CB6D408E7FA",
		CT: "3059D6D61753B958D92F4781C8640E58"
	},
	{
		KEY: "6CB4561C40BF0A9705931CB6D408E7FA90AFE91BB288544F2C32DC239B2635E6",
		PT: "3059D6D61753B958D92F4781C8640E58",
		CT: "E69465770505D7F80EF68CA38AB3A3D6"
	},
	{
		KEY: "3059D6D61753B958D92F4781C8640E586CB4561C40BF0A9705931CB6D408E7FA",
		PT: "E69465770505D7F80EF68CA38AB3A3D6",
		CT: "5AB67A5F8539A4A5FD9F0373BA463466"
	},
	{
		KEY: "E69465770505D7F80EF68CA38AB3A3D63059D6D61753B958D92F4781C8640E58",
		PT: "5AB67A5F8539A4A5FD9F0373BA463466",
		CT: "DC096BCD99FC72F79936D4C748E75AF7"
	},
	{
		KEY: "5AB67A5F8539A4A5FD9F0373BA463466E69465770505D7F80EF68CA38AB3A3D6",
		PT: "DC096BCD99FC72F79936D4C748E75AF7",
		CT: "C5A3E7CEE0F1B7260528A68FB4EA05F2"
	},
	{
		KEY: "DC096BCD99FC72F79936D4C748E75AF75AB67A5F8539A4A5FD9F0373BA463466",
		PT: "C5A3E7CEE0F1B7260528A68FB4EA05F2",
		CT: "43D5CEC327B24AB90AD34A79D0469151"
	}
]