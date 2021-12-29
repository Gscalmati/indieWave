        let arrayImg = ["https://wallpapercave.com/wp/wp4512652.jpg",
            "https://c4.wallpaperflare.com/wallpaper/86/560/11/retrowave-sunset-synthwave-wallpaper-preview.jpg",
            "https://fondosmil.com/fondo/15998.jpg",
            "https://www.ixpap.com/images/2021/11/Synthwave-Wallpaper-Phone-500x889.jpg",
            "https://wallpapers.com/images/high/synthwave-wallpaper-wt003mw9bsq6mkpk.jpg",
            "https://1.bp.blogspot.com/-0d82z4MJRSQ/YQZKHZrJijI/AAAAAAABSS4/wBpNHWQgSl83KInU0uHMCApyLKll_HpOACLcBGAsYHQ/s3000/city-lights-long-exposure-synthwave-5k-5t-3840x2160.jpg",
            "https://mocah.org/thumbs/346615-Vaporwave-Digital-Art-Scenery-Retrowave-Synthwave.jpg"
        ]



        let randomImg = arrayImg[Math.floor(Math.random() * arrayImg.length)];
        document.querySelector(".images-array").style.backgroundImage = `url(${randomImg})`;