import processing.sound.*;

SinOsc[] sines = new SinOsc[4];
float[] sineAmpMax = new float[4];

int currentNote = 0;

void initializeSoundSetup()	{
	sineAmpMax[0] = 0.1;
	sineAmpMax[1] = 0.1;
	sineAmpMax[2] = 0.02;
	sineAmpMax[3] = 0.02;

	sines[0] = new SinOsc(this);
	sines[0].amp(0);
	sines[0].freq(freq[0][currentNote]);
	sines[0].play();

	sines[1] = new SinOsc(this);
	sines[1].amp(sineAmpMax[1]);
	sines[1].freq(freq[1][currentNote]);
	sines[1].play();

	sines[2] = new SinOsc(this);
	sines[2].amp(sineAmpMax[2]);
	sines[2].freq(freq[2][currentNote]);
	sines[2].play();

	sines[3] = new SinOsc(this);
	sines[3].amp(sineAmpMax[3]);
	sines[3].freq(freq[3][currentNote]);
	sines[3].play();
}

void nextFreq()	{
	currentNote++;
	if (currentNote == 12) {
		currentNote = 0;
	}

	float frequency = freq[0][currentNote];
	sines[0].freq(frequency);
	float amp = map(frequency, freq[0][0], freq[0][11], 0, sineAmpMax[0]);
	sines[0].amp(amp);

	frequency = freq[1][currentNote];
	sines[1].freq(frequency);
	amp = map(frequency, freq[1][0], freq[1][11], sineAmpMax[1], sineAmpMax[2]);
	sines[1].amp(amp);

	frequency = freq[2][currentNote];
	sines[2].freq(frequency);
	amp = sineAmpMax[2];
	sines[2].amp(amp);

	frequency = freq[3][currentNote];
	sines[3].freq(frequency);
	amp = map(frequency, freq[3][0], freq[3][11], sineAmpMax[3], 0);
	sines[3].amp(amp);
}

void setPan(float fraction)	{
	if (abs(fraction) < 0.5) {
		for (int i=0; i<sines.length; i++) {
			sines[i].pan(0);
		}	
	}else {
		if (fraction >= 0) {
			for (int i=0; i<sines.length; i++) {
				sines[i].pan(-0.3);
			}	
		}else {
			for (int i=0; i<sines.length; i++) {
				sines[i].pan(0.3);
			}
		}
	}
}