package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"regexp"
)

func main() {
	resolvConf := loadResolvConf()
	nameservers := getNameservers(resolvConf)
	for _, nameserver := range nameservers {
		fmt.Println(nameserver)
	}
}

func loadResolvConf() string {
	resolvConf, err := ioutil.ReadFile("/etc/resolv.conf")
	if err != nil {
		log.Fatal(err)
	}
	return string(resolvConf[:])
}

func getNameservers(resolvConf string) []string {
	r, err := regexp.Compile("nameserver\\s+(\\d+\\.){3}\\d+")
	if err != nil {
		log.Fatal(err)
	}
	nameservers := r.FindAllString(resolvConf, -1)
	for i, nameserver := range nameservers {
		r, err := regexp.Compile("(\\d+\\.){3}\\d+")
		if err != nil {
			log.Fatal(err)
		}
		nameservers[i] = r.FindString(nameserver)
	}
	return nameservers
}
