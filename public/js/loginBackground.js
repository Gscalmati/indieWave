        let arrayImg = ["https://wallpapercave.com/wp/wp4512652.jpg",
            "https://c4.wallpaperflare.com/wallpaper/86/560/11/retrowave-sunset-synthwave-wallpaper-preview.jpg",
            "https://fondosmil.com/fondo/15998.jpg"
        ]



        let randomImg = arrayImg[Math.floor(Math.random() * arrayImg.length)];
        document.querySelector(".images-array").style.backgroundImage = `url(${randomImg})`;

        console.log(randomImg)