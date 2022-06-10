import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="index-filter"
export default class extends Controller {
  static targets = ["chilli", "filter", "results"]
  static values = {chilliCount: String}

  connect() {
    console.log("hi from index controller")
    // console.log(this.chilliTargets)
    console.log(this.chilliCountValue)
  }

  filterResults(e) {
    e.preventDefault()
    function isInactive(el) {
      return el.className.includes("inactive");
    }
    // console.log(e.target.dataset.chilliType)
    e.target.classList.toggle("inactive")
    // console.log(e.target.className.includes("inactive"))
    console.log(this.filterTargets.every(isInactive))
    console.log("****************")
    this.filterTargets.forEach(filter => {console.log(filter.className.includes("inactive"));})
    console.log("****************")


    if (this.filterTargets.every(isInactive)) {
      console.log("This is true")
      this.chilliTargets.forEach(chilli => {
          chilli.classList.remove("d-none")
        })
    } else {
      this.filterTargets.forEach(filter => {
        // console.log(filter.className.includes("inactive"))
        if(filter.className.includes("inactive")){
          this.chilliTargets.forEach(chilli => {
            if(chilli.dataset.chilliType === filter.dataset.chilliType){
              chilli.classList.add("d-none")
            }
            })
        } else {
          this.chilliTargets.forEach(chilli => {
            if(chilli.dataset.chilliType === filter.dataset.chilliType){
            chilli.classList.remove("d-none")
            }
          })
        }
        })
      console.log(this.filterTargets.every(isInactive))
    }
    console.log("hello from count results")
    let result = 0;

    this.chilliTargets.forEach(chilli => {
      if(chilli.className.includes("d-none")){
        result += 1
      }
      })

    let totalResults = parseInt(this.chilliCountValue) - result
    console.log(result)
    console.log(totalResults)
    this.resultsTarget.innerHTML = `${totalResults} Results`

  }

  // countResults(e){
  //   e.preventDefault()
  //   console.log("hello from count results")
  //   let result = 0;

  //   this.chilliTargets.forEach(chilli => {
  //     if(chilli.className.includes("d-none")){
  //       result += 1
  //     }
  //     })

  //   let totalResults = parseInt(this.chilliCountValue) - result
  //   console.log(result)
  //   console.log(totalResults)
  //   this.resultsTarget.insertAdjacentHTML("afterstart", totalResults)

  // }


}
