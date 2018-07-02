( function _Look_tools_test_s_() {

'use strict';

if( typeof module !== 'undefined' )
{

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      toolsPath = require.resolve( toolsPath );
    }
    catch( err )
    {
      toolsExternal = 1;
      require( 'wTools' );
    }
    if( !toolsExternal )
    require( toolsPath );
  }

  var _ = _global_.wTools;

  _.include( 'wTesting' );

}

var _global = _global_;
var _ = _global_.wTools;

// --
// tests
// --

function entityIdenticalSimple( test )
{

  test.description = 'null - undefined';

  var expected = true;
  debugger;
  var got = _.entityIdentical( null, null );
  debugger;
  test.identical( got, expected );
  debugger;

  var expected = true;
  var got = _.entityIdentical( undefined, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( null, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( undefined, null );
  test.identical( got, expected );

  /* */

  test.description = 'number - number';

  var expected = true;
  var got = _.entityIdentical( 1, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 1, 1 + 1e-15 );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( 0, 0 );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( NaN, NaN );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( Infinity, Infinity );
  test.identical( got, expected );

  /* */

  test.description = 'number - not number';

  var expected = false;
  var got = _.entityIdentical( 1, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 0, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 0, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( NaN, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( Infinity, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 3, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 3, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 3, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 3, new Float32Array( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 3, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 3, function(){} );
  test.identical( got, expected );

  /* */

  test.description = 'String - String';

  var expected = true;
  var got = _.entityIdentical( '', '' );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( 'abc', 'abc' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', 'abc' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', '' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'ab', 'c' );
  test.identical( got, expected );

  /* */

  test.description = 'String - not String';

  var expected = false;
  var got = _.entityIdentical( '', new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', new Float32Array( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', new RegExp( '' ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', function(){} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', new Float32Array( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', function(){} );
  test.identical( got, expected );

  /* */

  test.description = 'RegExp - RegExp';

  var expected = true;
  var got = _.entityIdentical( new RegExp( '' ), new RegExp( '' ) );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( /abc/, /abc/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( /abc/iy, /abc/yi );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( new RegExp( 'abc' ), /abc/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( new RegExp( 'abc','i' ), /abc/i );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/i, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/i, /abc/yi );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, new RegExp( '' ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /ab/, /c/ );
  test.identical( got, expected );

  /* */

  test.description = 'RegExp - not RegExp';

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), new Float32Array( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), function(){} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, new Float32Array( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, function(){} );
  test.identical( got, expected );

  /* */

  test.description = 'Routine - Routine';

  var func1 = function func(){};
  var func2 = function func(){};

  var expected = true;
  var got = _.entityIdentical( func1, func1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, func2 );
  test.identical( got, expected );

  /* */

  test.description = 'Routine - not Routine';

  var expected = false;
  var got = _.entityIdentical( func1, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, new Float32Array( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, function(){} );
  test.identical( got, expected );

  /* */

  test.description = 'Date - Date';

  var expected = true;
  var got = _.entityIdentical( new Date(), new Date() );
  test.identical( got, expected );

  var expected = false;
  var src1 = new Date();
  var src2 = new Date();
  src2.setFullYear( 1987 );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  /* */

  test.description = 'Date - not Date';

  var expected = false;
  var got = _.entityIdentical( new Date(), '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), new Float32Array( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), function(){} );
  test.identical( got, expected );

  /* */

  test.description = 'Array - Array';

  var expected = true;
  var got = _.entityIdentical( [], [] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( [ 0 ], [ 0 ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( [ 1 ], [ 1 ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( [ undefined ], [ undefined ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( [ null ], [ null ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( [ [ 1,2,3 ] ], [ [ 1,2,3 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ [ 1,2 ] ], [ [ 1,2,3 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ [ 1,2 ] ], [ [ 1 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ [ 1,3 ] ], [ 1,3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ null ], [ undefined ] );
  test.identical( got, expected );

  /* */

  test.description = 'Array - not Array';

  var expected = false;
  var got = _.entityIdentical( [], '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], new Float32Array( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], new RegExp( '' ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], function(){} );
  test.identical( got, expected );

  /* */

  var expected = false;
  var got = _.entityIdentical( [ '1' ], '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ undefined ], undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ null ], null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ NaN ], NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ 0 ], 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ 1 ], 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ {} ], {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ new Date() ], new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ new Float32Array( 3 ) ], new Float32Array( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ new RegExp( '' ) ], new RegExp( '' ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ function(){} ], function(){} );
  test.identical( got, expected );

  /* */

  test.description = 'Map - Map';

  var expected = true;
  var got = _.entityIdentical( {}, {} );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( { a : 0 }, { a : 0 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( { a : 1 }, { a : 1 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( { a : undefined }, { a : undefined } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( { a : null }, { a : null } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( { a : { b : 1 } }, { a : { b : 1 } } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : { b : 1 } }, { a : { b : 1, c : 2 } } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : { b : 1, c : 2 } }, { a : { b : 1 } } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : { b : 1, c : 3 } }, { b : 1, c : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : null }, { a : undefined } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : undefined }, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, { a : undefined } );
  test.identical( got, expected );

  /* */

  test.description = 'Map - not Map';

  var expected = false;
  var got = _.entityIdentical( {}, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, new Float32Array( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, new RegExp( '' ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, function(){} );
  test.identical( got, expected );

  /* */

  var expected = false;
  var got = _.entityIdentical( { a : '1' }, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : undefined }, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : null }, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : NaN }, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : 0 }, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : 1 }, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : {} }, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : new Date() }, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : new Float32Array( 3 ) }, new Float32Array( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : new RegExp( '' ) }, new RegExp( '' ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : function(){} }, function(){} );
  test.identical( got, expected );

  /* qqq : add typed / raw / node / view buffers tests */

}

//

function entityEqualBuffers( test )
{
  var c = this;

  test.description = 'entityIdentical of float buffers with NaNs, same type';

  var src1 =
  {
    min : new Float64Array([ NaN,NaN ]),
    max : new Float64Array([ NaN,NaN ]),
  }

  var src2 =
  {
    min : new Float64Array([ NaN,NaN ]),
    max : new Float64Array([ NaN,NaN ]),
  }

  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.description = 'entityEquivalent of float buffers with NaNs, same type';

  var src1 =
  {
    min : new Float64Array([ NaN,NaN ]),
    max : new Float64Array([ NaN,NaN ]),
  }

  var src2 =
  {
    min : new Float64Array([ NaN,NaN ]),
    max : new Float64Array([ NaN,NaN ]),
  }

  var expected = true;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.description = 'entityIdentical of float buffers with NaNs, different types';

  var src1 =
  {
    min : new Float32Array([ NaN,NaN ]),
    max : new Float32Array([ NaN,NaN ]),
  }

  var src2 =
  {
    min : new Float64Array([ NaN,NaN ]),
    max : new Float64Array([ NaN,NaN ]),
  }

  var expected = false;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.description = 'entityEquivalent of float buffers with NaNs, different types';

  var src1 =
  {
    min : new Float32Array([ NaN,NaN ]),
    max : new Float32Array([ NaN,NaN ]),
  }

  var src2 =
  {
    min : new Float64Array([ NaN,NaN ]),
    max : new Float64Array([ NaN,NaN ]),
  }

  var expected = true;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

}

//

function entityIdenticalCycled( test )
{
  var c = this;

  test.description = 'trivial array';

  var expected = true;
  var got = _.entityIdentical( [ 1,3 ], [ 1,3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ 1 ], [ 1,3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ 1,3 ], [ 1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ [ 1,2 ] ], [ [ 1,2,3 ] ] );
  test.identical( got, expected );

  test.description = 'trivial map';

  var expected = true;
  var got = _.entityIdentical( { a : 1, b : 3 }, { a : 1, b : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : 1 }, { a : 1, b : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : 1, b : 3 }, { a : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : { a : 1, b : 2 } }, { a : { a : 1, b : 2, c : 3 } } );
  test.identical( got, expected );

  test.description = 'trivial mixed with routine';

  var onAtom = function(){};
  var src1 =
  {
    onAtom : onAtom,
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }
  var src2 =
  {
    onAtom : onAtom,
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }

  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  var onAtom = function(){};
  var src1 =
  {
    onAtom : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }
  var src2 =
  {
    onAtom : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }

  var expected = false;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.description = 'trivial mixed';

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var expected = true;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  var a = { e : [ 1,3,4 ] }
  var b = { e : [ 1,4,4 ] }
  var expected = false;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,4 ] } ] } }
  var expected = false;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  test.description = 'cycle';

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = true;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.x = a;
  var b = { x : 1, y : null }
  b.x = b;
  var expected = true;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : { x : 1, y : null } }
  a.y.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = false;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : { x : 1, y : null } }
  b.y.y = b;
  var expected = false;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  test.description = 'mixed cycle - equal';

  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, instances : ainstances };
  var ac1 = { f1 : af1, instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  var bc1 = { f1 : bf1, instances : binstances };
  binstances.push( bc1 );

  var expected = true;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  test.description = 'mixed cycle - different cycle a';

  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, instances : ainstances };
  ainstances.push( a );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  var bc1 = { f1 : bf1, instances : binstances };
  binstances.push( bc1 );

  var expected = false;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  test.description = 'mixed cycle - different cycle b';

  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, instances : ainstances };
  var ac1 = { f1 : af1, instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  binstances.push( b );

  var expected = false;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

}

//

function entityIdenticalCycledWithOptions( test )
{
  var c = this;

  /* */

  var onUpPaths = [];
  function onUp( e, k, it )
  {
    onUpPaths.push( it.path );
    return it.result;
  }

  /* */

  var onDownPaths = [];
  function onDown( e, k, it )
  {
    onDownPaths.push( it.path );
    return it.result;
  }

  /* */

  function clean()
  {
    onUpPaths = [];
    onDownPaths = [];
    opt = { onUp : onUp, onDown : onDown };
  }

  var opt = null;

  /* */

  test.description = 'trivial array';

  clean();
  var expected = true;
  var got = _.entityIdentical( [ 1,3 ], [ 1,3 ], opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/0', '/1' ] );
  test.identical( onDownPaths, [ '/0', '/1', '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( [ 1 ], [ 1,3 ], opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/' ] );
  test.identical( onDownPaths, [ '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( [ 1,3 ], [ 1 ], opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/' ] );
  test.identical( onDownPaths, [ '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( [ [ 1,2 ] ], [ [ 1,2,3 ] ], opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/0' ] );
  test.identical( onDownPaths, [ '/0', '/' ] );

  test.description = 'trivial map'; /* */

  clean();
  var expected = true;
  var got = _.entityIdentical( { a : 1, b : 3 }, { a : 1, b : 3 }, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/a', '/b' ] );
  test.identical( onDownPaths, [ '/a', '/b', '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( { a : 1 }, { a : 1, b : 3 }, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/' ] );
  test.identical( onDownPaths, [ '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( { a : 1, b : 3 }, { a : 1 }, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/' ] );
  test.identical( onDownPaths, [ '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( { a : { a : 1, b : 2 } }, { a : { a : 1, b : 2, c : 3 } }, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/a' ] );
  test.identical( onDownPaths, [ '/a', '/' ] );

  test.description = 'trivial mixed with routine'; /* */

  var onAtom = function(){};
  var src1 =
  {
    onAtom : onAtom,
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }
  var src2 =
  {
    onAtom : onAtom,
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }

  clean();
  var expected = true;
  var got = _.entityIdentical( src1, src2, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/onAtom', '/name', '/takingArguments', '/takingArguments/0', '/takingArguments/1' ] );
  test.identical( onDownPaths, [ '/onAtom', '/name', '/takingArguments/0', '/takingArguments/1', '/takingArguments', '/' ] );

  var onAtom = function(){};
  var src1 =
  {
    onAtom : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }
  var src2 =
  {
    onAtom : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }

  clean();
  var expected = false;
  var got = _.entityIdentical( src1, src2, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/onAtom' ] );
  test.identical( onDownPaths, [ '/onAtom', '/' ] );

  test.description = 'trivial mixed'; /* */

  clean();
  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var expected = true;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/a', '/a/0', '/b', '/b/c', '/b/c/0', '/b/c/0/d', '/b/c/0/e', '/b/c/0/e/0', '/b/c/0/e/1' ] );
  test.identical( onDownPaths, [ '/a/0', '/a', '/b/c/0/d', '/b/c/0/e/0', '/b/c/0/e/1', '/b/c/0/e', '/b/c/0', '/b/c', '/b', '/' ] );

  clean();
  var a = { e : [ 1,3 ] }
  var b = { e : [ 1,4 ] }
  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/e', '/e/0', '/e/1' ] );
  test.identical( onDownPaths, [ '/e/0', '/e/1', '/e', '/' ] );

  clean();
  var a = { e : [ 1,3,4 ] }
  var b = { e : [ 1,4,4 ] }
  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/e', '/e/0', '/e/1' ] );
  test.identical( onDownPaths, [ '/e/0', '/e/1', '/e', '/' ] );

  clean();
  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,4 ] } ] } }
  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/a', '/a/0', '/b', '/b/c', '/b/c/0', '/b/c/0/d', '/b/c/0/e', '/b/c/0/e/0', '/b/c/0/e/1' ] );
  test.identical( onDownPaths, [ '/a/0', '/a', '/b/c/0/d', '/b/c/0/e/0', '/b/c/0/e/1', '/b/c/0/e', '/b/c/0', '/b/c', '/b', '/' ] );

  test.description = 'cycle'; /* */

  clean();
  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = true;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/x', '/y' ] );
  test.identical( onDownPaths, [ '/x', '/y', '/' ] );

  clean();
  var a = { x : 1, y : null }
  a.x = a;
  var b = { x : 1, y : null }
  b.x = b;
  var expected = true;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/x', '/y' ] );
  test.identical( onDownPaths, [ '/x', '/y', '/' ] );

  clean();
  var a = { x : { x : 1, y : null }, y : null }
  a.x.x = a;
  var b = { x : 1, y : null }
  b.x = b;
  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/x' ] );
  test.identical( onDownPaths, [ '/x', '/' ] );

  clean();
  var a = { x : 1, y : { x : 1, y : null } }
  a.y.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/x', '/y' ] );
  test.identical( onDownPaths, [ '/x', '/y', '/' ] );

  clean();
  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : { x : 1, y : null } }
  b.y.y = b;
  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/x', '/y', '/y/x', '/y/y' ] );
  test.identical( onDownPaths, [ '/x', '/y/x', '/y/y', '/y', '/' ] );

  test.description = 'mixed cycle - equal'; /* */

  clean();
  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, instances : ainstances };
  var ac1 = { f1 : af1, instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  var bc1 = { f1 : bf1, instances : binstances };
  binstances.push( bc1 );

  var expected = true;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/f1', '/instances', '/instances/0', '/instances/0/f1', '/instances/0/instances' ] );
  test.identical( onDownPaths, [ '/f1', '/instances/0/f1', '/instances/0/instances', '/instances/0', '/instances', '/' ] );

  test.description = 'mixed cycle - different cycle a'; /* */

  clean();
  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, instances : ainstances };
  ainstances.push( a );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  var bc1 = { f1 : bf1, instances : binstances };
  binstances.push( bc1 );

  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/f1', '/instances', '/instances/0', '/instances/0/f1', '/instances/0/instances' ] );
  test.identical( onDownPaths, [ '/f1', '/instances/0/f1', '/instances/0/instances', '/instances/0', '/instances', '/' ] );

  test.description = 'mixed cycle - different cycle b'; /* */

  clean();
  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, instances : ainstances };
  var ac1 = { f1 : af1, instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  binstances.push( b );

  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/f1', '/instances', '/instances/0' ] );
  test.identical( onDownPaths, [ '/f1', '/instances/0', '/instances', '/' ] );

}

//

function entityEquivalentCycled( test )
{
  var c = this;

  test.description = 'trivial array';

  var expected = true;
  var got = _.entityEquivalent( [ 1,3 ], [ 1,3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityEquivalent( [ 1 ], [ 1,3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityEquivalent( [ 1,3 ], [ 1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityEquivalent( [ [ 1,2 ] ], [ [ 1,2,3 ] ] );
  test.identical( got, expected );

  test.description = 'trivial map';

  var expected = true;
  var got = _.entityEquivalent( { a : 1, b : 3 }, { a : 1, b : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityEquivalent( { a : 1 }, { a : 1, b : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityEquivalent( { a : 1, b : 3 }, { a : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityEquivalent( { a : { a : 1, b : 2 } }, { a : { a : 1, b : 2, c : 3 } } );
  test.identical( got, expected );

  /* */

  test.description = 'trivial mixed with routine';

  var onAtom = function(){};
  var src1 =
  {
    onAtom : onAtom,
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }
  var src2 =
  {
    onAtom : onAtom,
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }

  var expected = true;
  var got = _.entityEquivalent( src1, src2 );

  test.identical( got, expected );
  var onAtom = function(){};
  var src1 =
  {
    onAtom : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }
  var src2 =
  {
    onAtom : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }

  var expected = false;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  /* */

  test.description = 'trivial mixed';

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  var a = { e : [ 1,3,4 ] }
  var b = { e : [ 1,4,4 ] }
  var expected = false;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,4 ] } ] } }
  var expected = false;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  test.description = 'cycle';

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.x = a;
  var b = { x : 1, y : null }
  b.x = b;
  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : { x : 1, y : null } }
  a.y.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : { x : 1, y : null } }
  b.y.y = b;
  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  /* */

  test.description = 'mixed cycle - equal';

  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, instances : ainstances };
  var ac1 = { f1 : af1, instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  var bc1 = { f1 : bf1, instances : binstances };
  binstances.push( bc1 );

  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  /* */

  test.description = 'mixed cycle - different cycle a';

  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, instances : ainstances };
  ainstances.push( a );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  var bc1 = { f1 : bf1, instances : binstances };
  binstances.push( bc1 );

  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  /* */

  test.description = 'mixed cycle - different cycle b';

  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, instances : ainstances };
  var ac1 = { f1 : af1, instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  binstances.push( b );

  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

}

//

function entityContain( test )
{
  var c = this;

  /* */

  test.description = 'trivial array';

  var expected = true;
  var got = _.entityContain( [ 1,3 ], [ 1,3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContain( [ 1 ], [ 1,3 ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContain( [ 1,3 ], [ 1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContain( [ [ 1,2 ] ], [ [ 1,2,3 ] ] );
  test.identical( got, expected );

  /* */

  test.description = 'trivial map';

  var expected = true;
  var got = _.entityContain( { a : 1, b : 3 }, { a : 1, b : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContain( { a : 1 }, { a : 1, b : 3 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContain( { a : 1, b : 3 }, { a : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContain( { a : { a : 1, b : 2 } }, { a : { a : 1, b : 2, c : 3 } } );
  test.identical( got, expected );

  /* */

  test.description = 'trivial mixed';

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var expected = true;
  var got = _.entityContain( a, b );
  test.identical( got, expected );

  var a = { e : [ 1,3,4 ] }
  var b = { e : [ 1,4,4 ] }
  var expected = false;
  var got = _.entityContain( a, b );
  test.identical( got, expected );

  var a = { e : [ 1,4,3 ] }
  var b = { e : [ 1,4 ] }
  var expected = true;
  var got = _.entityContain( a, b );
  test.identical( got, expected );

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,4,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,4 ] } ] } }
  var expected = true;
  var got = _.entityContain( a, b );
  test.identical( got, expected );

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,4 ] } ] } }
  var expected = false;
  var got = _.entityContain( a, b );
  test.identical( got, expected );

  /* */

  test.description = 'cycle';

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = true;
  var got = _.entityContain( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.x = a;
  var b = { x : 1, y : null }
  b.x = b;
  var expected = true;
  var got = _.entityContain( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : { x : 1, y : null } }
  a.y.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = false;
  var got = _.entityContain( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : { x : 1, y : null } }
  b.y.y = b;
  var expected = false;
  var got = _.entityContain( a, b );
  test.identical( got, expected );

}

//

function _entityEqualLoose( test )
{

  /* default options */

  test.description = 'default options, number';
  var got = _._entityEqual( 1, 1 );
  var expected = true ;
  test.identical( got, expected );

  test.description = 'default options, string';
  var got = _._entityEqual( '123', '123' );
  var expected = true ;
  test.identical( got, expected );

  test.description = 'default options, boolean';
  var got = _._entityEqual( 0, false );
  var expected = false;
  test.identical( got, expected );

  test.description = 'default options, array';
  var got = _._entityEqual( [ 1, 2 ,'3'], [ 1, 2, 3 ] );
  var expected = false ;
  test.identical( got, expected );

  test.description = 'default options, object';
  var src1 = { a : 1, b : 2 , c : { d : 3  }  };
  var src2 = { a : 1, b : 2 , c : { d : 3  }  };
  var got = _._entityEqual( src1, src2 );
  var expected = true ;
  test.identical( got, expected );

  /* strict string - number */

  test.description = 'number & string, strictNumbering : 0, strictTyping : 0';
  debugger;
  var got = _._entityEqual( '123', 123, { strictNumbering : 0, strictTyping : 0 } );
  debugger;
  var expected = true ;
  test.identical( got, expected );

  test.description = 'number & string, strictNumbering : 1, strictTyping : 0';
  var got = _._entityEqual( '123', 123, { strictNumbering : 1, strictTyping : 0 } );
  var expected = false ;
  test.identical( got, expected );

  test.description = 'number & string, strictNumbering : 0, strictTyping : 1';
  var got = _._entityEqual( '123', 123, { strictNumbering : 0, strictTyping : 1 } );
  var expected = false ;
  test.identical( got, expected );

  test.description = 'number & string, strictNumbering : 1, strictTyping : 1';
  var got = _._entityEqual( '123', 123, { strictNumbering : 1, strictTyping : 1 } );
  var expected = false ;
  test.identical( got, expected );

  /* strict bool - number */

  test.description = 'number & boolean, strictNumbering : 0, strictTyping : 0';
  var got = _._entityEqual( false, 0, { strictNumbering : 0, strictTyping : 0 } );
  var expected = true ;
  test.identical( got, expected );

  test.description = 'number & boolean, strictNumbering : 0, strictTyping : 1';
  var got = _._entityEqual( false, 0, { strictNumbering : 0, strictTyping : 1 } );
  var expected = false ;
  test.identical( got, expected );

  test.description = 'number & boolean, strictNumbering : 1, strictTyping : 0';
  var got = _._entityEqual( false, 0, { strictNumbering : 1, strictTyping : 0 } );
  var expected = false ;
  test.identical( got, expected );

  test.description = 'number & boolean, strictNumbering : 1, strictTyping : 1';
  var got = _._entityEqual( false, 0, { strictNumbering : 1, strictTyping : 1 } );
  var expected = false ;
  test.identical( got, expected );

  /* */

  test.description = 'src1 constains elem from src2 ';
  var got = _._entityEqual( { a : 1, b : 2 }, { b : 2 }, { contain : 1 } );
  var expected = true ;
  test.identical( got, expected );

  test.description = 'onNumbersAreEqual';
  function onNumbersAreEqual( a, b ){ return _.entityEquivalent( a, b, { accuracy : 1 } ) };
  var got = _._entityEqual( { a : 1, b : 2 }, { a : 2, b : 2 }, { onNumbersAreEqual : onNumbersAreEqual } );
  var expected = true ;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.description = 'argument missed';
  test.shouldThrowError( function()
  {
    _._entityEqual( );
  });

  test.description = 'options is not a Object';
  test.shouldThrowError( function()
  {
    _._entityEqual( 1, 2, 3 );
  });

  test.description = 'extendet options';
  test.shouldThrowError( function()
  {
    _._entityEqual( 1, 2, { fixed : 1 } );
  });

}

//

function entityIdenticalLoose( test )
{

  var options =
  {
    strictTyping : 0,
  };

  /* numbers */

  var x1 = 44;
  var y1 = 44;
  var x2 = 44;
  var y2 = 34;

  /* strings */

  var strX1 = '4';
  var strY1 = 4;
  var strX2 = '0';
  var strY2 = '0';
  var strX3 = '0';
  var strY3 = new String( '0' );

  /* array values */

  var arrX1 = [ 0, 1, 3 ];
  var arrY1 = [ 0, 1, 3 ];
  var arrX2 = [ 0, 1, 3 ];
  var arrY2 = [ 0, 1, 2 ];

  /* object values */

  var objX1 = { a : 0, b : 1, c : 3 };
  var objY1 = { a : 0, b : 1, c : 3 };
  var objX2 = { a : 0, b : 1, c : 3 };
  var objY2 = { a : 0, b : 1, c : 2 };
  var objX3 = { a : 0, b : 1, e : { c : 2, d : 3 } };
  var objY3 = { a : 0, b : 1, e : { c : 2, d : 3 } };

  /* numbers test */

  test.description = 'identical numbers';
  var got = _.entityIdentical( x1, y1 );
  test.identical( got, true );

  test.description = 'not identical numbers';
  var got = _.entityIdentical( x2, y2 );
  test.identical( got, false );

  // strings test

  test.description = 'same string';
  var got = _.entityIdentical( strX1, strX1 );
  test.identical( got, true );

  test.description = 'mismatch types : no strict';
  var got = _.entityIdentical( strX1, strX1, _.mapExtend( null, options ) );
  test.identical( got, true );

  test.description = 'entities is two non empty same strings';
  var got = _.entityIdentical( strX2, strY2 );
  test.identical( got, true );

  test.description = 'string and object';
  debugger;
  var got = _.entityIdentical( strX3, strY3, _.mapExtend( null, options ) );
  debugger;
  test.identical( got, true );

  // array tests

  test.description = 'tests two non empty arrays';
  var got = _.entityIdentical( arrX1, arrY1 );
  test.identical( got, true );

  test.description = 'tests two non empty different arrays';
  var got = _.entityIdentical( arrX2, arrY2 );
  test.identical( got, false );

  // object tests

  test.description = 'tests two non empty objects';
  var got = _.entityIdentical( objX1, objY1 );
  test.identical( got, true );

  test.description = 'tests two different objects';
  var got = _.entityIdentical( objX2, objY2 );
  test.identical( got, false );

  test.description = 'tests nested objects';
  var got = _.entityIdentical( objX3, objY3 );
  test.identical( got, true );

  if( !Config.debug )
  return;

  test.description = 'missed arguments';
  test.shouldThrowError( function()
  {
    _.entityIdentical();
  });

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.entityIdentical( strX3, strY3, {}, '' );
  });

};

//

function entityEquivalentLoose( test )
{
  var accuracy = 1e-5;

  var options =
  {
    accuracy : accuracy
  }

  /* numbers */

  var x1 = 44;
  var y1 = 44;
  var x2 = 44;
  var y2 = 44 + accuracy / 2;
  var x3 = 44;
  var y3 = 44 + 2 * accuracy;

  /* numbers test */

  test.description = 'identical numbers';
  var got = _.entityEquivalent( x1, y1, _.mapExtend( null, options ) );
  test.identical( got, true );

  test.description = ' practically equivalent numbers';
  var got = _.entityEquivalent( x2, y2, _.mapExtend( null, options ) );
  test.identical( got, true );

  test.description = ' not equivalent numbers';
  var got = _.entityEquivalent( x3, y3, _.mapExtend( null, options ) );
  test.identical( got, false );

  if( !Config.debug )
  return;

  test.description = 'missed arguments';
  test.shouldThrowError( function()
  {
    _.entityEquivalent();
  });

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.entityEquivalent( strX3, strY3, options, '');
  });

};

//

function entityContainLoose( test )
{

  /* numbers */

  var x1 = 44;
  var y1 = 44;
  var x2 = 44;
  var y2 = 34;

  /* strings */

  var strX1 = '4';
  var strY1 = 4;
  var strX2 = '0';
  var strY2 = '0';
  var strX3 = '0';
  var strY3 = new String( '0' );

  /* array values */

  var arrX1 = [ 0, 1, 3 ];
  var arrY1 = [ 0, 1, 3 ];
  var arrX2 = [ 0, 1, 3 ];
  var arrY2 = [ 0, 1, 2 ];
  var arrX3 = [ 0, 1, 3 ];
  var arrY3 = [ 0, 1 ];
  var arrX4 = [ [ 0, 1 ] ];
  var arrY4 = [ 0, 1 ];
  var arrX5 = [ [ 0, 1 ], [ 3, 4 ] ];
  var arrY5 = [ [ 0 ], [ 3 ] ];

  /* object values */

  var objX1 = { a : 0, b : 1, c : 3 };
  var objY1 = { a : 0, b : 1, c : 3 };
  var objX2 = { a : 0, b : 1, c : 3 };
  var objY2 = { a : 0, b : 1, c : 2 };
  var objX3 = { a : 0, b : 1, e : { c : 2, d : 3 } };
  var objY3 = { a : 0, b : 1, e : { c : 2, d : 3 } };
  var objX4 = { a : 0, b : 1, e : { c : 2, d : 3 } };
  var objY4 = { a : 0, e : { d : 3 } };

  /* array tests */

  test.description = 'tests two non empty arrays : same length';
  var got = _.entityContain( arrX1, arrY1 );
  test.identical( got, true );

  test.description = 'tests two non empty different arrays';
  var got = _.entityContain( arrX2, arrY2 );
  test.identical( got, false );

  test.description = 'one array contains other`s elements';
  var got = _.entityContain( arrX3, arrY3 );
  test.identical( got, true );

  test.description = 'one array contains other as element';
  var got = _.entityContain( arrX4, arrY4 );
  test.identical( got, false );

  test.description = 'nested arrays';
  var got = _.entityContain( arrX5, arrY5 );
  test.identical( got, true );

  /* object tests */

  test.description = 'tests two non empty objects : identical keys';
  var got = _.entityContain( objX1, objY1 );
  test.identical( got, true );

  test.description = 'tests two different objects : identical keys';
  var got = _.entityContain( objX2, objY2 );
  test.identical( got, false );

  test.description = 'tests nested objects : identical';
  var got = _.entityContain( objX3, objY3 );
  test.identical( got, true );

  test.description = 'one object contains elements of another';
  var got = _.entityContain( objX4, objY4 );
  test.identical( got, true );

  if( !Config.debug )
  return;

  test.description = 'missed arguments';
  test.shouldThrowError( function()
  {
    _.entityContain();
  });

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.entityContain( strX3, strY3, options, '');
  });

}

//

function entityDiffLoose( test )
{

  /* returns false if same */

  test.description = 'number';
  var got = _.entityDiff( 1, 1 );
  var expected = false ;
  test.identical( got, expected );

  test.description = 'strings';
  debugger;
  var got = _.entityDiff( 'abc', 'abd' );
  debugger;
  var expected =
  [
    'src1 :',
    'abc',
    'src2 :',
    'abd ',
    'difference :',
    'ab*'
  ].join('\n');
  test.identical( got, expected );

  test.description = 'arrays';
  debugger;
  var got = _.entityDiff( [ 1, 2, 3 ], [ 1, 2, 4 ] );
  debugger;
  var expected =
`at /2
src1 :
[ 1, 2, 3 ]
src2 :
[ 1, 2, 4 ]
difference :
[ 1, 2, *`;
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

  test.description = 'objects,custom path';
  var src1 = { a : { a : 1, b : '2' }, b : [ 1,2 ] };
  var src2 = { a : { a : 1, b : '2' } };
  var got = _.entityDiff( src1, src2 );
  var expected =
`src1 :
{
  a : [ Object with 2 elements ],
  b : [ Array with 2 elements ]
}
src2 :
{
  a : [ Object with 2 elements ]
}
difference :
{
  a : [ Object with 2 elements ]*`;
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

  /* */

  test.description = 'trivial mixed';

  var src1 =
  {
    f : function(){},
    a : 'reducing',
    b : [ 1,3 ],
    c : true,
  }
  var src2 =
  {
    f : function(){},
    a : 'reducing',
    b : [ 1,3 ],
    c : true,
  }

  var got = _.entityDiff( src1, src2 );
  var expected =
`at /f
src1 :
{
  f : [ routine f ],
  a : 'reducing',
  b : [ Array with 2 elements ],
  c : true
}
src2 :
{
  f : [ routine f ],
  a : 'reducing',
  b : [ Array with 2 elements ],
  c : true
}`;
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

  if( !Config.debug )
  return;

  test.description = 'argument missed';
  test.shouldThrowError( function()
  {
    _.entityDiff( );
  });

  test.description = 'invalid options type';
  test.shouldThrowError( function()
  {
    _.entityDiff( 1, 2, 3 );
  });

}

//

function look( test )
{

  var structure1 =
  {
    a : 1,
    b : 's',
    c : [ 1,3 ],
    d : [ 1,{ date : new Date() } ],
    e : function(){},
    f : new ArrayBuffer( 13 ),
    g : new Float32Array([ 1,2,3 ]),
  }

  var expectedUpPaths = [ '/', '/a', '/b', '/c', '/c/0', '/c/1', '/d', '/d/0', '/d/1', '/d/1/date', '/e', '/f', '/g' ];
  var expectedDownPaths = [ '/a', '/b', '/c/0', '/c/1', '/c', '/d/0', '/d/1/date', '/d/1', '/d', '/e', '/f', '/g', '/' ];
  var expectedUpIndinces = [ null, 0, 1, 2, 0, 1, 3, 0, 1, 0, 4, 5, 6 ];
  var expectedDownIndices = [ 0, 1, 0, 1, 2, 0, 0, 1, 3, 4, 5, 6, null ];

  var gotUpPaths = [];
  var gotDownPaths = [];
  var gotUpIndinces = [];
  var gotDownIndices = [];

  function handleUp1( e, k, it )
  {
    debugger;
    gotUpPaths.push( it.path );
    gotUpIndinces.push( it.index );
  }

  function handleDown1( e, k, it )
  {
    debugger;
    gotDownPaths.push( it.path );
    gotDownIndices.push( it.index );
  }

  debugger;
  _.look( structure1, handleUp1, handleDown1 );
  debugger;

  test.description = 'paths on up';
  test.identical( gotUpPaths, expectedUpPaths );
  test.description = 'paths on down';
  test.identical( gotDownPaths, expectedDownPaths );
  test.description = 'indices on up';
  test.identical( gotUpIndinces, expectedUpIndinces );
  test.description = 'indices on down';
  test.identical( gotDownIndices, expectedDownIndices );

}

// --
// declare
// --

var Self =
{

  name : 'Tools/base/layer2/Look',
  silencing : 1,

  context :
  {
  },

  tests :
  {

    entityIdenticalSimple : entityIdenticalSimple,
    entityEqualBuffers : entityEqualBuffers,

    entityIdenticalCycled : entityIdenticalCycled,
    entityIdenticalCycledWithOptions : entityIdenticalCycledWithOptions,
    entityEquivalentCycled : entityEquivalentCycled,
    entityContain : entityContain,

    _entityEqualLoose : _entityEqualLoose,
    entityIdenticalLoose : entityIdenticalLoose,
    entityEquivalentLoose : entityEquivalentLoose,
    entityContainLoose : entityContainLoose,
    entityDiffLoose : entityDiffLoose,

    look : look,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

})();