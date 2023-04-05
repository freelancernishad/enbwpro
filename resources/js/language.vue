<template>

    <select v-model="$i18n.locale" @change="setLang()">
        <option
        v-for="(lang, i) in langs"
        :key="`lang-${i}`"
        :value="lang.shortname">
        {{ lang.fullname }}
    </option>
</select>

</template>
<script>
export default {
data(){
    return {

        langs: [
                {
                    "fullname":'English',
                    "shortname":'en'
                },
                {
                    "fullname":'বাংলা',
                    "shortname":'bn'
                },
            ],
    }
}
}
</script>
