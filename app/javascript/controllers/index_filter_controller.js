import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="index-filter"
export default class extends Controller {
  static targets = ["chilli", "filter"]

  connect() {
    console.log("hi from index controller")
    console.log(this.chilliTargets)
  }

  filterResults(e) {
    e.preventDefault()
    function isActive(el) {
      return el.className.includes("active");
    }
    // console.log(e.target.dataset.chilliType)
    e.target.classList.toggle("active")
    // console.log(e.target.className.includes("active"))
    console.log(this.filterTargets.every(isActive))
    console.log("****************")
    this.filterTargets.forEach(filter => {console.log(filter.className.includes("active"));})
    console.log("****************")


    if (this.filterTargets.every(isActive)) {
      console.log("This is true")
      this.chilliTargets.forEach(chilli => {
          chilli.classList.remove("d-none")
        })
    } else {
      this.filterTargets.forEach(filter => {
        // console.log(filter.className.includes("active"))
        if(filter.className.includes("active")){
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
      console.log(this.filterTargets.every(isActive))
    }

      // if(e.target.dataset.input.checked){
      //   filter.classList.add("active")
      // } else {
      //   filter.classList.remove("active")
      // }


  }

    // this.chilliTargets.forEach(chilli => {
    //   console.log(chilli.dataset)
    //   if(chilli.dataset.chilliType === e.target.dataset.chilliType){
    //     chilli.classList.add("d-none")
    //   } else {
    //     chilli.classList.remove("d-none")
    //   }
    //   })
    // };

}
