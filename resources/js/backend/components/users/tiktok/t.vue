<template>
<div>


    <swiper loop page-transition="push" :show-indicator="showindicator"         @beforeChange="beforeChange"
        @afterChange="afterChange">
        <swiper-item  v-for="(tiktok, i) in tiktokData" :key="tiktok.id">



            <video width="320" height="240" @click="toggoleplay(i)" :id="i" :src="tiktok.video" ref="vidRef"  />


            <svg
      width="512"
      height="512"
      viewBox="0 0 512 512"
      @click="toggoleplay(i)"
      v-show="!playstatus"
    >
      <path d="M152.443 136.417l207.114 119.573-207.114 119.593z" fill="#fff" />
    </svg>

        </swiper-item>

    </swiper>

</div>
    </template>

    <script>

import { Swiper, SwiperItem } from 'vue-h5-swiper';
import TiktoksJson from "../../../tiktoks.json";
    export default {
        created() {
           this.tiktokData = TiktoksJson
        },
        components: {
        Swiper,
        SwiperItem
    },
        data () {
            return {
                showindicator:false,
                playstatus:false,
                playIndex:0,
                tiktokData:{},
            }
        },
        methods: {
            toggoleplay(id){
                const video = document.getElementById(id);
                if(this.playstatus){
                    video.pause()
                    this.playstatus = false
                }else{
                    video.play()
                    this.playstatus = true
                }
            },

            playVideo(id){
                const video = document.getElementById(id);
                    video.play()
                    this.playstatus = true
            },


            pauseVideo(id){
                const video = document.getElementById(id);
                    video.pause()
                    this.playstatus = false

            },



            beforeChange(activeIndex, oldIndex) {
                // console.log(`before-change: ${activeIndex}, ${oldIndex}`);

            },



            afterChange(activeIndex, oldIndex) {
                this.playstatus = false
                console.log(`after-change: ${activeIndex}, ${oldIndex}`);
                if(oldIndex>0){
                    this.pauseVideo(oldIndex)
                }else{
                    this.pauseVideo(0)

                }

                this.playVideo(activeIndex)

            }


        }
    }
    </script>

<style scoped>
.tiktok {
  position: relative;
  width: 100%;
  height: 100%;
}
video {
  aspect-ratio: 348/520;

  height: auto;
  position: relative;
  min-width: 300px;
    margin: 0 auto;
}

svg {
  position: absolute;
  top: calc(50% - 35px);
  left: calc(50% - 35px);
  width: 90px;
  height: 90px;
  z-index: 10;
}

</style>
