# ldsearch
A local directory wordlist generator which can generate a wordlist from any Unix local directories recursively.

### Requirements
-Unix Operating system

-Ruby 

### Usage
./ldsearch.rb --directory testdir

### Example
ldsearch is good for creating a small wordlist of a file system or project. This is useful for testing websites with open source projects in which the code can be accessed.


Generating a wordlist:

![generate-wordlist](https://github.com/kyle-c-simmons/ldsearch/blob/master/images/ldsearch-generate.png)


Using the wordlist with dirb:

![using-wordlist](https://github.com/kyle-c-simmons/ldsearch/blob/master/images/ldsearch-dirb.png)

The results show a lot of discovered files on the web server in only a few seconds recursively. A lot of these files would not have been found by a normal wordlist since some of the file names of the open source CMS were unique to that CMS. 


## Authors

* **Kyle Simmons** - [Github - kyle-c-simmons](https://github.com/kyle-c-simmons)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
