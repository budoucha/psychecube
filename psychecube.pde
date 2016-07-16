
int div=16;
int t=0;
float du, r;


void setup() {
  //Select Size
  //fullScreen(P3D, 1);
  //size(1920,1080,P3D);
  size(1280, 720, P3D);
  colorMode(HSB);
  du= max(width, height)/2;  //描画全般関連基本単位
  r= du/16;  //同心円上配置関連基本単位
} 


void draw() {
  t++;
  background(t%256, 255, 192+64*cos(t*PI/12));  //背景の明滅

  translate(width/2, height/2, -du);  //原点を画面中心に設定

  rotateZ(t*PI/360);                //全体の経時回転
  for (int k=0; k<14; k++) {        //同心円数
    rotateZ(t*PI/1200);             //回転速度の外周部補正

    for (int i=0; i<div; i++) {      //円周上配置
      rotateZ(2*PI/div);

      pushMatrix();
      translate(k*r, 1.2*r+k*k*r*0.25, 0);  //円の中心からの相対描画位置設定

      //立方体
      pushMatrix();
      rotateY(k*2*PI/div+t*PI/48);      //捩量設定
      fill(i*255/div, 216, 216, 128);
      strokeWeight(du/384);
      stroke(255, 48);
      box(r*1.56+k*r/2.6);        //立方体描画
      popMatrix();

      //直線
      pushMatrix();
      translate(0, 0, du/4);  //直線描画面深度の設定
      strokeWeight(du/280);
      stroke(255, 56);
      line(0, 0, 0, -16*du);    //直線描画
      popMatrix();

      popMatrix();
    }
  }
  
 //saveFrame("frame#####.png"); //静止画保存
 if(frameCount>32004){exit();}
}