<template>
    <div>


        <header class="header-text" style="background-color: #d75549;margin-bottom: -16px;">
      <p class="py-2 text-white">treasure</p>
   </header>

   <main style="background-image: url(/img/bgggggg.png); background-size: 100%;
 background-repeat: no-repeat;
 padding-top: 5px;
 height: 800px;">

      <div class="w-100 text-center animation">
         <img :src="$asseturl+'img/animation.png'" alt="" class="animation">
      </div>

      <div class="position">
         <p class=" trea-text">You find a treasure chest</p>
      <img :src="$asseturl+'img/box.png'" alt="" class="img-fluid mt-5 pt-2" style="width: 185px; height: 150px;">
      <p class="my-5 pt-3 trea-text trea-text1">Open the treasure</p>
      </div>

      <div class="bg-white py-5 mx-5">
         <marquee width="40%" direction="up" height="20%">
            <p> This is sample scrolling text.</p>
            <p> This is sample scrolling text.</p>
            <p> This is sample scrolling text.</p>
            <p> This is sample scrolling text.</p>
            <p> This is sample scrolling text.</p>
            <p> This is sample scrolling text.</p>
          </marquee>

         </p>
      </div>
   </main>



    </div>
</template>
