# Welcome to the mycrontab app documentation

This program was built by the members of the group 39; Albert Hadacek, Lewis Mackenzie and Ewan Robertson. Albert built the first version (0.1) of the script that contained all the functionality, yet it only worked with inputs that are whole crontab strings. After that, Lewis and Ewan started to expand on that functionality, enabling the user to easily navigate through the app predominantly using numbers rather than copying and pasting whole strings. The last part of the task was to deal with the data validation and to implement this into the existing codebase. This happened during our last meetup where we all put together the validation functions. This documentation was mainly written by Albert with inputs from Lewis and Ewan

For communication, we mainly used a Discord channel and we called on a weekly basis. We used git and Github to allow everyone in our group to access the current version of the code. To edit our code we all used Visual Studio Code. As for the documentation, we used the standard markup language Markdown, so it is recommended to read this document in a text editor that supports Markdown. Most coding editors offer some form of extension if they don't support Markdown syntax natively.

## Introduction

The provided script written in bash provides a simple command line user interface for performing CRUD (Create, Read, Update, Delete) on cron jobs. Cron jobs are automated tasks that normally run on a server or any other Linux based machine with a certain periodicity. We can, for instance, schedule emails or database  backups using cron. Using our script, there is no need to copy and paste a legally formatted string, instead you can just fill the prompts and the script creates the final string for you which it then saves into the crontab file and is ready to be triggered.

## Usage

Make sure you give the mycrontab.sh executions rights by running the following command.

```bash
chmod +x mycrontab.sh
```

To check if the file can be executed, you can run the following command in the directory where your script is saved.

```bash
ls -l
```

Then execute the file using this command:

```bash
./mycrontab.sh
```

After that the program prompts you for information. Don't worry, if you make a typo as the script contains basic data validation for your string inputs.

## Code Structure Overview ##

The code is split into multiple functions which are then used together to create the whole program. This approach allows easier maintenence and further development of the code. The so called spaghetti approach would be very hard in this case, as the code is over 500 lines. 

Speaking of the used functions, they can be split into several categories: validation functions (get_something), prompt functions (choose_something) and CRUD functions. The whole program then uses a flag variable that controls if it is running or not and calls the needed functionality based on the user's input. In case, the user types an "illegal" input the code catches it and prompts the user again. 

### Display Tasks ###

The displaying functionality happens in the **display_cronetab_jobs** function. Inside of the function, we copy the content of the Crontab into mycron file, then we print each line of the mycron file into the console. We also use a counter variable (temp_count) to display the line number of each task, so the user can easily remember the line he wants to then update or delete. After everything is printed into the command line we simply delete the temporary file we used.

### Create a Task ###

Creating task functionality is stored in the **insert_a_job** function. This function runs several helper functions to get the needed input from the user (minute,hour,day,month,day of the week and the command itself). After that, the concatenated string is inserted into the Crontab file. The insert function makes use of the validation functions, therefore all the input besides the command is checked, so it is a legal expression recognized by the cron.

### Update a task ###

Updating task functionality is stored in the **edit_a_job** function. This function crompts the user for a number of the task that should be edited and which time part of the job should be edited. We copy the array into our mycron file, remove the job that should be edited while storing it, then updating the to be edited array, appending it to the end of the jobs array and echoing it all into the crontab file. Then, the mycron temporary file is removed.

### Removing a job ###

Removing a job functionality is stored in the **remove_a_job** function. We store the content of crontab into mycron file, then we print it so the user can pick which job to remove. After that we unset that item in the array and print it back to the crontab file and we remove the temporary mycron tab file.

### Removing all jobs ###

This function is stored under the label **remove_all_jobs** and it simply deletes the content of the crontab file.

### Exiting the app ###

If the option 9 is chosen, the program ends. The flag is_running is simply set to the boolean value false. If yout, the user, input something else besides 1, 2, 3, 4, 5, or 9. You will be asked to choose again as your input is apparently invalid.

### Validation Functions ###

To make the user experience as smooth as possible we introduced several validation functions to our code, namely **get_day, get_minute, get_month, get_hour and get_day_of_the_week**. The purpose of these is to simply ensure that the formats that are legal within the cron are followed. These functions can also work with strings which is needed fo the months parameter as they can be written either as a number or a string in the format of capitalized first three letters e.g. "Jan" for January. The rest of the validation is pretty standard. A flag is used for prompt repetition in case the input is invalid and we are mostly checking number intervals for minutes and hours etc...

### Prompt Functions ###
As the script collects quite a lot of input we separated the prompt functions, namely, **choose_minute, choose_hour, choose_day, choose_month and choose_day_of_the_week**  ,for each input needed to build the cron string. These functions take use of the validation functions to ensure all input is legal. They follow the same pattern as our main prompt. We have a case statement within a while loop that asks you, the user, for the input that we need. Then you just follow the the displayed options and chooses the one he wants by inserting the appropriate number

## License
[MIT](https://choosealicense.com/licenses/mit/)