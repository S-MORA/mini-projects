
let myPromise = axios.get("https://www.redbullshopus.com/products.json").then (function (myResponse) {
 for (let i = 0; i < myResponse.data.products.length; i++) {
    let newParent = document.createElement("div")
    let newImg = document.createElement("img")
    let newText = document.createElement("div")

    newText.innerHTML = myResponse.data.products[i].body_html
    newImg.src = myResponse.data.products[i].images[0].src
    newParent.classList.add("flex-container")

    newParent.appendChild(newImg)
    newParent.appendChild(newText)
    document.body.appendChild(newParent)
  }
})
