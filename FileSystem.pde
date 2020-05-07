void getData()	{
	File f = new File(sketchPath() + "/data/trash.psysna");
	if (!f.exists()) {
		String[] trash = new String[12];
		trash[0] = "0";
		trash[1] = "1";
		trash[2] = "1";
		trash[3] = "1";
		trash[4] = "1";
		trash[5] = "1";
		trash[6] = "1";
		trash[7] = "1";
		trash[8] = "1";
		trash[9] = "1";
		trash[10] = "1";
		trash[11] = "0";
		saveStrings("/data/trash.psysna", trash);
	}
	String[] trash = loadStrings("/data/trash.psysna");
	for(int i=0; i<3; i++)	{
		isVersionLocked[i] = (trash[i].equals("1"))? true: false;
	}
	for(int i=0; i<8; i++)	{
		isColorLocked[i] = (trash[i+3].equals("1"))? true: false;
	}
	hScore = int(trash[11]);
}

void unlockVersion(int v)	{
	isVersionLocked[v] = false;
	saveData();
}

void unlockColor(int c)	{
	isColorLocked[c] = false;
	boolean allUnlocked = true;
	for(int i=0; i<8; i++)	{
		if(isColorLocked[i])	{
			allUnlocked = false;
			break;
		}
	}
	if (allUnlocked) {
		isVersionLocked[2] = false;
		println("yes");
	}
	saveData();
}

void updateHScore(int score)	{
	hScore = score;
	saveData();
}

void saveData()	{
	String[] trash = new String[12];
	for(int i=0; i<3; i++)	{
		trash[i] = (isVersionLocked[i])? "1": "0";
	}
	for(int i=0; i<8; i++)	{
		trash[i+3] = (isColorLocked[i])? "1": "0";
	}
	trash[11] = String.valueOf(hScore);
	saveStrings("/data/trash.psysna", trash);
}