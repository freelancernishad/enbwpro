class Notification{

    successSound(){
        // console.log(this)
        // var data = {  soundurl : ASSETURL+'Single Audio.mp3'}
        // var audio = new Audio(data.soundurl);
        // audio.play();
    }
    deleteSound(){
    //     var data = {  soundurl : ASSETURL+'Broke Glass.mp3'}
    //     var audio = new Audio(data.soundurl);
    //     audio.play();
    }
    errorSound(){
        // var data = {  soundurl : ASSETURL+'Windows error.mp3'}
        // var audio = new Audio(data.soundurl);
        // audio.play();
    }


    preLoader(data){
        return '<h1>hello</h1>';
    }



	success(){
		new Noty({
			type: 'success',
			layout: 'topRight',
			text: 'Successfully done!',
			timeout: 1000,
		}).show();
        this.successSound()
	}

	alert(){
		new Noty({
			type: 'alert',
			layout: 'topRight',
			text: 'Are you sure?',
			timeout: 1000,
		}).show();
	}

	warning(){
		new Noty({
			type: 'warning',
			layout: 'topRight',
			text: 'Oops wrong!',
			timeout: 1000,
		}).show();
        this.errorSound()
	}

	error(){
		new Noty({
			type: 'error',
			layout: 'topRight',
			text: 'Something went wrong!',
			timeout: 1000,
		}).show();
        this.errorSound()
	}

    customdelete (mess){
		new Noty({
			type: 'error',
			layout: 'topRight',
			text: mess,
			timeout: 2000,
		}).show();
        this.deleteSound();
	}
	not_found(){
		new Noty({
			type: 'error',
			layout: 'topRight',
			text: 'Product Not Found!',
			timeout: 1000,
		}).show();
        this.errorSound()
	}

	image_validation(){
		new Noty({
			type: 'error',
			layout: 'topRight',
			text: 'File size should be less then 1MB!',
			timeout: 2000,
		}).show();
        this.errorSound()
	}

	cart_success(){
		new Noty({
			type: 'success',
			layout: 'topRight',
			text: 'Successfully added to cart!',
			timeout: 2000,
		}).show();
        this.successSound()
	}
	customSuccess(mess){
		new Noty({
			type: 'success',
			layout: 'topRight',
			text: mess,
			timeout: 2000,
		}).show();
        this.successSound()
	}

    customError(mess){
		new Noty({
			type: 'error',
			layout: 'topRight',
			text: mess,
			timeout: 2000,




		}).show();
        this.errorSound()
	}

	cart_delete(){
		new Noty({
			type: 'error',
			layout: 'topRight',
			text: 'Product removed from cart!',
			timeout: 2000,
		}).show();
        this.deleteSound();
	}

	Out_of_stock(){
		new Noty({
			type: 'error',
			layout: 'topRight',
			text: 'Product Out of stock!',
			timeout: 2000,
		}).show();
        this.errorSound()
	}
}

export default Notification = new Notification()
