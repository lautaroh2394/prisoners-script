# Readme
This is a simple script that simulates the problem stated in this [Veritasium video](https://youtu.be/iSNsgj1OCLA), something I played around a bit with on a free saturday morning.

To execute simply call it from the terminal
```bash
.\script.rb                 
```

You can pass parameters. The defaults values are:

* TOTAL_PRISIONS = 1000
* LOG = false
* ALLOWED_BOXES_TO_LOOK = 50
* TOTAL_PRISONERS = 100

```bash
.\script.rb TOTAL_PRISIONS LOG ALLOWED_BOXES_TO_LOOK TOTAL_PRISONERS
```

Examples:
```bash
.\script.rb 50000 true 25 40
.\script.rb 10000000 true
```

There is also a script that uses threads. The params differ a little bit:

* TOTAL_PRISIONS = 1000
* NUMBER_OF_THREADS = 4
* LOG = false
* ALLOWED_BOXES_TO_LOOK = 50
* TOTAL_PRISIONERS = 100

 
 Examples:
```bash
.\script.rb 100000 8 true 25 50
.\script.rb 100000 4
```

You might ask:
> Why are there two scripts if the first one could be replaced by the second one using one thread? 
>
Thats a good question. The reason is simply that I was lazy and I didnt want to tidy up the code