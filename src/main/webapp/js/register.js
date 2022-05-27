window.addEventListener("load",function(){
let b=document.getElementById("checkPassword")
b.addEventListener('blur',function(){
    let i=document.getElementById("password").value
    let k=document.getElementById("checkPassword").value
    let j=document.getElementById("checkid")
if(i!=k){
    j.innerHTML='<i class="fa-solid fa-circle-xmark"></i>'
}
else{
    j.innerHTML='<i class="fa-solid fa-circle-check"></i>'
}
    })
let a=this.document.getElementById("username")
a.addEventListener('blur',function(){
    let un=document.getElementById("username").value
    let us=document.getElementById("usid")
    let reg1=/^[\w]{6,18}$/
    if(reg1.test(un)){
        us.innerHTML='<i class="fa-solid fa-circle-check"></i>'
        return true
    }
    else{
        us.innerHTML='<i class="fa-solid fa-circle-xmark"></i>'
        return false
    }
})
let c=this.document.getElementById("password")
c.addEventListener('blur',function(){
    let pwd=document.getElementById("password").value
    let ps=document.getElementById('pass')
    let reg2=/^[\w]{6,18}$/
    if(reg2.test(pwd)){
        ps.innerHTML='<i class="fa-solid fa-circle-check"></i>'
        return true
    }
    else{
        ps.innerHTML='<i class="fa-solid fa-circle-xmark"></i>'
        return false
    }
})
let d=this.document.getElementById("idnum")
d.addEventListener('blur',function(){
    let xxx=document.getElementById("idnum").value
    let idp=document.getElementById("idn")
    let chkid = "0123456789ABCDEFGHJKLMNPQRSTUVXYWZIO"
    xxx=xxx.toUpperCase()
    if(xxx.search(/^[A-Z](1|2)\d{8}$/i)==-1){
        idp.innerHTML='<i class="fa-solid fa-circle-xmark"></i>'
        return false
    }
    else{
    let k=chkid.indexOf(xxx.charAt(0));
    console.log(k)
    let total=~~(k/10)+(k%10*9);
    console.log(total)
    for(let i=1;i<9;i++) {
        total+=chkid.indexOf(xxx.charAt(i))*(9-i);
    }
   total+=chkid.indexOf(xxx.charAt(9));
   console.log(total)
   if(total%10 == 0){
        idp.innerHTML='<i class="fa-solid fa-circle-check"></i>'
        return true
   }
    else{
        idp.innerHTML='<i class="fa-solid fa-circle-xmark"></i>'
        return false
    }
}      
})
let e=this.document.getElementById("email")
e.addEventListener('blur',function(){
    let email_id=document.getElementById("email").value
    let email_emid=document.getElementById("emid")
    let reg3=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/
    if(reg3.test(email_id)){
        email_emid.innerHTML='<i class="fa-solid fa-circle-check"></i>'
        return true
    }
    else{
        email_emid.innerHTML='<i class="fa-solid fa-circle-xmark"></i>'
        return false
    }
})
let p=this.document.getElementById("phonenum")
p.addEventListener('blur',function(){
    let phone_num=document.getElementById("phonenum").value
    let phone_id=document.getElementById("phone_id")
    let reg4=/^[0]{1}[9]{1}[0-9]{8}$/
    if(reg4.test(phone_num)){
        phone_id.innerHTML='<i class="fa-solid fa-circle-check"></i>'
        return true
    }
    else{
        phone_id.innerHTML='<i class="fa-solid fa-circle-xmark"></i>'
        return false
    }
})
})

function checkAll(){
    let un=document.getElementById("username").value
    let reg1=/^[\w]{6,18}$/
    if(!reg1.test(un)){
        alert('欄位有誤')
        return false
    }
    else{
    let pwd=document.getElementById("password").value
    let reg2=/^[\w]{6,18}$/
    if(!reg2.test(pwd)){
        alert('欄位有誤')
        return false
    }
    else{
        let i=document.getElementById("password").value
        let k=document.getElementById("checkPassword").value
    if(i!=k){
        alert('欄位有誤')
        return false
    }
    else{
        let xxx=document.getElementById("idnum").value
        let chkid = "0123456789ABCDEFGHJKLMNPQRSTUVXYWZIO"
        xxx=xxx.toUpperCase()
        if(xxx.search(/^[A-Z](1|2)\d{8}$/i)==-1){
            alert('欄位有誤')
            return false
        }
        else{
        let k=chkid.indexOf(xxx.charAt(0));
        let total=~~(k/10)+(k%10*9);
        for(let i=1;i<9;i++) {
            total+=chkid.indexOf(xxx.charAt(i))*(9-i);
        }
       total+=chkid.indexOf(xxx.charAt(9));
       if(total%10 != 0){
        alert('欄位有誤')
            return false
       }
        else{
        let email_id=document.getElementById("email").value
        let reg3=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/
        if(!reg3.test(email_id)){
        alert('欄位有誤')
        return false
        }
        else{
        let phone_num=document.getElementById("phonenum").value
        let reg4=/^[0]{1}[9]{1}[0-9]{8}$/
        if(!reg4.test(phone_num)){
            alert('欄位有誤')
            return false
        }
        else{
            return true
        }
        }
        }
    }
    }
    }
}
}
