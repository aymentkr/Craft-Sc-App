import 'dart:math';

  String calculer(int age,double height,double weight,String selectedGender){
    String msg;
    double y,z;
    height *= 100;
    double x = weight/ pow(height,2);
    print(pow(1.2,2));
    print(pow(height,2));
    print(height);
   if (selectedGender == "Male") y = height - 100 - ((height-150)/4);
   else y = height - 100 - ((height-150)/2.5);
   if (x<16.5)
    msg = "dénutrition ou anorexie";
    else if (x>=16.5 && x <= 18.5)
    msg = "maigreur";
    else if (x>= 18.5 && x <=25)
    msg = "corpulence normale";
    else if (x >=25 && x <= 30)
    msg = "surpoids";
    else if ( x>=30 && x <=35) 
    msg = "obésité modérée";
    else if (x>=35 && x <=40)
    msg = "obésité sévère";
    else
    msg = "obésité morbide ou massive";
       z=(weight/y) *100;
       y = num.parse(y.toStringAsFixed(2));
       z = num.parse(z.toStringAsFixed(2));
       return msg + "\n\n le poids ideal de votre taille est ="+ y.toString()+ "\nTu as achevé "+ z.toString()+ "% il vous reste seulement " +
       (100-z).toStringAsFixed(2) +"% à completer qui est égale à"+ (y-weight).toString()+" kg";
  }
