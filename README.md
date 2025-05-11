# SDU Exam Monitor on Linux

**Disclaimer:** I'm just a student at University of Southern Denmark (SDU) and **not** affiliated with [Exam Monitor](https://sdu.exammonitor.dk/).

## Usage

### Prerequisites

- You need to have Nix (the package manager) installed.
- You need to use X11. **Wayland does not work.** On Wayland, it will look like it runs correctly but it can't take screenshots.

### Run

1. Clone the repo.
2. Run `nix develop` in the root folder of the repository.
3. Run `./exam_monitor.sh` in the root folder of the repository.

You should now see the exam monitor program pop up and be able to login. In some cases exam monitor is not able to open the login portal in the browser. In that case the a url is automatically copied to your clipboard, that can be pasted into the browser manually.

### Verify that exam monitor is working

You can verify if exam monitor is working by running exam monitor, logging in and then entering "DEMO" in the "Course" field. Let it run for a while to collect data, maybe copy paste a few things. Then, click on exam monitor on the bottom of the screen and quit the exam. Next, open up the [Exam Monitor](https://sdu.exammonitor.dk/) website. Scroll down a bit and you should see a "login" button. After logging in you should see a list of reports from exams. Press "report" on the newest one and look at the data it has collected. If it looks good then you know its working as intended.

## Thanks

These repos were useful to see the prerequisites for running exam monitor on Linux:

- https://github.com/Sigu0428/linux-helper-SDU-Exam-Monitor
- https://github.com/frederikstroem/SDU-Exam-Monitor-Linux-Install-Helper
