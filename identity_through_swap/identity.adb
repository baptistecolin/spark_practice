package body Identity is
   procedure Swap (X, Y: in out Integer) is
      T : Integer;
   begin
      T := Y;
      Y := X;
      X := T;
   end Swap;

   procedure Id (X, Y: in out Integer) is
   begin
      Swap (X,Y);
      Swap (X,Y);
   end Id;
end Identity;
