# SDU Exam Monitor on Linux

This is a tool for running Exam Monitor easily on Linux.

**Disclaimer:** I'm just a student at the University of Southern Denmark (SDU) and **not** affiliated with [Exam Monitor](https://sdu.exammonitor.dk/).

## Usage

### Prerequisites

- You need to have [Nix (the package manager)](https://nixos.org/download/) installed.
- You need to use X11. **Wayland does not work.** On Wayland, it will look like it runs correctly, but it can't take screenshots.

### Run

1. Clone the repo.
2. Run `nix run` in the repository's root folder.

You should now see the exam monitor program pop up and be able to log in. In some cases, the exam monitor is not able to open the login portal in the browser. In that case, the URL is automatically copied to your clipboard, which can be pasted into the browser manually.

> [!IMPORTANT]
> If you get an error when using `nix run` that says the hash is wrong, then you need to disable checking the hash by going into `settings.nix` and changing `disableHashCheck = false` to `disableHashCheck = true`. This happens when Exam Monitor is updated, and this repository is yet to be updated to support the newest version.
>
> When this happens, please [create an issue](https://github.com/jonas-bork/linux-sdu-exam-monitor/issues) to notify us (if one is not already open).
>
> When you disable checking the hash, you need to be aware that Exam Monitor through this repository might no longer work and that you lose the additional security that the hash check provides.

### Verify that Exam Monitor is working

> [!CAUTION]
> You are responsible for verifying that it works. I am not liable if you fail to do so sufficiently.

You can verify if Exam Monitor is working by running Exam Monitor, logging in and then entering "DEMO" in the "Course" field. 
Let it run for a while to collect data, maybe copy-paste a few things. Then, click on Exam Monitor at the bottom of the screen and quit the exam. 

Next, open up the [Exam Monitor website](https://sdu.exammonitor.dk/).
Scroll down the page and click on the "Login" button.
After logging in, you should see a list of reports from exams.
Press "report" on the newest one and look at the data it has collected. 
If the data in the report is correct, you know it's working as intended. Especially verify that screenshots work (and that they are not just black).

## Thanks

These repos were useful to see the prerequisites for running Exam Monitor on Linux, as well as inspiration for the README:

- https://github.com/Sigu0428/linux-helper-SDU-Exam-Monitor
- https://github.com/frederikstroem/SDU-Exam-Monitor-Linux-Install-Helper
