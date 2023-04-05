<template>

<video width="320" height="240" @click="toggoleplay(2)" id="2" src="https://v16-webapp.tiktok.com/4c2df72921425f1523711d311973b787/635f0be5/video/tos/useast2a/tos-useast2a-pve-0037c001-aiso/7d3f4c8958df4ea798dffc6c9a4c2b31/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C1%7C0&cv=1&br=4136&bt=2068&cs=0&ds=3&ft=WgGbvN4hVQ9wU8wil1W.CSpxatk3hdxwiq85Vrl8eC_O&mime_type=video_mp4&qs=0&rc=OzxoOjozaWc2PDxpaDRlaUBpanZvMzw6Zm08ZzMzZjczM0AwXy8uMGIxX2ExYWMzXi4zYSNlc2ZocjRvazNgLS1kMWNzcw%3D%3D&l=202210301742130102440750600A64FF59&btag=80000&__vid=TT-vCache-7155265211560103194" ref="vidRef"  />





</template>

<script>
export default {
    data () {
        return {
            playstatus:false,
        }
    },
    methods: {
        toggoleplay(id){
            const video = document.getElementById(id);
            console.log(video.play())

            if(this.playstatus){
                video.pause()
            }else{
                video.play()
            }




            video.addEventListener('play', (event) => {
            console.log('The Boolean paused property is now false. Either the ' +
            'play() method was called or the autoplay attribute was toggled.');
            });
            console.log(id);
        }
    }
}
</script>
