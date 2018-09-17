package Identity is
   procedure Id (X, Y: in out Integer) with
      Depends => (X => X,
                  Y => Y);

   private
   procedure Swap (X, Y: in out Integer) with
      Depends => (X => Y,
                  Y => X);
end Identity;
