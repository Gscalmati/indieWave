document.getElementById("audio").addEventListener("play", function () {
    console.log("fired")
    document.getElementById("tombstone-div").style.display = "block";
    document.getElementById("tombstone-div").classList.toggle("animate__fadeInUp")
})