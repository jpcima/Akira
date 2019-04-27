# Hacking tips for Akira

## Formatting

To avoid mess with codestyle we use uncrustify to parse and format files

- How to check if all files are correctly formated:

        find -name *.vala -exec uncrustify -c uncrustify.cfg \{} --check \; |& grep FAIL

- How to format files before submit a MR:

        find -name *.vala -exec uncrustify -c uncrustify.cfg \{} --replace \;

### NOTE: It shouldn't happen but sometimes format is not correct. Avoid reformat files
unrelated with your MR. Avoid reformat lines unrelated with your MR.

## Submit MR

Try to isolate changes and submit in atomic related changes, that's easy to review an merge

## Open issues

Try to be specific when you detect an issue or want to suggest a new feature. Images and diagrams
are always welcomed. We are available on social media if you want to discuss an unspecific problem
