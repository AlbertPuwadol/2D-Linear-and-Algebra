
% Copyright 2019 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Name of author
%                Email of author

function [ A_out, b_out ] = guassjordan_spark1( A, b )

  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  [ bT, ...
    bB ] = FLA_Part_2x1( b, ...
                         0, 'FLA_TOP' );

  while ( size( ATL, 1 ) < size( A, 1 ) )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    [ b0, ...
      beta1, ...
      b2 ] = FLA_Repart_2x1_to_3x1( bT, ...
                                    bB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%
    
    if alpha11 == 0
        i = 1
        while a21(i) == 0
            i = i+1;
        end
        
        tempalpha11 = alpha11;
        tempa10t = a10t;
        tempa12t = a12t;
        
        alpha11 = a21(i);
        a10t = A20(i,:);
        a12t = A22(i,:);
        
        a21(i) = tempalpha11
        A20(i,:) = tempa10t;
        A22(i,:) = tempa12t;
        
        tempbeta1 = beta1;
        beta1 = b2(i);
        b2(i) = tempbeta1;

    end

    a01 = a01/alpha11;
    a21 = a21/alpha11;
    A02 = A02 - a01*a12t;
    A22 = A22 - a21*a12t;
    b0 = b0 - beta1*a01;
    b2 = b2 - beta1*a21;
    a01 = set_to_zero_unb(a01);
    a21 = set_to_zero_unb(a21);

    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

    [ bT, ...
      bB ] = FLA_Cont_with_3x1_to_2x1( b0, ...
                                       beta1, ...
                                       b2, ...
                                       'FLA_TOP' );

  end

  A_out = [ ATL, ATR
            ABL, ABR ];

  b_out = [ bT
            bB ];

return
