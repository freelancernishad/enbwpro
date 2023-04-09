<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>united-eib3s</title>
    <link rel="shortcut icon" type="image/x-icon" href="{{ asset('united.jpg') }}">
    <!-- Bootstrap CSS -->
    <link href="{{ asset('frontend/css/bootstrap.min.css') }}" rel="stylesheet" >
    <link href="{{ asset('frontend/css/font-awesome.min.css') }}" rel="stylesheet" >
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        *{
            --van-cell-group-background-color:white;
             --van-button-default-background-color:white;
             --defaltColor:#B000FF;
        }

        .defaltColor{
            color: var(--defaltColor) !important;
        }

        .defaltColorBg {
                background: var(--defaltColor) !important;
            }
    </style>

    <link rel="stylesheet" href="{{ asset('css/app.css?ver=1.0.2') }}">
    <link rel="stylesheet" href="{{ asset('css/style.css?ver=1.0.5') }}">



</head>
<body>
    <div id="app">
        <component :is="$route.meta.layout || 'div'" >
            <router-view />
          </component>

    </div>
    <script>
console.log("{{ Auth::user() }}")

        if ("{{ Auth::user() }}") {

            const storeToken = localStorage.getItem('token');


            if(!storeToken){

                let data = {'_token': "{{ csrf_token() }}"};
                fetch("/logout", {
                method: "POST",
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify(data)
                }).then(res => {

                });

                // axios.post('/logout').then(()=>{
                //     // window.location.href = '/'
                // })
            }


        }else{

                localStorage.removeItem('token')
                localStorage.removeItem('user')
                localStorage.removeItem('userid')
                localStorage.removeItem('role')
                localStorage.removeItem('position')
        }
        </script>
    <script src="{{ asset('frontend/js/bootstrap.bundle.min.js') }}" ></script>
    <script src="{{ asset('frontend/js/bootstrap.min.js') }}" ></script>
    <script src="{{ asset('js/frontend.js?ver=1.0.18') }}"></script>
</body>
</html>
