# MATLAB-Arduino Data Acquisition and Signal Processing

##  Project Overview
This project demonstrates a "Hardware-in-the-Loop" setup using MATLAB and an Arduino. It captures real-time analog voltage data from a Light Dependent Resistor (LDR), calculates the actual sampling frequency, and performs digital signal processing (DSP) to analyze the frequency components of the captured signal using a Fast Fourier Transform (FFT).

##  Features
* **Real-Time Data Acquisition:** Interfaces MATLAB directly with Arduino over USB to log sensor data.
* **Hardware Control:** Actively controls external hardware (LEDs) based on the measurement state.
* **Dynamic Sampling Calculation:** Automatically calculates the true sampling frequency ($f_s$) based on execution time and sample count.
* **Time-Domain Analysis:** Plots the raw voltage signal over time.
* **Frequency-Domain Analysis:** Computes and plots a Frequency Spectrum (FFT)

##  Hardware Requirements
* Arduino (Uno, Mega, Nano, etc.)
* 1x Light Dependent Resistor (LDR)
* 1x Pull-down/Pull-up Resistor (e.g., 10kΩ) for the LDR voltage divider
* 2x LEDs (with appropriate current-limiting resistors)
* Jumper wires & Breadboard

##  Circuit Setup
1. **Sensor:** Connect the LDR voltage divider output to Arduino Analog Pin **A0**.
2. **Indicators:** Connect the two LEDs to Digital Pins **D5** and **D7**.
3. **Power:** Ensure the circuit shares a common Ground (GND) with the Arduino.


##  Results
Once the measurement duration (e.g., 20 seconds) is complete, the script outputs two distinct figures:

### 1. The Raw Signal (Time Domain)
This graph shows the raw voltage fluctuations recorded by the LDR over the measurement period.


### 2. The Frequency Spectrum (Frequency Domain)
This graph utilizes a Fast Fourier Transform to break the raw signal down into its constituent frequencies. The mathematical mirroring (Hermitian Symmetry) has been removed to display a clean, professional single-sided spectrum up to the Nyquist frequency ($f_s / 2$).



## How to Run
1. Connect your Arduino to your computer via USB.
2. Open MATLAB and ensure the Arduino Support Package is installed.
3. Open the script.
4. Click **Run**. The LEDs will illuminate during data capture and turn off automatically when processing begins.
