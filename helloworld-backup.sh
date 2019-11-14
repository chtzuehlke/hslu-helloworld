#!/bin/bash

tar cvfz helloworld.tgz --exclude='.git' --exclude='target' --exclude='.classpath' --exclude='.settings' --exclude='.project' helloworld/
