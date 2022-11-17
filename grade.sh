# Create your grading script here


set -e


rm -rf student-submission
git clone $1 student-submission


S_File="student-submission/ListExamples.java"
if  [-f "$S_File"]
then
    echo "$S_File found"
else
    echo "$S_File does not exist"
    exit

fi

cp TestListExample.java ./student_submission

set +e

javac -cp .;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar student_submission/*.java 2>error.txt

set -e

if [-s error.txt]
    then echo "$(cat error.txt)"
    exit
fi
