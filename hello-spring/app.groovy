@RestController
class ThisWillActuallyRun {

    @RequestMapping("/")
    String home() {
        "Spring-Boot:App.Groovy:Hello World!"
    }

}
