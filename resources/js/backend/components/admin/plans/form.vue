<template>
    <div>
        <div class="breadcrumbs-area">
            <h3>Methods Form</h3>
            <ul>
                <li>
                    <router-link :to="{ name: 'Dashboard' }">Home</router-link>
                </li>
                <li>Methods Form</li>
            </ul>
        </div>
        <div class="card">
            <form action="https://realearn69.com/admin/withdraw/method/edit/1" method="POST"
                enctype="multipart/form-data">
                <input type="hidden" name="_token" value="RDR3Tlzt7cJlSKjha9KItACaTDjWrjRtmR1NNsm9">
                <div class="card-body">
                    <h6 class="card-title mb-20">Method Update Form</h6>
                    <div class="payment-method-item">
                        <div class="payment-method-header d-flex flex-wrap">
                            <div class="thumb">
                                <div class="avatar-preview">
                                    <div class="profilePicPreview"
                                        style="background-image: url(https://realearn69.com/assets/images/withdraw/method/62ea4b23859ac1659521827.jpg)">
                                    </div>
                                </div>
                                <div class="avatar-edit">
                                    <input type="file" name="image" class="profilePicUpload" id="image"
                                        accept=".png, .jpg, .jpeg">
                                    <label for="image" class="bg--primary"><i class="la la-pencil"></i></label>
                                </div>
                            </div>
                            <div class="content">
                                <div class="d-flex justify-content-between">
                                    <input type="text" class="form-control" placeholder="Method Name" name="name"
                                        value="Bkash">
                                </div>
                                <div class="row mt-4">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="w-100">Currency <span class="text-danger">*</span></label>
                                            <div class="input-group">
                                                <input type="text" name="currency" class="form-control border-radius-5"
                                                    value="৳">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="w-100">Rate <span class="text-danger">*</span></label>
                                            <div class="input-group has_append">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">1 TAKA =</div>
                                                </div>
                                                <input type="text" class="form-control" placeholder="0" name="rate"
                                                    value="1">
                                                <div class="input-group-append">
                                                    <div class="input-group-text"><span class="currency_symbol">৳</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="w-100">Processing Time <span
                                                    class="text-danger">*</span></label>
                                            <input type="text" name="delay" class="form-control border-radius-5"
                                                value="24 hours">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="payment-method-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="card border--primary mb-2">
                                        <h5 class="card-header bg--primary">Range</h5>
                                        <div class="card-body">
                                            <div class="input-group has_append mb-3">
                                                <label class="w-100">Minimum Amount <span
                                                        class="text-danger">*</span></label>
                                                <input type="text" class="form-control" name="min_limit" placeholder="0"
                                                    value="700">
                                                <div class="input-group-append">
                                                    <div class="input-group-text"> TAKA </div>
                                                </div>
                                            </div>
                                            <div class="input-group has_append">
                                                <label class="w-100">Maximum Amount <span
                                                        class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="0" name="max_limit"
                                                    value="10000">
                                                <div class="input-group-append">
                                                    <div class="input-group-text"> TAKA </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="card border--primary">
                                        <h5 class="card-header bg--primary">Charge</h5>
                                        <div class="card-body">
                                            <div class="input-group has_append mb-3">
                                                <label class="w-100">Fixed Charge <span
                                                        class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="0"
                                                    name="fixed_charge" value="0">
                                                <div class="input-group-append">
                                                    <div class="input-group-text"> TAKA </div>
                                                </div>
                                            </div>
                                            <div class="input-group has_append">
                                                <label class="w-100">Percent Charge <span
                                                        class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="0"
                                                    name="percent_charge" value="12">
                                                <div class="input-group-append">
                                                    <div class="input-group-text">%</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="card border--dark my-2">
                                        <h5 class="card-header bg--dark">Withdraw Instruction </h5>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <div style="width: 957px;" unselectable="on">
                                                    <div style="overflow: hidden; width: 100%; border: 1px solid rgb(204, 204, 204); background-color: rgb(239, 239, 239);"
                                                        class=" nicEdit-panelContain" unselectable="on">
                                                        <div style="margin: 0px 2px 2px; overflow: hidden;"
                                                            class=" nicEdit-panel" unselectable="on">
                                                            <div style="float: left; margin-top: 2px; display: none;">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain ">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -432px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;"
                                                                unselectable="on">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain " unselectable="on">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined"
                                                                        unselectable="on">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -54px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;"
                                                                unselectable="on">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain " unselectable="on">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined"
                                                                        unselectable="on">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -126px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;"
                                                                unselectable="on">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain " unselectable="on">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined"
                                                                        unselectable="on">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -342px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;"
                                                                unselectable="on">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain " unselectable="on">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined"
                                                                        unselectable="on">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -162px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;"
                                                                unselectable="on">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain " unselectable="on">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined"
                                                                        unselectable="on">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -72px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;"
                                                                unselectable="on">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain " unselectable="on">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined"
                                                                        unselectable="on">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -234px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;"
                                                                unselectable="on">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain " unselectable="on">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined"
                                                                        unselectable="on">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -144px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;"
                                                                unselectable="on">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain " unselectable="on">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined"
                                                                        unselectable="on">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -180px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;"
                                                                unselectable="on">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain " unselectable="on">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined"
                                                                        unselectable="on">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -324px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin: 2px 1px 0px;"
                                                                unselectable="on">
                                                                <div style="width: 90px; height: 20px; cursor: pointer; overflow: hidden; opacity: 0.6;"
                                                                    class=" nicEdit-selectContain" unselectable="on">
                                                                    <div style="overflow: hidden; border: 1px solid rgb(204, 204, 204); padding-left: 3px; background-color: rgb(255, 255, 255);"
                                                                        unselectable="on">
                                                                        <div style="overflow: hidden; float: right; height: 18px; width: 16px; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -450px 0px;"
                                                                            class=" nicEdit-selectControl"
                                                                            unselectable="on"></div>
                                                                        <div style="overflow: hidden; float: left; width: 66px; height: 14px; margin-top: 1px; font-family: sans-serif; text-align: center; font-size: 12px;"
                                                                            class=" nicEdit-selectTxt"
                                                                            unselectable="on">Font&nbsp;Size...</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin: 2px 1px 0px;"
                                                                unselectable="on">
                                                                <div style="width: 90px; height: 20px; cursor: pointer; overflow: hidden; opacity: 0.6;"
                                                                    class=" nicEdit-selectContain" unselectable="on">
                                                                    <div style="overflow: hidden; border: 1px solid rgb(204, 204, 204); padding-left: 3px; background-color: rgb(255, 255, 255);"
                                                                        unselectable="on">
                                                                        <div style="overflow: hidden; float: right; height: 18px; width: 16px; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -450px 0px;"
                                                                            class=" nicEdit-selectControl"
                                                                            unselectable="on"></div>
                                                                        <div style="overflow: hidden; float: left; width: 66px; height: 14px; margin-top: 1px; font-family: sans-serif; text-align: center; font-size: 12px;"
                                                                            class=" nicEdit-selectTxt"
                                                                            unselectable="on">Font&nbsp;Family...</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin: 2px 1px 0px;"
                                                                unselectable="on">
                                                                <div style="width: 90px; height: 20px; cursor: pointer; overflow: hidden; opacity: 0.6;"
                                                                    class=" nicEdit-selectContain" unselectable="on">
                                                                    <div style="overflow: hidden; border: 1px solid rgb(204, 204, 204); padding-left: 3px; background-color: rgb(255, 255, 255);"
                                                                        unselectable="on">
                                                                        <div style="overflow: hidden; float: right; height: 18px; width: 16px; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -450px 0px;"
                                                                            class=" nicEdit-selectControl"
                                                                            unselectable="on"></div>
                                                                        <div style="overflow: hidden; float: left; width: 66px; height: 14px; margin-top: 1px; font-family: sans-serif; text-align: center; font-size: 12px;"
                                                                            class=" nicEdit-selectTxt"
                                                                            unselectable="on">Font&nbsp;Format...</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;"
                                                                unselectable="on">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain " unselectable="on">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined"
                                                                        unselectable="on">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -108px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;"
                                                                unselectable="on">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain " unselectable="on">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined"
                                                                        unselectable="on">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -198px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain ">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -360px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain ">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -468px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain ">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -378px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain ">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -396px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain ">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -36px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain ">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -18px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;"
                                                                unselectable="on">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain " unselectable="on">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined"
                                                                        unselectable="on">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -288px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;"
                                                                unselectable="on">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain " unselectable="on">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined"
                                                                        unselectable="on">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -306px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;"
                                                                unselectable="on">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain " unselectable="on">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined"
                                                                        unselectable="on">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -270px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;"
                                                                unselectable="on">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain " unselectable="on">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined"
                                                                        unselectable="on">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -216px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;"
                                                                unselectable="on">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain " unselectable="on">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined"
                                                                        unselectable="on">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: -90px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="float: left; margin-top: 2px;">
                                                                <div style="width: 20px; height: 20px; opacity: 0.6;"
                                                                    class=" nicEdit-buttonContain ">
                                                                    <div style="background-color: rgb(239, 239, 239); border: 1px solid rgb(239, 239, 239);"
                                                                        class=" nicEdit-button-undefined">
                                                                        <div style="width: 18px; height: 18px; overflow: hidden; cursor: pointer; background-image: url(&quot;http://js.nicedit.com/nicEditIcons-latest.gif&quot;); background-position: 0px 0px;"
                                                                            class=" nicEdit-button" unselectable="on">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div
                                                    style="width: 957px; border-color: currentcolor rgb(204, 204, 204) rgb(204, 204, 204); border-style: none solid solid; border-width: 0px 1px 1px; border-image: none 100% / 1 / 0 stretch; overflow: hidden auto;">
                                                    <div style="width: 949px; margin: 4px; min-height: 136px; overflow: hidden;"
                                                        class=" nicEdit-main " contenteditable="true">
                                                        <div><span style="color: rgb(33, 37, 41);">রবিবার -
                                                                বৃহস্পতিবার&nbsp;</span></div>
                                                        <div><span style="color: rgb(33, 37, 41);">সকাল ৯টা - ৫টা
                                                                পর্যন্ত উত্তলোন করতে পারবেন।&nbsp;</span></div>
                                                        <div>
                                                            <div>২৪ঘন্টার ভিতর পেমেন্ট পাবেন। পেমেন্ট পেয়ে অফিসিয়াল
                                                                টেলিগ্রাম এ শেয়ার করবেন।</div>
                                                        </div>
                                                    </div>
                                                </div><textarea rows="5" class="form-control border-radius-5 nicEdit"
                                                    name="instruction" id="nicEditor0"
                                                    style="display: none;">&lt;div&gt;&lt;span style="color: rgb(33, 37, 41);"&gt;রবিবার - বৃহস্পতিবার&amp;nbsp;&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;span style="color: rgb(33, 37, 41);"&gt;সকাল ৯টা - ৫টা পর্যন্ত উত্তলোন করতে পারবেন।&amp;nbsp;&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;div&gt;২৪ঘন্টার ভিতর পেমেন্ট পাবেন। পেমেন্ট পেয়ে অফিসিয়াল টেলিগ্রাম এ শেয়ার করবেন।&lt;/div&gt;&lt;/div&gt;</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <button type="submit" class="btn-fill-lmd text-light gradient-dodger-blue btn-block">Save Method</button>
                </div>
            </form>
        </div>
    </div>
</template>
