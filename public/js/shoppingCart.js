
window.onload = function () {

    document.querySelector("#game-to-cart-btn").addEventListener("click", () =>{

        if(sessionStorage.getItem("cart") == undefined){
            sessionStorage.setItem("cart", "[]")
        } else {
            let cart = sessionStorage.getItem("cart")
        }

        
    })
    
}