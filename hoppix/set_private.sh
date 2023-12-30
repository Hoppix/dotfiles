#!/bin/bash

ssh-add -D # remove all entries from the ssh-agent
ssh-add ~/.ssh/github
git config --global user.name "Hoppix"
git config --global user.email "k.hopfmann@hotmail.de"
