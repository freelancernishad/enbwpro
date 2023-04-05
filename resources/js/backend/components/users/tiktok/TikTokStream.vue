<template>


<div>







    <div class="tiktok-stream" ref="tiktokStream" v-swipe="onSwipe" :style="state.style">

        <!-- <button @click="next()">next</button> -->

        <swiper loop page-transition="push" :show-indicator="showindicator">
        <swiper-item  v-for="(tiktok, i) in tiktokData" :key="tiktok.id">
            <tiktok :video="tiktok.video"  :ref="(el) => { tiktokRefs[i] = el;}" />

        </swiper-item>

  </swiper>



    </div>




</div>

</template>

<script>







import {
    defineComponent,
    ref,
    reactive,
    computed,
    watch,
    onBeforeUpdate,
} from "vue";

import swipe from "../../../directives/swipe.js";
import Tiktok from "./Tiktok.vue";
import TiktoksJson from "../../../tiktoks.json";
import { Swiper, SwiperItem } from 'vue-h5-swiper';


const DIRECTIONS = {
  UP: 'Up',
  DOWN: 'Down'
};
export default defineComponent({
    name: "TikTokStream",
    directives: {
        swipe,
    },
    components: {
        Tiktok,
        Swiper,
        SwiperItem
    },
    props: {
    showIndicator: {
      type: Boolean,
      default: true
    },
    pageTransition: {
      type: String,
      default: 'move',
      validator(value) {
        return [
          'move',
          'fade',
          'cover',
          'carousel',
          'scale',
          'glue',
          'cube',
          'push',
          'three'
        ].indexOf(value) !== -1;
      }
    },
    loop: {
      type: Boolean,
      default: false
    },
    interval: {
      type: Number,
      default: 3000
    },
    autoplay: {
      type: Boolean,
      default: false
    }
  },
  provide() {
    return {
      swiper: this
    };
  },




    setup() {
        const tiktokStream = ref(null);
        const tiktokRefs = ref([]);
        const tiktokData = TiktoksJson;

        const state = reactive({
            currentSlide: 1,
            amoundOfSlides: TiktoksJson.length,
            style: {
                transform: computed(
                    () => `translate3d(0, ${-(state.currentSlide - 1) * 100}%, 0)`
                ),
            },
        });

        onBeforeUpdate(() => {
            tiktokRefs.value = [];
        });

        watch(
            () => state.currentSlide,
            (items, oldItems) => {
                tiktokRefs.value[items - 1].play();
                tiktokRefs.value[oldItems - 1].pause();
            },
            {
                lazy: false,
            }
        );

        const onSwipe = (direction) => {
            if (
                (direction === 1 && state.currentSlide === state.amoundOfSlides) ||
                (direction === -1 && state.currentSlide === 1)
            ) {
                return;
            }

            state.currentSlide += direction;
        };

        return {
            state,
            onSwipe,
            tiktokStream,
            tiktokData,
            tiktokRefs,
        };
    },
data(){
    return {
        items: [],
      activeIndex: -1,
      oldIndex: -1,
      swipeDirection: '',
      pageAnimating: false,
      showindicator: false,
      timer: null
    }
},
    methods: {
        startTimer() {
      if (this.interval <= 0 || !this.autoplay) return;
      this.timer = setInterval(this.playSlides, this.interval);
    },
    pauseTimer() {
      clearInterval(this.timer);
    },
    playSlides() {
      this.next();
    },
    getNextIndex(isNext = true) {
        // console.log(TiktoksJson.length)
      const length = this.items.length;
      let index = this.activeIndex;
      if (this.loop) {
        index = (isNext ? (++index) : (--index + length)) % length;
        if (index === this.activeIndex) return -1;
      } else {
        isNext ? index++ : index--;
        if (index >= length || index < 0) return -1;
      }
      if (
        index === this.activeIndex ||
        index >= length ||
        index < 0
      ) {
        return -1;
      }
      return index;
    },
    handleSwipe(direction) {
      if (direction === 'Up') {
        this.next();
      } else if (direction === 'Down') {
        this.prev();
      }
    },
    handlePageAnimationEnd() {
      this.pageAnimating = false;
      this.$emit('afterChange', this.activeIndex, this.oldIndex);
      this.startTimer();
    },
    prev() {
      let prevIndex = this.getNextIndex(false);
      if (prevIndex === -1) {
        return;
      }
      this.swipeDirection = 'Down';
      this.setActiveItem(prevIndex);
    },
    next() {
      let nextIndex = this.getNextIndex();
      if (nextIndex === -1) {
        return;
      }
      this.swipeDirection = 'Up';
      this.setActiveItem(nextIndex);
    },
    moveTo(index) {
      if (index === this.activeIndex) {
        return;
      }
      this.swipeDirection =
        index < this.activeIndex ?
        DIRECTIONS.DOWN :
        DIRECTIONS.UP;
      this.setActiveItem(index);
    },
    setActiveItem(index) {
      index = Number(index);
      const oldIndex = this.activeIndex;
      this.activeIndex = index
      if (oldIndex !== this.activeIndex) {
        this.oldIndex = oldIndex;
        this.$emit('beforeChange', this.activeIndex, this.oldIndex);
        this.pauseTimer();
        this.pageAnimating = true;
        this.items.forEach((item, index) => {
            console.log(item)
          item.setActive(index, this.activeIndex, oldIndex);
        });
      }

    }
    }



});
</script>

<style scoped >
.tiktok-stream {
    position: relative;
    height: 100%;
    width: 100%;
    margin: 0;
    padding: 0;
    transform: translate3d(0, 0, 0);
    transition: transform 200ms ease;
}


body {
  background: #f1f1f1 !important;
  margin: 0 !important;
  overflow: hidden !important;
}

html,
body {
  height: 100% !important;
}

#app {
  position: relative !important;
  width: 100% !important;
  height: 100% !important;
}




</style>
