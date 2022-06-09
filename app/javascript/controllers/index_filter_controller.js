import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="index-filter"
export default class extends Controller {
  static targets = ["chilli", "filter"]

  connect() {
    console.log("hi from index controller")
    console.log(this.chilliTargets)
  }

  // filterResults(e) {
  //   e.preventDefault()
  //   // console.log(e.target.dataset.chilliType)
  //   e.target.classList.toggle("active")

  //   this.filterTargets.forEach(filter => {
  //     console.log(filter.dataset)
  //     if(filter.className === "active"){
  //       this.chilliTargets.forEach(chilli => {
  //         if(chilli.dataset.chilliType === filter.dataset.chilliType){
  //           chilli.classList.add("d-none")
  //         } else {
  //           chilli.classList.remove("d-none")
  //         }
  //         })
  //     }
  //     // if(e.target.dataset.input.checked){
  //     //   filter.classList.add("active")
  //     // } else {
  //     //   filter.classList.remove("active")
  //     // }
  //   })

  //   this.chilliTargets.forEach(chilli => {
  //     console.log(chilli.dataset)
  //     if(chilli.dataset.chilliType === e.target.dataset.chilliType){
  //       chilli.classList.add("d-none")
  //     } else {
  //       chilli.classList.remove("d-none")
  //     }
  //     })
  //   };

}
