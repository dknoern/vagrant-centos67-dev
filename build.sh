#!/bin/bash

rm -fr *.box
vagrant destroy

vagrant up
vagrant halt
vagrant package --output centos7-dev.box
