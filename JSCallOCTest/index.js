

function buttonClick()
{
    // 调OC方法
    testobject.ZTHShowPicker();
}

function XHbuttonClick()
{
    testobject.ZTHpay();
}

function HbuttonClick()
{
    // 调OC方法  顺便传递参数
    testobject.ZTHPassParameter("1123425255");
}

function ZTHbuttonClick()
{
    // 调OC方法  顺便传递两个参数，比如，姓名，订单号
    testobject.ZTHTestParameteroneAndParametertwo("1123425255","ZTH");
}
