#!/bin/bash

# directory structure; parent dir and multiple subdir 
mkdir -p submission_reminder_app/{app,modules,assets,config}

# moved into the created parent dir
	cd submission_reminder_app

# moving the provided contents stored on various paths to  fill the subdir contents 
cat /shell_scripting_lab/shell_workingfiles/reminder.sh > app/reminder.sh 
cat /shell_scripting_lab/shell_workingfiles/functions.sh > modules/functions.sh 
cat /shell_scripting_lab/shell_workingfiles/config.env > config/config.env
cat /shell_scripting_lab/submissions.txt > assets/submissions.txt

	# making the reminder and functions script exe
	chmod +x app/reminder.sh modules/functions.sh

# appending the submission file with additional 5 names
	echo -e "Delucie, Shell Navigation, not submitted\nMoses, Shell Navigation, not submitted\nPaul, Shell Navigation, not submitted\nElizabeth, Shell Navigation,not submitted\nVictor, Shell Navigation, submitted" >> assets/submissions.txt

	# creates the startup script file, makes it exe, populates it with commands that verify the reminder sh file availability and runs it
	echo -e "#!/bin/bash\nif [ -f ./app/reminder.sh ]; then\necho "Configuration file found. Starting reminder.sh"\n./app/reminder.sh\nelse\necho "Configuration file missing. Cannot start reminder.sh."\nexit 1\nfi" > startup.sh && chmod +x startup.sh
