( function _Functional_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
  _.include( 'wSelector' );
}

var _ = _global_.wTools;

//--
// scalar
//--

function scalarAppend( test )
{
  test.case = 'dst is undefined, src = undefined';
  var dst = undefined;
  var src = undefined;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [] );

  test.case = 'dst is undefined, src is longLike';
  var dst = undefined;
  var src = [ null, '', 1, [], [ 1, [ 2 ] ] ];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ null, '', 1, [], [ 1, [ 2 ] ] ] );

  test.case = 'dst is undefined, src = unroll';
  var dst = undefined;
  var src = _.unrollMake( [ null, '', 1 ] );
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ null, '', 1 ] );

  test.case = 'dst is undefined, src = argumentsArray';
  var dst = undefined;
  var src = _.argumentsArrayMake( [ null, '', 1 ] );
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ null, '', 1 ] );

  test.case = 'dst is undefined, src is buffer';
  var dst = undefined;
  var src = new F32x( [ 0, 2, 10 ] );
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 0, 2, 10 ] );

  test.case = 'dst is undefined, src is string';
  var dst = undefined;
  var src = 'str';
  var got = _.scalarAppend( dst, src );
  test.identical( got, 'str' );

  test.case = 'dst is undefined, src is map';
  var dst = undefined;
  var src = { 'a' : 'str' };
  var got = _.scalarAppend( dst, src );
  test.identical( got, { 'a' : 'str' } );

  /* dst is array */

  test.case = 'dst is empty array, src is empty array';
  var dst = [];
  var src = [];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst is empty array, src is null';
  var dst = [];
  var src = null;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ null ] );
  test.is( got === dst );

  test.case = 'dst is array, src = undefined';
  var dst = [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ];
  var src = undefined;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  test.is( got === dst );

  test.case = 'dst is array, src is string';
  var dst = [ 1, null, 'str', [] ];
  var src = 'str';
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], 'str' ] );
  test.is( got === dst );

  test.case = 'dst is array, src is map';
  var dst = [ 1, null, 'str', [] ];
  var src = { 'a' : 1 };
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], { 'a' : 1 } ] );
  test.is( got === dst );

  test.case = 'dst is array, src = array';
  var dst = [ 1, null, 'str', [] ];
  var src = [ 'src', 2, undefined ];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], 'src', 2, undefined ] );
  test.is( got === dst );

  /* dst is unroll */

  test.case = 'dst is empty unroll, src is empty array';
  var dst = _.unrollMake( [] );
  var src = [];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst is empty unroll, src is null';
  var dst = _.unrollMake( [] );
  var src = null;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ null ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src = undefined';
  var dst = _.unrollMake( [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  var src = undefined;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src is string';
  var dst = _.unrollMake( [ 1, null, 'str', [] ] );
  var src = 'str';
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], 'str' ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src is map';
  var dst = _.unrollMake( [ 1, null, 'str', [] ] );
  var src = { 'a' : 1 };
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], { 'a' : 1 } ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src = array';
  var dst = _.unrollMake( [ 1, null, 'str', [] ] );
  var src = [ 'src', 2, undefined ];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], 'src', 2, undefined ] );
  test.is( got === dst );

  /* dst is argumentsArray */

  test.case = 'dst is empty unroll, src is empty array';
  var dst = _.argumentsArrayMake( [] );
  var src = [];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [] );

  test.case = 'dst is empty unroll, src is null';
  var dst = _.argumentsArrayMake( [] );
  var src = null;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ null ] );

  test.case = 'dst is unroll, src = undefined';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  var src = undefined;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );

  test.case = 'dst is unroll, src is string';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [] ] );
  var src = 'str';
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], 'str' ] );

  test.case = 'dst is unroll, src is map';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [] ] );
  var src = { 'a' : 1 };
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], { 'a' : 1 } ] );

  test.case = 'dst is unroll, src = array';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [] ] );
  var src = [ 'src', 2, undefined ];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], 'src', 2, undefined ] );

  /* dst is buffer */

  test.case = 'dst is empty buffer, src = undefined';
  var dst = new U8x();
  var src = undefined;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [] );

  test.case = 'dst is empty buffer, src is empty array';
  var dst = new U8x();
  var src = [];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [] );

  test.case = 'dst is buffer, src = undefined';
  var dst = new U8x( [ 1, 2, 0, 78 ] );
  var src = undefined;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src is number';
  var dst = new I16x( [ 1, 2, 0, 78 ] );
  var src = 32;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, 2, 0, 78, 32 ] );

  test.case = 'dst is buffer, src is empty array';
  var dst = new U16x( [ 1, 2, 0, 78 ] );
  var src = [];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src = array';
  var dst = new I32x( [ 1, 2, 0, 78 ] );
  var src = [ 'str', null, undefined ];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, 2, 0, 78, 'str', null, undefined ] );

  test.case = 'dst is buffer, src is buffer';
  var dst = new U32x( [ 1, 2, 0, 78 ] );
  var src = new F32x( [ 1, 2, 3, 4 ] );
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, 2, 0, 78, 1, 2, 3, 4 ] );

  /* dst not undefined, not longLike */

  test.case = 'dst is null, src is null';
  var dst = null;
  var src = null;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ null, null ] );

  test.case = 'dst is null, src is null';
  var dst = null;
  var src = undefined;
  var got = _.scalarAppend( dst, src );
  test.identical( got, null );

  test.case = 'dst is null, src is empty array';
  var dst = null;
  var src = [];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ null ] );

  test.case = 'dst is string, src is string';
  var dst = 'str';
  var src = '';
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 'str', '' ] );

  test.case = 'dst is string, src is string';
  var dst = 'str';
  var src = undefined;
  var got = _.scalarAppend( dst, src );
  test.identical( got, 'str' );

  test.case = 'dst is number, src is string';
  var dst = 1;
  var src = [ '', 2, [], [ { a : 2 } ] ];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, '', 2, [], [ { a : 2 } ] ] );

  test.case = 'dst is map, src is buffer';
  var dst = { 'a' : 1 };
  var src = new U8x( [ 10, 20, 30 ] );
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ { 'a' : 1 }, 10, 20, 30 ] );

  /* */

  test.case = 'dst === src';
  var arr = [ 1, 2, 'str' ];
  var dst = arr;
  var src = arr;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [  1, 2, 'str',  1, 2, 'str' ] );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'wrong arguments.length';
  test.shouldThrowErrorSync( () => _.scalarAppend() );
  test.shouldThrowErrorSync( () => _.scalarAppend( 1 ) );
  test.shouldThrowErrorSync( () => _.scalarAppend( 1, 2, 'str' ) );
}

//

function scalarAppendOnce( test )
{
  test.case = 'dst is undefined, src = undefined';
  var dst = undefined;
  var src = undefined;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [] );

  test.case = 'dst is undefined, src is longLike';
  var dst = undefined;
  var src = [ null, '', 1, [], [ 1, [ 2 ] ], null, 1 ];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ null, '', 1, [], [ 1, [ 2 ] ] ] );

  test.case = 'dst is undefined, src = unroll';
  var dst = undefined;
  var src = _.unrollMake( [ null, '', 1 , null, '', 1 ] );
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ null, '', 1 ] );

  test.case = 'dst is undefined, src = argumentsArray';
  var dst = undefined;
  var src = _.argumentsArrayMake( [ null, '', 1 , null, '', 1 ] );
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ null, '', 1 ] );

  test.case = 'dst is undefined, src is buffer';
  var dst = undefined;
  var src = new F32x( [ 0, 2, 10, 0, 2, 10 ] );
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 0, 2, 10 ] );

  test.case = 'dst is undefined, src is string';
  var dst = undefined;
  var src = 'str';
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, 'str' );

  test.case = 'dst is undefined, src is map';
  var dst = undefined;
  var src = { 'a' : 'str' };
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, { 'a' : 'str' } );

  /* dst is array */

  test.case = 'dst is empty array, src is empty array';
  var dst = [];
  var src = [];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst is empty array, src is null';
  var dst = [];
  var src = null;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ null ] );
  test.is( got === dst );

  test.case = 'dst is array, src = undefined';
  var dst = [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ], [ 1, [ 2 ] ] ];
  var src = undefined;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ], [ 1, [ 2 ] ] ] );
  test.is( got === dst );

  test.case = 'dst is array, src is string';
  var dst = [ 1, null, 'str', [], 1 ];
  var src = 'str';
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [], 1 ] );
  test.is( got === dst );

  test.case = 'dst is array, src is map';
  var dst = [ 1, null, 'str', [], { 'a' : 1 } ];
  var src = { 'a' : 1 };
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [], { 'a' : 1 }, { 'a' : 1 } ] );
  test.is( got === dst );

  test.case = 'dst is array, src = array';
  var dst = [ 1, null, 'str', [] ];
  var src = [ 'str', 1, undefined ];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [], undefined ] );
  test.is( got === dst );

  /* dst is unroll */

  test.case = 'dst is empty unroll, src is empty array';
  var dst = _.unrollMake( [] );
  var src = [];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst is empty unroll, src is null';
  var dst = _.unrollMake( [] );
  var src = null;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ null ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src = undefined';
  var dst = _.unrollMake( [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  var src = undefined;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src is string';
  var dst = _.unrollMake( [ 1, null, 'str', [] ] );
  var src = 'str';
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [] ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src is map';
  var dst = _.unrollMake( [ 1, null, 'str', [], { 'a' : 1 } ] );
  var src = { 'a' : 1 };
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [], { 'a' : 1 }, { 'a' : 1 } ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src = array';
  var dst = _.unrollMake( [ 1, null, 'str', [] ] );
  var src = [ 'str', 1, undefined ];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [], undefined ] );
  test.is( got === dst );

  /* dst is argumentsArray */

  test.case = 'dst is empty unroll, src is empty array';
  var dst = _.argumentsArrayMake( [] );
  var src = [];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [] );

  test.case = 'dst is empty unroll, src is null';
  var dst = _.argumentsArrayMake( [] );
  var src = null;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ null ] );

  test.case = 'dst is unroll, src = undefined';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  var src = undefined;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );

  test.case = 'dst is unroll, src is string';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [] ] );
  var src = 'str';
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [] ] );

  test.case = 'dst is unroll, src is map';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [], { 'a' : 1 } ] );
  var src = { 'a' : 1 };
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [], { 'a' : 1 }, { 'a' : 1 } ] );

  test.case = 'dst is unroll, src = array';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [] ] );
  var src = [ 'str', 1, undefined ];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [], undefined ] );

  /* dst is buffer */

  test.case = 'dst is empty buffer, src = undefined';
  var dst = new U8x();
  var src = undefined;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [] );

  test.case = 'dst is empty buffer, src is empty array';
  var dst = new U8x();
  var src = [];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [] );

  test.case = 'dst is buffer, src = undefined';
  var dst = new U8x( [ 1, 2, 0, 78 ] );
  var src = undefined;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src is number';
  var dst = new I16x( [ 1, 2, 0, 78 ] );
  var src = 0;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src is empty array';
  var dst = new U16x( [ 1, 2, 0, 78 ] );
  var src = [];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src = array';
  var dst = new I32x( [ 1, 2, 0, 78 ] );
  var src = [ 'str', 2, 78 ];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, 2, 0, 78, 'str' ] );

  test.case = 'dst is buffer, src is buffer';
  var dst = new U32x( [ 1, 2, 0, 78 ] );
  var src = new F32x( [ 1, 2, 3, 4 ] );
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, 2, 0, 78, 3, 4 ] );

  /* dst not undefined, not longLike */

  test.case = 'dst is null, src is null';
  var dst = null;
  var src = null;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ null ] );

  test.case = 'dst is null, src is null';
  var dst = null;
  var src = undefined;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, null );

  test.case = 'dst is null, src is empty array';
  var dst = null;
  var src = [];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ null ] );

  test.case = 'dst is string, src is string';
  var dst = 'str';
  var src = 'str';
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 'str' ] );

  test.case = 'dst is string, src is string';
  var dst = 'str';
  var src = undefined;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, 'str' );

  test.case = 'dst is number, src is string';
  var dst = 1;
  var src = [ '', 1, [], [ { a : 2 } ] ];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, '', [], [ { a : 2 } ] ] );

  test.case = 'dst is map, src is buffer';
  var dst = { 'a' : 1 };
  var src = new U8x( [ 10, 20, 30 ] );
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ { 'a' : 1 }, 10, 20, 30 ] );

  /* */

  test.case = 'dst === src';
  var arr = [ 1, 2, 'str' ];
  var dst = arr;
  var src = arr;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [  1, 2, 'str' ] );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'wrong arguments.length';
  test.shouldThrowErrorSync( () => _.scalarAppendOnce() );
  test.shouldThrowErrorSync( () => _.scalarAppendOnce( 1 ) );
  test.shouldThrowErrorSync( () => _.scalarAppendOnce( 1, 2, 'str' ) );
}

//

function scalarPrepend( test )
{
  test.case = 'dst is undefined, src = undefined';
  var dst = undefined;
  var src = undefined;
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [] );

  test.case = 'dst is undefined, src is longLike';
  var dst = undefined;
  var src = [ null, '', 1, [], [ 1, [ 2 ] ] ];
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ null, '', 1, [], [ 1, [ 2 ] ] ] );

  test.case = 'dst is undefined, src = unroll';
  var dst = undefined;
  var src = _.unrollMake( [ null, '', 1 ] );
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ null, '', 1 ] );

  test.case = 'dst is undefined, src = argumentsArray';
  var dst = undefined;
  var src = _.argumentsArrayMake( [ null, '', 1 ] );
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ null, '', 1 ] );

  test.case = 'dst is undefined, src is buffer';
  var dst = undefined;
  var src = new F32x( [ 0, 2, 10 ] );
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ 0, 2, 10 ] );

  test.case = 'dst is undefined, src is string';
  var dst = undefined;
  var src = 'str';
  var got = _.scalarPrepend( dst, src );
  test.identical( got, 'str' );

  test.case = 'dst is undefined, src is map';
  var dst = undefined;
  var src = { 'a' : 'str' };
  var got = _.scalarPrepend( dst, src );
  test.identical( got, { 'a' : 'str' } );

  /* dst is array */

  test.case = 'dst is empty array, src is empty array';
  var dst = [];
  var src = [];
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst is empty array, src is null';
  var dst = [];
  var src = null;
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ null ] );
  test.is( got === dst );

  test.case = 'dst is array, src = undefined';
  var dst = [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ];
  var src = undefined;
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  test.is( got === dst );

  test.case = 'dst is array, src is string';
  var dst = [ 1, null, 'str', [] ];
  var src = 'str';
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ 'str', 1, null, 'str', [] ] );
  test.is( got === dst );

  test.case = 'dst is array, src is map';
  var dst = [ 1, null, 'str', [] ];
  var src = { 'a' : 1 };
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ { 'a' : 1 }, 1, null, 'str', [] ] );
  test.is( got === dst );

  test.case = 'dst is array, src = array';
  var dst = [ 1, null, 'str', [] ];
  var src = [ 'src', 2, undefined ];
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ 'src', 2, undefined, 1, null, 'str', [] ] );
  test.is( got === dst );

  /* dst is unroll */

  test.case = 'dst is empty unroll, src is empty array';
  var dst = _.unrollMake( [] );
  var src = [];
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst is empty unroll, src is null';
  var dst = _.unrollMake( [] );
  var src = null;
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ null ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src = undefined';
  var dst = _.unrollMake( [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  var src = undefined;
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src is string';
  var dst = _.unrollMake( [ 1, null, 'str', [] ] );
  var src = 'str';
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ 'str', 1, null, 'str', [] ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src is map';
  var dst = _.unrollMake( [ 1, null, 'str', [] ] );
  var src = { 'a' : 1 };
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ { 'a' : 1 }, 1, null, 'str', [] ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src = array';
  var dst = _.unrollMake( [ 1, null, 'str', [] ] );
  var src = [ 'src', 2, undefined ];
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ 'src', 2, undefined, 1, null, 'str', [] ] );
  test.is( got === dst );

  /* dst is argumentsArray */

  test.case = 'dst is empty unroll, src is empty array';
  var dst = _.argumentsArrayMake( [] );
  var src = [];
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [] );

  test.case = 'dst is empty unroll, src is null';
  var dst = _.argumentsArrayMake( [] );
  var src = null;
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ null ] );

  test.case = 'dst is unroll, src = undefined';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  var src = undefined;
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );

  test.case = 'dst is unroll, src is string';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [] ] );
  var src = 'str';
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ 'str', 1, null, 'str', [] ] );

  test.case = 'dst is unroll, src is map';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [] ] );
  var src = { 'a' : 1 };
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ { 'a' : 1 }, 1, null, 'str', [] ] );

  test.case = 'dst is unroll, src = array';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [] ] );
  var src = [ 'src', 2, undefined ];
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ 'src', 2, undefined, 1, null, 'str', [] ] );

  /* dst is buffer */

  test.case = 'dst is empty buffer, src = undefined';
  var dst = new U8x();
  var src = undefined;
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [] );

  test.case = 'dst is empty buffer, src is empty array';
  var dst = new U8x();
  var src = [];
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [] );

  test.case = 'dst is buffer, src = undefined';
  var dst = new U8x( [ 1, 2, 0, 78 ] );
  var src = undefined;
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src is number';
  var dst = new I16x( [ 1, 2, 0, 78 ] );
  var src = 32;
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ 32, 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src is empty array';
  var dst = new U16x( [ 1, 2, 0, 78 ] );
  var src = [];
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src = array';
  var dst = new I32x( [ 1, 2, 0, 78 ] );
  var src = [ 'str', null, undefined ];
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ 'str', null, undefined, 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src is buffer';
  var dst = new U32x( [ 1, 2, 0, 78 ] );
  var src = new F32x( [ 1, 2, 3, 4 ] );
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ 1, 2, 3, 4, 1, 2, 0, 78 ] );

  /* dst not undefined, not longLike */

  test.case = 'dst is null, src is null';
  var dst = null;
  var src = null;
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ null, null ] );

  test.case = 'dst is null, src is null';
  var dst = null;
  var src = undefined;
  var got = _.scalarPrepend( dst, src );
  test.identical( got, null );

  test.case = 'dst is null, src is empty array';
  var dst = null;
  var src = [];
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ null ] );

  test.case = 'dst is string, src is string';
  var dst = 'str';
  var src = '';
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ '', 'str' ] );

  test.case = 'dst is string, src is string';
  var dst = 'str';
  var src = undefined;
  var got = _.scalarPrepend( dst, src );
  test.identical( got, 'str' );

  test.case = 'dst is number, src is string';
  var dst = 1;
  var src = [ '', 2, [], [ { a : 2 } ] ];
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ '', 2, [], [ { a : 2 } ], 1 ] );

  test.case = 'dst is map, src is buffer';
  var dst = { 'a' : 1 };
  var src = new U8x( [ 10, 20, 30 ] );
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [ 10, 20, 30, { 'a' : 1 } ] );

  /* */

  test.case = 'dst === src';
  var arr = [ 1, 2, 'str' ];
  var dst = arr;
  var src = arr;
  var got = _.scalarPrepend( dst, src );
  test.identical( got, [  1, 2, 'str',  1, 2, 'str' ] );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'wrong arguments.length';
  test.shouldThrowErrorSync( () => _.scalarPrepend() );
  test.shouldThrowErrorSync( () => _.scalarPrepend( 1 ) );
  test.shouldThrowErrorSync( () => _.scalarPrepend( 1, 2, 'str' ) );
}

//

function scalarPrependOnce( test )
{
  test.case = 'dst is undefined, src = undefined';
  var dst = undefined;
  var src = undefined;
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [] );

  test.case = 'dst is undefined, src is longLike';
  var dst = undefined;
  var src = [ null, '', 1, [], [ 1, [ 2 ] ], null, 1 ];
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ '', [], [ 1, [ 2 ] ], null, 1 ] );

  test.case = 'dst is undefined, src = unroll';
  var dst = undefined;
  var src = _.unrollMake( [ null, '', 1 , null, '', 1 ] );
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ null, '', 1 ] );

  test.case = 'dst is undefined, src = argumentsArray';
  var dst = undefined;
  var src = _.argumentsArrayMake( [ null, '', 1 , null, '', 1 ] );
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ null, '', 1 ] );

  test.case = 'dst is undefined, src is buffer';
  var dst = undefined;
  var src = new F32x( [ 0, 2, 10, 0, 2, 10 ] );
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ 0, 2, 10 ] );

  test.case = 'dst is undefined, src is string';
  var dst = undefined;
  var src = 'str';
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, 'str' );

  test.case = 'dst is undefined, src is map';
  var dst = undefined;
  var src = { 'a' : 'str' };
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, { 'a' : 'str' } );

  /* dst is array */

  test.case = 'dst is empty array, src is empty array';
  var dst = [];
  var src = [];
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst is empty array, src is null';
  var dst = [];
  var src = null;
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ null ] );
  test.is( got === dst );

  test.case = 'dst is array, src = undefined';
  var dst = [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ], [ 1, [ 2 ] ] ];
  var src = undefined;
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ], [ 1, [ 2 ] ] ] );
  test.is( got === dst );

  test.case = 'dst is array, src is string';
  var dst = [ 1, null, 'str', [], 1 ];
  var src = 'str';
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [], 1 ] );
  test.is( got === dst );

  test.case = 'dst is array, src is map';
  var dst = [ 1, null, 'str', [], { 'a' : 1 } ];
  var src = { 'a' : 1 };
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ { 'a' : 1 }, 1, null, 'str', [], { 'a' : 1 } ] );
  test.is( got === dst );

  test.case = 'dst is array, src = array';
  var dst = [ 1, null, 'str', [] ];
  var src = [ 'str', 1, undefined ];
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ undefined, 1, null, 'str', [] ] );
  test.is( got === dst );

  /* dst is unroll */

  test.case = 'dst is empty unroll, src is empty array';
  var dst = _.unrollMake( [] );
  var src = [];
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst is empty unroll, src is null';
  var dst = _.unrollMake( [] );
  var src = null;
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ null ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src = undefined';
  var dst = _.unrollMake( [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  var src = undefined;
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src is string';
  var dst = _.unrollMake( [ 1, null, 'str', [] ] );
  var src = 'str';
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [] ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src is map';
  var dst = _.unrollMake( [ 1, null, 'str', [], { 'a' : 1 } ] );
  var src = { 'a' : 1 };
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ { 'a' : 1 }, 1, null, 'str', [], { 'a' : 1 } ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src = array';
  var dst = _.unrollMake( [ 1, null, 'str', [] ] );
  var src = [ 'str', 1, undefined ];
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ undefined, 1, null, 'str', [] ] );
  test.is( got === dst );

  /* dst is argumentsArray */

  test.case = 'dst is empty unroll, src is empty array';
  var dst = _.argumentsArrayMake( [] );
  var src = [];
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [] );

  test.case = 'dst is empty unroll, src is null';
  var dst = _.argumentsArrayMake( [] );
  var src = null;
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ null ] );

  test.case = 'dst is unroll, src = undefined';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  var src = undefined;
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );

  test.case = 'dst is unroll, src is string';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [] ] );
  var src = 'str';
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [] ] );

  test.case = 'dst is unroll, src is map';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [], { 'a' : 1 } ] );
  var src = { 'a' : 1 };
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ { 'a' : 1 }, 1, null, 'str', [], { 'a' : 1 } ] );

  test.case = 'dst is unroll, src = array';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [] ] );
  var src = [ 'str', 1, undefined ];
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ undefined, 1, null, 'str', [] ] );

  /* dst is buffer */

  test.case = 'dst is empty buffer, src = undefined';
  var dst = new U8x();
  var src = undefined;
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [] );

  test.case = 'dst is empty buffer, src is empty array';
  var dst = new U8x();
  var src = [];
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [] );

  test.case = 'dst is buffer, src = undefined';
  var dst = new U8x( [ 1, 2, 0, 78 ] );
  var src = undefined;
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src is number';
  var dst = new I16x( [ 1, 2, 0, 78 ] );
  var src = 0;
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src is empty array';
  var dst = new U16x( [ 1, 2, 0, 78 ] );
  var src = [];
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src = array';
  var dst = new I32x( [ 1, 2, 0, 78 ] );
  var src = [ 'str', 2, 78 ];
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ 'str', 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src is buffer';
  var dst = new U32x( [ 1, 2, 0, 78 ] );
  var src = new F32x( [ 1, 2, 3, 4 ] );
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ 3, 4, 1, 2, 0, 78 ] );

  /* dst not undefined, not longLike */

  test.case = 'dst is null, src is null';
  var dst = null;
  var src = null;
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ null ] );

  test.case = 'dst is null, src is null';
  var dst = null;
  var src = undefined;
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, null );

  test.case = 'dst is null, src is empty array';
  var dst = null;
  var src = [];
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ null ] );

  test.case = 'dst is string, src is string';
  var dst = 'str';
  var src = 'str';
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ 'str' ] );

  test.case = 'dst is string, src is string';
  var dst = 'str';
  var src = undefined;
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, 'str' );

  test.case = 'dst is number, src is string';
  var dst = 1;
  var src = [ '', 1, [], [ { a : 2 } ] ];
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ '', [], [ { a : 2 } ], 1 ] );

  test.case = 'dst is map, src is buffer';
  var dst = { 'a' : 1 };
  var src = new U8x( [ 10, 20, 30 ] );
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [ 10, 20, 30, { 'a' : 1 } ] );

  /* */

  test.case = 'dst === src';
  var arr = [ 1, 2, 'str' ];
  var dst = arr;
  var src = arr;
  var got = _.scalarPrependOnce( dst, src );
  test.identical( got, [  1, 2, 'str' ] );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'wrong arguments.length';
  test.shouldThrowErrorSync( () => _.scalarPrependOnce() );
  test.shouldThrowErrorSync( () => _.scalarPrependOnce( 1 ) );
  test.shouldThrowErrorSync( () => _.scalarPrependOnce( 1, 2, 'str' ) );
}

//

function scalarToVector( test )
{

  test.case = 'nothing';
  var got = _.scalarToVector( [], 0 );
  var expected = [];
  test.identical( got, expected );

  test.case = 'static array';
  var got = _.scalarToVector( 3, 7 );
  var expected = [ 3, 3, 3, 3, 3, 3, 3 ];
  test.identical( got, expected );

  test.case = 'original array';
  var got = _.scalarToVector( [ 3, 7, 13 ], 3 );
  var expected = [ 3, 7, 13 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.scalarToVector();
  });

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( function()
  {
    _.scalarToVector( [ 1, 2, 3 ] );
  });

  test.case = 'extra argument';
  test.shouldThrowErrorSync( function()
  {
    _.scalarToVector( [ 1, 2, 3 ], 3, 'redundant argument' );
  });

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( function()
  {
    _.scalarToVector('wrong argument', 'wrong argument');
  });

  test.case = 'second argument too much';
  test.shouldThrowErrorSync( function()
  {
    _.scalarToVector( [ 1, 2, 3 ], 4 );
  });

  test.case = 'first three arguments are not wrapped into array';
  test.shouldThrowErrorSync( function()
  {
    _.scalarToVector( 1, 2, 3, 3 );
  });
};

// --
// tests
// --

function entityTimeExperiment( test )
{
  var srcArray = new U8x( 500000000 );
  var onEach = ( e, k, src ) => e;

  /* */

  testTime( entityEachLongsFor, 20, srcArray, onEach );
  testTime( entityEachLongsForEach, 20, srcArray, onEach );

  testTime( entityAnyLongsFor, 20, srcArray, onEach );
  testTime( entityAnyLongsSome, 20, srcArray, onEach );

  for( let i = srcArray.length; i >= 0; i-- )
  srcArray[ i ] = ( Math.random() + 0.01 ) * 250;
  testTime( entityAllLongsFor, 30, srcArray, onEach );
  testTime( entityAllLongsEvery, 30, srcArray, onEach );

  /*|         |                                Running time                                 |
    |         |---------------------------|------------------------|------------------------|
    |  NodeJS | for     | Array.forEach() | for    | Array.every() | for    | Array.some()  |
    |---------|---------|-----------------|--------|---------------|--------|---------------|
    |  v8     | 17,3 s  | 128,8 s         | 33.7 s | 205,5 s       | 21,9 s | 134,8 s       |
    |         | 17,3 s  | 128,9 s         | 33.5 s | 204,8 s       | 21,8 s | 143,3 s       |
    |---------|---------|-----------------|--------|---------------|--------|---------------|
    |  v9     | 17,2 s  | 129,2 s         | 32,8 s | 203,2 s       | 21,9 s | 134,0 s       |
    |         | 17,4 s  | 129,3 s         | 35.7 s | 204,5 s       | 21,8 s | 133,7 s       |
    |---------|---------|-----------------|--------|---------------|--------|---------------|
    |  v10    | 12,8 s  | 137,1 s         | 26,9 s | 208,6 s       | 17,2 s | 142,6 s       |
    |         | 13,0 s  | 138,8 s         | 26,6 s | 210,1 s       | 17,1 s | 143.2 s       |
    |---------|---------|-----------------|--------|---------------|--------|---------------|
    |  v12    | 8,5 s   | 184.5 s         | 26,9 s | 369,7 s       | 13,0 s | 216,5 s       |
    |         | 8,4 s   | 184,4 s         | 26,7 s | 329,1 s       | 26,7 s | 223,4 s       |
  */


  /* testing subroutine */

  function testTime( func, times, arg1, arg2 )
  {
    var timeStart = _.time.now();

    for( let i = times; i > 0; i-- )
    var result = func( arg1, arg2 );

    var timeEnd = _.time.now();

    test.is( timeEnd - timeStart > 30000 )
    console.log( timeEnd - timeStart );
  }

  /* */

  function entityEachLongsFor( src, onEach )
  {
    for( let k = 0 ; k < src.length ; k++ )
    onEach( src[ k ], k, src );

    return src
  }

  /* */

  function entityEachLongsForEach( src, onEach )
  {
    src.forEach( onEach );

    return src;
  }

  /* */

  function entityAllLongsFor( src, onEach )
  {
    let result;
    if( _.routineIs( onEach ) )
    {
      for( let k = 0 ; k < src.length ; k++ )
      {
        result = onEach( src[ k ], k, src );
        if( !result )
        return result;
      }
    }
    else
    {
      for( let k = 0 ; k < src.length ; k++ )
      {
        result = src[ k ];
        if( !result )
        return result;
      }
    }

    return true;
  }

  /* */

  function entityAllLongsEvery( src, onEach )
  {
    let result;
    if( _.routineIs( onEach ) )
    result = src.every( onEach );
    else
    result = src.every();

    return result;
  }

  /* */

  function entityAnyLongsFor( src, onEach )
  {
    let result;
    if( _.routineIs( onEach ) )
    {
      for( let k = 0 ; k < src.length ; k++ )
      {
        result = onEach( src[ k ], k, src );
        if( result )
        return result;
      }
    }
    else
    {
      for( let k = 0 ; k < src.length ; k++ )
      {
        result = src[ k ];
        if( result )
        return result;
      }
    }

    return true;
  }

  /* */

  function entityAnyLongsSome( src, onEach )
  {
    let result;
    if( _.routineIs( onEach ) )
    result = src.some( onEach );
    else
    result = src.some();

    return result;
  }

}
entityTimeExperiment.experimental = 1;
entityTimeExperiment.timeOut = 1800000;

//

function entityEach( test )
{
  test.open( 'src is an ArrayLike');

  test.case = 'empty arrayLike objects';
  var got;
  var src = [];
  _.entityEach( src, ( v ) => got = typeof v );
  test.identical( got, undefined );

  var got = [];
  var src = _.unrollMake( 0 );
  _.entityEach( src, ( v, i ) => got[ i ] = v + i );
  test.identical( got, [] );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

  var got = [];
  var src = _.argumentsArrayMake( 0 );
  _.entityEach( src, ( v, i ) => got[ i ] = v + i );
  test.identical( got, [] );
  test.is( _.arrayIs( got ) );

  var got = [];
  var src = new Array( 0 );
  _.entityEach( src, ( v, i ) => got[ i ] = v + i );
  test.identical( got, src );
  test.is( _.arrayIs( got ) );

  var got = [];
  var src = new F32x( 0 );
  _.entityEach( src, ( v, i ) => got[ i ] = v + i );
  test.identical( got, [] );
  test.is( _.arrayIs( got ) );

  //

  test.case = 'not empty arrayLike objects';

  var got = [];
  var src = [ 0, 1, 2 ];
  _.entityEach( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );

  var got = [];
  var src = _.unrollMake( [ 0, 1, _.unrollMake( [ 2 ] ) ] );
  _.entityEach( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( src ) );

  var got = [];
  var src = _.argumentsArrayMake( [ 0, 1, 2 ] );
  _.entityEach( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );
  test.is( _.longIs( src ) );

  var got = [];
  var src = new Array( 0, 1, 2 );
  _.entityEach( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );
  test.is( _.longIs( src ) );

  var got = [];
  var src = new F32x( [ 0, 1, 2 ] );
  _.entityEach( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );
  test.is( _.longIs( src ) );

  //

  test.case = 'routine counter';

  var onEach = function( v, i )
  {
    if( _.strIs( v ) && i >= 0 )
    got += 10;
    else
    got -= 1;
  }

  var got = 0;
  _.entityEach( 1, onEach );
  test.identical( got, -1 );

  var got = 0;
  _.entityEach( 'abc', onEach );
  test.identical( got, -1 );

  var got = 0;
  _.entityEach( [ 'abc', 1, 'ab', 'a' ], onEach );
  test.identical( got, 29 );

  var got = 0;
  _.entityEach( [ { a : 1 }, { b : 2 } ], onEach );
  test.identical( got, -2 );

  var got = 0;
  var src = _.unrollFrom( [ 1, 'str', _.unrollMake( [ 2, 'str' ] ) ] );
  _.entityEach( src, onEach );
  test.identical( got, 18 );

  var got = 0;
  var src = _.argumentsArrayMake( [ 1, 'str', [ 2, 'str' ] ] );
  _.entityEach( src, onEach );
  test.identical( got, 8 );

  var got = 0;
  var src = new Array( 1, 'str', [ 2, 'str' ] );
  _.entityEach( src, onEach );
  test.identical( got, 8 );

  var got = 0;
  var src = new F32x( [ 1, 1, [ 2 ] ] );
  _.entityEach( src, onEach );
  test.identical( got, -3 );

  test.case = 'Third argument in onEach'
  var onEach = function( v, i, src )
  {
    if( _.longIs( src ) )
    got = src;
    else
    got += 10;
  }

  var got;
  var src = [ 0, 1, 3, 5 ];
  _.entityEach( src, onEach );
  test.identical( got, src );

  var got;
  var src = _.unrollMake( [ 0, 1, _.unrollFrom( [ 3, 5 ] ) ] );
  _.entityEach( src, onEach );
  test.identical( got, [ 0, 1, 3, 5 ] );
  test.is( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

  var got;
  var src = _.argumentsArrayMake( [ 0, 1, [ 3, 5 ] ] );
  _.entityEach( src, onEach );
  test.identical( got, src );
  test.is( _.longIs( got ) );

  var got;
  var src = new Array( 1, 2, null, true );
  _.entityEach( src, onEach );
  test.identical( got, src );
  test.is( _.longIs( got ) );

  var got;
  var src = new F32x( [ 1, 2, 1, 3 ] );
  _.entityEach( src, onEach );
  test.equivalent( got, [ 1, 2, 1, 3 ] );
  test.is( _.longIs( got ) );

  test.close( 'src is an ArrayLike');

  /* - */

  test.open( 'src is an object' );

  var got = {};
  _.entityEach( {}, ( v ) => got = v );
  test.identical( got, {} );

  var got = {};
  _.entityEach( Object.create( null ), ( v, k ) => got[ k ] = v + k );
  test.identical( got, {} );

  var got = {};
  _.entityEach( { a : 1, b : 3, c : 5 }, ( v, k ) => got[ k ] = v * v + k );
  test.identical( got, { a : '1a', b : '9b', c : '25c' } );

  //

  test.case = 'routine counter';

  var onEach = function( v, k )
  {
    if( _.strIs( v ) && k )
    got += 10;
    else
    got -= 1;
  }

  var got = 0;
  _.entityEach( 'abc', onEach );
  test.identical( got, -1 );

  var got = 0;
  _.entityEach( { a : 'abc', b : { a : 1 }, c : [ null ], d : undefined }, onEach );
  test.identical( got, 7 );

  var got = 0;
  _.entityEach( { a : 'abc', b : 1, c : 'ab', d : 'a' }, onEach );
  test.identical( got, 29 );

  //

  test.case = 'Third argument in onEach'
  var onEach = function( v, k, src )
  {
    if( _.objectIs( src ) )
    got = src;
    else
    got += 10;
  }

  var got = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  _.entityEach( src, onEach );
  test.identical( got, src );

  test.close( 'src is an object' );

  /* - */

  test.case = 'src is not ArrayLike or ObjectLike';

  var got;
  _.entityEach( null, ( v ) => got = typeof v );
  test.identical( got, 'object' );

  var got;
  _.entityEach( 1, ( v ) => got = typeof v );
  test.identical( got, 'number' );

  var got;
  _.entityEach( 'a', ( v ) => got = v + 2 );
  test.identical( got, 'a2' );

  var got;
  _.entityEach( function b(){ return 'a'}, ( v ) => got = typeof v );
  test.identical( got, 'function' );

  var got;
  _.entityEach( function b(){ return 'a'}, ( v, i ) => got = typeof v + ' ' + typeof i );
  test.identical( got, 'function undefined' );

  //

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityEach() );

  test.case = 'only one argument';
  test.shouldThrowErrorSync( () => _.entityEach( [ 'a' ] ) );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.entityEach( [ 'a' ], ( a ) => a, ( b ) => b ) );

  test.case = 'onEach has more then three args';
  test.shouldThrowErrorSync( () => _.entityEach( [ 1 ], ( a, b, c, d ) => a + b + c + d ) );

  test.case = 'onEach is not a routine';
  test.shouldThrowErrorSync( () => _.entityEach( { a : 2 }, [] ) );
}

//
//
// function entityEachKey( test )
// {
//   test.open( 'src is an ArrayLike');
//
//   test.case = 'empty arrayLike objects'
//   var got;
//   var src = [];
//   _.entityEachKey( src, ( v ) => got = typeof v );
//   test.identical( got, undefined );
//
//   var got = [];
//   var src = _.unrollMake( 0 );
//   _.entityEachKey( src, ( v, i ) => got[ i ] = v + i );
//   test.identical( got, [] );
//   test.isNot( _.unrollIs( got ) );
//   test.is( _.arrayIs( got ) );
//
//   var got = [];
//   var src = _.argumentsArrayMake( 0 );
//   _.entityEachKey( src, ( v, i ) => got[ i ] = v + i );
//   test.identical( got, [] );
//   test.is( _.longIs( src ) );
//
//   var got = [];
//   var src = new Array( 0 );
//   _.entityEachKey( src, ( v, i ) => got[ i ] = v + i );
//   test.identical( got, src );
//   test.is( _.longIs( src ) );
//
//   var got = [];
//   var src = new F32x( 0 );
//   _.entityEachKey( src, ( v, i ) => got[ i ] = v + i );
//   test.identical( got, [] );
//
//   //
//
//   test.case = 'not empty arrayLike objects';
//
//   var got = [];
//   var src = [ 0, 1, 2 ];
//   _.entityEachKey( src, ( v, u, i ) => got[ i ] = v * v );
//   test.identical( got, [ 0, 1, 4 ] );
//
//   var got = [];
//   var src = _.unrollMake( [ 0, 1, _.unrollMake( [ 2 ] ) ] );
//   _.entityEachKey( src, ( v, u, i ) => got[ i ] = v * v );
//   test.identical( got, [ 0, 1, 4 ] );
//   test.isNot( _.unrollIs( got ) );
//   test.is( _.arrayIs( src ) );
//
//   var got = [];
//   var src = _.argumentsArrayMake( [ 0, 1, 2 ] );
//   _.entityEachKey( src, ( v, u, i ) => got[ i ] = v * v );
//   test.identical( got, [ 0, 1, 4 ] );
//   test.is( _.longIs( src ) );
//
//   var got = [];
//   var src = new Array( 0, 1, 2 );
//   _.entityEachKey( src, ( v, u, i ) => got[ i ] = v * v );
//   test.identical( got, [ 0, 1, 4 ] );
//   test.is( _.longIs( src ) );
//
//   var got = [];
//   var src = new F32x( [ 0, 1, 2 ] );
//   _.entityEachKey( src, ( v, u, i ) => got[ i ] = v * v );
//   test.identical( got, [ 0, 1, 4 ] );
//   test.is( _.longIs( src ) );
//
//   //
//
//   test.case = 'routine counter';
//
//   var onEach = function( v, u )
//   {
//     if( _.strIs( v ) && u === undefined )
//     got += 10;
//     else
//     got -= 1;
//   }
//
//   var got = 0;
//   _.entityEachKey( 1, onEach );
//   test.identical( got, -1 );
//
//   var got = 0;
//   _.entityEachKey( 'abc', onEach );
//   test.identical( got, 10 );
//
//   var got = 0;
//   _.entityEachKey( [ 'abc', 1, 'ab', 'a',  { a : 1 } ], onEach );
//   test.identical( got, 28 );
//
//   var got = 0;
//   var src = _.unrollFrom( [ 1, 'str', _.unrollMake( [ { a : 'abc' }, 'str' ] ) ] );
//   _.entityEachKey( src, onEach );
//   test.identical( got, 18 );
//
//   var got = 0;
//   var src = _.argumentsArrayMake( [ 1, 'str', [ [ 'abc' ], 'str' ] ] );
//   _.entityEachKey( src, onEach );
//   test.identical( got, 8 );
//
//   var got = 0;
//   var src = new Array( 1, 'str', [ 2, 'str' ] );
//   _.entityEachKey( src, onEach );
//   test.identical( got, 8 );
//
//   var got = 0;
//   var src = new F32x( [ 1, 1, [ 2 ] ] );
//   _.entityEachKey( src, onEach );
//   test.identical( got, -3 );
//
//   test.case = 'Third argument in onEach'
//   var onEach = function( v, u, i )
//   {
//     if( _.longIs( arguments[ 3 ] ) )
//     got = src;
//     else
//     got += 10;
//   }
//
//   var got;
//   var src = [ 0, 1, 3, 5 ];
//   _.entityEachKey( src, onEach );
//   test.identical( got, src );
//
//   var got;
//   var src = _.unrollMake( [ 0, 1, _.unrollFrom( [ 3, 5 ] ) ] );
//   _.entityEachKey( src, onEach );
//   test.identical( got, [ 0, 1, 3, 5 ] );
//   test.is( _.unrollIs( got ) );
//   test.is( _.arrayIs( got ) );
//
//   var got;
//   var src = _.argumentsArrayMake( [ 0, 1, [ 3, 5 ] ] );
//   _.entityEachKey( src, onEach );
//   test.identical( got, src );
//   test.is( _.longIs( got ) );
//
//   var got;
//   var src = new Array( 1, 2, null, true );
//   _.entityEachKey( src, onEach );
//   test.identical( got, src );
//   test.is( _.longIs( got ) );
//
//   var got;
//   var src = new F32x( [ 1, 2, 1, 3 ] );
//   _.entityEachKey( src, onEach );
//   test.equivalent( got, [ 1, 2, 1, 3 ] );
//   test.is( _.longIs( got ) );
//
//   test.close( 'src is an ArrayLike');
//
//   /* - */
//
//   test.open( 'src is an ObjectLike' );
//
//   test.case = 'not onEach';
//   var got = {};
//   _.entityEachKey( {}, ( v ) => got = v );
//   test.identical( got, {} );
//
//   var got = {};
//   _.entityEachKey( Object.create( null ), ( v, k ) => got[ k ] = v + k );
//   test.identical( got, {} );
//
//   var got = {};
//   _.entityEachKey( { a : 1, b : 3, c : 5 }, ( k, v ) => got[ k ] = v * v + k );
//   test.identical( got, { a : '1a', b : '9b', c : '25c' } );
//
//   //
//
//   test.case = 'routine counter';
//   var onEach = function( k, v )
//   {
//     if( _.strIs( v ) && k )
//     got += 10;
//     else
//     got -= 1;
//   }
//
//   var got = 0;
//   _.entityEachKey( 'abc', onEach );
//   test.identical( got, -1 );
//
//   var got = 0;
//   _.entityEachKey( { a : 'abc' }, onEach );
//   test.identical( got, 10 );
//
//   var got = 0;
//   _.entityEachKey( { a : 'abc', b : 1, c : 'ab', d : null }, onEach );
//   test.identical( got, 18 );
//
//   var got = 0;
//   _.entityEachKey( { a : [ 'a', 'b' ], b : { e : 1 } }, onEach );
//   test.identical( got, -2 );
//
//   //
//
//   test.case = 'Third argument in onEach'
//   var onEach = function( v, k, i )
//   {
//     got[ i ] = v + k;
//   }
//
//   var got = {};
//   _.entityEachKey( { ak : 'a', bk : 'b', ck : 'c' }, onEach );
//   test.identical( got, { 0 : 'a1', 1 : 'b2', 2 : 'c3' } );
//
//   test.close( 'src is an ObjectLike' );
//
//   /* - */
//
//   test.case = 'src is not ArrayLike or ObjectLike';
//
//   var got;
//   _.entityEachKey( null, ( v ) => got = typeof v );
//   test.identical( got, 'object' );
//
//   var got;
//   _.entityEachKey( 1, ( v ) => got = typeof v );
//   test.identical( got, 'number' );
//
//   var got;
//   _.entityEachKey( 'a', ( v ) => got = v + 2 );
//   test.identical( got, 'a2' );
//
//   var got;
//   _.entityEachKey( function b(){ return 'a'}, ( v, i ) => got = typeof v + ' ' + typeof i );
//   test.identical( got, 'function undefined' );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.entityEachKey() );
//
//   test.case = 'only one argument';
//   test.shouldThrowErrorSync( () => _.entityEachKey( [ 'a' ] ) );
//
//   test.case = 'too many arguments';
//   test.shouldThrowErrorSync( () => _.entityEachKey( [ 'a' ], ( a ) => a, ( b ) => b ) );
//
//   test.case = 'onEach has more then three arg';
//   test.shouldThrowErrorSync( () => _.entityEachKey( [ 1 ], ( a, b, c, d ) => a + b + c + d ) );
//
//   test.case = 'onEach is not a routine';
//   test.shouldThrowErrorSync( () => _.entityEachKey( { a : 2 }, [] ) );
// }

//

function entityEachOwn( test )
{
  test.open( 'src is an ArrayLike');

  test.case = 'empty arrayLike objects';
  var got;
  var src = [];
  _.entityEachOwn( src, ( v ) => got = typeof v );
  test.identical( got, undefined );

  var got = [];
  var src = _.unrollMake( 0 );
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v + i );
  test.identical( got, [] );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

  var got = [];
  var src = _.argumentsArrayMake( 0 );
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v + i );
  test.identical( got, [] );
  test.is( _.arrayIs( got ) );

  var got = [];
  var src = new Array( 0 );
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v + i );
  test.identical( got, src );
  test.is( _.arrayIs( got ) );

  var got = [];
  var src = new F32x( 0 );
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v + i );
  test.identical( got, [] );
  test.is( _.arrayIs( got ) );

  //

  test.case = 'not empty arrayLike objects';

  var got = [];
  var src = [ 0, 1, 2 ];
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );

  var got = [];
  var src = _.unrollMake( [ 0, 1, _.unrollMake( [ 2 ] ) ] );
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( src ) );

  var got = [];
  var src = _.argumentsArrayMake( [ 0, 1, 2 ] );
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );
  test.is( _.longIs( src ) );

  var got = [];
  var src = new Array( 0, 1, 2 );
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );
  test.is( _.longIs( src ) );

  var got = [];
  var src = new F32x( [ 0, 1, 2 ] );
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );
  test.is( _.longIs( src ) );

  //

  test.case = 'routine counter';

  var onEach = function( v, i )
  {
    if( _.strIs( v ) && i >= 0 )
    got += 10;
    else
    got -= 1;
  }

  var got = 0;
  _.entityEachOwn( 1, onEach );
  test.identical( got, -1 );

  var got = 0;
  _.entityEachOwn( 'abc', onEach );
  test.identical( got, -1 );

  var got = 0;
  _.entityEachOwn( [ 'abc', 1, 'ab', 'a' ], onEach );
  test.identical( got, 29 );

  var got = 0;
  _.entityEachOwn( [ { a : 1 }, { b : 2 } ], onEach );
  test.identical( got, -2 );

  var got = 0;
  var src = _.unrollFrom( [ 1, 'str', _.unrollMake( [ 2, 'str' ] ) ] );
  _.entityEachOwn( src, onEach );
  test.identical( got, 18 );

  var got = 0;
  var src = _.argumentsArrayMake( [ 1, 'str', [ 2, 'str' ] ] );
  _.entityEachOwn( src, onEach );
  test.identical( got, 8 );

  var got = 0;
  var src = new Array( 1, 'str', [ 2, 'str' ] );
  _.entityEachOwn( src, onEach );
  test.identical( got, 8 );

  var got = 0;
  var src = new F32x( [ 1, 1, [ 2 ] ] );
  _.entityEachOwn( src, onEach );
  test.identical( got, -3 );

  test.case = 'Third argument in onEach'
  var onEach = function( v, i, src )
  {
    if( _.longIs( src ) )
    got = src;
    else
    got += 10;
  }

  var got;
  var src = [ 0, 1, 3, 5 ];
  _.entityEachOwn( src, onEach );
  test.identical( got, src );

  var got;
  var src = _.unrollMake( [ 0, 1, _.unrollFrom( [ 3, 5 ] ) ] );
  _.entityEachOwn( src, onEach );
  test.identical( got, [ 0, 1, 3, 5 ] );
  test.is( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

  var got;
  var src = _.argumentsArrayMake( [ 0, 1, [ 3, 5 ] ] );
  _.entityEachOwn( src, onEach );
  test.identical( got, src );
  test.is( _.longIs( got ) );

  var got;
  var src = new Array( 1, 2, null, true );
  _.entityEachOwn( src, onEach );
  test.identical( got, src );
  test.is( _.longIs( got ) );

  var got;
  var src = new F32x( [ 1, 2, 1, 3 ] );
  _.entityEachOwn( src, onEach );
  test.equivalent( got, [ 1, 2, 1, 3 ] );
  test.is( _.longIs( got ) );

  test.close( 'src is an ArrayLike');

  /* - */

  test.open( 'src is an ObjectLike' );

  var got ={};
  _.entityEachOwn( {}, ( v ) => got = v );
  test.identical( got, {} );

  var got = {};
  var src = Object.create( null );
  var src2 = Object.create( src );
  _.entityEachOwn( src, ( v, k ) => got[ k ] = v + k );
  test.identical( got, {} );
  _.entityEachOwn( src2, ( v, k ) => got[ k ] = v + k );
  test.identical( got, {} );

  var got = {};
  var src = Object.create( null );
  src.a = 1;
  src.b = 3;
  var src2 = Object.create( src );
  _.entityEachOwn( src2, ( v, k ) => got[ k ] = v * v + k );
  test.identical( got, {} );
  _.entityEachOwn( src, ( v, k ) => got[ k ] = v * v + k );
  test.identical( got, { a : '1a', b : '9b' } );

  test.case = 'routine counter';

  var onEach = function( v, k )
  {
    if( _.strIs( v ) && k )
    got += 10;
    else
    got -= 1;
  }

  var got = 0;
  _.entityEachOwn( 1, onEach );
  test.identical( got, -1 );

  var got = 0;
  _.entityEachOwn( { a : 'abc', b : 1, c : 'ab', d : null }, onEach );
  test.identical( got, 18 );

  var got = 0;
  var src = { name : 'object', toString : 1, toSource : null };
  var src2 = Object.create( src );
  _.entityEachOwn( src2, onEach );
  test.identical( got, 0 );
  _.entityEachOwn( src, onEach );
  test.identical( got, 8 );

  var got = 0;
  var src = Object.create( null );
  src.a = [ 'a', 'b' ];
  src.b = { a : 1 };
  var src2 = Object.create( src );
  src2.c = 'str';
  test.identical( src.a, src2.a );
  test.identical( src.b, src2.b );
  _.entityEachOwn( src, onEach );
  test.identical( got, -2 );
  _.entityEachOwn( src2, onEach );
  test.identical( got, 8 );

  test.case = 'Third argument in onEach'
  var onEach = function( v, k, src )
  {
    if( _.objectIs( src ) )
    got = src;
    else
    got += 10;
  }

  var got = {};
  var src = Object.create( null );
  src.a = 'str';
  var src2 = Object.create( src );
  _.entityEachOwn( src2, onEach );
  test.identical( got, {} );
  _.entityEachOwn( src, onEach );
  test.identical( got, src );

  test.close( 'src is an ObjectLike' );

  /* - */

  test.case = 'src is not ArrayLike or ObjectLike';

  var got;
  _.entityEachOwn( null, ( v ) => got = typeof v );
  test.identical( got, 'object' );

  var got;
  _.entityEachOwn( 1, ( v ) => got = typeof v );
  test.identical( got, 'number' );

  var got;
  _.entityEachOwn( 'a', ( v ) => got = v + 2 );
  test.identical( got, 'a2' );

  var got;
  _.entityEachOwn( function b(){ return 'a'}, ( v, i ) => got = typeof v + ' ' + typeof i );
  test.identical( got, 'function undefined' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityEachOwn() );

  test.case = 'only one argument';
  test.shouldThrowErrorSync( () => _.entityEachOwn( [ 'a' ] ) );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.entityEachOwn( [ 'a' ], ( a ) => a, ( b ) => b ) );

  test.case = 'onEach has more then three arg';
  test.shouldThrowErrorSync( () => _.entityEachOwn( [ 1 ], ( a, b, c, d ) => a + b + c + d ) );

  test.case = 'onEach is not a routine';
  test.shouldThrowErrorSync( () => _.entityEachOwn( { a : 2 }, [] ) );
}

//

function entityOnlyOnlyDst( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityOnly( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOnly( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, _.nothing';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 }, _.nothing ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 }, _.nothing ];
  var got = _.entityOnly( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityOnly( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityOnly( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOnly( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOnly( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOnly( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOnly( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityOnly( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityOnly( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOnly( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOnly( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOnly( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityOnly( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOnly( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityOnly( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityOnly( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOnly( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOnly( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOnly( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOnly( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f1, _.nothing';
  var exp = { a : { f1 : _.nothing, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOnly( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOnly( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOnly( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOnly( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityOnly( dst, undefined, '*/x' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityOnly( dst, undefined, '*/length' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOnly( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOnly( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOnly( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityOnly() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entityOnly( [ 1, 2 ], [ 0, 1 ], ( e ) => e, 'extra' ) );

  test.case = 'wrong onEach type';
  test.shouldThrowErrorSync( () => _.entityOnly( [ 1, 2 ], [ 0, 1 ], 'wrong' ) );
  test.shouldThrowErrorSync( () => _.entityOnly( [ 1, 2 ], [ 0, 1 ], [] ) );

  test.case = 'onEach.length > 3';
  test.shouldThrowErrorSync( () => _.entityOnly( [ 1, 2 ], [ 0, 1 ], ( a, b, c, d ) => a - b + c - d ) );
}

//

function entityOnlyOnlySrc( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityOnly( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOnly( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityOnly( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityOnly( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOnly( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOnly( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOnly( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOnly( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityOnly( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityOnly( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOnly( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOnly( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOnly( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityOnly( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOnly( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityOnly( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityOnly( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOnly( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOnly( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOnly( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'src - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOnly( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, */f1, _.nothing';
  var exp = { a : { f1 : _.nothing, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOnly( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOnly( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOnly( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOnly( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityOnly( null, src, '*/x' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityOnly( null, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOnly( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOnly( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOnly( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityOnlyBothSame( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = src;
  var got = _.entityOnly( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = src;
  var got = _.entityOnly( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = exp;
  var got = _.entityOnly( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityOnly( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f1, _.nothing';
  var exp = { a : { f1 : _.nothing, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityOnly( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityOnly( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityOnly( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityOnly( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = dst;
  var got = _.entityOnly( dst, src, '*/x' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityOnly( dst, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOnly( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOnly( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOnly( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityOnlyBoth( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map, src - map';
  var exp = { true : true, null : null, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, null : 'null', true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, _.nothing';
  var exp = { true : true, null : null, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : false, zero : 0, null : 'null', true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ false, 0, 'str', [ 1 ] ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 1, false, 0, 'str', [ 1 ] ];
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ false, 0, 'str', [ 1 ], _.nothing ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], _.nothing, { a : 0 } ];
  var src = [ true, 1, false, 0, 'str', [ 1 ], _.nothing ];
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got.x, 1 );

  test.case = 'dst - obj, src - number';
  var exp = undefined;
  var dst = new Constructor1();
  var src = 0;
  var got = _.entityOnly( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = 'src';
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - obj';
  var exp = 'dst';
  var dst = 'dst';
  var src = new Constructor1();
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityOnly( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - str';
  var exp = '';
  var dst = '';
  var src = 'src';
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - undefined';
  var exp = undefined;
  var dst = false;
  var src = undefined;
  var got = _.entityOnly( dst, src );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - number';
  var exp = false;
  var dst = false;
  var src = 2;
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - false';
  var exp = undefined;
  var dst = 0;
  var src = false;
  var got = _.entityOnly( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - true';
  var exp = 0;
  var dst = 0;
  var src = true;
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map, src - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'dst::empty' };
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 }, 2, 3 ];
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src  = 'src';
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, dst - str';
  var exp = undefined;
  var dst = '';
  var src = 'src';
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - true';
  var exp = undefined;
  var dst = false;
  var src  = true;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - 1';
  var exp = undefined;
  var dst = 0;
  var src = 1;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map, src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'src::empty' };
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'src::empty', nothing : _.nothing };
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ true, 1, 'str', [ 1 ] ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ] ];
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var exp = undefined;
  var dst = new Constructor1();
  var src = false;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = 'src';
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = undefined;
  var dst = 'dst';
  var src = null;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = '';
  var dst = '';
  var src = true;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = undefined;
  var dst = false;
  var src = 0;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = false;
  var dst = false;
  var src = 1;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = undefined;
  var dst = 0;
  var src = '';
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map, src - map';
  var exp = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { 0 : null, false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ 0, false, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 0, false, 1, 'str', [ 1 ] ];
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var exp = undefined;
  var dst = new Constructor1();
  var src = false;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src = 'src';
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = undefined;
  var dst = 'dst';
  var src = null;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = undefined;
  var dst = '';
  var src = true;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = undefined;
  var dst = false;
  var src = 0;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = undefined;
  var dst = false;
  var src = 1;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = undefined;
  var dst = 0;
  var src = '';
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, src - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 3, f2 : 0 }, b : { f1 : 1, f2 : 3 }, c : { f1 : 0, f2 : 'str' } };
  var got = _.entityOnly( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, */f1, _.nothing';
  var exp = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 } };
  var dst = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 3, f2 : 0 }, b : { f1 : 1, f2 : 3 }, c : { f1 : 0, f2 : 'str' } };
  var got = _.entityOnly( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, */f2';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 1 }, b : { f1 : false, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOnly( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f1';
  var exp = [ { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 0, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOnly( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f2';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : true }, { f1 : false, f2 : false }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOnly( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - str';
  var exp = undefined;
  var dst = new Constructor1();
  var src = 'src';
  var got = _.entityOnly( dst, src, '*/x' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - 0';
  var exp = undefined;
  var dst = 'dst';
  var src = 0;
  var got = _.entityOnly( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - 1';
  var exp = undefined;
  var dst = '';
  var src = 1;
  var got = _.entityOnly( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src = true';
  var exp = undefined;
  var dst = false;
  var src = true;
  var got = _.entityOnly( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - null';
  var exp = undefined;
  var dst = 0;
  var src = null;
  var got = _.entityOnly( dst, src, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityOnlyDiffTypes( test )
{
  test.shouldThrowErrorSync
  ( () =>
  {
    /* Dmytro : need clarification. Array prototype has some properties, the access to this properties provides by  arr[ property ].
    the example below show this effect */

    test.case = 'dst - map, src - array';
    var exp = { map : { a : 0 } };
    var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ false, 0, 'null', true, 1, 'str', [ 1 ], { a : 0 }, '' ];
    var got = _.entityOnly( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 0 ];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { 1 : 1, false : false, zero : 0, null : 'null', true : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var got = _.entityOnly( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = {};
    var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], maps : { a : 0 }, '' : 'str::empty' };
    var src = [ true, false, 1, 0, 'str', [], {} ];
    var got = _.entityOnly( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ false, 1 ];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityOnly( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
    var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ 1, 2, 3, 4 ];
    var got = _.entityOnly( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 0, false, 1, 'str', [ 1 ], { a : 0 } ];
    var dst = [ true, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityOnly( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with maps, */f1';
    var exp = { 1 : { f1 : false, f2 : 3 } };
    var dst = { a : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
    var src = [ { f1 : 3, f2 : 0 }, { f1 : 1, f2 : 3 }, { f1 : 0, f2 : 'str' } ];
    var got = _.entityOnly( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with map, */f2';
    var exp = { 1 : { f1 : false, f2 : 3 } };
    var dst = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, 2 : { f1 : [], f2 : 'str' } };
    var src = [ 0, { f1 : 1, f2 : 1 }, 2, 3 ];
    var got = _.entityOnly( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f1';
    var exp = [ { f1 : 1, f2 : 0 } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityOnly( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f2';
    var exp = [ { f1 : false, f2 : 3 } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityOnly( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var exp = new Constructor1();
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityOnly( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = 0;
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityOnly( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var exp = undefined;
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityOnly( dst, src, ( e, k ) => k );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = undefined;
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityOnly( dst, src, ( e, k ) => k );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

}

//

function entityOnlyOnlySets( test )
{
  test.open( 'only dst' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOnly( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOnly( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, _.nothing';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var got = _.entityOnly( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOnly( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOnly( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOnly( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOnly( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityOnly( dst, undefined, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'only src' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOnly( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOnly( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, _.nothing';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var got = _.entityOnly( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOnly( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOnly( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOnly( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOnly( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var src = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityOnly( null, src, '*/f1' );
  test.is( got !== src );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only src' );

  /* - */

  test.open( 'both same' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, _.nothing';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var src = dst;
  var got = _.entityOnly( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both same' );

  /* - */

  test.open( 'both' );

  test.case = 'has same unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, false, 'some', 7 ] );
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has same unnecessary elements, _.nothing';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str', _.nothing ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, false, 'some', 7, _.nothing ] );
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has different unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, false, 'str' ] );
  var dst = new Set( [ 0, 1, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, 'some', 7 ] );
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 2, [ 3, 4 ], { b : 3 }, 'src' ], 8 );
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { 'a' : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 3, null, undefined, [ 0 ], '', { a : 0 }, false, 'str' ] );
  var got = _.entityOnly( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 2, [ 0 ], { a : 0 }, 'str' ] );
  var got = _.entityOnly( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ [ 2 ], { a : 3 } ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', false, { a : 3 }, 'str' ] );
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 } ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 2, [ 0 ], { a : 0 }, 'str' ] );
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [ [ 2 ], { a : 3 } ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ { a : 3 }, 0, 1, null, undefined, [ 2 ], '', false, 'str' ] );
  var got = _.entityOnly( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [ [ 2 ], { a : 3 } ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOnly( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var src = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityOnly( dst, src, '*/f1' );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both' );
}

//

function entityOnlyOnlyHashMaps( test )
{
  test.open( 'only dst' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map();
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map();
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var got = _.entityOnly( dst, undefined, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'only src' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map();
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map();
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var got = _.entityOnly( null, src, '*/f1' );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'only src' );

  /* - */

  test.open( 'both same' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map();
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map();
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'both same' );

  /* - */

  test.open( 'both' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 0, 0 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 1 ], [ 1, 0 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, true ], [ [ 2 ], [ 1 ] ], [ { a : 3 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ null, null ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, 'null' ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 4 ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, 'null' ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 4 ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ]);
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 1 ], [ 1, 1 ], [ null, 'null' ], [ undefined, 'undefined' ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 2 ], [ [ 2 ], [ '2' ] ], [ { a : 3 }, { a : 0 } ], [ 'str', 'src' ] ] );
  var got = _.entityOnly( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'b', { f1 : false, f2 : 3 } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = new Map( [ [ 'a', { f1 : 0, f2 : 0 } ], [ 'b', { f1 : 1, f2 : 3 } ], [ 'c', { f1 : undefined, f2 : 'str' } ] ] );
  var got = _.entityOnly( dst, src, '*/f1' );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'both' );
}

/* end of entityOnly* routines */

//

function entityButOnlyDst( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0 };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = { false : false, zero : 0 };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityBut( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ false, 0 ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityBut( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, _.nothing';
  var exp = [ false, 0 ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 }, _.nothing ];
  var got = _.entityBut( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = exp;
  var got = _.entityBut( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityBut( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var got = _.entityBut( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var got = _.entityBut( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var got = _.entityBut( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityBut( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var dst = new Constructor1();
  var got = _.entityBut( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got.x, 1 );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityBut( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var got = _.entityBut( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var got = _.entityBut( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var got = _.entityBut( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0 };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = { false : false, zero : 0 };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityBut( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ false, 0 ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityBut( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityBut( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityBut( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var got = _.entityBut( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var got = _.entityBut( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var got = _.entityBut( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = { '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ false ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var dst = new Constructor1();
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got.x, 1 );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = { b : { f1 : false, f2 : 3 } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityBut( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f1, _.nothing';
  var exp = { b : { f1 : false, f2 : 3 } };
  var dst = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityBut( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = { a : { f1 : 1, f2 : 0 } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityBut( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [ { f1 : false, f2 : 3 } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityBut( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [ { f1 : 1, f2 : 0 } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityBut( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityBut( dst, undefined, '*/x' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityBut( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var got = _.entityBut( dst, undefined, '*/length' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var got = _.entityBut( dst, undefined, '*/length' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var got = _.entityBut( dst, undefined, '*/length' );
  test.is( dst === got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityBut() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entityBut( [ 1, 2 ], [ 0, 1 ], ( e ) => e, 'extra' ) );

  test.case = 'wrong onEach type';
  test.shouldThrowErrorSync( () => _.entityBut( [ 1, 2 ], [ 0, 1 ], 'wrong' ) );
  test.shouldThrowErrorSync( () => _.entityBut( [ 1, 2 ], [ 0, 1 ], [] ) );

  test.case = 'onEach.length > 3';
  test.shouldThrowErrorSync( () => _.entityBut( [ 1, 2 ], [ 0, 1 ], ( a, b, c, d ) => a - b + c - d ) );
}

//

function entityButOnlySrc( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { false : false, zero : 0 };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, _.nothing';
  var exp = { false : false, zero : 0 };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityBut( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ false, 0 ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityBut( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityBut( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityBut( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = '';
  var src = '';
  var got = _.entityBut( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = false;
  var src = false;
  var got = _.entityBut( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = 0;
  var src = 0;
  var got = _.entityBut( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityBut( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var src = new Constructor1();
  var got = _.entityBut( null, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got.x, 1 );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityBut( null, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = '';
  var src = '';
  var got = _.entityBut( null, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = false;
  var src = false;
  var got = _.entityBut( null, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = 0;
  var src = 0;
  var got = _.entityBut( null, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { false : false, zero : 0 };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, _.nothing';
  var exp = { false : false, zero : 0 };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityBut( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ false, 0 ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityBut( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityBut( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityBut( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = '';
  var src = '';
  var got = _.entityBut( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = false;
  var src = false;
  var got = _.entityBut( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = 0;
  var src = 0;
  var got = _.entityBut( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ false ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var src = new Constructor1();
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got.x, 1 );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = '';
  var src = '';
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = false;
  var src = false;
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = 0;
  var src = 0;
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'src - map, */f1';
  var exp = { b : { f1 : false, f2 : 3 } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityBut( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, */f1, _.nothing';
  var exp = { b : { f1 : false, f2 : 3 } };
  var src = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityBut( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, */f2';
  var exp = { a : { f1 : 1, f2 : 0 } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityBut( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f1';
  var exp = [ { f1 : false, f2 : 3 } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityBut( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f2';
  var exp = [ { f1 : 1, f2 : 0 } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityBut( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityBut( null, src, '*/x' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityBut( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = '';
  var src = '';
  var got = _.entityBut( null, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = false;
  var src = false;
  var got = _.entityBut( null, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = 0;
  var src = 0;
  var got = _.entityBut( null, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityButBothSame( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0 };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = src;
  var got = _.entityBut( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = { false : false, zero : 0 };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = src;
  var got = _.entityBut( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ false, 0 ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got.x, 1 );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0 };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = { false : false, zero : 0 };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ false, 0 ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = { '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ false ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got.x, 1 );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = { b : { f1 : false, f2 : 3 } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f1, _.nothing';
  var exp = { b : { f1 : false, f2 : 3 } };
  var dst = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = { a : { f1 : 1, f2 : 0 } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityBut( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [ { f1 : false, f2 : 3 } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [ { f1 : 1, f2 : 0 } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityBut( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityBut( dst, src, '*/x' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityBut( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var src = dst;
  var got = _.entityBut( dst, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var src = dst;
  var got = _.entityBut( dst, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var src = dst;
  var got = _.entityBut( dst, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityButBoth( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map, src - map';
  var exp = { false : false, zero : 0 };
  var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, null : 'null', true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, _.nothing';
  var exp = { false : false, zero : 0 };
  var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : false, zero : 0, null : 'null', true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityBut( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ true, 1, { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 1, false, 0, 'str', [ 1 ] ];
  var got = _.entityBut( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, _.nothing';
  var exp = [ true, 1, { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], _.nothing, { a : 0 } ];
  var src = [ true, 1, false, 0, 'str', [ 1 ], _.nothing ];
  var got = _.entityBut( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityBut( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - number';
  var dst = new Constructor1();
  var src = 0;
  var got = _.entityBut( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got.x, 1 );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src = 'src';
  var got = _.entityBut( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - obj';
  var exp = undefined;
  var dst = 'dst';
  var src = new Constructor1();
  var got = _.entityBut( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = '';
  var dst = '';
  var src = null;
  var got = _.entityBut( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - str';
  var exp = undefined;
  var dst = '';
  var src = 'src';
  var got = _.entityBut( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - undefined';
  var exp = false;
  var dst = false;
  var src = undefined;
  var got = _.entityBut( dst, src );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - false, src - number';
  var exp = undefined;
  var dst = false;
  var src = 2;
  var got = _.entityBut( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - false';
  var exp = 0;
  var dst = 0;
  var src = false;
  var got = _.entityBut( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - true';
  var exp = undefined;
  var dst = 0;
  var src = true;
  var got = _.entityBut( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map, src - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'dst::empty' };
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 }, 2, 3 ];
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got.x, 1 );

  test.case = 'dst - str, src - str';
  var exp = 'dst';
  var dst = 'dst';
  var src  = 'src';
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, dst - str';
  var exp = '';
  var dst = '';
  var src = 'src';
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - true';
  var exp = false;
  var dst = false;
  var src  = true;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - 1';
  var exp = 0;
  var dst = 0;
  var src = 1;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map, src - map';
  var exp = { false : false, zero : 0 };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'src::empty' };
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, _.nothing';
  var exp = { false : false, zero : 0 };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'src::empty', nothing : _.nothing };
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ false, 0, { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ] ];
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, nothing';
  var exp = [ false, 0, { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], _.nothing, { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], _.nothing ];
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var dst = new Constructor1();
  var src = false;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got.x, 1 );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src = 'src';
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = 'dst';
  var dst = 'dst';
  var src = null;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = '';
  var dst = '';
  var src = null;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = undefined;
  var dst = '';
  var src = true;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = false;
  var dst = false;
  var src = 0;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = undefined;
  var dst = false;
  var src = 1;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = 0;
  var dst = 0;
  var src = '';
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map, src - map';
  var exp = { '' : 'str::empty' };
  var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { 0 : null, false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ false ];
  var dst = [ false, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 0, false, 1, 'str', [ 1 ] ];
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var dst = new Constructor1();
  var src = false;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got.x, 1 );

  test.case = 'dst - str, src - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = 'src';
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = 'dst';
  var dst = 'dst';
  var src = null;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = '';
  var dst = '';
  var src = null;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = '';
  var dst = '';
  var src = true;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = false;
  var dst = false;
  var src = 0;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = false;
  var dst = false;
  var src = 1;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = 0;
  var dst = 0;
  var src = '';
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, src - map, */f1';
  var exp = { c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 3, f2 : 0 }, b : { f1 : 1, f2 : 3 }, c : { f1 : 0, f2 : 'str' } };
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, */f1, _.nothing';
  var exp = { c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : 1, f2 : 3 }, c : { f1 : 0, f2 : 'str' } };
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 1 }, b : { f1 : false, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityBut( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 0, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f2';
  var exp = [ { f1 : false, f2 : 3 } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : true }, { f1 : false, f2 : false }, { f1 : [], f2 : 'str' } ];
  var got = _.entityBut( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - str';
  var dst = new Constructor1();
  var src = 'src';
  var got = _.entityBut( dst, src, '*/x' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got.x, 1 );

  test.case = 'dst - str, src - 0';
  var exp = 'dst';
  var dst = 'dst';
  var src = 0;
  var got = _.entityBut( dst, src, '*/length' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - 1';
  var exp = '';
  var dst = '';
  var src = 1;
  var got = _.entityBut( dst, src, '*/length' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src = true';
  var exp = false;
  var dst = false;
  var src = true;
  var got = _.entityBut( dst, src, '*/length' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - null';
  var exp = 0;
  var dst = 0;
  var src = null;
  var got = _.entityBut( dst, src, '*/length' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityButDiffTypes( test )
{
  test.shouldThrowErrorSync
  ( () =>
  {
    /* Dmytro : need clarification. Array prototype has some properties, the access to this properties provides by  arr[ property ].
    the example below show this effect */

    test.case = 'dst - map, src - array';
    var exp = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], '' : 'str::empty' };
    var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ false, 0, 'null', true, 1, 'str', [ 1 ], { a : 0 }, '' ];
    var got = _.entityBut( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ false, true, 1, 'str', [ 1 ], { a : 0 } ];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { 1 : 1, false : false, zero : 0, null : 'null', true : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var got = _.entityBut( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], maps : { a : 0 }, '' : 'str::empty' };
    var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], maps : { a : 0 }, '' : 'str::empty' };
    var src = [ true, false, 1, 0, 'str', [], {} ];
    var got = _.entityBut( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 0, true, 'str', [ 1 ], { a : 0 } ];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityBut( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var exp = undefined;
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityBut( dst, src, ( e, k ) => e );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = undefined;
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityBut( dst, src, ( e, k ) => e );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = { '' : 'str::empty' };
    var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ 1, 2, 3, 4 ];
    var got = _.entityBut( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ true ];
    var dst = [ true, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityBut( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var exp = new Constructor1();
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityBut( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = 0;
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityBut( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with maps, */f1';
    var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
    var dst = { a : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
    var src = [ { f1 : 3, f2 : 0 }, { f1 : 1, f2 : 3 }, { f1 : 0, f2 : 'str' } ];
    var got = _.entityBut( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with map, */f2';
    var exp = { 0 : { f1 : 1, f2 : 0 }, 2 : { f1 : [], f2 : 'str' } };
    var dst = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, 2 : { f1 : [], f2 : 'str' } };
    var src = [ 0, { f1 : 1, f2 : 1 }, 2, 3 ];
    var got = _.entityBut( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f1';
    var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityBut( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f2';
    var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityBut( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });
}

//

function entityButOnlySets( test )
{
  test.open( 'only dst' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 0, null, undefined, '', false ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, _.nothing';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var got = _.entityBut( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 0, null, undefined, '', false ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : false, f2 : 3 } ] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityBut( dst, undefined, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'only src' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 0, null, undefined, '', false ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 0, null, undefined, '', false ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value, _.nothing';
  var exp = new Set( [] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var got = _.entityBut( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : false, f2 : 3 } ] );
  var src = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityBut( null, src, '*/f1' );
  test.is( got !== src );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only src' );

  /* - */

  test.open( 'both same' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 0, null, undefined, '', false ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 0, null, undefined, '', false ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value, _.nothing';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : false, f2 : 3 } ] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var src = dst;
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both same' );

  /* - */

  test.open( 'both' );

  test.case = 'has same unnecessary elements';
  var exp = new Set( [ 0, null, undefined, [ 2 ], '', { a : 3 }, false ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, false, 'some', 7 ] );
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has different unnecessary elements';
  var exp = new Set( [ 0, undefined, [ 2 ], '', { a : 3 }, false ] );
  var dst = new Set( [ 0, 1, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, 'some', 7 ] );
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 2, [ 3, 4 ], { b : 3 }, 'src', 8 ] );
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 4, null, undefined, [ 2 ], { a : 3 }, '', false, 'str' ] );
  var got = _.entityBut( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ [ 2 ], { a : 3 } ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 0 ], { a : 0 }, 'str' ] );
  var got = _.entityBut( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 4, null, undefined, [ 2 ], { a : 3 }, '', false, 'str' ] );
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var dst = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var src = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : _.nothing, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var dst = new Set( [ { f1 : _.nothing, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var src = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both' );
}

//

function entityButOnlyHashMaps( test )
{
  test.open( 'only dst' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, _.nothing';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, _.nothing ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'b', { f1 : false, f2 : 3 } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var got = _.entityBut( dst, undefined, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'only src' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value, _.nothing';
  var exp = new Map( [ [ 0, 0 ], [ undefined, undefined ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, _.nothing ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'b', { f1 : false, f2 : 3 } ] ] );
  var src = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var got = _.entityBut( null, src, '*/f1' );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'only src' );

  /* - */

  test.open( 'both same' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'b', { f1 : false, f2 : 3 } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = dst;
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'b', { f1 : false, f2 : 3 } ] ] );
  var dst = new Map( [ [ 'a', { f1 : _.nothing, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = dst;
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'both same' );

  /* - */

  test.open( 'both' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 1 ], [ 1, 0 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ null, _.nothing ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, _.nothing ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 1 ], [ 1, 0 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, true ], [ [ 2 ], [ 1 ] ], [ { a : 3 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 0, 0 ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, 'null' ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 4 ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, 'null' ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 4 ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 1 ], [ 1, 1 ], [ null, 'null' ], [ undefined, 'undefined' ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 2 ], [ [ 2 ], [ '2' ] ], [ { a : 3 }, { a : 0 } ], [ 'str', 'src' ] ] );
  var got = _.entityBut( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = new Map( [ [ 'a', { f1 : 0, f2 : 0 } ], [ 'b', { f1 : 1, f2 : 3 } ], [ 'c', { f1 : undefined, f2 : 'str' } ] ] );
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'both' );
}

/* end of entityBut* routines */

//

function entityAndOnlyDst( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityAnd( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityAnd( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, _.nothing';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 }, _.nothing ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 }, _.nothing ];
  var got = _.entityAnd( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityAnd( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityAnd( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityAnd( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityAnd( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityAnd( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityAnd( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityAnd( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityAnd( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityAnd( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityAnd( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityAnd( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityAnd( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityAnd( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityAnd( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityAnd( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityAnd( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityAnd( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityAnd( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityAnd( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f1';
  var exp = { a : { f1 : _.nothing, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityAnd( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityAnd( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityAnd( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1, _.nothing';
  var exp = [ { f1 : _.nothing, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : _.nothing, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityAnd( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityAnd( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityAnd( dst, undefined, '*/x' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityAnd( dst, undefined, '*/length' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityAnd( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityAnd( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityAnd( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityAnd() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entityAnd( [ 1, 2 ], [ 0, 1 ], ( e ) => e, 'extra' ) );

  test.case = 'wrong onEach type';
  test.shouldThrowErrorSync( () => _.entityAnd( [ 1, 2 ], [ 0, 1 ], 'wrong' ) );
  test.shouldThrowErrorSync( () => _.entityAnd( [ 1, 2 ], [ 0, 1 ], [] ) );

  test.case = 'onEach.length > 3';
  test.shouldThrowErrorSync( () => _.entityAnd( [ 1, 2 ], [ 0, 1 ], ( a, b, c, d ) => a - b + c - d ) );
}

//

function entityAndOnlySrc( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityAnd( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityAnd( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityAnd( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityAnd( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityAnd( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityAnd( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityAnd( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityAnd( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityAnd( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityAnd( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityAnd( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityAnd( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityAnd( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityAnd( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityAnd( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityAnd( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityAnd( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityAnd( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityAnd( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityAnd( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'src - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityAnd( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, */f1, _.nothing';
  var exp = { a : { f1 : _.nothing, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityAnd( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityAnd( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityAnd( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityAnd( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityAnd( null, src, '*/x' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityAnd( null, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityAnd( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityAnd( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityAnd( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityAndBothSame( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = src;
  var got = _.entityAnd( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = src;
  var got = _.entityAnd( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, _.nothing';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 }, _.nothing ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 }, _.nothing ];
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = exp;
  var got = _.entityAnd( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f1, _.nothing';
  var exp = { a : { f1 : _.nothing, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityAnd( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityAnd( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = dst;
  var got = _.entityAnd( dst, src, '*/x' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityAnd( dst, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityAnd( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityAnd( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityAnd( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityAndBoth( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map, src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, null : 'null', true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : false, zero : 0, null : 'null', true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityAnd( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ 'str', [ 1 ] ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 1, false, 0, 'str', [ 1 ] ];
  var got = _.entityAnd( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, _.nothing';
  var exp = [ 'str', [ 1 ], _.nothing ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], _.nothing, { a : 0 } ];
  var src = [ true, 1, false, 0, 'str', [ 1 ], _.nothing ];
  var got = _.entityAnd( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityAnd( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got.x, 1 );

  test.case = 'dst - obj, src - number';
  var exp = undefined;
  var dst = new Constructor1();
  var src = 0;
  var got = _.entityAnd( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = 'src';
  var got = _.entityAnd( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - obj';
  var exp = 'dst';
  var dst = 'dst';
  var src = new Constructor1();
  var got = _.entityAnd( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityAnd( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - str';
  var exp = undefined;
  var dst = '';
  var src = 'src';
  var got = _.entityAnd( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - undefined';
  var exp = undefined;
  var dst = false;
  var src = undefined;
  var got = _.entityAnd( dst, src );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - number';
  var exp = undefined;
  var dst = false;
  var src = 2;
  var got = _.entityAnd( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - true';
  var exp = undefined;
  var dst = 0;
  var src = true;
  var got = _.entityAnd( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map, src - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'dst::empty' };
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 }, 2, 3 ];
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src = 'src';
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, dst - str';
  var exp = undefined;
  var dst = '';
  var src = 'src';
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - true';
  var exp = undefined;
  var dst = false;
  var src  = true;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - 1';
  var exp = undefined;
  var dst = 0;
  var src = 1;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map, src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'src::empty' };
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'src::empty', nothing : _.nothing };
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ true, 1, 'str', [ 1 ] ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ] ];
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var exp = undefined;
  var dst = new Constructor1();
  var src = false;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = 'src';
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = undefined;
  var dst = 'dst';
  var src = null;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - false';
  var exp = undefined;
  var dst = 0;
  var src = false;
  var got = _.entityAnd( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = undefined;
  var dst = '';
  var src = true;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = undefined;
  var dst = false;
  var src = 0;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = undefined;
  var dst = false;
  var src = 1;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = undefined;
  var dst = 0;
  var src = '';
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map, src - map';
  var exp = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { 0 : null, false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ 0, false, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 0, false, 1, 'str', [ 1 ] ];
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var exp = undefined;
  var dst = new Constructor1();
  var src = false;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src = 'src';
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = undefined;
  var dst = 'dst';
  var src = null;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = undefined;
  var dst = '';
  var src = true;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = undefined;
  var dst = false;
  var src = 0;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = undefined;
  var dst = false;
  var src = 1;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = undefined;
  var dst = 0;
  var src = '';
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, src - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 3, f2 : 0 }, b : { f1 : 1, f2 : 3 }, c : { f1 : 0, f2 : 'str' } };
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, */f1, _.nothing';
  var exp = { a : { f1 : _.nothing, f2 : 0 } };
  var dst = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 3, f2 : 0 }, b : { f1 : 1, f2 : 3 }, c : { f1 : 0, f2 : 'str' } };
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, */f2';
  var exp = { c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 1 }, b : { f1 : false, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityAnd( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f1';
  var exp = [ { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 0, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f1, _.nothing';
  var exp = [ { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : _.nothing, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 0, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f2';
  var exp = [ { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : true }, { f1 : false, f2 : false }, { f1 : [], f2 : 'str' } ];
  var got = _.entityAnd( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - str';
  var exp = undefined;
  var dst = new Constructor1();
  var src = 'src';
  var got = _.entityAnd( dst, src, '*/x' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - 0';
  var exp = undefined;
  var dst = 'dst';
  var src = 0;
  var got = _.entityAnd( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - 1';
  var exp = undefined;
  var dst = '';
  var src = 1;
  var got = _.entityAnd( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src = true';
  var exp = undefined;
  var dst = false;
  var src = true;
  var got = _.entityAnd( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - null';
  var exp = undefined;
  var dst = 0;
  var src = null;
  var got = _.entityAnd( dst, src, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityAndDiffTypes( test )
{
  test.shouldThrowErrorSync
  ( () =>
  {
    /* Dmytro : need clarification. Array prototype has some properties, the access to this properties provides by  arr[ property ].
    the example below show this effect */

    test.case = 'dst - map, src - array';
    var exp = { map : { a : 0 } };
    var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ false, 0, 'null', true, 1, 'str', [ 1 ], { a : 0 }, '' ];
    var got = _.entityAnd( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { 1 : 1, false : false, zero : 0, null : 'null', true : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var got = _.entityAnd( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = {};
    var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], maps : { a : 0 }, '' : 'str::empty' };
    var src = [ true, false, 1, 0, 'str', [], {} ];
    var got = _.entityAnd( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 1 ];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityAnd( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var exp = new Constructor1();
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityAnd( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = undefined;
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityAnd( dst, src, ( e, k ) => e );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
    var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ 1, 2, 3, 4 ];
    var got = _.entityAnd( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 0, false, 1, 'str', [ 1 ], { a : 0 } ];
    var dst = [ true, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityAnd( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var exp = undefined;
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityAnd( dst, src, ( e, k ) => k );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = undefined;
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityAnd( dst, src, ( e, k ) => k );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with maps, */f1';
    var exp = {};
    var dst = { a : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
    var src = [ { f1 : 3, f2 : 0 }, { f1 : 1, f2 : 3 }, { f1 : 0, f2 : 'str' } ];
    var got = _.entityAnd( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with map, */f2';
    var exp = { 1 : { f1 : false, f2 : 3 } };
    var dst = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, 2 : { f1 : [], f2 : 'str' } };
    var src = [ 0, { f1 : 1, f2 : 1 }, 2, 3 ];
    var got = _.entityAnd( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f1';
    var exp = [ { f1 : 1, f2 : 0 } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityAnd( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f2';
    var exp = [ { f1 : false, f2 : 3 } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityAnd( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });
}

//

function entityAndOnlySets( test )
{
  test.open( 'only dst' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, _.nothing';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var got = _.entityAnd( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityAnd( dst, undefined, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'only src' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value, _.nothing';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str', _.nothing ] );
  var got = _.entityAnd( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var src = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityAnd( null, src, '*/f1' );
  test.is( got !== src );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only src' );

  /* - */

  test.open( 'both same' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined, _.nothing';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str', _.nothing ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var src = dst;
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both same' );

  /* - */

  test.open( 'both' );

  test.case = 'has same unnecessary elements';
  var exp = new Set( [ 1, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, false, 'some', 7 ] );
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has different unnecessary elements';
  var exp = new Set( [1, 'str' ] );
  var dst = new Set( [ 0, 1, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, 'some', 7 ] );
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 2, [ 3, 4 ], { b : 3 }, 'src', 8 ] );
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 4, null, undefined, [ 2 ], { a : 3 }, '', false, 'str' ] );
  var got = _.entityAnd( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 0 ], { a : 0 }, 'str' ] );
  var got = _.entityAnd( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 4, null, undefined, [ 2 ], { a : 3 }, '', false, 'str' ] );
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [] );
  var dst = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : 1, f2 : 'str' } ] );
  var src = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : 1, f2 : 'str' } ] );
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector, _.nothing';
  var exp = new Set( [] );
  var dst = new Set( [ { f1 : _.nothing, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : 1, f2 : 'str' } ] );
  var src = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : 1, f2 : 'str' } ] );
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both' );
}

//

function entityAndOnlyHashMaps( test )
{
  test.open( 'only dst' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, _.nothing';
  var exp = new Map( [ [ 1, _.nothing ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, _.nothing ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var got = _.entityAnd( dst, undefined, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'only src' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, _.nothing';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, _.nothing ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, _.nothing ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var got = _.entityAnd( null, src, '*/f1' );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'only src' );

  /* - */

  test.open( 'both same' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value, _.nothing';
  var exp = new Map( [ [ 1, _.nothing ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, _.nothing ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'both same' );

  /* - */

  test.open( 'both' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 1 ], [ 1, 0 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, true ], [ [ 2 ], [ 1 ] ], [ { a : 3 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, 'null' ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 4 ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, 'null' ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 4 ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 1 ], [ 1, 1 ], [ null, 'null' ], [ undefined, 'undefined' ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 2 ], [ [ 2 ], [ '2' ] ], [ { a : 3 }, { a : 0 } ], [ 'str', 'src' ] ] );
  var got = _.entityAnd( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : 1, f2 : 3 } ], [ 'c', { f1 : undefined, f2 : 'str' } ] ] );
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector, _.nothing';
  var exp = new Map( [ [ _.nothing, { f1 : 1, f2 : 0 } ] ] );
  var dst = new Map( [ [ _.nothing, { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = new Map( [ [ _.nothing, { f1 : 1, f2 : 0 } ], [ 'b', { f1 : 1, f2 : 3 } ], [ 'c', { f1 : undefined, f2 : 'str' } ] ] );
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'both' );
}

/* end of entityAnd* routines */

//

function entityOrOnlyDst( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityOr( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOr( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, _.nothing';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 }, _.nothing ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 }, _.nothing ];
  var got = _.entityOr( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityOr( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityOr( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOr( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOr( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOr( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOr( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityOr( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityOr( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOr( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOr( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOr( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityOr( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOr( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityOr( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityOr( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOr( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOr( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOr( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOr( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f1, _.nothing';
  var exp = { a : { f1 : _.nothing, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOr( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOr( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOr( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1, _.nothing';
  var exp = [ { f1 : _.nothing, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : _.nothing, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOr( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOr( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityOr( dst, undefined, '*/x' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityOr( dst, undefined, '*/length' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOr( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOr( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOr( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityOr() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entityOr( [ 1, 2 ], [ 0, 1 ], ( e ) => e, 'extra' ) );

  test.case = 'wrong onEach type';
  test.shouldThrowErrorSync( () => _.entityOr( [ 1, 2 ], [ 0, 1 ], 'wrong' ) );
  test.shouldThrowErrorSync( () => _.entityOr( [ 1, 2 ], [ 0, 1 ], [] ) );

  test.case = 'onEach.length > 3';
  test.shouldThrowErrorSync( () => _.entityOr( [ 1, 2 ], [ 0, 1 ], ( a, b, c, d ) => a - b + c - d ) );
}

//

function entityOrOnlySrc( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityOr( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOr( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityOr( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityOr( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOr( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOr( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOr( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOr( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityOr( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityOr( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOr( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOr( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOr( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityOr( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOr( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityOr( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityOr( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOr( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOr( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOr( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'src - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOr( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, */f1, _.nothing';
  var exp = { a : { f1 : _.nothing, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOr( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOr( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOr( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOr( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityOr( null, src, '*/x' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityOr( null, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOr( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOr( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOr( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityOrBothSame( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = src;
  var got = _.entityOr( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = src;
  var got = _.entityOr( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityOr( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = exp;
  var got = _.entityOr( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityOr( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOr( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOr( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOr( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - _.nothing';
  var exp = _.nothing;
  var dst = _.nothing;
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f1, _.nothing';
  var exp = { a : { f1 : _.nothing, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityOr( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityOr( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = dst;
  var got = _.entityOr( dst, src, '*/x' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityOr( dst, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOr( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOr( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOr( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityOrBoth( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map, src - map';
  var exp = { null : 'null', true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, null : 'null', true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, _.nothing';
  var exp = { null : 'null', true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : false, zero : 0, null : 'null', true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityOr( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ true, 1, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 1, false, 0, 'str', [ 1 ] ];
  var got = _.entityOr( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, _.nothing';
  var exp = [ true, 1, true, 1, 'str', [ 1 ], _.nothing, { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], _.nothing, { a : 0 } ];
  var src = [ true, 1, false, 0, 'str', [ 1 ], _.nothing ];
  var got = _.entityOr( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityOr( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got.x, 1 );

  test.case = 'dst - obj, src - number';
  var dst = new Constructor1();
  var src = 0;
  var got = _.entityOr( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got.x, 1 );

  test.case = 'dst - str, src - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = 'src';
  var got = _.entityOr( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - obj';
  var exp = 'dst';
  var dst = 'dst';
  var src = new Constructor1();
  var got = _.entityOr( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityOr( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - str';
  var exp = 'src';
  var dst = '';
  var src = 'src';
  var got = _.entityOr( dst, src );
  test.is( dst !== got );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - false, src - undefined';
  var exp = undefined;
  var dst = false;
  var src = undefined;
  var got = _.entityOr( dst, src );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - _.nothing';
  var exp = _.nothing;
  var dst = false;
  var src = _.nothing;
  var got = _.entityOr( dst, src );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - number';
  var exp = 2;
  var dst = false;
  var src = 2;
  var got = _.entityOr( dst, src );
  test.is( dst !== got );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - false';
  var exp = undefined;
  var dst = 0;
  var src = false;
  var got = _.entityOr( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - true';
  var exp = true;
  var dst = 0;
  var src = true;
  var got = _.entityOr( dst, src );
  test.is( dst !== got );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map, src - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'dst::empty' };
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 }, 2, 3 ];
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src  = 'src';
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, dst - str';
  var exp = undefined;
  var dst = '';
  var src = 'src';
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - true';
  var exp = undefined;
  var dst = false;
  var src  = true;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - 1';
  var exp = undefined;
  var dst = 0;
  var src = 1;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map, src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'src::empty' };
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'src::empty', nothing : _.nothing };
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ] ];
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var dst = new Constructor1();
  var src = false;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got.x, 1 );

  test.case = 'dst - str, src - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = 'src';
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = 'dst';
  var dst = 'dst';
  var src = null;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = true;
  var dst = '';
  var src = true;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = undefined;
  var dst = false;
  var src = 0;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = 1;
  var dst = false;
  var src = 1;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = undefined;
  var dst = 0;
  var src = '';
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map, src - map';
  var exp = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { 0 : null, false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ 0, false, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 0, false, 1, 'str', [ 1 ] ];
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var exp = undefined;
  var dst = new Constructor1();
  var src = false;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src = 'src';
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = undefined;
  var dst = 'dst';
  var src = null;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = undefined;
  var dst = '';
  var src = true;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = undefined;
  var dst = false;
  var src = 0;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = undefined;
  var dst = false;
  var src = 1;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = undefined;
  var dst = 0;
  var src = '';
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, src - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, b : { f1 : 1, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 3, f2 : 0 }, b : { f1 : 1, f2 : 3 }, c : { f1 : 0, f2 : 'str' } };
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, */f1, _.nothing';
  var exp = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : 1, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 3, f2 : 0 }, b : { f1 : 1, f2 : 3 }, c : { f1 : 0, f2 : 'str' } };
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, */f2';
  var exp = {  a : { f1 : 1, f2 : 1 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 1 }, b : { f1 : false, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOr( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 0, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f1, _.nothing';
  var exp = [ { f1 : _.nothing, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : _.nothing, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 0, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f2';
  var exp = [ { f1 : 1, f2 : true }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : true }, { f1 : false, f2 : false }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOr( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - str';
  var dst = new Constructor1();
  var src = 'src';
  var got = _.entityOr( dst, src, '*/x' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got.x, 1 );

  // Dmytro : delimeter '*/length' check length of string as property

  test.case = 'dst - str, src - 0';
  var exp = 'dst';
  var dst = 'dst';
  var src = 0;
  var got = _.entityOr( dst, src, '*/length' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - 1';
  var exp = undefined;
  var dst = '';
  var src = 1;
  var got = _.entityOr( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src = true';
  var exp = undefined;
  var dst = false;
  var src = true;
  var got = _.entityOr( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - null';
  var exp = undefined;
  var dst = 0;
  var src = null;
  var got = _.entityOr( dst, src, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityOrDiffTypes( test )
{
  test.shouldThrowErrorSync
  ( () =>
  {
    /* Dmytro : need clarification. Array prototype has some properties, the access to this properties provides by  arr[ property ].
    the example below show this effect */

    test.case = 'dst - map, src - array';
    var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ false, 0, 'null', true, 1, 'str', [ 1 ], { a : 0 }, '' ];
    var got = _.entityOr( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 1, true, 1, 'str', [ 1 ], { a : 0 } ];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { 1 : 1, false : false, zero : 0, null : 'null', true : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var got = _.entityOr( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = {};
    var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], maps : { a : 0 }, '' : 'str::empty' };
    var src = [ true, false, 1, 0, 'str', [], {} ];
    var got = _.entityOr( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 1 ];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityOr( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityOr( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got.x, 1 );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = [ 1 ];
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityOr( dst, src, ( e, k ) => e );
    test.is( dst !== got );
    test.is( src === got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
    var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ 1, 2, 3, 4 ];
    var got = _.entityOr( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 0, false, 1, 'str', [ 1 ], { a : 0 } ];
    var dst = [ true, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityOr( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityOr( dst, src, ( e, k ) => k );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got.x, 1 );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = undefined;
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityOr( dst, src, ( e, k ) => k );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with maps, */f1';
    var exp = {};
    var dst = { a : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
    var src = [ { f1 : 3, f2 : 0 }, { f1 : 1, f2 : 3 }, { f1 : 0, f2 : 'str' } ];
    var got = _.entityOr( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with map, */f2';
    var exp = { 1 : { f1 : false, f2 : 3 } };
    var dst = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, 2 : { f1 : [], f2 : 'str' } };
    var src = [ 0, { f1 : 1, f2 : 1 }, 2, 3 ];
    var got = _.entityOr( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f1';
    var exp = [ { f1 : 1, f2 : 0 } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityOr( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f2';
    var exp = [ { f1 : false, f2 : 3 } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityOr( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });
}

//

function entityOrOnlySets( test )
{
  test.open( 'only dst' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, _.nothing';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str', _.nothing ] );
  var got = _.entityOr( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityOr( dst, undefined, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'only src' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, _.nothing';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var got = _.entityOr( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var src = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityOr( null, src, '*/f1' );
  test.is( got !== src );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only src' );

  /* - */

  test.open( 'both same' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityOr( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityOr( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var src = dst;
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both same' );

  /* - */

  test.open( 'both' );

  test.case = 'has same unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, false, 'some', 7 ] );
  var got = _.entityOr( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has different unnecessary elements';
  var exp = new Set( [ 1,[ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, 'some', 7 ] );
  var got = _.entityOr( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 2, [ 3, 4 ], { b : 3 }, 'src', 8 ] );
  var got = _.entityOr( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 4, null, undefined, [ 0 ], { a : 3 }, '', false, 'str' ] );
  var got = _.entityOr( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 2, [ 0 ], { a : 0 }, 'src' ] );
  var got = _.entityOr( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 4, null, undefined, [ 0 ], { a : 0 }, '', false, 'str' ] );
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 0, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 0 ], { a : 0 }, 'str' ] );
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 'str' } ] );
  var dst = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : 1, f2 : 'str' } ] );
  var src = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : 1, f2 : 'str' } ] );
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector, _.nothing';
  var exp = new Set( [ { f1 : _.nothing, f2 : 'str' } ] );
  var dst = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : _.nothing, f2 : 'str' } ] );
  var src = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : _.nothing, f2 : 'str' } ] );
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both' );
}

//

function entityOrOnlyHashMaps( test )
{
  test.open( 'only dst' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, _.nothing';
  var exp = new Map( [ [ 1, _.nothing ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, _.nothing ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var got = _.entityOr( dst, undefined, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'only src' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, _.nothing';
  var exp = new Map( [ [ 1, _.nothing ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, _.nothing ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var got = _.entityOr( null, src, '*/f1' );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'only src' );

  /* - */

  test.open( 'both same' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOr( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOr( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value, _.nothing';
  var exp = new Map( [ [ 1, _.nothing ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, _.nothing ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = dst;
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'both same' );

  /* - */

  test.open( 'both' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 0, 1 ], [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 1 ], [ 1, 0 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, true ], [ [ 2 ], [ 1 ] ], [ { a : 3 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ null, 'null' ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, 'null' ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 4 ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, 'null' ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 4 ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 1 ], [ 1, 1 ], [ null, 'null' ], [ undefined, 'undefined' ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOr( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 2 ], [ [ 2 ], [ '2' ] ], [ { a : 3 }, { a : 0 } ], [ 'str', 'src' ] ] );
  var got = _.entityOr( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : 1, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : 1, f2 : 3 } ], [ 'c', { f1 : undefined, f2 : 'str' } ] ] );
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector, _.nothing';
  var exp = new Map( [ [ 'a', { f1 : _.nothing, f2 : 0 } ], [ 'b', { f1 : _.nothing, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var dst = new Map( [ [ 'a', { f1 : _.nothing, f2 : 0 } ], [ 'b', { f1 : _.nothing, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : 1, f2 : 3 } ], [ 'c', { f1 : undefined, f2 : 'str' } ] ] );
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'both' );
}

/* end of entityOr* routines */

//

function entityXorOnlyDst( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityXor( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityXor( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityXor( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, _.nothing';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 }, _.nothing ];
  var got = _.entityXor( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityXor( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityXor( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityXor( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityXor( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityXor( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityXor( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityXor( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityXor( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityXor( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityXor( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityXor( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityXor( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityXor( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityXor( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityXor( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityXor( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityXor( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityXor( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityXor( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityXor( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityXor( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityXor( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityXor( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityXor( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityXor( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityXor( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = {};
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityXor( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f1, _.nothing';
  var exp = {};
  var dst = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityXor( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = {};
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityXor( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityXor( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1, _.nothing';
  var exp = [];
  var dst = [ { f1 : _.nothing, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityXor( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityXor( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityXor( dst, undefined, '*/x' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityXor( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityXor( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityXor( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityXor( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  test.case = 'dst - map, onEach uses external variable';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty'};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var count = 1;
  var onEach = function( e )
  {
    if( count === 1 )
    count--;
    else
    count++;
    return count;
  }
  var got = _.entityXor( dst, undefined, onEach );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str, onEach uses external variable';
  var exp = '';
  var dst = '';
  var count = 1;
  var onEach = function( e )
  {
    if( count === 1 )
    count--;
    else
    count++;
    return count;
  }
  var got = _.entityXor( dst, undefined, onEach );
  test.is( dst === got );
  test.identical( got, exp );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityXor() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entityXor( [ 1, 2 ], [ 0, 1 ], ( e ) => e, 'extra' ) );

  test.case = 'wrong onEach type';
  test.shouldThrowErrorSync( () => _.entityXor( [ 1, 2 ], [ 0, 1 ], 'wrong' ) );
  test.shouldThrowErrorSync( () => _.entityXor( [ 1, 2 ], [ 0, 1 ], [] ) );

  test.case = 'onEach.length > 3';
  test.shouldThrowErrorSync( () => _.entityXor( [ 1, 2 ], [ 0, 1 ], ( a, b, c, d ) => a - b + c - d ) );
}

//

function entityXorOnlySrc( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { false : true, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : true, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityXor( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, _.nothing';
  var exp = { false : true, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : true, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityXor( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityXor( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityXor( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityXor( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = '';
  var src = '';
  var got = _.entityXor( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = false;
  var src = false;
  var got = _.entityXor( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = 0;
  var src = 0;
  var got = _.entityXor( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityXor( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityXor( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityXor( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityXor( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityXor( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityXor( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityXor( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityXor( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, _.nothing';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var got = _.entityXor( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityXor( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityXor( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityXor( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityXor( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityXor( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityXor( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityXor( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityXor( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityXor( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityXor( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityXor( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityXor( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityXor( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'src - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityXor( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, */f1, _.nothing';
  var exp = { a : { f1 : _.nothing, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityXor( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityXor( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityXor( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityXor( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityXor( null, src, '*/x' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityXor( null, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityXor( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityXor( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityXor( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityXorBothSame( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = {};
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = src;
  var got = _.entityXor( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = {};
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var dst = src;
  var got = _.entityXor( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityXor( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityXor( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - _.nothing';
  var exp = undefined;
  var dst = _.nothing;
  var src = dst;
  var got = _.entityXor( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityXor( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityXor( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityXor( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityXor( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, _.nothing';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = {};
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityXor( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f1, _.nothing';
  var exp = {};
  var dst = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityXor( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = {};
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityXor( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityXor( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityXor( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityXor( dst, src, '*/x' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityXor( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityXor( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityXor( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityXor( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityXorBoth( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map, src - map';
  var exp = { null : 'null' };
  var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, null : 'null', true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityXor( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, _.nothing';
  var exp = { false : _.nothing, null : 'null' };
  var dst = { false : _.nothing, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, null : 'null', true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityXor( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ true, 1, true, 1, { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 1, false, 0, 'str', [ 1 ] ];
  var got = _.entityXor( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ true, 1, true, 1, { a : 0 }, _.nothing ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 }, _.nothing ];
  var src = [ true, 1, false, 0, 'str', [ 1 ] ];
  var got = _.entityXor( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityXor( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - number';
  var dst = new Constructor1();
  var src = 0;
  var got = _.entityXor( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got.x, 1 );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src = 'src';
  var got = _.entityXor( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - obj';
  var exp = undefined;
  var dst = 'dst';
  var src = new Constructor1();
  var got = _.entityXor( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityXor( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - str';
  var exp = 'src';
  var dst = '';
  var src = 'src';
  var got = _.entityXor( dst, src );
  test.is( dst !== got );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - false, src - undefined';
  var exp = undefined;
  var dst = false;
  var src = undefined;
  var got = _.entityXor( dst, src );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - number';
  var exp = 2;
  var dst = false;
  var src = 2;
  var got = _.entityXor( dst, src );
  test.is( dst !== got );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - false';
  var exp = undefined;
  var dst = 0;
  var src = false;
  var got = _.entityXor( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - true';
  var exp = true;
  var dst = 0;
  var src = true;
  var got = _.entityXor( dst, src );
  test.is( dst !== got );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map, src - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'dst::empty' };
  var got = _.entityXor( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 }, 2, 3 ];
  var got = _.entityXor( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityXor( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src  = 'src';
  var got = _.entityXor( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, dst - str';
  var exp = undefined;
  var dst = '';
  var src = 'src';
  var got = _.entityXor( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - true';
  var exp = undefined;
  var dst = false;
  var src  = true;
  var got = _.entityXor( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - 1';
  var exp = undefined;
  var dst = 0;
  var src = 1;
  var got = _.entityXor( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map, src - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'src::empty' };
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, _.nothing';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty', nothing : _.nothing };
  var src = { false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'src::empty', nothing : _.nothing };
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ] ];
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var dst = new Constructor1();
  var src = false;
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got.x, 1 );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src = 'src';
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = 'dst';
  var dst = 'dst';
  var src = null;
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = true;
  var dst = '';
  var src = true;
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = undefined;
  var dst = false;
  var src = 0;
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = 1;
  var dst = false;
  var src = 1;
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = undefined;
  var dst = 0;
  var src = '';
  var got = _.entityXor( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map, src - map';
  var exp = {};
  var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { 0 : null, false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ { a : 0 } ];
  var dst = [ false, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 0, false, 1, 'str', [ 1 ] ];
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var exp = undefined;
  var dst = new Constructor1();
  var src = false;
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src = 'src';
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = undefined;
  var dst = 'dst';
  var src = null;
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = undefined;
  var dst = '';
  var src = true;
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = undefined;
  var dst = false;
  var src = 0;
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = undefined;
  var dst = false;
  var src = 1;
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = undefined;
  var dst = 0;
  var src = '';
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, src - map, */f1';
  var exp = { b : { f1 : 1, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 3, f2 : 0 }, b : { f1 : 1, f2 : 3 }, c : { f1 : 0, f2 : 'str' } };
  var got = _.entityXor( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, */f1, _.nothing';
  var exp = { b : { f1 : _.nothing, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : _.nothing, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 3, f2 : 0 }, b : { f1 : _.nothing, f2 : 3 }, c : { f1 : 0, f2 : 'str' } };
  var got = _.entityXor( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, */f2';
  var exp = {  a : { f1 : 1, f2 : 1 }, b : { f1 : false, f2 : 3 } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 1 }, b : { f1 : false, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityXor( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 0, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityXor( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f1, _.nothing';
  var exp = [ { f1 : _.nothing, f2 : 0 } ];
  var dst = [ { f1 : _.nothing, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 0, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityXor( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f2';
  var exp = [ { f1 : 1, f2 : true }, { f1 : false, f2 : 3 } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : true }, { f1 : false, f2 : false }, { f1 : [], f2 : 'str' } ];
  var got = _.entityXor( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - _.nothing, src - str';
  var exp = undefined;
  var dst = _.nothing;
  var src = 'src';
  var got = _.entityXor( dst, src, '*/x' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - str';
  var dst = new Constructor1();
  var src = 'src';
  var got = _.entityXor( dst, src, '*/x' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got.x, 1 );

  // Dmytro : delimeter '*/length' check length of string as property

  test.case = 'dst - str, src - 0';
  var exp = 'dst';
  var dst = 'dst';
  var src = 0;
  var got = _.entityXor( dst, src, '*/length' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - 1';
  var exp = undefined;
  var dst = '';
  var src = 1;
  var got = _.entityXor( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src = true';
  var exp = undefined;
  var dst = false;
  var src = true;
  var got = _.entityXor( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - null';
  var exp = undefined;
  var dst = 0;
  var src = null;
  var got = _.entityXor( dst, src, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityXorDiffTypes( test )
{
  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], '' : 'str::empty' };
    var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ false, 0, 'null', true, 1, 'str', [ 1 ], { a : 0 }, '' ];
    var got = _.entityXor( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 1, 1, true, 1, 'str', [ 1 ], { a : 0 } ];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { 1 : 1, false : false, zero : 0, null : 'null', true : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var got = _.entityXor( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], '' : 'str::empty' };
    var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], maps : { a : 0 }, '' : 'str::empty' };
    var src = [ true, false, 1, 0, 'str', [], {} ];
    var got = _.entityXor( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 'str', true, 1, 'str', [ 1 ], { a : 0 } ];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityXor( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var exp = undefined;
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityXor( dst, src, ( e, k ) => e );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = [ 1 ];
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityXor( dst, src, ( e, k ) => e );
    test.is( dst !== got );
    test.is( src === got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = { zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
    var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ 1, 2, 3, 4 ];
    var got = _.entityXor( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 0, false, 1, 'str', [ 1 ], { a : 0 } ];
    var dst = [ true, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityXor( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var exp = undefined;
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityXor( dst, src, ( e, k ) => k );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = [ 1 ];
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityXor( dst, src, ( e, k ) => k );
    test.is( dst !== got );
    test.is( src === got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with maps, */f1';
    var exp = { a : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
    var dst = { a : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
    var src = [ { f1 : 3, f2 : 0 }, { f1 : 1, f2 : 3 }, { f1 : 0, f2 : 'str' } ];
    var got = _.entityXor( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with map, */f2';
    var exp = {};
    var dst = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, 2 : { f1 : [], f2 : 'str' } };
    var src = [ 0, { f1 : 1, f2 : 1 }, 2, 3 ];
    var got = _.entityXor( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f1';
    var exp = [ { f1 : [], f2 : 'str' } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityXor( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f2';
    var exp = [ { f1 : [], f2 : 'str' } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityXor( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });
}

//

function entityXorOnlySets( test )
{
  test.open( 'only dst' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityXor( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, _.nothing';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str', _.nothing ] );
  var got = _.entityXor( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityXor( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityXor( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityXor( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityXor( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityXor( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityXor( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityXor( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityXor( dst, undefined, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'only src' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityXor( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityXor( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, _.nothing';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var got = _.entityXor( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityXor( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityXor( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityXor( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityXor( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityXor( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityXor( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var src = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityXor( null, src, '*/f1' );
  test.is( got !== src );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only src' );

  /* - */

  test.open( 'both same' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityXor( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityXor( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityXor( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityXor( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value, _.nothing';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str', _.nothing ] );
  var src = dst;
  var got = _.entityXor( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityXor( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityXor( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var src = dst;
  var got = _.entityXor( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both same' );

  /* - */

  test.open( 'both' );

  test.case = 'has same unnecessary elements';
  var exp = new Set( [ [ 2 ], { a : 3 }, [ 2 ], { a : 3 }, 'some', 7 ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, false, 'some', 7 ] );
  var got = _.entityXor( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has different unnecessary elements';
  var exp = new Set( [ [ 2 ], { a : 3 }, [ 2 ], { a : 3 }, 'some', 7 ] );
  var dst = new Set( [ 0, 1, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, 'some', 7 ] );
  var got = _.entityXor( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str', 2, [ 3, 4 ], { b : 3 }, 'src', 8 ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 2, [ 3, 4 ], { b : 3 }, 'src', 8 ] );
  var got = _.entityXor( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 4, [ 0 ], { a : 3 } ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 4, null, undefined, [ 0 ], { a : 3 }, '', false, 'str' ] );
  var got = _.entityXor( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str', 2, [ 0 ], { a : 0 }, 'src' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 2, [ 0 ], { a : 0 }, 'src' ] );
  var got = _.entityXor( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 4, [ 0 ], { a : 0 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 4, null, undefined, [ 0 ], { a : 0 }, '', false, 'str' ] );
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 0 ], { a : 0 }, 'str'] );
  var dst = new Set( [ 0, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 0 ], { a : 0 }, 'str' ] );
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityXor( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityXor( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 'str' }, { f1 : 1, f2 : 'str' } ] );
  var dst = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : 1, f2 : 'str' } ] );
  var src = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : 1, f2 : 'str' } ] );
  var got = _.entityXor( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector, _.nothing';
  var exp = new Set( [ { f1 : _.nothing, f2 : 'str' }, { f1 : 1, f2 : 'str' } ] );
  var dst = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : _.nothing, f2 : 'str' } ] );
  var src = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : 1, f2 : 'str' } ] );
  var got = _.entityXor( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both' );
}

//

function entityXorOnlyHashMaps( test )
{
  test.open( 'only dst' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, _.nothing';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, _.nothing ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var got = _.entityXor( dst, undefined, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'only src' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, _.nothing';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], , _.nothing ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], , _.nothing ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var got = _.entityXor( null, src, '*/f1' );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'only src' );

  /* - */

  test.open( 'both same' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityXor( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityXor( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityXor( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityXor( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value, _.nothing';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, _.nothing ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityXor( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityXor( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityXor( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = dst;
  var got = _.entityXor( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'both same' );

  /* - */

  test.open( 'both' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 0, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 1 ], [ 1, 0 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ [ 2 ], [ 1 ] ], [ { a : 3 }, { a : 0 } ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, true ], [ [ 2 ], [ 1 ] ], [ { a : 3 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ null, 'null' ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, 'null' ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 4 ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, 'null' ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 4 ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 1 ], [ 1, 1 ], [ null, 'null' ], [ undefined, 'undefined' ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityXor( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 2 ], [ [ 2 ], [ '2' ] ], [ { a : 3 }, { a : 0 } ], [ 'str', 'src' ] ] );
  var got = _.entityXor( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'c', { f1 : [], f2 : 'str' } ], [ 'b', { f1 : 1, f2 : 3 } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : 1, f2 : 3 } ], [ 'c', { f1 : undefined, f2 : 'str' } ] ] );
  var got = _.entityXor( dst, src, '*/f1' );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector, _.nothing';
  var exp = new Map( [ [ 'c', { f1 : _.nothing, f2 : 'str' } ], [ 'b', { f1 : 1, f2 : 3 } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : _.nothing, f2 : 'str' } ] ] );
  var src = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : 1, f2 : 3 } ], [ 'c', { f1 : undefined, f2 : 'str' } ] ] );
  var got = _.entityXor( dst, src, '*/f1' );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'both' );
}

/* end of entityXor* routines */

//

function entityAll( test )
{
  test.open( 'onEach is routine' );

  test.case = 'Set';

  var src = new Set( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var src = new Set( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAll( src, ( v, i, c ) => v && c.size > 3 );
  test.identical( got, true );

  var src = new Set( [ 1, 2, [ 'str' ], false, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = new Set( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAll( src, () => undefined );
  test.identical( got, undefined );

  var src = new Set( [ 1, 2, [ 'str' ], 3, 4, _.nothing ] );
  var got = _.entityAll( src, ( v ) => v );
  test.identical( got, true );

  /* */

  test.case = 'Map';

  var src = new Map( [ [ 1, 2 ], [ 'c', 4 ], [ 'a', undefined ] ] );
  var got = _.entityAll( src, ( v, k ) => v === k );
  test.identical( got, false );

  var src = new Map( [ [ 'a', 'a' ], [ '4', '4' ], [ 'true', 'true' ] ] );
  var got = _.entityAll( src, ( v, k ) => v === k );
  test.identical( got, true );

  var src = new Map( [ [ 1, 2 ], [ 2, 3 ], [ 'a', null ] ] );
  var got = _.entityAll( src, ( v, k ) => v !== k );
  test.identical( got, true );

  var src = new Map( [ [ 'a', 'a' ], [ 'c', 'str' ], [ 'd', 'd' ] ] );
  var got = _.entityAll( src, ( v, k ) => typeof v === typeof k );
  test.identical( got, true );

  var src = new Map( [ [ 1, 2 ], [ 'c', 4 ], [ 'a', undefined ] ] );
  var got = _.entityAll( src, ( v, k, src ) => src.size !== v );
  test.identical( got, true );

  var src = new Map( [ [ 1, 2 ], [ 'c', 4 ], [ 'a', _.nothing ] ] );
  var got = _.entityAll( src, ( v, k, src ) => v );
  test.identical( got, true );

  /* */

  test.case = 'array';

  var got = _.entityAll( [ 1, 'str', undefined ], ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var got = _.entityAll( [ 1, 'str', { a : 2 }, 4 ], ( v, i ) => !!v && i + 2 < 6 );
  test.identical( got, true );

  var got = _.entityAll( [ 1, 'str', { a : 2 }, false ], ( v, i ) => !!v && i + 2 < 6 );
  test.identical( got, false );

  var got = _.entityAll( [ 1, 'str', 3, null ], () => undefined );
  test.identical( got, undefined );

  var got = _.entityAll( [ 1, 'str', 3, _.nothing ], ( v ) => v );
  test.identical( got, true );

  /* */

  test.case = 'unroll';

  var src = _.unrollFrom( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var src = _.unrollMake( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = _.unrollMake( [ 1, 2, _.unrollFrom( [ 'str' ] ), undefined, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = _.unrollMake( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityAll( src, () => undefined );
  test.identical( got, undefined );

  var src = _.unrollMake( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4, _.nothing ] );
  var got = _.entityAll( src, ( v ) => v );
  test.identical( got, true );

  /* */

  test.case = 'argument array';

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], false, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAll( src, () => undefined );
  test.identical( got, undefined );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4, _.nothing ] );
  var got = _.entityAll( src, ( v ) => v );
  test.identical( got, true );

  /* */

  test.case = 'F32x';

  var src = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var src = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = new F32x( [ 1, 2, [ 8 ], false, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityAll( src, () => undefined );
  test.identical( got, undefined );

  /* */

  test.case = 'MapLike';

  var got = _.entityAll( { 1 : 2, c : 4, a : undefined }, ( v, k ) => v === k );
  test.identical( got, false );

  var got = _.entityAll( { 'a' : 'a', '4' : '4', 'true' : 'true' }, ( v, k ) => v === k );
  test.identical( got, true );

  var got = _.entityAll( { 1 : 2, 2 : 3, a : null }, ( v, k ) => v !== k );
  test.identical( got, true );

  var got = _.entityAll( { a : 1, b : 3, c : true }, ( v, k ) => v !== k );
  test.identical( got, true );

  var got = _.entityAll( { 'a' : 'a', 'b' : 'str' }, ( v, k ) => typeof v === typeof k );
  test.identical( got, true );

  var got = _.entityAll( { a : 1, b : false }, ( v, k ) => v === k );
  test.identical( got, false );

  var got = _.entityAll( { a : 1, b : false }, ( v, k, src ) => src.length !== v );
  test.identical( got, true );

  var got = _.entityAll( { a : 1, b : _.nothing }, ( v, k, src ) => v );
  test.identical( got, true );

  /* */

  test.case = 'no ArrayLike, no MapLike'

  var got = _.entityAll( undefined, ( src, u ) => src !== u );
  test.identical( got, false );

  var got = _.entityAll( null, ( src, u ) => src === u );
  test.identical( got, false );

  var got = _.entityAll( 1, ( src, u ) => src === u );
  test.identical( got, false );

  var got = _.entityAll( 'str', ( src, u ) => src === u );
  test.identical( got, false );

  var got = _.entityAll( false, ( src, u ) => src === u );
  test.identical( got, false );

  var got = _.entityAll( true, ( src, u ) => src !== u );
  test.identical( got, true );

  var got = _.entityAll( true, ( src, u, u2 ) => src !== u2 );
  test.identical( got, true );

  var got = _.entityAll( _.nothing, ( src, u, u2 ) => src !== u2 );
  test.identical( got, true );

  test.close( 'onEach is routine' );

  /* - */

  test.open( 'onEach is undefined' );

  test.case = 'Set';

  var src = new Set( [ 1, 'str', undefined ] );
  var got = _.entityAll( src );
  test.identical( got, undefined );

  var src = new Set( [ 1, 2, [ false ], 3, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, true );

  var src = new Set( [ 1, 2, [ 'str' ], false, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, false );

  /* */

  test.case = 'Map';

  var src = new Map( [ [ 1, 2 ], [ 'c', 4 ], [ 'a', undefined ] ] );
  var got = _.entityAll( src );
  test.identical( got, undefined );

  var src = new Map( [ [ 'a', 1 ], [ '4', [ false ] ], [ 'true', 'true' ] ] );
  var got = _.entityAll( src );
  test.identical( got, true );

  var src = new Map( [ [ 1, 2 ], [ 2, 3 ], [ 'a', '' ] ] );
  var got = _.entityAll( src );
  test.identical( got, '' );

  /* */

  test.case = 'array';

  var got = _.entityAll( [ 1, 'str', undefined ] );
  test.identical( got, undefined );

  var got = _.entityAll( [ 1, 'str', { a : 2 }, 4 ] );
  test.identical( got, true );

  var got = _.entityAll( [ 1, 'str', { a : 2 }, false ] );
  test.identical( got, false );

  /* */

  test.case = 'unroll';

  var src = _.unrollFrom( [ 1, 2, _.unrollFrom( [ 'str' ] ), null, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, null );

  var src = _.unrollMake( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, true );

  var src = _.unrollMake( [ 1, 2, _.unrollFrom( [ 'str' ] ), false, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, false );

  /* */

  test.case = 'argument array';

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], undefined, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, undefined );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, true );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], false, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, false );

  /* */

  test.case = 'F32x';

  var src = new F32x( [ null, 2, [ 8 ], 3, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, 0 );

  var src = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, true );

  var src = new F32x( [ 1, 2, [ 8 ], 'str', 4 ] );
  var got = _.entityAll( src );
  test.identical( got, NaN );

  /* */

  test.case = 'MapLike';

  var got = _.entityAll( { 1 : 2, c : 4, a : undefined } );
  test.identical( got, undefined );

  var got = _.entityAll( { 1 : 2, 2 : 3, a : null } );
  test.identical( got, null );

  var got = _.entityAll( { a : 1, b : 3, c : true } );
  test.identical( got, true );

  var got = _.entityAll( { a : 'a', b : 'str' } );
  test.identical( got, true );

  var got = _.entityAll( { a : 1, b : false } );
  test.identical( got, false );

  /* */

  test.case = 'no ArrayLike, no MapLike'

  var got = _.entityAll( undefined );
  test.identical( got, undefined );

  var got = _.entityAll( null );
  test.identical( got, null );

  var got = _.entityAll( 1 );
  test.identical( got, true );

  var got = _.entityAll( 'str' );
  test.identical( got, true );

  var got = _.entityAll( false );
  test.identical( got, false );

  var got = _.entityAll( true );
  test.identical( got, true );

  test.close( 'onEach is undefined' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityAll() );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.entityAll( [ 'a' ], ( a ) => a, ( b ) => b ) );

  test.case = 'onEach has more then three arg';
  test.shouldThrowErrorSync( () => _.entityAll( [ 1 ], ( a, b, c, d ) => a + b + c + d ) );

  test.case = 'onEach is not a routine';
  test.shouldThrowErrorSync( () => _.entityAll( { a : 2 }, [] ) );
}

//

function entityAny( test )
{
  test.open( 'onEach is routine' );

  test.case = 'Set';

  var src = new Set( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAny( src, ( v, i ) => v >= 5 );
  test.identical( got, false );

  var src = new Set( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAny( src, ( v, i, c ) => v > 3 && c.size > 3 );
  test.identical( got, true );

  var src = new Set( [ 1, 2, [ 'str' ], false, 4 ] );
  var got = _.entityAny( src, ( v, i ) =>  !v && !i );
  test.identical( got, true );

  var src = new Set( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAny( src, ( v ) => undefined );
  test.identical( got, false );

  var src = new Set( [ _.nothing, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAny( src, ( v ) => v );
  test.identical( got, _.nothing );

  /* */

  test.case = 'Map';

  var src = new Map( [ [ 1, 2 ], [ 'c', 4 ], [ 'a', undefined ] ] );
  var got = _.entityAny( src, ( v, k ) => v === k );
  test.identical( got, false );

  var src = new Map( [ [ 'a', 'a' ], [ '4', '4' ], [ 'true', 'true' ] ] );
  var got = _.entityAny( src, ( v, k ) => v === k );
  test.identical( got, true );

  var src = new Map( [ [ 1, 2 ], [ 2, 3 ], [ 'a', null ] ] );
  var got = _.entityAny( src, ( v, k ) => v !== k );
  test.identical( got, true );

  var src = new Map( [ [ 'a', 1 ], [ 'c', true ], [ 'd', 'd' ] ] );
  var got = _.entityAny( src, ( v, k ) => typeof v === typeof k );
  test.identical( got, true );

  var src = new Map( [ [ 1, 2 ], [ 'c', 4 ], [ 'a', undefined ] ] );
  var got = _.entityAny( src, ( v, k, src ) => src.size === v );
  test.identical( got, false );

  var src = new Map( [ [ 1, _.nothing ], [ 'c', 4 ], [ 'a', undefined ] ] );
  var got = _.entityAny( src, ( v, k, src ) => v );
  test.identical( got, _.nothing );

  /* */

  test.case = 'array';

  var got = _.entityAny( [ 1, 'str', undefined ], ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, true );

  var got = _.entityAny( [ false, false, undefined ], ( v, i ) => !!v && i + 2 < 6 );
  test.identical( got, false );

  var got = _.entityAny( [ 1, 'str', { a : 2 }, false ], ( v, i ) => !!v && i + 2 < 6 );
  test.identical( got, true );

  var got = _.entityAny( [ 1, 'str', 3, null ], () => undefined );
  test.identical( got, false );

  var got = _.entityAny( [ _.nothing, 1, 'str', 3, null ], ( v ) => v );
  test.identical( got, _.nothing );

  /* */

  test.case = 'unroll';

  var src = _.unrollFrom( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, true );

  var src = _.unrollMake( [ undefined, false, _.unrollFrom( null ) ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = _.unrollMake( [ undefined, false, _.unrollFrom( [ 'str' ] ) ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = _.unrollMake( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityAny( src, () => undefined );
  test.identical( got, false );

  var src = _.unrollMake( [ _.nothing, 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityAny( src, ( v ) => v );
  test.identical( got, _.nothing );

  /* */

  test.case = 'argument array';

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, true );

  var src = _.argumentsArrayMake( [ false, null, undefined ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], false, 4 ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAny( src, () => undefined );
  test.identical( got, false );

  var src = _.argumentsArrayMake( [ _.nothing, 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAny( src, ( v ) => v );
  test.identical( got, _.nothing );

  /* */

  test.case = 'F32x';

  var src = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, true );

  var src = new F32x( [ 'a', undefined, false, null ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = new F32x( [ 1, 2, [ 8 ], false, 4 ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityAny( src, () => undefined );
  test.identical( got, false );

  /* */

  test.case = 'MapLike';

  var got = _.entityAny( { 1 : 2, c : 4, a : undefined }, ( v, k ) => v === k );
  test.identical( got, false );

  var got = _.entityAny( { 'a' : false, '4' : false, 'true' : 'true' }, ( v, k ) => v === k );
  test.identical( got, true );

  var got = _.entityAny( { 1 : 2, 2 : 3, a : null }, ( v, k ) => typeof v === typeof k );
  test.identical( got, false );

  var got = _.entityAny( { 'a' : [], 'b' : 'str' }, ( v, k ) => typeof v === typeof k );
  test.identical( got, true );

  var got = _.entityAny( { a : 1, b : false }, ( v, k ) => v === k );
  test.identical( got, false );

  var got = _.entityAny( { a : 1, b : false }, ( v, k, u ) => v !== u );
  test.identical( got, true );

  var got = _.entityAny( { a : _.nothing, b : false }, ( v, k, u ) => v );
  test.identical( got, _.nothing );

  /* */

  test.case = 'no ArrayLike, no ObjectLike'

  var got = _.entityAny( undefined, ( src, u ) => src !== u );
  test.identical( got, false );

  var got = _.entityAny( null, ( src, u ) => src === u );
  test.identical( got, false );

  var got = _.entityAny( 1, ( src, u ) => src !== u );
  test.identical( got, true );

  var got = _.entityAny( 'str', ( src, u ) => src === u );
  test.identical( got, false );

  var got = _.entityAny( false, ( src, u ) => src !== u );
  test.identical( got, true );

  var got = _.entityAny( true, ( src, u ) => src !== u );
  test.identical( got, true );

  var got = _.entityAny( true, ( src, u, u2 ) => src !== u2 );
  test.identical( got, true );

  var got = _.entityAny( _.nothing, ( src, u, u2 ) => src );
  test.identical( got, _.nothing );

  test.close( 'onEach is routine' );

  /* - */

  test.open( 'onEach is undefined' );

  test.case = 'Set';

  var src = new Set( [ false, undefined, '' ] );
  var got = _.entityAny( src );
  test.identical( got, false );

  var src = new Set( [ 1, 2, [ false ], 3, 4 ] );
  var got = _.entityAny( src );
  test.identical( got, 1 );

  var src = new Set( [ '', null, undefined, false, 4 ] );
  var got = _.entityAny( src );
  test.identical( got, 4 );

  /* */

  test.case = 'Map';

  var src = new Map( [ [ 1, '' ], [ 'c', null ], [ 'a', undefined ] ] );
  var got = _.entityAny( src );
  test.identical( got, false );

  var src = new Map( [ [ 'a', 1 ], [ '4', [ false ] ], [ 'true', 'true' ] ] );
  var got = _.entityAny( src );
  test.identical( got, 1 );

  var src = new Map( [ [ 1, false ], [ 2, 0 ], [ 'a', '' ] ] );
  var got = _.entityAny( src );
  test.identical( got, false );

  /* */

  test.case = 'array';

  var got = _.entityAny( [ 1, 'str', undefined ] );
  test.identical( got, 1 );

  var got = _.entityAny( [ 'str', 1, { a : 2 }, 4 ] );
  test.identical( got, 'str' );

  var got = _.entityAny( [ false, null, undefined ] );
  test.identical( got, false );

  /* */

  test.case = 'unroll';

  var src = _.unrollFrom( [ false, 2, _.unrollFrom( [ 'str' ] ), null, 4 ] );
  var got = _.entityAny( src );
  test.identical( got, 2 );

  var src = _.unrollMake( [ undefined, false, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityAny( src );
  test.identical( got, 'str' );

  var src = _.unrollMake( [ null, undefined, false ] );
  var got = _.entityAny( src );
  test.identical( got, false );

  /* */

  test.case = 'argument array';

  var src = _.argumentsArrayMake( [ null, false, [ 'str' ], undefined, 4 ] );
  var got = _.entityAny( src );
  test.identical( got, [ 'str' ] );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAny( src );
  test.identical( got, 1 );

  var src = _.argumentsArrayMake( [ null, false, undefined ] );
  var got = _.entityAny( src );
  test.identical( got, false );

  /* */

  test.case = 'F32x';

  var src = new F32x( [ 5, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAny( src );
  test.identical( got, 5 );

  var src = new F32x( [ undefined, [ 8 ], 3, 4 ] );
  var got = _.entityAny( src );
  test.identical( got, 8 );

  var src = new F32x( [ 'str', undefined, { a : 2 } ] );
  var got = _.entityAny( src );
  test.identical( got, false );

  /* */

  test.case = 'ObjectLike';

  var got = _.entityAny( { 1 : 2, c : 4, a : undefined } );
  test.identical( got, 2 );

  var got = _.entityAny( { 1 : 2, 2 : 3, a : null } );
  test.identical( got, 2 );

  var got = _.entityAny( { a : false, b : null, c : undefined } );
  test.identical( got, false );

  var got = _.entityAny( { a : 'a', b : 'str' } );
  test.identical( got, 'a' );

  var got = _.entityAny( { a : 1, b : false } );
  test.identical( got, 1 );

  /* */

  test.case = 'no ArrayLike, no ObjectLike'

  var got = _.entityAny( undefined );
  test.identical( got, false );

  var got = _.entityAny( null );
  test.identical( got, false );

  var got = _.entityAny( 1 );
  test.identical( got, 1 );

  var got = _.entityAny( 'str' );
  test.identical( got, 'str' );

  var got = _.entityAny( false );
  test.identical( got, false );

  var got = _.entityAny( true );
  test.identical( got, true );

  test.close( 'onEach is undefined' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityAny() );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.entityAny( [ 'a' ], ( a ) => a, ( b ) => b ) );

  test.case = 'onEach has more then three arg';
  test.shouldThrowErrorSync( () => _.entityAny( [ 1 ], ( a, b, c, d ) => a + b + c + d ) );

  test.case = 'onEach is not a routine';
  test.shouldThrowErrorSync( () => _.entityAny( { a : 2 }, [] ) );
}

//

function entityNone( test )
{
  test.open( 'onEach is routine' );

  test.case = 'Set';

  var src = new Set( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityNone( src, ( v, i ) => v >= 5 );
  test.identical( got, true );

  var src = new Set( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityNone( src, ( v, i, c ) => v > 3 && c.size > 3 );
  test.identical( got, false );

  var src = new Set( [ 1, 2, [ 'str' ], false, 4 ] );
  var got = _.entityNone( src, ( v, i ) =>  !v && !i );
  test.identical( got, false );

  var src = new Set( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityNone( src, ( v ) => undefined );
  test.identical( got, true );

  var src = new Set( [ 1, 2, [ 'str' ], 3, 4, _.nothing ] );
  var got = _.entityNone( src, ( v ) => v );
  test.identical( got, false );

  /* */

  test.case = 'Map';

  var src = new Map( [ [ 1, 2 ], [ 'c', 4 ], [ 'a', undefined ] ] );
  var got = _.entityNone( src, ( v, k ) => v === k );
  test.identical( got, true );

  var src = new Map( [ [ 'a', 'a' ], [ '4', '4' ], [ 'true', 'true' ] ] );
  var got = _.entityNone( src, ( v, k ) => v === k );
  test.identical( got, false );

  var src = new Map( [ [ 1, 2 ], [ 2, 3 ], [ 'a', null ] ] );
  var got = _.entityNone( src, ( v, k ) => v !== k );
  test.identical( got, false );

  var src = new Map( [ [ 'a', 1 ], [ 'c', true ], [ 'd', 'd' ] ] );
  var got = _.entityNone( src, ( v, k ) => typeof v === typeof k );
  test.identical( got, false );

  var src = new Map( [ [ 1, 2 ], [ 'c', 4 ], [ 'a', undefined ] ] );
  var got = _.entityNone( src, ( v, k, src ) => src.size === v );
  test.identical( got, true );

  var src = new Map( [ [ 1, 2 ], [ 'c', 4 ], [ 'a', _.nothing ] ] );
  var got = _.entityNone( src, ( v, k, src ) => v );
  test.identical( got, false );

  /* */

  test.case = 'array';

  var got = _.entityNone( [ 1, 'str', undefined ], ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var got = _.entityNone( [ false, false, undefined ], ( v, i ) => !!v && i + 2 < 6 );
  test.identical( got, true );

  var got = _.entityNone( [ 1, 'str', { a : 2 }, false ], ( v, i ) => !!v && i + 2 < 6 );
  test.identical( got, false );

  var got = _.entityNone( [ 1, 'str', 3, null ], () => undefined );
  test.identical( got, true );

  var got = _.entityNone( [ 1, 'str', 3, _.nothing ], ( v ) => v );
  test.identical( got, false );

  /* */

  test.case = 'unroll';

  var src = _.unrollFrom( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var src = _.unrollMake( [ undefined, false, _.unrollFrom( null ) ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = _.unrollMake( [ undefined, false, _.unrollFrom( [ 'str' ] ) ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = _.unrollMake( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityNone( src, () => undefined );
  test.identical( got, true );

  var src = _.unrollMake( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4, _.nothing ] );
  var got = _.entityNone( src, ( v ) => v );
  test.identical( got, false );

  /* */

  test.case = 'argument array';

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var src = _.argumentsArrayMake( [ false, null, undefined ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], false, 4 ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityNone( src, () => undefined );
  test.identical( got, true );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4, _.nothing ] );
  var got = _.entityNone( src, ( v ) => v );
  test.identical( got, false );

  /* */

  test.case = 'F32x';

  var src = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var src = new F32x( [ 'a', undefined, false, null ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = new F32x( [ 1, 2, [ 8 ], false, 4 ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityNone( src, () => undefined );
  test.identical( got, true );

  /* */

  test.case = 'ObjectLike';

  var got = _.entityNone( { 1 : 2, c : 4, a : undefined }, ( v, k ) => v === k );
  test.identical( got, true );

  var got = _.entityNone( { 'a' : false, '4' : false, 'true' : 'true' }, ( v, k ) => v === k );
  test.identical( got, false );

  var got = _.entityNone( { 1 : 2, 2 : 3, a : null }, ( v, k ) => typeof v === typeof k );
  test.identical( got, true );

  var got = _.entityNone( { 'a' : [], 'b' : 'str' }, ( v, k ) => typeof v === typeof k );
  test.identical( got, false );

  var got = _.entityNone( { a : 1, b : false }, ( v, k ) => v === k );
  test.identical( got, true );

  var got = _.entityNone( { a : 1, b : false }, ( v, k, src ) => src.length === v );
  test.identical( got, true );

  var got = _.entityNone( { a : 1, b : _.nothing }, ( v, k, src ) => v );
  test.identical( got, false );

  /* */

  test.case = 'no ArrayLike, no ObjectLike'

  var got = _.entityNone( undefined, ( src, u ) => src !== u );
  test.identical( got, true );

  var got = _.entityNone( null, ( src, u ) => src === u );
  test.identical( got, true );

  var got = _.entityNone( 1, ( src, u ) => src !== u );
  test.identical( got, false );

  var got = _.entityNone( 'str', ( src, u ) => src === u );
  test.identical( got, true );

  var got = _.entityNone( false, ( src, u ) => src !== u );
  test.identical( got, false );

  var got = _.entityNone( true, ( src, u ) => src !== u );
  test.identical( got, false );

  var got = _.entityNone( true, ( src, u, u2 ) => src !== u2 );
  test.identical( got, false );

  var got = _.entityNone( _.nothing, ( src, u, u2 ) => src );
  test.identical( got, false );

  test.close( 'onEach is routine' );

  /* - */

  test.open( 'onEach is undefined' );

  test.case = 'Set';

  var src = new Set( [ false, undefined, '' ] );
  var got = _.entityNone( src );
  test.identical( got, true );

  var src = new Set( [ 1, 2, [ false ], 3, 4 ] );
  var got = _.entityNone( src );
  test.identical( got, false );

  var src = new Set( [ '', null, undefined, false, 4 ] );
  var got = _.entityNone( src );
  test.identical( got, false );

  /* */

  test.case = 'Map';

  var src = new Map( [ [ 1, '' ], [ 'c', null ], [ 'a', undefined ] ] );
  var got = _.entityNone( src );
  test.identical( got, true );

  var src = new Map( [ [ 'a', 1 ], [ '4', [ false ] ], [ 'true', 'true' ] ] );
  var got = _.entityNone( src );
  test.identical( got, false );

  var src = new Map( [ [ 1, false ], [ 2, 0 ], [ 'a', '' ] ] );
  var got = _.entityNone( src );
  test.identical( got, true );

  /* */

  test.case = 'array';

  var got = _.entityNone( [ 1, 'str', undefined ] );
  test.identical( got, false );

  var got = _.entityNone( [ 'str', 1, { a : 2 }, 4 ] );
  test.identical( got, false );

  var got = _.entityNone( [ false, null, undefined ] );
  test.identical( got, true );

  /* */

  test.case = 'unroll';

  var src = _.unrollFrom( [ false, 2, _.unrollFrom( [ 'str' ] ), null, 4 ] );
  var got = _.entityNone( src );
  test.identical( got, false );

  var src = _.unrollMake( [ undefined, false, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityNone( src );
  test.identical( got, false );

  var src = _.unrollMake( [ null, undefined, false ] );
  var got = _.entityNone( src );
  test.identical( got, true );

  /* */

  test.case = 'argument array';

  var src = _.argumentsArrayMake( [ null, false, [ 'str' ], undefined, 4 ] );
  var got = _.entityNone( src );
  test.identical( got, false );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityNone( src );
  test.identical( got, false );

  var src = _.argumentsArrayMake( [ null, false, undefined ] );
  var got = _.entityNone( src );
  test.identical( got, true );

  /* */

  test.case = 'F32x';

  var src = new F32x( [ 5, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityNone( src );
  test.identical( got, false );

  var src = new F32x( [ undefined, [ 8 ], 3, 4 ] );
  var got = _.entityNone( src );
  test.identical( got, false );

  var src = new F32x( [ 'str', undefined, { a : 2 } ] );
  var got = _.entityNone( src );
  test.identical( got, true );

  /* */

  test.case = 'MapLike';

  var got = _.entityNone( { 1 : 2, c : 4, a : undefined } );
  test.identical( got, false );

  var got = _.entityNone( { 1 : 2, 2 : 3, a : null } );
  test.identical( got, false );

  var got = _.entityNone( { a : false, b : null, c : undefined } );
  test.identical( got, true );

  var got = _.entityNone( { a : 'a', b : 'str' } );
  test.identical( got, false );

  var got = _.entityNone( { a : 1, b : false } );
  test.identical( got, false );

  /* */

  test.case = 'no ArrayLike, no MapLike'

  var got = _.entityNone( undefined );
  test.identical( got, true );

  var got = _.entityNone( null );
  test.identical( got, true );

  var got = _.entityNone( 1 );
  test.identical( got, false );

  var got = _.entityNone( 'str' );
  test.identical( got, false );

  var got = _.entityNone( false );
  test.identical( got, true );

  var got = _.entityNone( true );
  test.identical( got, false );

  test.close( 'onEach is undefined' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityNone() );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.entityNone( [ 'a' ], ( a ) => a, ( b ) => b ) );

  test.case = 'onEach has more then three arguments';
  test.shouldThrowErrorSync( () => _.entityNone( [ 1 ], ( a, b, c, d ) => a + b + c + d ) );

  test.case = 'onEach is not a routine';
  test.shouldThrowErrorSync( () => _.entityNone( { a : 2 }, [] ) );
}

//

function _filter_functor( test )
{
  test.case = 'routine, levels - 1';
  var src = ( e, k, s ) => e;
  var condition = _._filter_functor( src, 1 );
  var obj = { a : 1, b : 2 };
  var got = condition( obj, 'a', 1 );
  test.is( got === obj );
  test.identical( got, obj );

  test.case = 'passed element is original object, levels - 1';
  var src = { a : 1, b : 2 };
  var condition = _._filter_functor( src, 1 );
  var got = condition( src, 'a', src );
  test.is( got === src );
  test.identical( got, { a : 1, b : 2 } );

  test.case = 'passed element is original object, levels - -1';
  var src = { a : 1, b : 2 };
  var condition = _._filter_functor( src, -1 );
  var got = condition( src, 'a', src );
  test.is( got === src );
  test.identical( got, { a : 1, b : 2 } );

  test.case = 'passed element is not object, levels - 1';
  var src = { a : 1, b : 2 };
  var condition = _._filter_functor( src, 1 );
  var got = condition( 1, 'a', src );
  test.identical( got, undefined );

  /* */

  test.case = 'src - 1 level, obj - copy of src, levels - 0';
  var src = { a : 1, b : 2 };
  var condition = _._filter_functor( src, 0 );
  var obj = { a : 1, b : 2 };
  var got = condition( obj, 'a', src );
  test.identical( got, undefined );

  test.case = 'callback identicalWith returns true, levels - 0';
  var identicalWith = ( e ) => true;
  var src = { a : 1, b : 2, identicalWith : identicalWith };
  var condition = _._filter_functor( src, 0 );
  var obj = { c : 1, identicalWith : identicalWith };
  var got = condition( obj, 'a', src );
  test.is( got === obj );
  test.identical( got, obj );

  test.case = 'src - level 1, obj - copy of src, levels - 1';
  var src = { a : 1, b : 2 };
  var condition = _._filter_functor( src, 1 );
  var obj = { a : 1, b : 2 };
  var got = condition( obj, 'a', src );
  test.is( got === obj );
  test.identical( got, obj );

  test.case = 'src - level 2, obj - copy of src, levels - 1';
  var src = { a : { c : 2 }, b : 2 };
  var condition = _._filter_functor( src, 1 );
  var obj = { a : { c : 2 }, b : 2 };
  var got = condition( obj, 'a', src );
  test.identical( got, undefined );

  test.case = 'src - level 2, obj - copy of src, levels - 2';
  var src = { a : { c : 2 }, b : 2 };
  var condition = _._filter_functor( src, 2 );
  var obj = { a : { c : 2 }, b : 2 };
  var got = condition( obj, 'a', src );
  test.is( got === obj );
  test.identical( got, obj );

  test.case = 'src - level, obj - level 2, levels - 2';
  var src = { a : { c : 2 }, b : 2 };
  var condition = _._filter_functor( src, 2 );
  var obj = { a : { d : 2 }, b : 2 };
  var got = condition( obj, 'a', src );
  test.identical( got, undefined );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _._filter_functor() );

  test.case = 'one argument';
  test.shouldThrowErrorSync( () => _._filter_functor( { a : 1 } ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _._filter_functor( { a : 1 }, 1, 1 ) );

  test.case = 'wrong type of condition';
  test.shouldThrowErrorSync( () => _._filter_functor( 'wrong', 1 ) );
  test.shouldThrowErrorSync( () => _._filter_functor( [ 1, 2 ], 1 ) );

  test.case = 'wrong quantity arguments in maked routine';
  var condition = _._filter_functor( { a : 1 }, 1 );
  test.shouldThrowErrorSync( () => condition() );
  test.shouldThrowErrorSync( () => condition( { a : 1 } ) );
  test.shouldThrowErrorSync( () => condition( { a : 1 }, 'a' ) );
  test.description = 'check of routine';
  test.mustNotThrowError( () => condition( { a : 1 }, 'a', { a : 1 } ) );
}

//

function entityMap( test )
{
  test.open( 'src is arrayLike' );

  test.case = 'simple test with mapping array by sqr';
  var got = _.entityMap( [ 3, 4, 5 ], ( v, i, ent ) => v * v );
  test.identical( got,[ 9, 16, 25 ] );

  test.case = 'array';
  var src1 = [ 1, 2, null, 'str' ];
  var got = _.entityMap( src1, ( v, i, s ) => v + i );
  test.identical( got, [ 1, 3, 2, 'str3' ] );

  test.case = 'unroll';
  var src1 = _.unrollFrom( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityMap( src1, ( v, i, s ) => v + i );
  test.identical( got, [ 1, 3, 'str2', 6, 8 ] );
  test.is( _.arrayIs( got ) );
  test.isNot( _.unrollIs( got ) );

  test.case = 'argument array';
  var src1 = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityMap( src1, ( v, i, s ) => v + i );
  test.identical( got, [ 1, 3, 'str2', 6, 8 ] );
  test.is( _.arrayIs( got ) );

  test.case = 'Array';
  var src1 = new Array( 1, 2, [ 'str' ], 3, 4 );
  var got = _.entityMap( src1, ( v, i, s ) => v + i );
  test.identical( got, [ 1, 3, 'str2', 6, 8 ] );
  test.is( _.arrayIs( got ) );

  test.case = 'F32x';
  var src1 = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityMap( src1, ( v, i, s ) => v + i );
  test.equivalent( got, [ 1, 3, 10, 6, 8 ] );
  test.is( _.longIs( got ) );

  test.close( 'src is arrayLike' );

  /* - */

  test.open( 'src is objectLike' );

  test.case = 'simple test with mapping object by sqr';
  var got = _.entityMap( { '3' : 3, '4' : 4, '5' : 5 }, ( v, i, ent ) => v * v );
  test.identical( got,{ '3' : 9, '4' : 16, '5' : 25 } );
  test.is( _.mapIs( got ) );

  var src1 = { a : 1, b : 2, c : null, d : 'str' };
  var got = _.entityMap( src1, ( v, k, s ) => v + k );
  test.identical( got, { a : '1a', b : '2b', c : 'nullc', d : 'strd' } );
  test.is( _.mapIs( got ) );

  test.case = 'object';
  function constr()
  {
    this.a = 1;
    this.b = 3;
    this.c = 4;
  }
  var got = _.entityMap( new constr(), ( e, i, ent ) => e.b );
  test.identical( got, 3 );

  // test.case = 'routine constructor';
  // function constr()
  // {
  //   this.a = 1;
  //   this.b = 3;
  //   this.c = 4;
  // }
  // var got = _.entityMap( new constr(), ( v, i, ent ) => v * v + i );
  // test.identical( got, { a : '1a', b : '9b', c : '16c' } );
  // test.is( !( got instanceof constr ) );
  // test.is( _.mapIs( got ) );

  test.case = 'simple test with mapping object by sqr : check callback arguments';
  var callback = function( v, i, ent )
  {
    if( externEnt )
    externEnt = ent;
    return v * v + i;
  };
  var externEnt = {};
  var got = _.entityMap( Object.assign( {}, { 'a' : 1, 'b' : 3, 'c' : 4 } ), callback );
  test.identical( externEnt, { 'a' : 1, 'b' : 3, 'c' : 4 } );

  test.case = 'mapping object by sqr : source object should be unmodified';
  test.identical( Object.is( got, Object.assign( {}, { 'a' : 1, 'b' : 3, 'c' : 4 } ) ), false );

  test.close( 'src is objectLike' );

  /* - */

  test.case = 'no ArrayLike, no ObjectLike';
  var got = _.entityMap( 2, ( v, u, u2 ) => v + v );
  test.identical( got, 4 );

  var got = _.entityMap( 'a', ( v, u, u2 ) => v + v );
  test.identical( got, 'aa' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( () => _.entityMap() );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.entityMap( [ 1,3 ], callback1, callback2 ) );

  test.case = 'passed argument has undefines';
  test.shouldThrowErrorSync( () => _.entityMap( [ 1, undefined ], ( v, i ) => v ) );
  test.shouldThrowErrorSync( () => _.entityMap( { a : 2, b : undefined }, ( v, i ) => v ) );
  test.shouldThrowErrorSync( () => _.entityMap( undefined, ( v, i ) => v ) );

  test.case = 'second argument is not routine';
  test.shouldThrowErrorSync( () => _.entityMap( [ 1, 2 ], {} ) );
}

//

function entityMapWithoutDst_( test )
{
  test.open( 'onEach returns element' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityMap_( src, ( e ) => e );
  test.identical( got, [] );
  test.is( got === src );

  test.case = 'unroll';
  var src = _.unrollMake( [ 1, 2, 3, 4, 'str' ] );
  var got = _.entityMap_( src, ( e ) => e );
  test.identical( got, _.unrollMake( [ 1, 2, 3, 4, 'str' ] ) );
  test.is( got === src );
  test.is( _.unrollIs( got ) );

  test.case = 'argumentsArray';
  var src = _.argumentsArrayMake( [ 1, 2, 3, 4, 'str' ] );
  var got = _.entityMap_( src, ( e ) => e );
  test.identical( got, _.argumentsArrayMake( [ 1, 2, 3, 4, 'str' ] ) );
  test.is( got === src );

  test.case = 'BufferTyped';
  var src = new U8x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityMap_( src, ( e ) => e );
  test.identical( got, new U8x( [ 1, 2, 3, 4, 5 ] ) );
  test.is( got === src );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityMap_( src, ( e ) => e );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = { a : 1, b : 2, c : 'str' };
  var got = _.entityMap_( src, ( e ) => e );
  test.identical( got, { a : 1, b : 2, c : 'str' } );
  test.is( got === src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityMap_( src, ( e ) => e );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  var got = _.entityMap_( src, ( e ) => e );
  test.identical( got, { a : 1, b : 2 } );
  test.is( got === src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityMap_( src, ( e ) => e );
  test.identical( got, null );

  test.case = 'undefined';
  var src = undefined;
  var got = _.entityMap_( src, ( e ) => String( e ) );
  test.identical( got, 'undefined' );

  test.case = 'string';
  var src = 'str';
  var got = _.entityMap_( src, ( e ) => e );
  test.identical( got, 'str' );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityMap_( src, ( e ) => e );
  test.identical( got, new Set() );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityMap_( src, ( e ) => e );
  test.identical( got, new BufferRaw() );

  test.close( 'onEach returns element' );

  /* - */

  test.open( 'onEach returns key' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityMap_( src, ( e, k ) => k );
  test.identical( got, [] );
  test.is( got === src );

  test.case = 'unroll';
  var src = _.unrollMake( [ 1, 2, 3, 4, 'str' ] );
  var got = _.entityMap_( src, ( e, k ) => k );
  test.identical( got, _.unrollMake( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got === src );
  test.is( _.unrollIs( got ) );

  test.case = 'argumentsArray';
  var src = _.argumentsArrayMake( [ 0, 1, 2, 3, 4 ] );
  var got = _.entityMap_( src, ( e, k ) => k );
  test.identical( got, _.argumentsArrayMake( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got === src );

  test.case = 'BufferTyped';
  var src = new I16x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityMap_( src, ( e, k ) => k );
  test.identical( got, new I16x( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got === src );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityMap_( src, ( e, k ) => k );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = { a : 1, b : 2, c : 'str' };
  var got = _.entityMap_( src, ( e, k ) => k );
  test.identical( got, { a : 'a', b : 'b', c : 'c' } );
  test.is( got === src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityMap_( src, ( e, k ) => k );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  var got = _.entityMap_( src, ( e, k ) => k );
  test.identical( got, { a : 'a', b : 'b' } );
  test.is( got === src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityMap_( src, ( e, k ) => String( k ) );
  test.identical( got, 'undefined' );

  test.case = 'undefined';
  var src = undefined;
  var got = _.entityMap_( src, ( e, k ) => String( k ) );
  test.identical( got, 'undefined' );

  test.case = 'string';
  var src = 'str';
  var got = _.entityMap_( src, ( e, k ) => String( k ) );
  test.identical( got, 'undefined' );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityMap_( src, ( e, k ) => String( k ) );
  test.identical( got, 'undefined' );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityMap_( src, ( e, k ) => String( k ) );
  test.identical( got, 'undefined' );

  test.close( 'onEach returns key' );

  /* - */

  test.open( 'onEach checks container' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityMap_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, [] );
  test.is( got === src );

  test.case = 'unroll';
  var src = _.unrollMake( [ 1, 2, 3, 4, 'str' ] );
  var got = _.entityMap_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, _.unrollMake( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got === src );
  test.is( _.unrollIs( got ) );

  test.case = 'argumentsArray';
  var src = _.argumentsArrayMake( [ 0, 1, 2, 3, 4 ] );
  var got = _.entityMap_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, _.argumentsArrayMake( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got === src );

  test.case = 'BufferTyped';
  var src = new F64x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityMap_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, new F64x( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got === src );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityMap_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = { a : 1, b : 2, c : 'str' };
  var got = _.entityMap_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, { a : 'a', b : 'b', c : 'c' } );
  test.is( got === src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityMap_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  var got = _.entityMap_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, { a : 'a', b : 'b' } );
  test.is( got === src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityMap_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, null );

  test.case = 'undefined';
  var src = undefined;
  var got = _.entityMap_( src, ( e, k, c ) => c ? k : String( e ) );
  test.identical( got, 'undefined' );

  test.case = 'string';
  var src = 'str';
  var got = _.entityMap_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, 'str' );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityMap_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, new Set() );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityMap_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, new BufferRaw() );

  test.close( 'onEach checks container' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityMap_() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.entityMap_( 'str' ) );
  test.shouldThrowErrorSync( () => _.entityMap_( [ 1, 2 ] ) );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.entityMap_( [ 1, 3 ], [ 1, 2 ], ( e ) => e, 'extra' ) );
  test.shouldThrowErrorSync( () => _.entityMap_( { a : 1 }, { b : 2 }, ( e ) => e, 'extra' ) );

  test.case = 'onEach returns undefined';
  test.shouldThrowErrorSync( () => _.entityMap_( [ 1, undefined ], ( e ) => e ) );
  test.shouldThrowErrorSync( () => _.entityMap_( { a : 2, b : undefined }, ( e ) => e ) );
  test.shouldThrowErrorSync( () => _.entityMap_( 1, ( e ) => undefined ) );

  test.case = 'wrong type of onEach';
  test.shouldThrowErrorSync( () => _.entityMap_( [ 1, 2 ], {} ) );
  test.shouldThrowErrorSync( () => _.entityMap_( null, [ 1, 2 ], {} ) );

  test.case = 'wrong dst container';
  test.shouldThrowErrorSync( () => _.entityMap_( {}, [ 1, 2 ], ( e ) => e ) );
  test.shouldThrowErrorSync( () => _.entityMap_( [], { a : 1, b : 2 }, ( e ) => e ) );
  test.shouldThrowErrorSync( () => _.entityMap_( new BufferRaw(), { a : 1, b : 2 }, ( e ) => e ) );

  test.case = 'dst is not resizable long';
  test.shouldThrowErrorSync( () => _.entityMap_( new F32x(), { a : 1, b : 2 }, ( e ) => e ) );

  test.case = 'not map like, not long like, cannot extend map';
  test.shouldThrowErrorSync( () => _.entityMap_( {}, 1, ( e ) => e ) );
}

//

function entityMapDstNull_( test )
{
  test.open( 'onEach returns element' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityMap_( null, src, ( e ) => e );
  test.identical( got, [] );
  test.is( got !== src );

  test.case = 'unroll';
  var src = _.unrollMake( [ 1, 2, 3, 4, 'str' ] );
  var got = _.entityMap_( null, src, ( e ) => e );
  test.identical( got, _.unrollMake( [ 1, 2, 3, 4, 'str' ] ) );
  test.is( got !== src );
  test.is( _.arrayIs( got ) );

  test.case = 'argumentsArray';
  var src = _.argumentsArrayMake( [ 1, 2, 3, 4, 'str' ] );
  var got = _.entityMap_( null, src, ( e ) => e );
  test.identical( got, [ 1, 2, 3, 4, 'str' ] );
  test.is( got !== src );

  test.case = 'BufferTyped';
  var src = new U8x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityMap_( null, src, ( e ) => e );
  test.identical( got, new U8x( [ 1, 2, 3, 4, 5 ] ) );
  test.is( got !== src );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityMap_( null, src, ( e ) => e );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = { a : 1, b : 2, c : 'str' };
  var got = _.entityMap_( null, src, ( e ) => e );
  test.identical( got, { a : 1, b : 2, c : 'str' } );
  test.is( got !== src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityMap_( null, src, ( e ) => e );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  var got = _.entityMap_( null, src, ( e ) => e );
  test.identical( got, { a : 1, b : 2 } );
  test.is( got !== src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityMap_( null, src, ( e ) => e );
  test.identical( got, null );

  test.case = 'undefined';
  var src = undefined;
  var got = _.entityMap_( null, src, ( e ) => String( e ) );
  test.identical( got, 'undefined' );

  test.case = 'string';
  var src = 'str';
  var got = _.entityMap_( null, src, ( e ) => e );
  test.identical( got, 'str' );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityMap_( null, src, ( e ) => e );
  test.identical( got, new Set() );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityMap_( null, src, ( e ) => e );
  test.identical( got, new BufferRaw() );

  test.close( 'onEach returns element' );

  /* - */

  test.open( 'onEach returns key' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityMap_( null, src, ( e, k ) => k );
  test.identical( got, [] );
  test.is( got !== src );

  test.case = 'unroll';
  var src = _.unrollMake( [ 1, 2, 3, 4, 'str' ] );
  var got = _.entityMap_( null, src, ( e, k ) => k );
  test.identical( got, _.unrollMake( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got !== src );
  test.is( _.arrayIs( got ) );

  test.case = 'argumentsArray';
  var src = _.argumentsArrayMake( [ 0, 1, 2, 3, 4 ] );
  var got = _.entityMap_( null, src, ( e, k ) => k );
  test.identical( got, [ 0, 1, 2, 3, 4 ] );
  test.is( got !== src );

  test.case = 'BufferTyped';
  var src = new I16x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityMap_( null, src, ( e, k ) => k );
  test.identical( got, new I16x( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got !== src );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityMap_( null, src, ( e, k ) => k );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = { a : 1, b : 2, c : 'str' };
  var got = _.entityMap_( null, src, ( e, k ) => k );
  test.identical( got, { a : 'a', b : 'b', c : 'c' } );
  test.is( got !== src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityMap_( null, src, ( e, k ) => k );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  var got = _.entityMap_( null, src, ( e, k ) => k );
  test.identical( got, { a : 'a', b : 'b' } );
  test.is( got !== src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityMap_( null, src, ( e, k ) => String( k ) );
  test.identical( got, 'undefined' );

  test.case = 'undefined';
  var src = undefined;
  var got = _.entityMap_( null, src, ( e, k ) => String( k ) );
  test.identical( got, 'undefined' );

  test.case = 'string';
  var src = 'str';
  var got = _.entityMap_( null, src, ( e, k ) => String( k ) );
  test.identical( got, 'undefined' );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityMap_( null, src, ( e, k ) => String( k ) );
  test.identical( got, 'undefined' );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityMap_( null, src, ( e, k ) => String( k ) );
  test.identical( got, 'undefined' );

  test.close( 'onEach returns key' );

  /* - */

  test.open( 'onEach checks container' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityMap_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, [] );
  test.is( got !== src );

  test.case = 'unroll';
  var src = _.unrollMake( [ 1, 2, 3, 4, 'str' ] );
  var got = _.entityMap_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, _.unrollMake( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got !== src );
  test.is( _.arrayIs( got ) );

  test.case = 'argumentsArray';
  var src = _.argumentsArrayMake( [ 0, 1, 2, 3, 4 ] );
  var got = _.entityMap_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, [ 0, 1, 2, 3, 4 ] );
  test.is( got !== src );

  test.case = 'BufferTyped';
  var src = new F64x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityMap_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, new F64x( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got !== src );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityMap_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = { a : 1, b : 2, c : 'str' };
  var got = _.entityMap_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, { a : 'a', b : 'b', c : 'c' } );
  test.is( got !== src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityMap_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  var got = _.entityMap_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, { a : 'a', b : 'b' } );
  test.is( got !== src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityMap_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, null );

  test.case = 'undefined';
  var src = undefined;
  var got = _.entityMap_( null, src, ( e, k, c ) => c ? k : String( e ) );
  test.identical( got, 'undefined' );

  test.case = 'string';
  var src = 'str';
  var got = _.entityMap_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, 'str' );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityMap_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, new Set() );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityMap_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, new BufferRaw() );

  test.close( 'onEach checks container' );
}

//

function entityMapDstNotNull_( test )
{
  test.open( 'onEach returns element' );

  test.case = 'dst - argumentsArray, empty array';
  var dst = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var src = [];
  var got = _.entityMap_( dst, src, ( e ) => e );
  test.identical( got, _.argumentsArrayMake( [ 1, 2, 3 ] ) );
  test.is( got === dst );

  test.case = 'dst - array, unroll';
  var dst = [ 'a', 'b', 'c', 'd', 'e', 'f' ];
  var src = _.unrollMake( [ 1, 2, 3, 4, 'str' ] );
  var got = _.entityMap_( dst, src, ( e ) => e );
  test.identical( got, _.unrollMake( [ 1, 2, 3, 4, 'str', 'f' ] ) );
  test.is( got === dst );

  test.case = 'dst - unroll, argumentsArray';
  var dst = _.unrollMake( [ 'a', 'b', 'c', 'd', 'e', 'f' ] );
  var src = _.argumentsArrayMake( [ 0, 1, 2, 3, 4 ] );
  var got = _.entityMap_( dst, src, ( e ) => e );
  test.identical( got, [ 0, 1, 2, 3, 4, 'f' ] );
  test.is( got === dst );

  test.case = 'dst - BufferTyped, BufferTyped';
  var dst = new U16x( 10 );
  var src = new F64x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityMap_( dst, src, ( e ) => e );
  test.identical( got, new U16x( [ 1, 2, 3, 4, 5, 0, 0, 0, 0, 0 ] ) );
  test.is( got === dst );

  /* */

  test.case = 'dst - map, empty map';
  var dst = { a : 2, d : 2 };
  var src = {};
  var got = _.entityMap_( dst, src, ( e ) => e );
  test.identical( got, { a : 2, d : 2 } );
  test.is( got === dst );

  test.case = 'dst - pure map, map';
  var dst = Object.create( null );
  dst.a = 2;
  dst.d = 2;
  var src = { a : 1, b : 2, c : 'str' };
  var got = _.entityMap_( dst, src, ( e ) => e );
  test.identical( got, { a : 1, b : 2, c : 'str', d : 2 } );
  test.is( got === dst );

  test.case = 'dst - map, empty pure map';
  var dst = { a : 2, d : 2 };
  var src = Object.create( null );
  var got = _.entityMap_( dst, src, ( e ) => e );
  test.identical( got, { a : 2, d : 2 } );
  test.is( got === dst );

  test.case = 'map';
  var dst = { a : 2, d : 2 };
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  var got = _.entityMap_( dst, src, ( e ) => e );
  test.identical( got, { a : 1, b : 2, d : 2 } );
  test.is( got === dst );

  /* */

  test.case = 'dst - array, null';
  var dst = [ 1, 2 ];
  var src = null;
  var got = _.entityMap_( dst, src, ( e ) => e );
  test.identical( got, [ 1, 2, null ] );
  test.is( got === dst );

  test.case = 'dst - map, undefined';
  var dst = { a : 1 };
  var src = undefined;
  var got = _.entityMap_( dst, src, ( e ) => { return { e : e } } );
  test.identical( got, { a : 1, 'undefined' : undefined } );
  test.is( got === dst );

  test.case = 'dst - undefined, string';
  var dst = undefined;
  var src = 'str';
  var got = _.entityMap_( dst, src, ( e ) => e );
  test.identical( got, 'str' );

  test.case = 'dst - emty unroll, Set';
  var dst = _.unrollMake( [] );
  var src = new Set();
  var got = _.entityMap_( dst, src, ( e ) => e );
  test.identical( got, [ new Set() ] );
  test.is( got === dst );

  test.case = 'dst - empty pure map, BufferRaw';
  var dst = Object.create( null );
  var src = new BufferRaw();
  var got = _.entityMap_( dst, src, ( e ) => [ e ] );
  test.identical( got, { 0 : new BufferRaw() } );
  test.is( got === dst );

  test.close( 'onEach returns element' );

  /* - */

  test.open( 'onEach returns key' );

  test.case = 'dst - argumentsArray, empty array';
  var dst = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var src = [];
  var got = _.entityMap_( dst, src, ( e, k ) => k );
  test.identical( got, _.argumentsArrayMake( [ 1, 2, 3 ] ) );
  test.is( got === dst );

  test.case = 'dst - array, unroll';
  var dst = [ 'a', 'b', 'c', 'd', 'e', 'f' ];
  var src = _.unrollMake( [ 1, 2, 3, 4, 'str' ] );
  var got = _.entityMap_( dst, src, ( e, k ) => k );
  test.identical( got, _.unrollMake( [ 0, 1, 2, 3, 4, 'f' ] ) );
  test.is( got === dst );

  test.case = 'dst - unroll, argumentsArray';
  var dst = _.unrollMake( [ 'a', 'b', 'c', 'd', 'e', 'f' ] );
  var src = _.argumentsArrayMake( [ 0, 1, 2, 3, 4 ] );
  var got = _.entityMap_( dst, src, ( e, k ) => k );
  test.identical( got, [ 0, 1, 2, 3, 4, 'f' ] );
  test.is( got === dst );

  test.case = 'dst - BufferTyped, BufferTyped';
  var dst = new U16x( 10 );
  var src = new F64x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityMap_( dst, src, ( e, k ) => k );
  test.identical( got, new U16x( [ 0, 1, 2, 3, 4, 0, 0, 0, 0, 0 ] ) );
  test.is( got === dst );

  /* */

  test.case = 'dst - map, empty map';
  var dst = { a : 2, d : 2 };
  var src = {};
  var got = _.entityMap_( dst, src, ( e, k ) => k );
  test.identical( got, { a : 2, d : 2 } );
  test.is( got === dst );

  test.case = 'dst - pure map, map';
  var dst = Object.create( null );
  dst.a = 2;
  dst.d = 2;
  var src = { a : 1, b : 2, c : 'str' };
  var got = _.entityMap_( dst, src, ( e, k ) => k );
  test.identical( got, { a : 'a', b : 'b', c : 'c', d : 2 } );
  test.is( got === dst );

  test.case = 'dst - map, empty pure map';
  var dst = { a : 2, d : 2 };
  var src = Object.create( null );
  var got = _.entityMap_( dst, src, ( e, k ) => k );
  test.identical( got, { a : 2, d : 2 } );
  test.is( got === dst );

  test.case = 'map';
  var dst = { a : 2, d : 2 };
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  var got = _.entityMap_( dst, src, ( e, k ) => k );
  test.identical( got, { a : 'a', b : 'b', d : 2 } );
  test.is( got === dst );

  /* */

  test.case = 'dst - array, null';
  var dst = [ 1, 2 ];
  var src = null;
  var got = _.entityMap_( dst, src, ( e, k ) => String( k ) );
  test.identical( got, [ 1, 2, 'undefined' ] );
  test.is( got === dst );

  test.case = 'dst - map, undefined';
  var dst = { a : 1 };
  var src = undefined;
  var got = _.entityMap_( dst, src, ( e, k ) => { return { k : k } } );
  test.identical( got, { a : 1, 'undefined' : undefined } );
  test.is( got === dst );

  test.case = 'dst - undefined, string';
  var dst = undefined;
  var src = 'str';
  var got = _.entityMap_( dst, src, ( e, k ) => String( k ) );
  test.identical( got, 'undefined' );

  test.case = 'dst - emty unroll, Set';
  var dst = _.unrollMake( [] );
  var src = new Set();
  var got = _.entityMap_( dst, src, ( e, k ) => String( k ) );
  test.identical( got, [ 'undefined' ] );
  test.is( got === dst );

  test.case = 'dst - empty pure map, BufferRaw';
  var dst = Object.create( null );
  var src = new BufferRaw();
  var got = _.entityMap_( dst, src, ( e, k ) => [ k ] );
  test.identical( got, { 0 : undefined } );
  test.is( got === dst );

  test.close( 'onEach returns key' );

  /* - */

  test.open( 'onEach checks container' );

  test.case = 'dst - argumentsArray, empty array';
  var dst = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var src = [];
  var got = _.entityMap_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, _.argumentsArrayMake( [ 1, 2, 3 ] ) );
  test.is( got === dst );

  test.case = 'dst - array, unroll';
  var dst = [ 'a', 'b', 'c', 'd', 'e', 'f' ];
  var src = _.unrollMake( [ 1, 2, 3, 4, 'str' ] );
  var got = _.entityMap_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, _.unrollMake( [ 0, 1, 2, 3, 4, 'f' ] ) );
  test.is( got === dst );

  test.case = 'dst - unroll, argumentsArray';
  var dst = _.unrollMake( [ 'a', 'b', 'c', 'd', 'e', 'f' ] );
  var src = _.argumentsArrayMake( [ 0, 1, 2, 3, 4 ] );
  var got = _.entityMap_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, [ 0, 1, 2, 3, 4, 'f' ] );
  test.is( got === dst );

  test.case = 'dst - BufferTyped, BufferTyped';
  var dst = new U16x( 10 );
  var src = new F64x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityMap_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, new U16x( [ 0, 1, 2, 3, 4, 0, 0, 0, 0, 0 ] ) );
  test.is( got === dst );

  /* */

  test.case = 'dst - map, empty map';
  var dst = { a : 2, d : 2 };
  var src = {};
  var got = _.entityMap_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, { a : 2, d : 2 } );
  test.is( got === dst );

  test.case = 'dst - pure map, map';
  var dst = Object.create( null );
  dst.a = 2;
  dst.d = 2;
  var src = { a : 1, b : 2, c : 'str' };
  var got = _.entityMap_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, { a : 'a', b : 'b', c : 'c', d : 2 } );
  test.is( got === dst );

  test.case = 'dst - map, empty pure map';
  var dst = { a : 2, d : 2 };
  var src = Object.create( null );
  var got = _.entityMap_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, { a : 2, d : 2 } );
  test.is( got === dst );

  test.case = 'map';
  var dst = { a : 2, d : 2 };
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  var got = _.entityMap_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, { a : 'a', b : 'b', d : 2 } );
  test.is( got === dst );

  /* */

  test.case = 'dst - array, null';
  var dst = [ 1, 2 ];
  var src = null;
  var got = _.entityMap_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, [ 1, 2, null ] );
  test.is( got === dst );

  test.case = 'dst - map, undefined';
  var dst = { a : 1 };
  var src = undefined;
  var got = _.entityMap_( dst, src, ( e, k, c ) => c ? k : { e : e } );
  test.identical( got, { a : 1, 'undefined' : undefined } );
  test.is( got === dst );

  test.case = 'dst - undefined, string';
  var dst = undefined;
  var src = 'str';
  var got = _.entityMap_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, 'str' );

  test.case = 'dst - emty unroll, Set';
  var dst = _.unrollMake( [] );
  var src = new Set();
  var got = _.entityMap_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, [ new Set() ] );
  test.is( got === dst );

  test.case = 'dst - empty pure map, BufferRaw';
  var dst = Object.create( null );
  var src = new BufferRaw();
  var got = _.entityMap_( dst, src, ( e, k, c ) => c ? k : [ e ] );
  test.identical( got, { 0 : new BufferRaw() } );
  test.is( got === dst );

  test.close( 'onEach checks container' );
}

//

/*
TODO : need to check actuality of this test | Dmytro : it works correctly
*/

function entityFilter( test )
{
  test.open( 'onEach is routine' );

  test.case = 'number';
  var callback = ( v, i, s ) => v < 0 ? undefined : Math.sqrt( v );
  var got = _.entityFilter( 3, callback );
  test.identical( got, Math.sqrt( 3 ) );

  test.case = 'string';
  var callback = ( v, i, s ) => v < 0 ? undefined : Math.sqrt( v );
  var got = _.entityFilter( 'str', ( v ) => v + ' ' + v );
  test.identical( got, 'str str' );

  test.case = 'array';
  var callback = ( v, i, s ) => v < 0 ? undefined : Math.sqrt( v );
  var got = _.entityFilter( [ 9, -16, 25, 36, -49 ], callback );
  test.identical( got, [ 3, 5, 6 ] );
  test.notIdentical( got, [ 3, 4, 5, 6, 7 ] );

  test.case = 'unroll';
  var callback = ( v, i, s ) => v < 0 ? undefined : Math.sqrt( v );
  var src = _.unrollMake( [ 9, _.unrollMake( [ -16, 25, _.unrollFrom( [ 36, -49 ] ) ] ) ] );
  var got = _.entityFilter( src, callback );
  test.identical( got, [ 3, 5, 6 ] );
  test.notIdentical( got, [ 3, 4, 5, 6, 7 ] );
  test.isNot( _.unrollIs( got) );

  test.case = 'argumentsArray';
  var callback = ( v, i, s ) => v < 0 ? undefined : Math.sqrt( v );
  var src = _.argumentsArrayMake( [ 9, -16, 25, 36, -49 ] );
  var got = _.entityFilter( src, callback );
  test.identical( got, [ 3, 5, 6 ] );

  test.case = 'BufferTyped to Array';
  var callback = ( v, i, s ) => v < 0 ? undefined : Math.sqrt( v );
  var src = new F32x( [ 9, -16, 25, 36, -49 ] );
  var src = Array.from( src );
  var got = _.entityFilter( src, callback );
  test.identical( got, [ 3, 5, 6 ] );
  test.notIdentical( got, [ 3, 4, 5, 6, 7 ] );

  test.case = 'mapLike';
  var callback = ( v, i, s ) => v < 0 ? undefined : Math.sqrt( v );
  var got = _.entityFilter( { '3' : 9, '4' : 16, '5' : 25, '6' : -36 }, callback );
  test.identical( got, { '3' : 3, '4' : 4, '5' : 5 } );
  test.notIdentical( got, { '3' : 3, '4' : 4, '5' : 5, '6' : 6 } );

  test.case = 'callback in routine';
  var callback = ( v, i, s ) => v < 0 ? undefined : Math.sqrt( v );
  var testFn1 = function()
  {
    return _.entityFilter( arguments, callback );
  }
  var got = testFn1( 9, -16, 25, 36, -49 );
  test.identical( got, [ 3, 5, 6 ] );

  test.case = 'src is array, filter makes unrolls';
  var onEach = ( e, i, s ) => _.unrollMake( [ e ] );
  var src = [ 1, [ 2, 3 ], [ 'str', null, undefined ] ];
  var got = _.entityFilter( src, onEach );
  test.identical( got, [ 1, [ 2, 3 ], [ 'str', null, undefined ] ] );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

  test.case = 'src is array, filter check equality';
  var onEach = ( e, i, s ) => e === i;
  var src = [ 0, 2, 2, [ 'str', null ], undefined ];
  var got = _.entityFilter( src, onEach );
  test.identical( got, [ true, false, true, false, false ] );
  test.notIdentical( got, [ true, false, true, false, false, false ] );
  test.is( _.arrayIs( got ) );

  test.close( 'onEach is routine' );

  /* - */

  test.case = 'onEach is objectLike - condition, one entry';
  var callback = { '3' : 9 };
  var got = _.entityFilter( { a : { '3' : 9 }, b : { '3' : 4 } }, callback );
  test.identical( got, { a : { '3' : 9 } } );

  test.case = 'onEach is objectLike - condition, a few entry';
  var callback = { '3' : 9 };
  var src = { a : { '3' : 9 }, b : { '3' : 4 }, c : { '3' : 9 }, d : { '3' : 9 } };
  var got = _.entityFilter( src, callback );
  test.identical( got, { a : { '3' : 9 }, c : { '3' : 9 }, d : { '3' : 9 } } );

  test.case = 'onEach is objectLike - condition, entry nested to next level';
  var callback = { '3' : 9 };
  var src = { a : { b : { '3' : 9 } } };
  var got = _.entityFilter( src, callback );
  test.identical( got, {} );
  test.notIdentical( got, { a : { b : { '3' : 9 } } } );

  test.case = 'onEach is objectLike - routine, entry nested to next level';
  var onEach = ( e ) => true;
  var callback = { '3' : onEach };
  var src = { a : { '3' : 9 } };
  var got = _.entityFilter( src, callback );
  test.identical( got, {} );
  test.notIdentical( got, { a : { '3' : 9 } } );

  test.case = 'onEach is objectLike - condition, identical entry';
  var onEach = ( e ) => true;
  var callback = { '3' : onEach };
  var src = { a : { '3' : onEach } };
  var got = _.entityFilter( src, callback );
  test.identical( got, { a : { '3' : onEach } } );
  test.notIdentical( got, {} );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( () => _.entityFilter() );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.entityFilter( [ 1,3 ], () => true, 1 ) );

  test.case = 'onEach is not routine';
  test.shouldThrowErrorSync( () => _.entityFilter( [ 1,3 ], 'callback' ) );
}

//

function entityFilterWithoutDst_( test )
{
  test.open( 'onEach returns element' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityFilter_( src, ( e ) => e );
  test.identical( got, [] );
  test.is( got === src );

  test.case = 'unroll';
  var src = _.unrollMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( src, ( e ) => e );
  test.identical( got, _.unrollMake( [ 1, 3, 'str' ] ) );
  test.is( got === src );
  test.is( _.unrollIs( got ) );

  test.case = 'argumentsArray';
  var src = _.argumentsArrayMake( [ 1, 2, 3, 4, 'str' ] );
  var got = _.entityFilter_( src, ( e ) => e );
  test.identical( got, _.argumentsArrayMake( [ 1, 2, 3, 4, 'str' ] ) );
  test.is( got === src );

  test.case = 'BufferTyped';
  var src = new U8x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityFilter_( src, ( e ) => e );
  test.identical( got, new U8x( [ 1, 2, 3, 4, 5 ] ) );
  test.is( got === src );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityFilter_( src, ( e ) => e );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = { a : 1, b : undefined, c : 'str', d : undefined };
  var got = _.entityFilter_( src, ( e ) => e );
  test.identical( got, { a : 1, c : 'str' } );
  test.is( got === src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityFilter_( src, ( e ) => e );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = 1;
  src.b = undefined;
  src.c = undefined;
  var got = _.entityFilter_( src, ( e ) => e );
  test.identical( got, { a : 1 } );
  test.is( got === src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityFilter_( src, ( e ) => e );
  test.identical( got, null );

  test.case = 'string';
  var src = 'str';
  var got = _.entityFilter_( src, ( e ) => e );
  test.identical( got, 'str' );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityFilter_( src, ( e ) => e );
  test.identical( got, new Set() );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityFilter_( src, ( e ) => e );
  test.identical( got, new BufferRaw() );

  test.close( 'onEach returns element' );

  /* - */

  test.open( 'onEach returns key' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityFilter_( src, ( e, k ) => k );
  test.identical( got, [] );
  test.is( got === src );

  test.case = 'unroll';
  var src = _.unrollMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( src, ( e, k ) => k );
  test.identical( got, _.unrollMake( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got === src );
  test.is( _.unrollIs( got ) );

  test.case = 'argumentsArray';
  var src = _.argumentsArrayMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( src, ( e, k ) => k );
  test.identical( got, _.argumentsArrayMake( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got === src );

  test.case = 'BufferTyped';
  var src = new I16x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityFilter_( src, ( e, k ) => k );
  test.identical( got, new I16x( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got === src );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityFilter_( src, ( e, k ) => k );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = { a : 1, b : undefined, c : 'str', d : undefined };
  var got = _.entityFilter_( src, ( e, k ) => k );
  test.identical( got, { a : 'a', b : 'b', c : 'c', d : 'd' } );
  test.is( got === src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityFilter_( src, ( e, k ) => k );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = 1;
  src.b = undefined;
  src.c = undefined;
  var got = _.entityFilter_( src, ( e, k ) => k );
  test.identical( got, { a : 'a', b : 'b', c : 'c' } );
  test.is( got === src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityFilter_( src, ( e, k ) => k );
  test.identical( got, null );

  test.case = 'string';
  var src = 'str';
  var got = _.entityFilter_( src, ( e, k ) => k );
  test.identical( got, null );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityFilter_( src, ( e, k ) => k );
  test.identical( got, null );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityFilter_( src, ( e, k ) => k );
  test.identical( got, null );

  test.close( 'onEach returns key' );

  /* - */

  test.open( 'onEach checks container' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityFilter_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, [] );
  test.is( got === src );

  test.case = 'unroll';
  var src = _.unrollMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, _.unrollMake( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got === src );
  test.is( _.unrollIs( got ) );

  test.case = 'argumentsArray';
  var src = _.argumentsArrayMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, _.argumentsArrayMake( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got === src );

  test.case = 'BufferTyped';
  var src = new F64x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityFilter_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, new F64x( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got === src );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityFilter_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = { a : 1, b : undefined, c : 'str', d : undefined };
  var got = _.entityFilter_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, { a : 'a', b : 'b', c : 'c', d : 'd' } );
  test.is( got === src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityFilter_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = 1;
  src.b = undefined;
  src.c = undefined;
  var got = _.entityFilter_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, { a : 'a', b : 'b', c : 'c' } );
  test.is( got === src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityFilter_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, null );

  test.case = 'string';
  var src = 'str';
  var got = _.entityFilter_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, 'str' );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityFilter_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, new Set() );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityFilter_( src, ( e, k, c ) => c ? k : e );
  test.identical( got, new BufferRaw() );

  test.close( 'onEach checks container' );

  /* - */

  test.open( 'onEach returns undefined' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityFilter_( src, ( e ) => undefined );
  test.identical( got, [] );
  test.is( got === src );

  test.case = 'unroll';
  var src = _.unrollMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( src, ( e ) => undefined );
  test.identical( got, _.unrollMake( [] ) );
  test.is( got === src );
  test.is( _.unrollIs( got ) );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityFilter_( src, ( e ) => undefined );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = { a : 1, b : undefined, c : 'str', d : undefined };
  var got = _.entityFilter_( src, ( e ) => undefined );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityFilter_( src, ( e ) => undefined );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = 1;
  src.b = undefined;
  src.c = undefined;
  var got = _.entityFilter_( src, ( e ) => undefined );
  test.identical( got, {} );
  test.is( got === src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityFilter_( src, ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'string';
  var src = 'str';
  var got = _.entityFilter_( src, ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityFilter_( src, ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityFilter_( src, ( e ) => undefined );
  test.identical( got, undefined );

  test.close( 'onEach returns undefined' );

  /* - */

  test.open( 'onEach is map like' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityFilter_( src, { a : 1 } );
  test.identical( got, [] );
  test.is( got === src );

  test.case = 'unroll';
  var src = _.unrollMake( [ { a : { a : 1 } }, { a : 1 }, 3, undefined, { a : { a : { a : 1 } } } ] );
  var got = _.entityFilter_( src, { a : 1 } );
  test.identical( got, _.unrollMake( [ { a : 1 } ] ) );
  test.is( got === src );
  test.is( _.unrollIs( got ) );

  test.case = 'argumentsArray';
  var src = _.argumentsArrayMake( [ { a : 1 }, { a : 1 }, { a : 1 }, { a : 1 }, { a : 1 } ] );
  var got = _.entityFilter_( src, { a : 1 } );
  test.identical( got, _.argumentsArrayMake( [ { a : 1 }, { a : 1 }, { a : 1 }, { a : 1 }, { a : 1 } ] ) );
  test.is( got === src );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityFilter_( src, { a : 1 } );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = { a : { a : 1 }, b : { a : { a : 1 } }, c : 'str', d : undefined };
  var got = _.entityFilter_( src, { a : 1 } );
  test.identical( got, { a : { a : 1 } } );
  test.is( got === src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityFilter_( src, { a : 1 } );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = { a : 1 };
  src.b = { a : { a : 1 } };
  src.c = undefined;
  var got = _.entityFilter_( src, { a : 1 } );
  test.identical( got, { a : { a : 1 } } );
  test.is( got === src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityFilter_( src, { a : 1 } );
  test.identical( got, undefined );

  test.case = 'string';
  var src = 'str';
  var got = _.entityFilter_( src, { a : 1 } );
  test.identical( got, undefined );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityFilter_( src, { a : 1 } );
  test.identical( got, undefined );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityFilter_( src, { a : 1 } );
  test.identical( got, undefined );

  test.close( 'onEach is map like' );

  /* - */

  test.open( 'onEach returns unroll' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityFilter_( src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, [] );
  test.is( got === src );

  test.case = 'unroll';
  var src = _.unrollMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, _.unrollMake( [ 1, 1, undefined, undefined, 3, 3, undefined, undefined, 'str', 'str' ] ) );
  test.is( got === src );
  test.is( _.unrollIs( got ) );

  test.case = 'argumentsArray';
  var src = _.argumentsArrayMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, _.argumentsArrayMake( [ 1, undefined, 3, undefined, 'str' ] ) );
  test.is( got === src );

  test.case = 'BufferTyped';
  var src = new I16x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityFilter_( src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, new I16x( [ 1, 2, 3, 4, 5 ] ) );
  test.is( got === src );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityFilter_( src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = { a : 1, b : undefined, c : 'str', d : undefined };
  var got = _.entityFilter_( src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, { a : [ 1, 1 ], b : [ undefined, undefined ], c : [ 'str', 'str' ], d : [ undefined, undefined ] } );
  test.is( got === src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityFilter_( src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, {} );
  test.is( got === src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = 1;
  src.b = undefined;
  src.c = undefined;
  var got = _.entityFilter_( src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, { a : [ 1, 1 ], b : [ undefined, undefined ], c : [ undefined, undefined ] } );
  test.is( got === src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityFilter_( src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, [ null, null ] );

  test.case = 'string';
  var src = 'str';
  var got = _.entityFilter_( src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, [ 'str', 'str' ] );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityFilter_( src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, [ new Set(), new Set() ] );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityFilter_( src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, [ new BufferRaw(), new BufferRaw() ] );

  test.close( 'onEach returns unroll' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityFilter_() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.entityFilter_( 'str' ) );
  test.shouldThrowErrorSync( () => _.entityFilter_( [ 1, 2 ] ) );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.entityFilter_( [ 1, 3 ], [ 1, 2 ], ( e ) => e, 'extra' ) );
  test.shouldThrowErrorSync( () => _.entityFilter_( { a : 1 }, { b : 2 }, ( e ) => e, 'extra' ) );

  test.case = 'src is not resizable long, cannot delete element';
  test.shouldThrowErrorSync( () => _.entityFilter_( _.argumentsArrayMake( [ undefined, undefined ], ( e ) => e ) ) );

  test.case = 'wrong type of onEach';
  test.shouldThrowErrorSync( () => _.entityFilter_( [ 1, 2 ], [] ) );
  test.shouldThrowErrorSync( () => _.entityFilter_( null, [ 1, 2 ], [] ) );

  test.case = 'wrong dst container';
  test.shouldThrowErrorSync( () => _.entityFilter_( {}, [ 1, 2 ], ( e ) => e ) );
  test.shouldThrowErrorSync( () => _.entityFilter_( [], { a : 1, b : 2 }, ( e ) => e ) );
  test.shouldThrowErrorSync( () => _.entityFilter_( new BufferRaw(), { a : 1, b : 2 }, ( e ) => e ) );

  test.case = 'dst is not resizable long';
  test.shouldThrowErrorSync( () => _.entityFilter_( new F32x(), { a : 1, b : 2 }, ( e ) => e ) );

  test.case = 'not map like, not long like, cannot extend map';
  test.shouldThrowErrorSync( () => _.entityFilter_( {}, 1, ( e ) => e ) );
}

//

function entityFilterDstNull_( test )
{
  test.open( 'onEach returns element' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityFilter_( null, src, ( e ) => e );
  test.identical( got, [] );
  test.is( got !== src );

  test.case = 'unroll';
  var src = _.unrollMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( null, src, ( e ) => e );
  test.identical( got, _.unrollMake( [ 1, 3, 'str' ] ) );
  test.is( got !== src );

  test.case = 'argumentsArray';
  var src = _.argumentsArrayMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( null, src, ( e ) => e );
  test.identical( got, [ 1, 3, 'str' ] );
  test.is( got !== src );

  test.case = 'BufferTyped';
  var src = new U8x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityFilter_( null, src, ( e ) => e );
  test.identical( got, new U8x( [] ) );
  test.is( got !== src );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityFilter_( null, src, ( e ) => e );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = { a : 1, b : undefined, c : 'str', d : undefined };
  var got = _.entityFilter_( null, src, ( e ) => e );
  test.identical( got, { a : 1, c : 'str' } );
  test.is( got !== src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityFilter_( null, src, ( e ) => e );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = 1;
  src.b = undefined;
  src.c = undefined;
  var got = _.entityFilter_( null, src, ( e ) => e );
  test.identical( got, { a : 1 } );
  test.is( got !== src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityFilter_( null, src, ( e ) => e );
  test.identical( got, null );

  test.case = 'string';
  var src = 'str';
  var got = _.entityFilter_( null, src, ( e ) => e );
  test.identical( got, 'str' );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityFilter_( null, src, ( e ) => e );
  test.identical( got, new Set() );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityFilter_( null, src, ( e ) => e );
  test.identical( got, new BufferRaw() );

  test.close( 'onEach returns element' );

  /* - */

  test.open( 'onEach returns key' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityFilter_( null, src, ( e, k ) => k );
  test.identical( got, [] );
  test.is( got !== src );

  test.case = 'unroll';
  var src = _.unrollMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( null, src, ( e, k ) => k );
  test.identical( got, _.unrollMake( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got !== src );
  test.is( _.unrollIs( got ) );

  test.case = 'argumentsArray';
  var src = _.argumentsArrayMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( null, src, ( e, k ) => k );
  test.identical( got, [ 0, 1, 2, 3, 4 ] );
  test.is( got !== src );

  test.case = 'BufferTyped';
  var src = new I16x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityFilter_( null, src, ( e, k ) => k );
  test.identical( got, new I16x( [] ) );
  test.is( got !== src );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityFilter_( null, src, ( e, k ) => k );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = { a : 1, b : undefined, c : 'str', d : undefined };
  var got = _.entityFilter_( null, src, ( e, k ) => k );
  test.identical( got, { a : 'a', b : 'b', c : 'c', d : 'd' } );
  test.is( got !== src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityFilter_( null, src, ( e, k ) => k );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = 1;
  src.b = undefined;
  src.c = undefined;
  var got = _.entityFilter_( null, src, ( e, k ) => k );
  test.identical( got, { a : 'a', b : 'b', c : 'c' } );
  test.is( got !== src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityFilter_( null, src, ( e, k ) => k );
  test.identical( got, null );

  test.case = 'string';
  var src = 'str';
  var got = _.entityFilter_( null, src, ( e, k ) => k );
  test.identical( got, null );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityFilter_( null, src, ( e, k ) => k );
  test.identical( got, null );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityFilter_( null, src, ( e, k ) => k );
  test.identical( got, null );

  test.close( 'onEach returns key' );

  /* - */

  test.open( 'onEach checks container' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityFilter_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, [] );
  test.is( got !== src );

  test.case = 'unroll';
  var src = _.unrollMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, _.unrollMake( [ 0, 1, 2, 3, 4 ] ) );
  test.is( got !== src );
  test.is( _.unrollIs( got ) );

  test.case = 'argumentsArray';
  var src = _.argumentsArrayMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, [ 0, 1, 2, 3, 4 ] );
  test.is( got !== src );

  test.case = 'BufferTyped';
  var src = new F64x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityFilter_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, new F64x( [] ) );
  test.is( got !== src );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityFilter_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = { a : 1, b : undefined, c : 'str', d : undefined };
  var got = _.entityFilter_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, { a : 'a', b : 'b', c : 'c', d : 'd' } );
  test.is( got !== src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityFilter_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = 1;
  src.b = undefined;
  src.c = undefined;
  var got = _.entityFilter_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, { a : 'a', b : 'b', c : 'c' } );
  test.is( got !== src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityFilter_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, null );

  test.case = 'string';
  var src = 'str';
  var got = _.entityFilter_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, 'str' );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityFilter_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, new Set() );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityFilter_( null, src, ( e, k, c ) => c ? k : e );
  test.identical( got, new BufferRaw() );

  test.close( 'onEach checks container' );

  /* - */

  test.open( 'onEach returns undefined' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityFilter_( null, src, ( e ) => undefined );
  test.identical( got, [] );
  test.is( got !== src );

  test.case = 'unroll';
  var src = _.unrollMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( null, src, ( e ) => undefined );
  test.identical( got, _.unrollMake( [] ) );
  test.is( got !== src );

  test.case = 'argumentsArray';
  var src = _.argumentsArrayMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( null, src, ( e ) => undefined );
  test.identical( got, [] );
  test.is( got !== src );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityFilter_( null, src, ( e ) => undefined );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = { a : 1, b : undefined, c : 'str', d : undefined };
  var got = _.entityFilter_( null, src, ( e ) => undefined );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityFilter_( null, src, ( e ) => undefined );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = 1;
  src.b = undefined;
  src.c = undefined;
  var got = _.entityFilter_( null, src, ( e ) => undefined );
  test.identical( got, {} );
  test.is( got !== src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityFilter_( null, src, ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'string';
  var src = 'str';
  var got = _.entityFilter_( null, src, ( e ) => undefined );
  test.identical( got, null );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityFilter_( null, src, ( e ) => undefined );
  test.identical( got, null );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityFilter_( null, src, ( e ) => undefined );
  test.identical( got, null );

  test.close( 'onEach returns undefined' );

  /* - */

  test.open( 'onEach is map like' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityFilter_( null, src, { a : 1 } );
  test.identical( got, [] );
  test.is( got !== src );

  test.case = 'unroll';
  var src = _.unrollMake( [ { a : { a : 1 } }, { a : 1 }, 3, undefined, { a : { a : { a : 1 } } } ] );
  var got = _.entityFilter_( null, src, { a : 1 } );
  test.identical( got, _.unrollMake( [ { a : 1 } ] ) );
  test.is( got !== src );

  test.case = 'argumentsArray';
  var src = _.argumentsArrayMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( null, src, { a : 1 } );
  test.identical( got, [] );
  test.is( got !== src );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityFilter_( null, src, { a : 1 } );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = { a : { a : 1 }, b : { a : { a : 1 } }, c : 'str', d : undefined };
  var got = _.entityFilter_( null, src, { a : 1 } );
  test.identical( got, { a : { a : 1 } } );
  test.is( got !== src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityFilter_( null, src, { a : 1 } );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = { a : 1 };
  src.b = { a : { a : 1 } };
  src.c = undefined;
  var got = _.entityFilter_( null, src, { a : 1 } );
  test.identical( got, { a : { a : 1 } } );
  test.is( got !== src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityFilter_( null, src, { a : 1 } );
  test.identical( got, undefined );

  test.case = 'string';
  var src = 'str';
  var got = _.entityFilter_( null, src, { a : 1 } );
  test.identical( got, null );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityFilter_( null, src, { a : 1 } );
  test.identical( got, null );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityFilter_( null, src, { a : 1 } );
  test.identical( got, null );

  test.close( 'onEach is map like' );

  /* - */

  test.open( 'onEach returns unroll' );

  test.case = 'empty array';
  var src = [];
  var got = _.entityFilter_( null, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, [] );
  test.is( got !== src );

  test.case = 'unroll';
  var src = _.unrollMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( null, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, _.unrollMake( [ 1, 1, undefined, undefined, 3, 3, undefined, undefined, 'str', 'str' ] ) );
  test.is( got !== src );
  test.is( _.unrollIs( got ) );

  test.case = 'argumentsArray';
  var src = _.argumentsArrayMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( null, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, [ 1, 1, undefined, undefined, 3, 3, undefined, undefined, 'str', 'str' ] );
  test.is( got !== src );

  test.case = 'BufferTyped';
  var src = new I16x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityFilter_( null, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, new I16x( [] ) );
  test.is( got !== src );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.entityFilter_( null, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = { a : 1, b : undefined, c : 'str', d : undefined };
  var got = _.entityFilter_( null, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, { a : [ 1, 1 ], b : [ undefined, undefined ], c : [ 'str', 'str' ], d : [ undefined, undefined ] } );
  test.is( got !== src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entityFilter_( null, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map';
  var src = Object.create( null );
  src.a = 1;
  src.b = undefined;
  src.c = undefined;
  var got = _.entityFilter_( null, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, { a : [ 1, 1 ], b : [ undefined, undefined ], c : [ undefined, undefined ] } );
  test.is( got !== src );

  /* */

  test.case = 'null';
  var src = null;
  var got = _.entityFilter_( null, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, [ null, null ] );

  test.case = 'string';
  var src = 'str';
  var got = _.entityFilter_( null, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, [ 'str', 'str' ] );

  test.case = 'Set';
  var src = new Set();
  var got = _.entityFilter_( null, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, [ new Set(), new Set() ] );

  test.case = 'BufferRaw';
  var src = new BufferRaw();
  var got = _.entityFilter_( null, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, [ new BufferRaw(), new BufferRaw() ] );

  test.close( 'onEach returns unroll' );
}

//

function entityFilterDstNotNull_( test )
{
  test.open( 'onEach returns element' );

  test.case = 'empty array';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = [];
  var got = _.entityFilter_( dst, src, ( e ) => e );
  test.identical( got, [ 7, 7, 7, 7, 7, 7 ] );
  test.is( got === dst );

  test.case = 'unroll';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = _.unrollMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( dst, src, ( e ) => e );
  test.identical( got, [ 1, 3, 'str', 7, 7, 7 ] );
  test.is( got === dst );

  test.case = 'argumentsArray';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = _.argumentsArrayMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( dst, src, ( e ) => e );
  test.identical( got, [ 1, 3, 'str', 7, 7, 7 ] );
  test.is( got === dst );

  test.case = 'BufferTyped';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = new U8x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityFilter_( dst, src, ( e ) => e );
  test.identical( got, [ 1, 2, 3, 4, 5, 7 ] );
  test.is( got === dst );

  /* */

  test.case = 'empty map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = {};
  var got = _.entityFilter_( dst, src, ( e ) => e );
  test.identical( got, { a : undefined, b : undefined, e : 1 } );
  test.is( got === dst );

  test.case = 'map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = { a : 1, b : undefined, c : 'str', d : undefined };
  var got = _.entityFilter_( dst, src, ( e ) => e );
  test.identical( got, { a : 1, b : undefined, c : 'str', e : 1 } );
  test.is( got === dst );

  test.case = 'empty pure map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = Object.create( null );
  var got = _.entityFilter_( dst, src, ( e ) => e );
  test.identical( got, { a : undefined, b : undefined, e : 1 } );
  test.is( got === dst );

  test.case = 'map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = Object.create( null );
  src.a = 1;
  src.b = undefined;
  src.c = undefined;
  var got = _.entityFilter_( dst, src, ( e ) => e );
  test.identical( got, { a : 1, b : undefined, e : 1 } );
  test.is( got === dst );

  /* */

  test.case = 'null';
  var dst = [ 1, 2 ];
  var src = null;
  var got = _.entityFilter_( dst, src, ( e ) => e );
  test.identical( got, [ 1, 2, null ] );
  test.is( got === dst );

  test.case = 'string';
  var dst = { a : 1 };
  var src = 'str';
  var got = _.entityFilter_( dst, src, ( e ) => [ e ] );
  test.identical( got, { a : 1, 0 : 'str' } );
  test.is( got === dst );

  test.case = 'Set';
  var dst = false;
  var src = new Set();
  var got = _.entityFilter_( dst, src, ( e ) => e );
  test.identical( got, new Set() );

  test.case = 'BufferRaw';
  var dst = _.unrollMake( [] );
  var src = new BufferRaw();
  var got = _.entityFilter_( dst, src, ( e ) => e );
  test.identical( got, [ new BufferRaw() ] );
  test.is( got === dst );

  test.close( 'onEach returns element' );

  /* - */

  test.open( 'onEach returns key' );

  test.case = 'empty array';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = [];
  var got = _.entityFilter_( dst, src, ( e, k ) => k );
  test.identical( got, [ 7, 7, 7, 7, 7, 7 ] );
  test.is( got === dst );

  test.case = 'unroll';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = _.unrollMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( dst, src, ( e, k ) => k );
  test.identical( got, [ 0, 1, 2, 3, 4, 7 ] );
  test.is( got === dst );

  test.case = 'argumentsArray';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = _.argumentsArrayMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( dst, src, ( e, k ) => k );
  test.identical( got, [ 0, 1, 2, 3, 4, 7 ] );
  test.is( got === dst );

  test.case = 'BufferTyped';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = new F64x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityFilter_( dst, src, ( e, k ) => k );
  test.identical( got, [ 0, 1, 2, 3, 4, 7 ] );
  test.is( got === dst );

  /* */

  test.case = 'empty map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = {};
  var got = _.entityFilter_( dst, src, ( e, k ) => k );
  test.identical( got, { a : undefined, b : undefined, e : 1 } );
  test.is( got === dst );

  test.case = 'map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = { a : 1, b : undefined, c : 'str', d : undefined };
  var got = _.entityFilter_( dst, src, ( e, k ) => k );
  test.identical( got, { a : 'a', b : 'b', c : 'c', d : 'd', e : 1 } );
  test.is( got === dst );

  test.case = 'empty pure map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = Object.create( null );
  var got = _.entityFilter_( dst, src, ( e, k ) => k );
  test.identical( got, { a : undefined, b : undefined, e : 1 } );
  test.is( got === dst );

  test.case = 'map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = Object.create( null );
  src.a = 1;
  src.b = undefined;
  src.c = undefined;
  var got = _.entityFilter_( dst, src, ( e, k ) => k );
  test.identical( got, { a : 'a', b : 'b', c : 'c', e : 1 } );
  test.is( got === dst );

  /* */

  test.case = 'null';
  var dst = [ 1, 2 ];
  var src = null;
  var got = _.entityFilter_( dst, src, ( e, k ) => k );
  test.identical( got, [ 1, 2, null ] );
  test.is( got === dst );

  test.case = 'string';
  var dst = { a : 1 };
  var src = 'str';
  var got = _.entityFilter_( dst, src, ( e, k ) => [ k ] );
  test.identical( got, { a : 1, 0 : null } );
  test.is( got === dst );

  test.case = 'Set';
  var dst = false;
  var src = new Set();
  var got = _.entityFilter_( dst, src, ( e, k ) => k );
  test.identical( got, null );

  test.case = 'BufferRaw';
  var dst = _.unrollMake( [] );
  var src = new BufferRaw();
  var got = _.entityFilter_( dst, src, ( e, k ) => k );
  test.identical( got, [ null ] );
  test.is( got === dst );

  test.close( 'onEach returns key' );

  /* - */

  test.open( 'onEach checks container' );

  test.case = 'empty array';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = [];
  var got = _.entityFilter_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, [ 7, 7, 7, 7, 7, 7 ] );
  test.is( got === dst );

  test.case = 'unroll';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = _.unrollMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, [ 0, 1, 2, 3, 4, 7 ] );
  test.is( got === dst );

  test.case = 'argumentsArray';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = _.argumentsArrayMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, [ 0, 1, 2, 3, 4, 7 ] );
  test.is( got === dst );

  test.case = 'BufferTyped';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = new F64x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityFilter_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, [ 0, 1, 2, 3, 4, 7 ] );
  test.is( got === dst );

  /* */

  test.case = 'empty map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = {};
  var got = _.entityFilter_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, { a : undefined, b : undefined, e : 1 } );
  test.is( got === dst );

  test.case = 'map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = { a : 1, b : undefined, c : 'str', d : undefined };
  var got = _.entityFilter_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, { a : 'a', b : 'b', c : 'c', d : 'd', e : 1 } );
  test.is( got === dst );

  test.case = 'empty pure map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = Object.create( null );
  var got = _.entityFilter_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, { a : undefined, b : undefined, e : 1 } );
  test.is( got === dst );

  test.case = 'map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = Object.create( null );
  src.a = 1;
  src.b = undefined;
  src.c = undefined;
  var got = _.entityFilter_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, { a : 'a', b : 'b', c : 'c', e : 1 } );
  test.is( got === dst );

  /* */

  test.case = 'null';
  var dst = [ 1, 2 ];
  var src = null;
  var got = _.entityFilter_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, [ 1, 2, null ] );
  test.is( got === dst );

  test.case = 'string';
  var dst = { a : 1 };
  var src = 'str';
  var got = _.entityFilter_( dst, src, ( e, k, c ) => c ? [ k ] : [ e ] );
  test.identical( got, { a : 1, 0 : 'str' } );
  test.is( got === dst );

  test.case = 'Set';
  var dst = false;
  var src = new Set();
  var got = _.entityFilter_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, new Set() );

  test.case = 'BufferRaw';
  var dst = _.unrollMake( [] );
  var src = new BufferRaw();
  var got = _.entityFilter_( dst, src, ( e, k, c ) => c ? k : e );
  test.identical( got, [ new BufferRaw() ] );
  test.is( got === dst );

  test.close( 'onEach checks container' );

  /* - */

  test.open( 'onEach returns undefined' );

  test.case = 'empty array';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = [];
  var got = _.entityFilter_( dst, src, ( e ) => undefined );
  test.identical( got, [ 7, 7, 7, 7, 7, 7 ] );
  test.is( got === dst );

  test.case = 'unroll';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = _.unrollMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( dst, src, ( e ) => undefined );
  test.identical( got, [ 7, 7, 7, 7, 7, 7 ] );
  test.is( got === dst );

  test.case = 'argumentsArray';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = _.argumentsArrayMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( dst, src, ( e ) => undefined );
  test.identical( got, [ 7, 7, 7, 7, 7, 7 ] );
  test.is( got === dst );

  test.case = 'BufferTyped';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = new F64x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityFilter_( dst, src, ( e ) => undefined );
  test.identical( got, [ 7, 7, 7, 7, 7, 7 ] );
  test.is( got === dst );

  /* */

  test.case = 'empty map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = {};
  var got = _.entityFilter_( dst, src, ( e ) => undefined );
  test.identical( got, { a : undefined, b : undefined, e : 1 } );
  test.is( got === dst );

  test.case = 'map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = { a : 1, b : undefined, c : 'str', d : undefined };
  var got = _.entityFilter_( dst, src, ( e ) => undefined );
  test.identical( got, { a : undefined, b : undefined, e : 1 } );
  test.is( got === dst );

  test.case = 'empty pure map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = Object.create( null );
  var got = _.entityFilter_( dst, src, ( e ) => undefined );
  test.identical( got, { a : undefined, b : undefined, e : 1 } );
  test.is( got === dst );

  test.case = 'map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = Object.create( null );
  src.a = 1;
  src.b = undefined;
  src.c = undefined;
  var got = _.entityFilter_( dst, src, ( e ) => undefined );
  test.identical( got, { a : undefined, b : undefined, e : 1 } );
  test.is( got === dst );

  /* */

  test.case = 'null';
  var dst = [ 1, 2 ];
  var src = null;
  var got = _.entityFilter_( dst, src, ( e ) => undefined );
  test.identical( got, [ 1, 2 ] );
  test.is( got === dst );

  test.case = 'string';
  var dst = { a : 1 };
  var src = 'str';
  var got = _.entityFilter_( dst, src, ( e ) => undefined );
  test.identical( got, { a : 1 } );
  test.is( got === dst );

  test.case = 'Set';
  var dst = false;
  var src = new Set();
  var got = _.entityFilter_( dst, src, ( e ) => undefined );
  test.identical( got, false );

  test.case = 'BufferRaw';
  var dst = _.unrollMake( [] );
  var src = new BufferRaw();
  var got = _.entityFilter_( dst, src, ( e ) => undefined );
  test.identical( got, [] );
  test.is( got === dst );

  test.close( 'onEach returns undefined' );

  /* - */

  test.open( 'onEach is map like' );

  test.case = 'empty array';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = [];
  var got = _.entityFilter_( dst, src, { a : 1 } );
  test.identical( got, [ 7, 7, 7, 7, 7, 7 ] );
  test.is( got === dst );

  test.case = 'unroll';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = _.unrollMake( [ { a : { a : 1 } }, { a : 1 }, 3, undefined, { a : { a : { a : 1 } } } ] );
  var got = _.entityFilter_( dst, src, { a : 1 } );
  test.identical( got, _.unrollMake( [ { a : 1 }, 7, 7, 7, 7, 7 ] ) );
  test.is( got === dst );

  test.case = 'argumentsArray';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = _.argumentsArrayMake( [ 1, { a : 1 }, 3, undefined, 'str' ] );
  var got = _.entityFilter_( dst, src, { a : 1 } );
  test.identical( got, [ { a : 1 }, 7, 7, 7, 7, 7 ] );
  test.is( got === dst );

  test.case = 'BufferTyped';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = new I32x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityFilter_( dst, src, { a : 1 } );
  test.identical( got, [ 7, 7, 7, 7, 7, 7 ] );
  test.is( got === dst );


  /* */

  test.case = 'empty map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = {};
  var got = _.entityFilter_( dst, src, { a : 1 } );
  test.identical( got, { a : undefined, b : undefined, e : 1 } );
  test.is( got === dst );

  test.case = 'map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = { a : { a : 1 }, b : { a : { a : 1 } }, c : 'str', d : undefined };
  var got = _.entityFilter_( dst, src, { a : 1 } );
  test.identical( got, { a : { a : 1 }, b : undefined, e : 1 } );
  test.is( got === dst );

  test.case = 'empty pure map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = Object.create( null );
  var got = _.entityFilter_( dst, src, { a : 1 } );
  test.identical( got, { a : undefined, b : undefined, e : 1 } );
  test.is( got === dst );

  test.case = 'map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = Object.create( null );
  src.a = { a : 1 };
  src.b = { a : { a : 1 } };
  src.c = undefined;
  var got = _.entityFilter_( dst, src, { a : 1 } );
  test.identical( got, { a : { a : 1 }, b : undefined, e : 1 } );
  test.is( got === dst );

  /* */

  test.case = 'null';
  var dst = [ 1, 2 ];
  var src = null;
  var got = _.entityFilter_( dst, src, { a : 1 } );
  test.identical( got, [ 1, 2 ] );
  test.is( got === dst );

  test.case = 'string';
  var dst = { a : 1 };
  var src = 'str';
  var got = _.entityFilter_( dst, src, { a : 1 } );
  test.identical( got, { a : 1 } );
  test.is( got === dst );

  test.case = 'Set';
  var dst = false;
  var src = new Set();
  var got = _.entityFilter_( dst, src, { a : 1 } );
  test.identical( got, false );

  test.case = 'BufferRaw';
  var dst = _.unrollMake( [] );
  var src = new BufferRaw();
  var got = _.entityFilter_( dst, src, { a : 1 } );
  test.identical( got, [] );
  test.is( got === dst );


  test.close( 'onEach is map like' );

  /* - */

  test.open( 'onEach returns unroll' );

  test.case = 'empty array';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = [];
  var got = _.entityFilter_( dst, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, [ 7, 7, 7, 7, 7, 7 ] );
  test.is( got === dst );

  test.case = 'unroll';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = _.unrollMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( dst, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, _.unrollMake( [ 1, 1, undefined, undefined, 3, 3, undefined, undefined, 'str', 'str', 7 ] ) );
  test.is( got === dst );

  test.case = 'argumentsArray';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = _.argumentsArrayMake( [ 1, undefined, 3, undefined, 'str' ] );
  var got = _.entityFilter_( dst, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, [ 1, 1, undefined, undefined, 3, 3, undefined, undefined, 'str', 'str', 7 ] );
  test.is( got === dst );

  test.case = 'BufferTyped';
  var dst = [ 7, 7, 7, 7, 7, 7 ];
  var src = new I16x( [ 1, 2, 3, 4, 5 ] );
  var got = _.entityFilter_( dst, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, [ 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 7 ] );
  test.is( got === dst );

  /* */

  test.case = 'empty map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = {};
  var got = _.entityFilter_( dst, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, { a : undefined, b : undefined, e : 1 } );
  test.is( got === dst );

  test.case = 'map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = { a : 1, b : undefined, c : 'str', d : undefined };
  var got = _.entityFilter_( dst, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, { a : [ 1, 1 ], b : [ undefined, undefined ], c : [ 'str', 'str' ], d : [ undefined, undefined ], e : 1 } );
  test.is( got === dst );

  test.case = 'empty pure map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = Object.create( null );
  var got = _.entityFilter_( dst, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, { a : undefined, b : undefined, e : 1 } );
  test.is( got === dst );

  test.case = 'map';
  var dst = { a : undefined, b : undefined, e : 1 };
  var src = Object.create( null );
  src.a = 1;
  src.b = undefined;
  src.c = undefined;
  var got = _.entityFilter_( dst, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, { a : [ 1, 1 ], b : [ undefined, undefined ], c : [ undefined, undefined ], e : 1 } );
  test.is( got === dst );

  /* */

  test.case = 'null';
  var dst = [ 1, 2 ];
  var src = null;
  var got = _.entityFilter_( dst, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, [ 1, 2, [ null, null ] ] );
  test.is( got === dst );

  test.case = 'string';
  var dst = { a : 1 };
  var src = 'str';
  var got = _.entityFilter_( dst, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, { a : 1, 0 : 'str', 1 : 'str' } );
  test.is( got === dst );

  test.case = 'Set';
  var dst = false;
  var src = new Set();
  var got = _.entityFilter_( dst, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, [ new Set(), new Set() ] );

  test.case = 'BufferRaw';
  var dst = _.unrollMake( [] );
  var src = new BufferRaw();
  var got = _.entityFilter_( dst, src, ( e ) => _.unrollMake( [ e, e ] ) );
  test.identical( got, [ [ new BufferRaw(), new BufferRaw() ] ] );
  test.is( got === dst );


  test.close( 'onEach returns unroll' );
}

//

function entityFilterDeep( test )
{
  test.open( 'onEach is routine' );

  test.case = 'array';
  var callback = ( v, i, s ) => v < 0 ? undefined : Math.sqrt( v );
  var got = _.entityFilterDeep( [ 9, -16, 25, 36, -49 ], callback );
  test.identical( got, [ 3, 5, 6 ] );
  test.notIdentical( got, [ 3, 4, 5, 6, 7 ] );

  test.case = 'unroll';
  var callback = ( v, i, s ) => v < 0 ? undefined : Math.sqrt( v );
  var src = _.unrollMake( [ 9, _.unrollMake( [ -16, 25, _.unrollFrom( [ 36, -49 ] ) ] ) ] );
  var got = _.entityFilterDeep( src, callback );
  test.identical( got, [ 3, 5, 6 ] );
  test.notIdentical( got, [ 3, 4, 5, 6, 7 ] );
  test.isNot( _.unrollIs( got) );

  test.case = 'argumentsArray';
  var callback = ( v, i, s ) => v < 0 ? undefined : Math.sqrt( v );
  var src = _.argumentsArrayMake( [ 9, -16, 25, 36, -49 ] );
  var got = _.entityFilterDeep( src, callback );
  test.identical( got, [ 3, 5, 6 ] );

  test.case = 'BufferTyped to Array';
  var callback = ( v, i, s ) => v < 0 ? undefined : Math.sqrt( v );
  var src = new F32x( [ 9, -16, 25, 36, -49 ] );
  var src = Array.from( src );
  var got = _.entityFilterDeep( src, callback );
  test.identical( got, [ 3, 5, 6 ] );
  test.notIdentical( got, [ 3, 4, 5, 6, 7 ] );

  test.case = 'mapLike';
  var callback = ( v, i, s ) => v < 0 ? undefined : Math.sqrt( v );
  var got = _.entityFilterDeep( { '3' : 9, '4' : 16, '5' : 25, '6' : -36 }, callback );
  test.identical( got, { '3' : 3, '4' : 4, '5' : 5 } );
  test.notIdentical( got, { '3' : 3, '4' : 4, '5' : 5, '6' : 6 } );

  test.case = 'callback in routine';
  var callback = ( v, i, s ) => v < 0 ? undefined : Math.sqrt( v );
  var testFn1 = function()
  {
    return _.entityFilterDeep( arguments, callback );
  }
  var got = testFn1( 9, -16, 25, 36, -49 );
  test.identical( got, [ 3, 5, 6 ] );

  test.case = 'src is array, filter make unrolls';
  var onEach = ( e, i, s ) => _.unrollMake( [ e ] );
  var src = [ 1, [ 2, 3 ], [ 'str', null, undefined ] ];
  var got = _.entityFilterDeep( src, onEach );
  test.identical( got, [ 1, [ 2, 3 ], [ 'str', null, undefined ] ] );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

  test.case = 'src is array, filter check equality';
  var onEach = ( e, i, s ) => e === i;
  var src = [ 0, 2, 2, [ 'str', null ], undefined ];
  var got = _.entityFilterDeep( src, onEach );
  test.identical( got, [ true, false, true, false, false ] );
  test.notIdentical( got, [ true, false, true, false, false, false ] );
  test.is( _.arrayIs( got ) );

  test.close( 'onEach is routine' );

  /* - */

  test.case = 'onEach is objectLike - condition, one entry';
  var callback = { '3' : 9 };
  var got = _.entityFilterDeep( { a : { '3' : 9 }, b : { '3' : 4 } }, callback );
  test.identical( got, { a : { '3' : 9 } } );

  test.case = 'onEach is objectLike - condition, a few entry';
  var callback = { '3' : 9 };
  var src = { a : { '3' : 9 }, b : { '4' : 4 }, c : { '3' : 9 }, d : { '3' : 9 } };
  var got = _.entityFilterDeep( src, callback );
  test.identical( got, { a : { '3' : 9 }, c : { '3' : 9 }, d : { '3' : 9 } } );

  test.case = 'onEach is objectLike - condition, entry nested to next levels';
  var callback = { '3' : 9 };
  var src = { a : { a : { b : { c : { '3' : 9, '4' : 6 } } } } };
  var got = _.entityFilterDeep( src, callback );
  test.identical( got, {} );
  test.notIdentical( got, { a : { a : { b : { c : { '3' : 9, '4' : 6 } } } } } );

  test.case = 'onEach is objectLike - routine, entry nested to next level';
  var onEach = ( e ) => true;
  var callback = { '3' : onEach };
  var src = { a : { b : { '3' : 9 } } };
  var got = _.entityFilterDeep( src, callback );
  test.identical( got, { a : { b : { '3' : 9 } } } );
  test.notIdentical( got, {} );

  test.case = 'onEach is objectLike - routine, entry nested to next level';
  var onEach = function( e )
  {
    for( let k in e )
    {
      e[ k ] = e[ k ] + 5;
      if( e[ k ] !== 10 )
      return false;
    }
    return true;
  }
  var callback = { '3' : onEach };
  var src = { a : { b : 5, c : 5, d : 5 } };
  var got = _.entityFilterDeep( src, callback );
  test.identical( got, { a : { b : 5, c : 5, d : 5 } } );
  test.notIdentical( got, {} );

  test.case = 'onEach is objectLike - condition, identical entry';
  var onEach = ( e ) => true;
  var callback = { '3' : onEach };
  var src = { a : { '3' : onEach } };
  var got = _.entityFilterDeep( src, callback );
  test.identical( got, { a : { '3' : onEach } } );
  test.notIdentical( got, {} );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( () => _.entityFilterDeep() );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.entityFilterDeep( [ 1,3 ], () => true, 1 ) );

  test.case = 'onEach is not routine';
  test.shouldThrowErrorSync( () => _.entityFilterDeep( [ 1,3 ], 'callback' ) );

  test.case = 'src is not arrayLike or mapLike';
  test.shouldThrowErrorSync( () => _.entityFilterDeep( undefined, ( e ) => e ) );
}

//

function first( test )
{
  test.open( 'onEach returns element' );

  test.case = 'empty array';
  var got = _.first( [], ( e ) => e );
  test.identical( got, undefined );

  test.case = 'argumentsArray with undefined';
  var got = _.first( _.argumentsArrayMake( [ undefined, undefined, undefined ] ), ( e ) => e );
  test.identical( got, undefined );

  test.case = 'unroll has defined elements';
  var got = _.first( _.unrollMake( [ undefined, 'str', 1 ] ), ( e ) => e );
  test.identical( got, 'str' );

  test.case = 'BufferTyped with zeros';
  var got = _.first( new U8x( 10 ), ( e ) => e );
  test.identical( got, 0 );

  /* */

  test.case = 'empty map';
  var got = _.first( {}, ( e ) => e );
  test.identical( got, undefined );

  test.case = 'map with undefined';
  var got = _.first( { a : undefined, b : undefined, c : undefined }, ( e ) => e );
  test.identical( got, undefined );

  test.case = 'map has defined elements';
  var got = _.first( { a : undefined, b : 'str', c : 1 }, ( e ) => e );
  test.identical( got, 'str' );

  test.case = 'empty pure map';
  var got = _.first( Object.create( null ), ( e ) => e );
  test.identical( got, undefined );

  test.case = 'pure map with undefined';
  var src = Object.create( null );
  src.a = undefined;
  src.b = undefined;
  var got = _.first( src, ( e ) => e );
  test.identical( got, undefined );

  test.case = 'map has defined elements';
  var src = Object.create( null );
  src.a = undefined;
  src.b = 'str';
  var got = _.first( src, ( e ) => e );
  test.identical( got, 'str' );

  /* */

  test.case = 'null';
  var got = _.first( null, ( e ) => e );
  test.identical( got, null );

  test.case = 'string';
  var got = _.first( 'str', ( e ) => e );
  test.identical( got, 'str' );

  test.case = 'number';
  var got = _.first( 1, ( e ) => e );
  test.identical( got, 1 );

  test.case = 'boolean - false';
  var got = _.first( false, ( e ) => e );
  test.identical( got, false );

  test.close( 'onEach returns element' );

  /* - */

  test.open( 'onEach returns key' );

  test.case = 'empty unroll';
  var got = _.first( _.unrollMake( [] ), ( e, k ) => k );
  test.identical( got, undefined );

  test.case = 'array with undefined';
  var got = _.first( [ undefined, undefined, undefined ], ( e, k ) => k );
  test.identical( got, 0 );

  test.case = 'argumentsArray has defined elements';
  var got = _.first( _.argumentsArrayMake( [ undefined, 'str', 1 ] ), ( e, k ) => k );
  test.identical( got, 0 );

  test.case = 'BufferTyped with zeros';
  var got = _.first( new I32x( 10 ), ( e, k ) => k );
  test.identical( got, 0 );

  /* */

  test.case = 'empty map';
  var got = _.first( {}, ( e, k ) => k );
  test.identical( got, undefined );

  test.case = 'map with undefined';
  var got = _.first( { a : undefined, b : undefined, c : undefined }, ( e, k ) => k );
  test.identical( got, 'a' );

  test.case = 'map has defined elements';
  var got = _.first( { a : undefined, b : 'str', c : 1 }, ( e, k ) => k );
  test.identical( got, 'a' );

  test.case = 'empty pure map';
  var got = _.first( Object.create( null ), ( e, k ) => k );
  test.identical( got, undefined );

  test.case = 'pure map with undefined';
  var src = Object.create( null );
  src.a = undefined;
  src.b = undefined;
  var got = _.first( src, ( e, k ) => k );
  test.identical( got, 'a' );

  test.case = 'map has defined elements';
  var src = Object.create( null );
  src.a = undefined;
  src.b = 'str';
  var got = _.first( src, ( e, k ) => k );
  test.identical( got, 'a' );

  /* */

  test.case = 'null';
  var got = _.first( null, ( e, k ) => k );
  test.identical( got, null );

  test.case = 'string';
  var got = _.first( 'str', ( e, k ) => k );
  test.identical( got, null );

  test.case = 'number';
  var got = _.first( 1, ( e, k ) => k );
  test.identical( got, null );

  test.case = 'boolean - false';
  var got = _.first( false, ( e, k ) => k );
  test.identical( got, null );

  test.close( 'onEach returns key' );

  /* - */

  test.open( 'onEach checks container' );

  test.case = 'empty unroll';
  var got = _.first( _.unrollMake( [] ), ( e, k, c ) => c ? k : e );
  test.identical( got, undefined );

  test.case = 'array with undefined';
  var got = _.first( [ undefined, undefined, undefined ], ( e, k, c ) => c ? k : e );
  test.identical( got, 0 );

  test.case = 'argumentsArray has defined elements';
  var got = _.first( _.argumentsArrayMake( [ undefined, 'str', 1 ] ), ( e, k, c ) => c ? k : e );
  test.identical( got, 0 );

  test.case = 'BufferTyped with zeros';
  var got = _.first( new I32x( 10 ), ( e, k, c ) => c ? k : e );
  test.identical( got, 0 );

  /* */

  test.case = 'empty map';
  var got = _.first( {}, ( e, k, c ) => c ? k : e );
  test.identical( got, undefined );

  test.case = 'map with undefined';
  var got = _.first( { a : undefined, b : undefined, c : undefined }, ( e, k, c ) => c ? k : e );
  test.identical( got, 'a' );

  test.case = 'map has defined elements';
  var got = _.first( { a : undefined, b : 'str', c : 1 }, ( e, k, c ) => c ? k : e );
  test.identical( got, 'a' );

  test.case = 'empty pure map';
  var got = _.first( Object.create( null ), ( e, k, c ) => c ? k : e );
  test.identical( got, undefined );

  test.case = 'pure map with undefined';
  var src = Object.create( null );
  src.a = undefined;
  src.b = undefined;
  var got = _.first( src, ( e, k, c ) => c ? k : e );
  test.identical( got, 'a' );

  test.case = 'map has defined elements';
  var src = Object.create( null );
  src.a = undefined;
  src.b = 'str';
  var got = _.first( src, ( e, k, c ) => c ? k : e );
  test.identical( got, 'a' );

  /* */

  test.case = 'null';
  var got = _.first( null, ( e, k, c ) => c ? k : e );
  test.identical( got, null );

  test.case = 'string';
  var got = _.first( 'str', ( e, k, c ) => c ? k : e );
  test.identical( got, 'str' );

  test.case = 'number';
  var got = _.first( 1, ( e, k, c ) => c ? k : e );
  test.identical( got, 1 );

  test.case = 'boolean - false';
  var got = _.first( false, ( e, k, c ) => c ? k : e );
  test.identical( got, false );

  test.close( 'onEach checks container' );

  /* - */

  test.open( 'onEach returns undefined' );

  test.case = 'empty unroll';
  var got = _.first( _.unrollMake( [] ), ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'array with undefined';
  var got = _.first( [ undefined, undefined, undefined ], ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'argumentsArray has defined elements';
  var got = _.first( _.argumentsArrayMake( [ undefined, 'str', 1 ] ), ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'BufferTyped with zeros';
  var got = _.first( new I32x( 10 ), ( e ) => undefined );
  test.identical( got, undefined );

  /* */

  test.case = 'empty map';
  var got = _.first( {}, ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'map with undefined';
  var got = _.first( { a : undefined, b : undefined, c : undefined }, ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'map has defined elements';
  var got = _.first( { a : undefined, b : 'str', c : 1 }, ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'empty pure map';
  var got = _.first( Object.create( null ), ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'pure map with undefined';
  var src = Object.create( null );
  src.a = undefined;
  src.b = undefined;
  var got = _.first( src, ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'map has defined elements';
  var src = Object.create( null );
  src.a = undefined;
  src.b = 'str';
  var got = _.first( src, ( e ) => undefined );
  test.identical( got, undefined );

  /* */

  test.case = 'null';
  var got = _.first( null, ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'string';
  var got = _.first( 'str', ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'number';
  var got = _.first( 1, ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'boolean - false';
  var got = _.first( false, ( e ) => undefined );
  test.identical( got, undefined );

  test.close( 'onEach returns undefined' );

  /* - */

  test.open( 'onEach is objectLike' );

 test.case = 'empty unroll';
  var got = _.first( _.unrollMake( [] ), { a : 1 } );
  test.identical( got, undefined );

  test.case = 'array with undefined';
  var got = _.first( [ undefined, undefined, undefined ], { a : 1 } );
  test.identical( got, undefined );

  test.case = 'argumentsArray has defined elements';
  var got = _.first( _.argumentsArrayMake( [ { b : 1 }, 'str', { a : 1 } ] ), { a : 1 } );
  test.identical( got, { a : 1 } );

  test.case = 'BufferTyped with zeros';
  var got = _.first( new I32x( 10 ), { a : 1 } );
  test.identical( got, undefined );

  /* */

  test.case = 'empty map';
  var got = _.first( {}, { a : 1 } );
  test.identical( got, undefined );

  test.case = 'map with undefined';
  var got = _.first( { a : undefined, b : undefined, c : undefined }, { a : 1 } );
  test.identical( got, undefined );

  test.case = 'map has defined elements';
  var got = _.first( { a : undefined, b : 'str', c : { a : 1 } }, { a : 1 } );
  test.identical( got, { a : 1 } );

  test.case = 'empty pure map';
  var got = _.first( Object.create( null ), { a : 1 } );
  test.identical( got, undefined );

  test.case = 'pure map with undefined';
  var src = Object.create( null );
  src.a = undefined;
  src.b = undefined;
  var got = _.first( src, { a : 1 } );
  test.identical( got, undefined );

  test.case = 'map has defined elements';
  var src = Object.create( null );
  src.a = undefined;
  src.b = { a : 1 };
  var got = _.first( src, { a : 1 } );
  test.identical( got, { a : 1 } );

  /* */

  test.case = 'null';
  var got = _.first( null, { a : 1 } );
  test.identical( got, undefined );

  test.case = 'string';
  var got = _.first( 'str', { a : 1 } );
  test.identical( got, undefined );

  test.case = 'number';
  var got = _.first( 1, { a : 1 } );
  test.identical( got, undefined );

  test.case = 'boolean - false';
  var got = _.first( false, { a : 1 } );
  test.identical( got, undefined );


  test.close( 'onEach is objectLike' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.first() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.first( 'str' ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.first( 'str', ( e ) => e, 'extra' ) );

  test.case = 'onEach is not a routine';
  test.shouldThrowErrorSync( () => _.first( [ 1, 2, 3 ], 1 ) );
}

//

function last( test )
{
  test.open( 'onEach returns element' );

  test.case = 'empty array';
  var got = _.last( [], ( e ) => e );
  test.identical( got, undefined );

  test.case = 'argumentsArray with undefined';
  var got = _.last( _.argumentsArrayMake( [ undefined, undefined, undefined ] ), ( e ) => e );
  test.identical( got, undefined );

  test.case = 'unroll has defined elements';
  var got = _.last( _.unrollMake( [ undefined, 'str', 1 ] ), ( e ) => e );
  test.identical( got, 1 );

  test.case = 'BufferTyped with zeros';
  var got = _.last( new U8x( 10 ), ( e ) => e );
  test.identical( got, 0 );

  /* */

  test.case = 'empty map';
  var got = _.last( {}, ( e ) => e );
  test.identical( got, undefined );

  test.case = 'map with undefined';
  var got = _.last( { a : undefined, b : undefined, c : undefined }, ( e ) => e );
  test.identical( got, undefined );

  test.case = 'map has defined elements';
  var got = _.last( { a : undefined, b : 'str', c : 1 }, ( e ) => e );
  test.identical( got, 1 );

  test.case = 'empty pure map';
  var got = _.last( Object.create( null ), ( e ) => e );
  test.identical( got, undefined );

  test.case = 'pure map with undefined';
  var src = Object.create( null );
  src.a = undefined;
  src.b = undefined;
  var got = _.last( src, ( e ) => e );
  test.identical( got, undefined );

  test.case = 'map has defined elements';
  var src = Object.create( null );
  src.a = 1;
  src.b = 'str';
  var got = _.last( src, ( e ) => e );
  test.identical( got, 'str' );

  /* */

  test.case = 'null';
  var got = _.last( null, ( e ) => e );
  test.identical( got, null );

  test.case = 'string';
  var got = _.last( 'str', ( e ) => e );
  test.identical( got, 'str' );

  test.case = 'number';
  var got = _.last( 1, ( e ) => e );
  test.identical( got, 1 );

  test.case = 'boolean - false';
  var got = _.last( false, ( e ) => e );
  test.identical( got, false );

  test.close( 'onEach returns element' );

  /* - */

  test.open( 'onEach returns key' );

  test.case = 'empty unroll';
  var got = _.last( _.unrollMake( [] ), ( e, k ) => k );
  test.identical( got, undefined );

  test.case = 'array with undefined';
  var got = _.last( [ undefined, undefined, undefined ], ( e, k ) => k );
  test.identical( got, 2 );

  test.case = 'argumentsArray has defined elements';
  var got = _.last( _.argumentsArrayMake( [ undefined, 'str', 1 ] ), ( e, k ) => k );
  test.identical( got, 2 );

  test.case = 'BufferTyped with zeros';
  var got = _.last( new I32x( 10 ), ( e, k ) => k );
  test.identical( got, 9 );

  /* */

  test.case = 'empty map';
  var got = _.last( {}, ( e, k ) => k );
  test.identical( got, undefined );

  test.case = 'map with undefined';
  var got = _.last( { a : undefined, b : undefined, c : undefined }, ( e, k ) => k );
  test.identical( got, 'c' );

  test.case = 'map has defined elements';
  var got = _.last( { a : undefined, b : 'str', c : 1 }, ( e, k ) => k );
  test.identical( got, 'c' );

  test.case = 'empty pure map';
  var got = _.last( Object.create( null ), ( e, k ) => k );
  test.identical( got, undefined );

  test.case = 'pure map with undefined';
  var src = Object.create( null );
  src.a = undefined;
  src.b = undefined;
  var got = _.last( src, ( e, k ) => k );
  test.identical( got, 'b' );

  test.case = 'map has defined elements';
  var src = Object.create( null );
  src.a = undefined;
  src.b = 'str';
  var got = _.last( src, ( e, k ) => k );
  test.identical( got, 'b' );

  /* */

  test.case = 'null';
  var got = _.last( null, ( e, k ) => k );
  test.identical( got, null );

  test.case = 'string';
  var got = _.last( 'str', ( e, k ) => k );
  test.identical( got, null );

  test.case = 'number';
  var got = _.last( 1, ( e, k ) => k );
  test.identical( got, null );

  test.case = 'boolean - false';
  var got = _.last( false, ( e, k ) => k );
  test.identical( got, null );

  test.close( 'onEach returns key' );

  /* - */

  test.open( 'onEach checks container' );

  test.case = 'empty unroll';
  var got = _.last( _.unrollMake( [] ), ( e, k, c ) => c ? k : e );
  test.identical( got, undefined );

  test.case = 'array with undefined';
  var got = _.last( [ undefined, undefined, undefined ], ( e, k, c ) => c ? k : e );
  test.identical( got, 2 );

  test.case = 'argumentsArray has defined elements';
  var got = _.last( _.argumentsArrayMake( [ undefined, 'str', 1 ] ), ( e, k, c ) => c ? k : e );
  test.identical( got, 2 );

  test.case = 'BufferTyped with zeros';
  var got = _.last( new I32x( 10 ), ( e, k, c ) => c ? k : e );
  test.identical( got, 9 );

  /* */

  test.case = 'empty map';
  var got = _.last( {}, ( e, k, c ) => c ? k : e );
  test.identical( got, undefined );

  test.case = 'map with undefined';
  var got = _.last( { a : undefined, b : undefined, c : undefined }, ( e, k, c ) => c ? k : e );
  test.identical( got, 'c' );

  test.case = 'map has defined elements';
  var got = _.last( { a : undefined, b : 'str', c : 1 }, ( e, k, c ) => c ? k : e );
  test.identical( got, 'c' );

  test.case = 'empty pure map';
  var got = _.last( Object.create( null ), ( e, k, c ) => c ? k : e );
  test.identical( got, undefined );

  test.case = 'pure map with undefined';
  var src = Object.create( null );
  src.a = undefined;
  src.b = undefined;
  var got = _.last( src, ( e, k, c ) => c ? k : e );
  test.identical( got, 'b' );

  test.case = 'map has defined elements';
  var src = Object.create( null );
  src.a = undefined;
  src.b = 'str';
  var got = _.last( src, ( e, k, c ) => c ? k : e );
  test.identical( got, 'b' );

  /* */

  test.case = 'null';
  var got = _.last( null, ( e, k, c ) => c ? k : e );
  test.identical( got, null );

  test.case = 'string';
  var got = _.last( 'str', ( e, k, c ) => c ? k : e );
  test.identical( got, 'str' );

  test.case = 'number';
  var got = _.last( 1, ( e, k, c ) => c ? k : e );
  test.identical( got, 1 );

  test.case = 'boolean - false';
  var got = _.last( false, ( e, k, c ) => c ? k : e );
  test.identical( got, false );

  test.close( 'onEach checks container' );

  /* - */

  test.open( 'onEach returns undefined' );

  test.case = 'empty unroll';
  var got = _.last( _.unrollMake( [] ), ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'array with undefined';
  var got = _.last( [ undefined, undefined, undefined ], ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'argumentsArray has defined elements';
  var got = _.last( _.argumentsArrayMake( [ undefined, 'str', 1 ] ), ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'BufferTyped with zeros';
  var got = _.last( new I32x( 10 ), ( e ) => undefined );
  test.identical( got, undefined );

  /* */

  test.case = 'empty map';
  var got = _.last( {}, ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'map with undefined';
  var got = _.last( { a : undefined, b : undefined, c : undefined }, ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'map has defined elements';
  var got = _.last( { a : undefined, b : 'str', c : 1 }, ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'empty pure map';
  var got = _.last( Object.create( null ), ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'pure map with undefined';
  var src = Object.create( null );
  src.a = undefined;
  src.b = undefined;
  var got = _.last( src, ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'map has defined elements';
  var src = Object.create( null );
  src.a = undefined;
  src.b = 'str';
  var got = _.last( src, ( e ) => undefined );
  test.identical( got, undefined );

  /* */

  test.case = 'null';
  var got = _.last( null, ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'string';
  var got = _.last( 'str', ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'number';
  var got = _.last( 1, ( e ) => undefined );
  test.identical( got, undefined );

  test.case = 'boolean - false';
  var got = _.last( false, ( e ) => undefined );
  test.identical( got, undefined );

  test.close( 'onEach returns undefined' );

  /* - */

  test.open( 'onEach is objectLike' );

 test.case = 'empty unroll';
  var got = _.last( _.unrollMake( [] ), { a : 1 } );
  test.identical( got, undefined );

  test.case = 'array with undefined';
  var got = _.last( [ undefined, undefined, undefined ], { a : 1 } );
  test.identical( got, undefined );

  test.case = 'argumentsArray has defined elements';
  var got = _.last( _.argumentsArrayMake( [ { a : 1 }, 'str', { b : 1 } ] ), { a : 1 } );
  test.identical( got, { a : 1 } );

  test.case = 'BufferTyped with zeros';
  var got = _.last( new I32x( 10 ), { a : 1 } );
  test.identical( got, undefined );

  /* */

  test.case = 'empty map';
  var got = _.last( {}, { a : 1 } );
  test.identical( got, undefined );

  test.case = 'map with undefined';
  var got = _.last( { a : undefined, b : undefined, c : undefined }, { a : 1 } );
  test.identical( got, undefined );

  test.case = 'map has defined elements';
  var got = _.last( { a : { a : 1 }, b : undefined, c : { b : 1 } }, { a : 1 } );
  test.identical( got, { a : 1 } );

  test.case = 'empty pure map';
  var got = _.last( Object.create( null ), { a : 1 } );
  test.identical( got, undefined );

  test.case = 'pure map with undefined';
  var src = Object.create( null );
  src.a = undefined;
  src.b = undefined;
  var got = _.last( src, { a : 1 } );
  test.identical( got, undefined );

  test.case = 'map has defined elements';
  var src = Object.create( null );
  src.a = { a : 1 };
  src.b = undefined;
  var got = _.last( src, { a : 1 } );
  test.identical( got, { a : 1 } );

  /* */

  test.case = 'null';
  var got = _.last( null, { a : 1 } );
  test.identical( got, undefined );

  test.case = 'string';
  var got = _.last( 'str', { a : 1 } );
  test.identical( got, undefined );

  test.case = 'number';
  var got = _.last( 1, { a : 1 } );
  test.identical( got, undefined );

  test.case = 'boolean - false';
  var got = _.last( false, { a : 1 } );
  test.identical( got, undefined );


  test.close( 'onEach is objectLike' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.last() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.last( 'str' ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.last( 'str', ( e ) => e, 'extra' ) );

  test.case = 'onEach is not a routine';
  test.shouldThrowErrorSync( () => _.last( [ 1, 2, 3 ], 1 ) );
}

//

function index( test )
{
  test.open( 'without onEach' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.index( src );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.index( src );
  var exp = { ak : 'a', bk : 'a', ck : 'a' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.index( src );
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.index( src );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.index( src );
  var exp = { 0 : 'a', 1 : 'a', 2 : 'a' };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.index( src );
  var exp = { 0 : 'a', 1 : 'b', 2 : 'c' };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.index( src );
  var exp = {};
  test.identical( got, exp );

  test.close( 'without onEach' );

  /* - */

  test.open( 'onEach returns undefined' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.index( src, ( e, k ) => undefined );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.index( src, ( e, k ) => undefined );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.index( src, ( e, k ) => undefined );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.index( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.index( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.index( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.index( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.close( 'onEach returns undefined' );

  /* - */

  test.open( 'onEach returns element' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.index( src, ( e, k ) => e );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.index( src, ( e, k ) => e );
  var exp = { a : 'a' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.index( src, ( e, k ) => e );
  var exp = { a : 'a', b : 'b', c : 'c' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.index( src, ( e, k ) => e );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.index( src, ( e, k ) => e );
  var exp = { a : 'a' };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.index( src, ( e, k ) => e );
  var exp = { a : 'a', b : 'b', c : 'c' };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.index( src, ( e, k ) => e );
  var exp = { src : 'src' };
  test.identical( got, exp );

  test.close( 'onEach returns element' );

  /* - */

  test.open( 'onEach returns key' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.index( src, ( e, k ) => k );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.index( src, ( e, k ) => k );
  var exp = { ak : 'a', bk : 'a', ck : 'a' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.index( src, ( e, k ) => k );
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.index( src, ( e, k ) => k );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.index( src, ( e, k ) => k );
  var exp = { 0 : 'a', 1 : 'a', 2 : 'a' };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.index( src, ( e, k ) => k );
  var exp = { 0 : 'a', 1 : 'b', 2 : 'c' };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.index( src, ( e, k ) => k );
  var exp = {};
  test.identical( got, exp );

  test.close( 'onEach returns key' );

  /* - */

  test.open( 'onEach returns map' );

  test.case = 'src - empty map';
  var src = {};
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.index( src, onEach );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.index( src, onEach );
  var exp = { '[object Object]' : 'a' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.index( src, onEach );
  var exp = { '[object Object]' : 'c' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.index( src, onEach );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.index( src, onEach );
  var exp = { '[object Object]' : 'a' };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.index( src, onEach );
  var exp = { '[object Object]' : 'c' };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.index( src, onEach );
  var exp = { '[object Object]' : 'src' };
  test.identical( got, exp );

  test.close( 'onEach returns map' );

  /* - */

  test.open( 'onEach returns unroll' );

  test.case = 'src - empty map';
  var src = {};
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.index( src, onEach );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.index( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'a',
    'ck' : 'a',
    'ak2' : 'a',
    'bk2' : 'a',
    'ck2' : 'a',
    'x' : 'a'
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.index( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'b',
    'ck' : 'c',
    'ak2' : 'a',
    'bk2' : 'b',
    'ck2' : 'c',
    'x' : 'c'
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.index( src, onEach );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.index( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'a',
    '2' : 'a',
    '02' : 'a',
    '12' : 'a',
    '22' : 'a',
    'x' : 'a'
  };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.index( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '02' : 'a',
    '12' : 'b',
    '22' : 'c',
    'x' : 'c'
  };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.index( src, onEach );
  var exp = { undefined2 : 'src', x : 'src' };
  test.identical( got, exp );

  test.close( 'onEach returns unroll' );

  /* - */

  test.open( 'onEach returns unroll with map' );

  test.case = 'src - empty map';
  var src = {};
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.index( src, onEach );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.index( src, onEach );
  var exp = { '[object Object]' : 'a' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.index( src, onEach );
  var exp = { '[object Object]' : 'c' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.index( src, onEach );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.index( src, onEach );
  var exp = { '[object Object]' : 'a' };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.index( src, onEach );
  var exp = { '[object Object]' : 'c' };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.index( src, onEach );
  var exp = { '[object Object]' : 'src' };
  test.identical( got, exp );

  test.close( 'onEach returns unroll with map' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.index( src, '*/f1' );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical entries';
  var src = { a : { f1 : 'aa.f1', f2 : 'aa.f2' }, b : { f1 : 'aa.f1', f2 : 'aa.f2' }, c : { f1 : 'aa.f1', f2 : 'aa.f2' } };
  var got = _.index( src, '*/f1' );
  var exp = { 'aa.f1' : { f1 : 'aa.f1', f2 : 'aa.f2' } };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical entries';
  var src = { a : { f1 : 'aa.f1', f2 : 'aa.f2' }, b : { f1 : 'bb.f1', f2 : 'bb.f2' }, c : { f1 : 'cc.f1', f2 : 'cc.f2' } };
  var got = _.index( src, '*/f1' );
  var exp = { 'aa.f1' : { f1 : 'aa.f1', f2 : 'aa.f2' }, 'bb.f1' : { f1 : 'bb.f1', f2 : 'bb.f2' }, 'cc.f1' : { f1 : 'cc.f1', f2 : 'cc.f2' } };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.index( src, '*/f1' );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'a.f1', f2 : 'a.f2' } ];
  var got = _.index( src, '*/f1' );
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' } };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.index( src, '*/f1' );
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  test.identical( got, exp );

  test.case = 'src - str';
  var src = 'src';
  var got = _.index( src, '*/src' );
  var exp = {};
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function indexExtending( test )
{
  test.open( 'without onEach' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexExtending( src );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.indexExtending( src );
  var exp = { ak : 'a', bk : 'a', ck : 'a' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexExtending( src );
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexExtending( src );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.indexExtending( src );
  var exp = { 0 : 'a', 1 : 'a', 2 : 'a' };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexExtending( src );
  var exp = { 0 : 'a', 1 : 'b', 2 : 'c' };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.indexExtending( src );
  var exp = { src : undefined };
  test.identical( got, exp );

  test.close( 'without onEach' );

  /* - */

  test.open( 'onEach returns undefined' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexExtending( src, ( e, k ) => undefined );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.indexExtending( src, ( e, k ) => undefined );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexExtending( src, ( e, k ) => undefined );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexExtending( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.indexExtending( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexExtending( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.indexExtending( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.close( 'onEach returns undefined' );

  /* - */

  test.open( 'onEach returns element' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexExtending( src, ( e, k ) => e );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.indexExtending( src, ( e, k ) => e );
  var exp = { a : 'a' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexExtending( src, ( e, k ) => e );
  var exp = { a : 'a', b : 'b', c : 'c' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexExtending( src, ( e, k ) => e );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.indexExtending( src, ( e, k ) => e );
  var exp = { a : 'a' };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexExtending( src, ( e, k ) => e );
  var exp = { a : 'a', b : 'b', c : 'c' };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.indexExtending( src, ( e, k ) => e );
  var exp = { src : 'src' };
  test.identical( got, exp );

  test.close( 'onEach returns element' );

  /* - */

  test.open( 'onEach returns key' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexExtending( src, ( e, k ) => k );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.indexExtending( src, ( e, k ) => k );
  var exp = { ak : 'a', bk : 'a', ck : 'a' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexExtending( src, ( e, k ) => k );
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexExtending( src, ( e, k ) => k );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.indexExtending( src, ( e, k ) => k );
  var exp = { 0 : 'a', 1 : 'a', 2 : 'a' };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexExtending( src, ( e, k ) => k );
  var exp = { 0 : 'a', 1 : 'b', 2 : 'c' };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.indexExtending( src, ( e, k ) => k );
  var exp = {};
  test.identical( got, exp );

  test.close( 'onEach returns key' );

  /* - */

  test.open( 'onEach returns map' );

  test.case = 'src - empty map';
  var src = {};
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexExtending( src, onEach );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexExtending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'a',
    'ck' : 'a',
    'ak2' : 'a',
    'bk2' : 'a',
    'ck2' : 'a',
    'x' : 'a'
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexExtending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'b',
    'ck' : 'c',
    'ak2' : 'a',
    'bk2' : 'b',
    'ck2' : 'c',
    'x' : 'c'
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexExtending( src, onEach );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexExtending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'a',
    '2' : 'a',
    '02' : 'a',
    '12' : 'a',
    '22' : 'a',
    'x' : 'a'
  };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexExtending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '02' : 'a',
    '12' : 'b',
    '22' : 'c',
    'x' : 'c'
  };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexExtending( src, onEach );
  var exp = { 'undefined' : 'src', 'undefined2' : 'src', 'x' : 'src' };
  test.identical( got, exp );

  test.close( 'onEach returns map' );

  /* - */

  test.open( 'onEach returns unroll' );

  test.case = 'src - empty map';
  var src = {};
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexExtending( src, onEach );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexExtending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'a',
    'ck' : 'a',
    'ak2' : 'a',
    'bk2' : 'a',
    'ck2' : 'a',
    'x' : 'a'
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexExtending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'b',
    'ck' : 'c',
    'ak2' : 'a',
    'bk2' : 'b',
    'ck2' : 'c',
    'x' : 'c'
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexExtending( src, onEach );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexExtending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'a',
    '2' : 'a',
    '02' : 'a',
    '12' : 'a',
    '22' : 'a',
    'x' : 'a'
  };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexExtending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '02' : 'a',
    '12' : 'b',
    '22' : 'c',
    'x' : 'c'
  };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexExtending( src, onEach );
  var exp = { undefined2 : 'src', x : 'src' };
  test.identical( got, exp );

  test.close( 'onEach returns unroll' );

  /* - */

  test.open( 'onEach returns unroll with map' );

  test.case = 'src - empty map';
  var src = {};
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexExtending( src, onEach );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexExtending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'a',
    'ck' : 'a',
    'ak2' : 'a2',
    'bk2' : 'a2',
    'ck2' : 'a2',
    'xk' : 'ck'
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexExtending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'b',
    'ck' : 'c',
    'ak2' : 'a2',
    'bk2' : 'b2',
    'ck2' : 'c2',
    'xk' : 'ck'
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexExtending( src, onEach );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexExtending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'a',
    '2' : 'a',
    '02' : 'a2',
    '12' : 'a2',
    '22' : 'a2',
    'xk' : 2
  };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexExtending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '02' : 'a2',
    '12' : 'b2',
    '22' : 'c2',
    'xk' : 2
  };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexExtending( src, onEach );
  var exp = { 'undefined' : 'src', 'undefined2' : 'src2', 'xk' : undefined };
  test.identical( got, exp );

  test.close( 'onEach returns unroll with map' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexExtending( src, '*/f1' );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical entries';
  var src = { a : { f1 : 'aa.f1', f2 : 'aa.f2' }, b : { f1 : 'aa.f1', f2 : 'aa.f2' }, c : { f1 : 'aa.f1', f2 : 'aa.f2' } };
  var got = _.indexExtending( src, '*/f1' );
  var exp = { 'aa.f1' : { f1 : 'aa.f1', f2 : 'aa.f2' } };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical entries';
  var src = { a : { f1 : 'aa.f1', f2 : 'aa.f2' }, b : { f1 : 'bb.f1', f2 : 'bb.f2' }, c : { f1 : 'cc.f1', f2 : 'cc.f2' } };
  var got = _.indexExtending( src, '*/f1' );
  var exp = { 'aa.f1' : { f1 : 'aa.f1', f2 : 'aa.f2' }, 'bb.f1' : { f1 : 'bb.f1', f2 : 'bb.f2' }, 'cc.f1' : { f1 : 'cc.f1', f2 : 'cc.f2' } };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexExtending( src, '*/f1' );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'a.f1', f2 : 'a.f2' } ];
  var got = _.indexExtending( src, '*/f1' );
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' } };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.indexExtending( src, '*/f1' );
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  test.identical( got, exp );

  test.case = 'src - str';
  var src = 'src';
  var got = _.indexExtending( src, '*/src' );
  var exp = {};
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function indexSupplementing( test )
{
  test.open( 'without onEach' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexSupplementing( src );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.indexSupplementing( src );
  var exp = { ak : 'a', bk : 'a', ck : 'a' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexSupplementing( src );
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexSupplementing( src );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.indexSupplementing( src );
  var exp = { 0 : 'a', 1 : 'a', 2 : 'a' };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexSupplementing( src );
  var exp = { 0 : 'a', 1 : 'b', 2 : 'c' };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.indexSupplementing( src );
  var exp = { src : undefined };
  test.identical( got, exp );

  test.close( 'without onEach' );

  /* - */

  test.open( 'onEach returns undefined' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexSupplementing( src, ( e, k ) => undefined );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.indexSupplementing( src, ( e, k ) => undefined );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexSupplementing( src, ( e, k ) => undefined );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexSupplementing( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.indexSupplementing( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexSupplementing( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.indexSupplementing( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.close( 'onEach returns undefined' );

  /* - */

  test.open( 'onEach returns element' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexSupplementing( src, ( e, k ) => e );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.indexSupplementing( src, ( e, k ) => e );
  var exp = { a : 'a' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexSupplementing( src, ( e, k ) => e );
  var exp = { a : 'a', b : 'b', c : 'c' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexSupplementing( src, ( e, k ) => e );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.indexSupplementing( src, ( e, k ) => e );
  var exp = { a : 'a' };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexSupplementing( src, ( e, k ) => e );
  var exp = { a : 'a', b : 'b', c : 'c' };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.indexSupplementing( src, ( e, k ) => e );
  var exp = { src : 'src' };
  test.identical( got, exp );

  test.close( 'onEach returns element' );

  /* - */

  test.open( 'onEach returns key' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexSupplementing( src, ( e, k ) => k );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.indexSupplementing( src, ( e, k ) => k );
  var exp = { ak : 'a', bk : 'a', ck : 'a' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexSupplementing( src, ( e, k ) => k );
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexSupplementing( src, ( e, k ) => k );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.indexSupplementing( src, ( e, k ) => k );
  var exp = { 0 : 'a', 1 : 'a', 2 : 'a' };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexSupplementing( src, ( e, k ) => k );
  var exp = { 0 : 'a', 1 : 'b', 2 : 'c' };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.indexSupplementing( src, ( e, k ) => k );
  var exp = {};
  test.identical( got, exp );

  test.close( 'onEach returns key' );

  /* - */

  test.open( 'onEach returns map' );

  test.case = 'src - empty map';
  var src = {};
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexSupplementing( src, onEach );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexSupplementing( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'a',
    'ck' : 'a',
    'ak2' : 'a',
    'bk2' : 'a',
    'ck2' : 'a',
    'x' : 'a'
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexSupplementing( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'b',
    'ck' : 'c',
    'ak2' : 'a',
    'bk2' : 'b',
    'ck2' : 'c',
    'x' : 'a'
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexSupplementing( src, onEach );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexSupplementing( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'a',
    '2' : 'a',
    '02' : 'a',
    '12' : 'a',
    '22' : 'a',
    'x' : 'a'
  };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexSupplementing( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '02' : 'a',
    '12' : 'b',
    '22' : 'c',
    'x' : 'a'
  };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexSupplementing( src, onEach );
  var exp = { 'undefined' : 'src', 'undefined2' : 'src', 'x' : 'src' };
  test.identical( got, exp );

  test.close( 'onEach returns map' );

  /* - */

  test.open( 'onEach returns unroll' );

  test.case = 'src - empty map';
  var src = {};
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexSupplementing( src, onEach );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexSupplementing( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'a',
    'ck' : 'a',
    'ak2' : 'a',
    'bk2' : 'a',
    'ck2' : 'a',
    'x' : 'a'
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexSupplementing( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'b',
    'ck' : 'c',
    'ak2' : 'a',
    'bk2' : 'b',
    'ck2' : 'c',
    'x' : 'a'
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexSupplementing( src, onEach );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexSupplementing( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'a',
    '2' : 'a',
    '02' : 'a',
    '12' : 'a',
    '22' : 'a',
    'x' : 'a'
  };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexSupplementing( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '02' : 'a',
    '12' : 'b',
    '22' : 'c',
    'x' : 'a'
  };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexSupplementing( src, onEach );
  var exp = { undefined2 : 'src', x : 'src' };
  test.identical( got, exp );

  test.close( 'onEach returns unroll' );

  /* - */

  test.open( 'onEach returns unroll with map' );

  test.case = 'src - empty map';
  var src = {};
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexSupplementing( src, onEach );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexSupplementing( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'a',
    'ck' : 'a',
    'ak2' : 'a2',
    'bk2' : 'a2',
    'ck2' : 'a2',
    'xk' : 'ak'
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexSupplementing( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'b',
    'ck' : 'c',
    'ak2' : 'a2',
    'bk2' : 'b2',
    'ck2' : 'c2',
    'xk' : 'ak'
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexSupplementing( src, onEach );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexSupplementing( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'a',
    '2' : 'a',
    '02' : 'a2',
    '12' : 'a2',
    '22' : 'a2',
    'xk' : 0
  };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexSupplementing( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '02' : 'a2',
    '12' : 'b2',
    '22' : 'c2',
    'xk' : 0
  };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexSupplementing( src, onEach );
  var exp = { 'undefined' : 'src', 'undefined2' : 'src2', 'xk' : undefined };
  test.identical( got, exp );

  test.close( 'onEach returns unroll with map' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexSupplementing( src, '*/f1' );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical entries';
  var src = { a : { f1 : 'aa.f1', f2 : 'aa.f2' }, b : { f1 : 'aa.f1', f2 : 'aa.f2' }, c : { f1 : 'aa.f1', f2 : 'aa.f2' } };
  var got = _.indexSupplementing( src, '*/f1' );
  var exp = { 'aa.f1' : { f1 : 'aa.f1', f2 : 'aa.f2' } };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical entries';
  var src = { a : { f1 : 'aa.f1', f2 : 'aa.f2' }, b : { f1 : 'bb.f1', f2 : 'bb.f2' }, c : { f1 : 'cc.f1', f2 : 'cc.f2' } };
  var got = _.indexSupplementing( src, '*/f1' );
  var exp = { 'aa.f1' : { f1 : 'aa.f1', f2 : 'aa.f2' }, 'bb.f1' : { f1 : 'bb.f1', f2 : 'bb.f2' }, 'cc.f1' : { f1 : 'cc.f1', f2 : 'cc.f2' } };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexSupplementing( src, '*/f1' );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with same elements';
  var src = [ { f1 : 'a.f1', f2 : 'f2' }, { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'a.f1', f2 : 'a.f2' } ];
  var got = _.indexSupplementing( src, '*/f1' );
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'f2' } };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.indexSupplementing( src, '*/f1' );
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  test.identical( got, exp );

  test.case = 'src - str';
  var src = 'src';
  var got = _.indexSupplementing( src, '*/src' );
  var exp = {};
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function indexAppending( test )
{
  test.open( 'without onEach' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexAppending( src );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.indexAppending( src );
  var exp = { ak : 'a', bk : 'a', ck : 'a' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexAppending( src );
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexAppending( src );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.indexAppending( src );
  var exp = { 0 : 'a', 1 : 'a', 2 : 'a' };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexAppending( src );
  var exp = { 0 : 'a', 1 : 'b', 2 : 'c' };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.indexAppending( src );
  var exp = { src : undefined };
  test.identical( got, exp );

  test.close( 'without onEach' );

  /* - */

  test.open( 'onEach returns undefined' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexAppending( src, ( e, k ) => undefined );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.indexAppending( src, ( e, k ) => undefined );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexAppending( src, ( e, k ) => undefined );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexAppending( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.indexAppending( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexAppending( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.indexAppending( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.close( 'onEach returns undefined' );

  /* - */

  test.open( 'onEach returns element' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexAppending( src, ( e, k ) => e );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.indexAppending( src, ( e, k ) => e );
  var exp = { a : [ 'a', 'a', 'a' ] };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexAppending( src, ( e, k ) => e );
  var exp = { a : 'a', b : 'b', c : 'c' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexAppending( src, ( e, k ) => e );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.indexAppending( src, ( e, k ) => e );
  var exp = { a : [ 'a', 'a', 'a' ] };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexAppending( src, ( e, k ) => e );
  var exp = { a : 'a', b : 'b', c : 'c' };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.indexAppending( src, ( e, k ) => e );
  var exp = { src : 'src' };
  test.identical( got, exp );

  test.close( 'onEach returns element' );

  /* - */

  test.open( 'onEach returns key' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexAppending( src, ( e, k ) => k );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.indexAppending( src, ( e, k ) => k );
  var exp = { ak : 'a', bk : 'a', ck : 'a' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexAppending( src, ( e, k ) => k );
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexAppending( src, ( e, k ) => k );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.indexAppending( src, ( e, k ) => k );
  var exp = { 0 : 'a', 1 : 'a', 2 : 'a' };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexAppending( src, ( e, k ) => k );
  var exp = { 0 : 'a', 1 : 'b', 2 : 'c' };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.indexAppending( src, ( e, k ) => k );
  var exp = {};
  test.identical( got, exp );

  test.close( 'onEach returns key' );

  /* - */

  test.open( 'onEach returns map' );

  test.case = 'src - empty map';
  var src = {};
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexAppending( src, onEach );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexAppending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'a',
    'ck' : 'a',
    'ak2' : 'a',
    'bk2' : 'a',
    'ck2' : 'a',
    'x' : [ 'a', 'a', 'a' ]
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexAppending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'b',
    'ck' : 'c',
    'ak2' : 'a',
    'bk2' : 'b',
    'ck2' : 'c',
    'x' : [ 'a', 'b', 'c' ]
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexAppending( src, onEach );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexAppending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'a',
    '2' : 'a',
    '02' : 'a',
    '12' : 'a',
    '22' : 'a',
    'x' : [ 'a', 'a', 'a' ]
  };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexAppending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '02' : 'a',
    '12' : 'b',
    '22' : 'c',
    'x' : [ 'a', 'b', 'c' ]
  };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexAppending( src, onEach );
  var exp = { 'undefined' : 'src', 'undefined2' : 'src', 'x' : 'src' };
  test.identical( got, exp );

  test.close( 'onEach returns map' );

  /* - */

  test.open( 'onEach returns unroll' );

  test.case = 'src - empty map';
  var src = {};
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexAppending( src, onEach );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexAppending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'a',
    'ck' : 'a',
    'ak2' : 'a',
    'bk2' : 'a',
    'ck2' : 'a',
    'x' : [ 'a', 'a', 'a' ]
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexAppending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'b',
    'ck' : 'c',
    'ak2' : 'a',
    'bk2' : 'b',
    'ck2' : 'c',
    'x' : [ 'a', 'b', 'c' ]
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexAppending( src, onEach );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexAppending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'a',
    '2' : 'a',
    '02' : 'a',
    '12' : 'a',
    '22' : 'a',
    'x' : [ 'a', 'a', 'a' ]
  };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexAppending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '02' : 'a',
    '12' : 'b',
    '22' : 'c',
    'x' : [ 'a', 'b', 'c' ]
  };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexAppending( src, onEach );
  var exp = { undefined2 : 'src', x : 'src' };
  test.identical( got, exp );

  test.close( 'onEach returns unroll' );

  /* - */

  test.open( 'onEach returns unroll with map' );

  test.case = 'src - empty map';
  var src = {};
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexAppending( src, onEach );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexAppending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'a',
    'ck' : 'a',
    'ak2' : 'a2',
    'bk2' : 'a2',
    'ck2' : 'a2',
    'xk' : [ 'ak', 'bk', 'ck' ]
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexAppending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'b',
    'ck' : 'c',
    'ak2' : 'a2',
    'bk2' : 'b2',
    'ck2' : 'c2',
    'xk' : [ 'ak', 'bk', 'ck' ]
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexAppending( src, onEach );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexAppending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'a',
    '2' : 'a',
    '02' : 'a2',
    '12' : 'a2',
    '22' : 'a2',
    'xk' : [ 0, 1, 2 ]
  };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexAppending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '02' : 'a2',
    '12' : 'b2',
    '22' : 'c2',
    'xk' : [ 0, 1, 2 ]
  };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexAppending( src, onEach );
  var exp = { 'undefined' : 'src', 'undefined2' : 'src2', 'xk' : undefined };
  test.identical( got, exp );

  test.close( 'onEach returns unroll with map' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexAppending( src, '*/f1' );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical entries';
  var src = { a : { f1 : 'aa.f1', f2 : 'aa.f2' }, b : { f1 : 'aa.f1', f2 : 'aa.f2' }, c : { f1 : 'aa.f1', f2 : 'aa.f2' } };
  var got = _.indexAppending( src, '*/f1' );
  var exp = { 'aa.f1' : [ { f1 : 'aa.f1', f2 : 'aa.f2' }, { f1 : 'aa.f1', f2 : 'aa.f2' }, { f1 : 'aa.f1', f2 : 'aa.f2' } ] };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical entries';
  var src = { a : { f1 : 'aa.f1', f2 : 'aa.f2' }, b : { f1 : 'bb.f1', f2 : 'bb.f2' }, c : { f1 : 'cc.f1', f2 : 'cc.f2' } };
  var got = _.indexAppending( src, '*/f1' );
  var exp = { 'aa.f1' : { f1 : 'aa.f1', f2 : 'aa.f2' }, 'bb.f1' : { f1 : 'bb.f1', f2 : 'bb.f2' }, 'cc.f1' : { f1 : 'cc.f1', f2 : 'cc.f2' } };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexAppending( src, '*/f1' );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with same elements';
  var src = [ { f1 : 'a.f1', f2 : 'f2' }, { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'a.f1', f2 : 'a.f2' } ];
  var got = _.indexAppending( src, '*/f1' );
  var exp = { 'a.f1' : [ { f1 : 'a.f1', f2 : 'f2' }, { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'a.f1', f2 : 'a.f2' } ] };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.indexAppending( src, '*/f1' );
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  test.identical( got, exp );

  test.case = 'src - str';
  var src = 'src';
  var got = _.indexAppending( src, '*/src' );
  var exp = {};
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function indexPrepending( test )
{
  test.open( 'without onEach' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexPrepending( src );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.indexPrepending( src );
  var exp = { ak : 'a', bk : 'a', ck : 'a' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexPrepending( src );
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexPrepending( src );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.indexPrepending( src );
  var exp = { 0 : 'a', 1 : 'a', 2 : 'a' };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexPrepending( src );
  var exp = { 0 : 'a', 1 : 'b', 2 : 'c' };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.indexPrepending( src );
  var exp = { src : undefined };
  test.identical( got, exp );

  test.close( 'without onEach' );

  /* - */

  test.open( 'onEach returns undefined' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexPrepending( src, ( e, k ) => undefined );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.indexPrepending( src, ( e, k ) => undefined );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexPrepending( src, ( e, k ) => undefined );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexPrepending( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.indexPrepending( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexPrepending( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.indexPrepending( src, ( e, k ) => undefined );
  var exp = {};
  test.identical( got, exp );

  test.close( 'onEach returns undefined' );

  /* - */

  test.open( 'onEach returns element' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexPrepending( src, ( e, k ) => e );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.indexPrepending( src, ( e, k ) => e );
  var exp = { a : [ 'a', 'a', 'a' ] };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexPrepending( src, ( e, k ) => e );
  var exp = { a : 'a', b : 'b', c : 'c' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexPrepending( src, ( e, k ) => e );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.indexPrepending( src, ( e, k ) => e );
  var exp = { a : [ 'a', 'a', 'a' ] };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexPrepending( src, ( e, k ) => e );
  var exp = { a : 'a', b : 'b', c : 'c' };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.indexPrepending( src, ( e, k ) => e );
  var exp = { src : 'src' };
  test.identical( got, exp );

  test.close( 'onEach returns element' );

  /* - */

  test.open( 'onEach returns key' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexPrepending( src, ( e, k ) => k );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var got = _.indexPrepending( src, ( e, k ) => k );
  var exp = { ak : 'a', bk : 'a', ck : 'a' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexPrepending( src, ( e, k ) => k );
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexPrepending( src, ( e, k ) => k );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var got = _.indexPrepending( src, ( e, k ) => k );
  var exp = { 0 : 'a', 1 : 'a', 2 : 'a' };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexPrepending( src, ( e, k ) => k );
  var exp = { 0 : 'a', 1 : 'b', 2 : 'c' };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var got = _.indexPrepending( src, ( e, k ) => k );
  var exp = {};
  test.identical( got, exp );

  test.close( 'onEach returns key' );

  /* - */

  test.open( 'onEach returns map' );

  test.case = 'src - empty map';
  var src = {};
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexPrepending( src, onEach );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexPrepending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'a',
    'ck' : 'a',
    'ak2' : 'a',
    'bk2' : 'a',
    'ck2' : 'a',
    'x' : [ 'a', 'a', 'a' ]
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexPrepending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'b',
    'ck' : 'c',
    'ak2' : 'a',
    'bk2' : 'b',
    'ck2' : 'c',
    'x' : [ 'c', 'b', 'a' ]
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexPrepending( src, onEach );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexPrepending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'a',
    '2' : 'a',
    '02' : 'a',
    '12' : 'a',
    '22' : 'a',
    'x' : [ 'a', 'a', 'a' ]
  };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexPrepending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '02' : 'a',
    '12' : 'b',
    '22' : 'c',
    'x' : [ 'c', 'b', 'a' ]
  };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var onEach = ( e, k ) => { return { [ k ] : e, [ k + '2' ] : e, [ 'x' ] : e } };
  var got = _.indexPrepending( src, onEach );
  var exp = { 'undefined' : 'src', 'undefined2' : 'src', 'x' : 'src' };
  test.identical( got, exp );

  test.close( 'onEach returns map' );

  /* - */

  test.open( 'onEach returns unroll' );

  test.case = 'src - empty map';
  var src = {};
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexPrepending( src, onEach );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexPrepending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'a',
    'ck' : 'a',
    'ak2' : 'a',
    'bk2' : 'a',
    'ck2' : 'a',
    'x' : [ 'a', 'a', 'a' ]
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexPrepending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'b',
    'ck' : 'c',
    'ak2' : 'a',
    'bk2' : 'b',
    'ck2' : 'c',
    'x' : [ 'c', 'b', 'a' ]
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexPrepending( src, onEach );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexPrepending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'a',
    '2' : 'a',
    '02' : 'a',
    '12' : 'a',
    '22' : 'a',
    'x' : [ 'a', 'a', 'a' ]
  };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexPrepending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '02' : 'a',
    '12' : 'b',
    '22' : 'c',
    'x' : [ 'c', 'b', 'a' ]
  };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var onEach = ( e, k ) => _.unrollMake( [ k, k + '2', 'x' ] );
  var got = _.indexPrepending( src, onEach );
  var exp = { undefined2 : 'src', x : 'src' };
  test.identical( got, exp );

  test.close( 'onEach returns unroll' );

  /* - */

  test.open( 'onEach returns unroll with map' );

  test.case = 'src - empty map';
  var src = {};
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexPrepending( src, onEach );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical values';
  var src = { ak : 'a', bk : 'a', ck : 'a' };
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexPrepending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'a',
    'ck' : 'a',
    'ak2' : 'a2',
    'bk2' : 'a2',
    'ck2' : 'a2',
    'xk' : [ 'ck', 'bk', 'ak' ]
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical values';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexPrepending( src, onEach );
  var exp =
  {
    'ak' : 'a',
    'bk' : 'b',
    'ck' : 'c',
    'ak2' : 'a2',
    'bk2' : 'b2',
    'ck2' : 'c2',
    'xk' : [ 'ck', 'bk', 'ak' ]
  };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexPrepending( src, onEach );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with identical elements';
  var src = [ 'a', 'a', 'a' ];
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexPrepending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'a',
    '2' : 'a',
    '02' : 'a2',
    '12' : 'a2',
    '22' : 'a2',
    'xk' : [ 2, 1, 0 ]
  };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ 'a', 'b', 'c' ];
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexPrepending( src, onEach );
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '02' : 'a2',
    '12' : 'b2',
    '22' : 'c2',
    'xk' : [ 2, 1, 0 ]
  };
  test.identical( got, exp );

  test.case = 'src - primitive';
  var src = 'src';
  var onEach = ( e, k ) => _.unrollMake( [ { [ k ] : e }, { [ k + '2' ] : e + '2' }, { 'xk' : k } ] );
  var got = _.indexPrepending( src, onEach );
  var exp = { 'undefined' : 'src', 'undefined2' : 'src2', 'xk' : undefined };
  test.identical( got, exp );

  test.close( 'onEach returns unroll with map' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.indexPrepending( src, '*/f1' );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with identical entries';
  var src = { a : { f1 : 'aa.f1', f2 : 'aa.f2' }, b : { f1 : 'aa.f1', f2 : 'aa.f2' }, c : { f1 : 'aa.f1', f2 : 'aa.f2' } };
  var got = _.indexPrepending( src, '*/f1' );
  var exp = { 'aa.f1' : [  { f1 : 'aa.f1', f2 : 'aa.f2' }, { f1 : 'aa.f1', f2 : 'aa.f2' }, { f1 : 'aa.f1', f2 : 'aa.f2' } ] };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map with not identical entries';
  var src = { a : { f1 : 'aa.f1', f2 : 'aa.f2' }, b : { f1 : 'bb.f1', f2 : 'bb.f2' }, c : { f1 : 'cc.f1', f2 : 'cc.f2' } };
  var got = _.indexPrepending( src, '*/f1' );
  var exp = { 'aa.f1' : { f1 : 'aa.f1', f2 : 'aa.f2' }, 'bb.f1' : { f1 : 'bb.f1', f2 : 'bb.f2' }, 'cc.f1' : { f1 : 'cc.f1', f2 : 'cc.f2' } };
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty array';
  var src = [];
  var got = _.indexPrepending( src, '*/f1' );
  var exp = {};
  test.identical( got, exp );

  test.case = 'src - array with same elements';
  var src = [ { f1 : 'a.f1', f2 : 'f2' }, { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'a.f1', f2 : 'a.f2' } ];
  var got = _.indexPrepending( src, '*/f1' );
  var exp = { 'a.f1' : [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'a.f1', f2 : 'f2' } ] };
  test.identical( got, exp );

  test.case = 'src - array with not identical elements';
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.indexPrepending( src, '*/f1' );
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  test.identical( got, exp );

  test.case = 'src - str';
  var src = 'src';
  var got = _.indexPrepending( src, '*/src' );
  var exp = {};
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function indexAppendingExperiment( test )
{
  test.case = 'src - array, a few nodes with same selection';
  var src = [ { f1 : 'a.f1' }, { f1 : 'a.f1' }, { f1 : 'a.f1' } ];
  var got = _.indexAppending( src, '*/f1' );
  var exp = { 'a.f1' : [ { f1 : 'a.f1' }, { f1 : 'a.f1' }, { f1 : 'a.f1' } ] };
  test.is( src !== got );
  test.identical( got, exp );
}
indexAppendingExperiment.experimental = 1;

//

function remap( test )
{

  /* */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remap( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remap( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remap( src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remap( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = {};
  var src = [ 'a', 'b', 'c' ];
  var got = _.remap( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remap( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remap( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a', '1' : 'b', '2' : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remap( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remap( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { 'ak' : 'ak', 'bk' : 'bk', 'ck' : 'ck' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remap( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 0, '1' : 1, '2' : 2 };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remap( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remap( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* */

  test.open( 'onEach - routine returning map' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : { 'ak' : 'a', 'ak2' : 'a', 'x' : 'a' },
    'bk' : { 'bk' : 'b', 'bk2' : 'b', 'x' : 'b' },
    'ck' : { 'ck' : 'c', 'ck2' : 'c', 'x' : 'c' }
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remap( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : { '0' : 'a', '02' : 'a', 'x' : 'a' },
    '1' : { '1' : 'b', '12' : 'b', 'x' : 'b' },
    '2' : { '2' : 'c', '22' : 'c', 'x' : 'c' }
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remap( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remap( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning map' );

  /* */

  test.open( 'onEach - routine returning unroll' );

  test.case = 'src - map';
  var exp = { 'ak' : 'x', 'bk' : 'x', 'ck' : 'x' }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remap( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'x', '1' : 'x', '2' : 'x' }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remap( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remap( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll' );

  /* */

  test.open( 'onEach - routine returning unroll of maps' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : { 'xk' : 'ak' },
    'bk' : { 'xk' : 'bk' },
    'ck' : { 'xk' : 'ck' }
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remap( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : { 'xk' : 0 },
    '1' : { 'xk' : 1 },
    '2' : { 'xk' : 2 }
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remap( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remap( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll of maps' );

  /* */

  test.open( 'onEach - selector' );

  test.case = 'src - map';
  var exp = { 'a' : 'a.f1', 'b' : 'b.f1', 'c' : 'c.f1' };
  var src = { a : { f1 : 'a.f1', f2 : 'a.f2' }, b : { f1 : 'b.f1', f2 : 'b.f2' }, c : { f1 : 'c.f1', f2 : 'c.f2' } };
  var got = _.remap( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a.f1', '1' : 'b.f1', '2' : 'c.f1' };
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.remap( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remap( src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* */

} /* end of function remap */

//

function remapExtending( test )
{

  /* */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapExtending( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapExtending( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapExtending( src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapExtending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = {};
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapExtending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remapExtending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapExtending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a', '1' : 'b', '2' : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapExtending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapExtending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { 'ak' : 'ak', 'bk' : 'bk', 'ck' : 'ck' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapExtending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 0, '1' : 1, '2' : 2 };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapExtending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remapExtending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* */

  test.open( 'onEach - routine returning map' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : 'c',
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapExtending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : 'c'
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapExtending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src', 'x' : 'src' }
  var src = 'src';
  var got = _.remapExtending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning map' );

  /* */

  test.open( 'onEach - routine returning unroll' );

  test.case = 'src - map';
  var exp = { 'ak' : 'x', 'bk' : 'x', 'ck' : 'x' }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapExtending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'x', '1' : 'x', '2' : 'x' }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapExtending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapExtending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll' );

  /* */

  test.open( 'onEach - routine returning unroll of maps' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a2',
    'xk' : 'ck',
    'bk' : 'b',
    'bk2' : 'b2',
    'ck' : 'c',
    'ck2' : 'c2'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapExtending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b2',
    '22' : 'c2',
    '02' : 'a2',
    'xk' : 2
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapExtending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src2', 'xk' : undefined };
  var src = 'src';
  var got = _.remapExtending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll of maps' );

  /* */

  test.open( 'onEach - selector' );

  test.case = 'src - map';
  var exp = { 'a' : 'a.f1', 'b' : 'b.f1', 'c' : 'c.f1' };
  var src = { a : { f1 : 'a.f1', f2 : 'a.f2' }, b : { f1 : 'b.f1', f2 : 'b.f2' }, c : { f1 : 'c.f1', f2 : 'c.f2' } };
  var got = _.remapExtending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a.f1', '1' : 'b.f1', '2' : 'c.f1' };
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.remapExtending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapExtending( src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* */

} /* end of function remapExtending */

//

function remapSupplementing( test )
{

  /* */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapSupplementing( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapSupplementing( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapSupplementing( src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapSupplementing( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = {};
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapSupplementing( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remapSupplementing( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapSupplementing( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a', '1' : 'b', '2' : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapSupplementing( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapSupplementing( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { 'ak' : 'ak', 'bk' : 'bk', 'ck' : 'ck' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapSupplementing( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 0, '1' : 1, '2' : 2 };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapSupplementing( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remapSupplementing( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* */

  test.open( 'onEach - routine returning map' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : 'a',
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapSupplementing( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : 'a'
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapSupplementing( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src', 'x' : 'src' }
  var src = 'src';
  var got = _.remapSupplementing( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning map' );

  /* */

  test.open( 'onEach - routine returning unroll' );

  test.case = 'src - map';
  var exp = { 'ak' : 'x', 'bk' : 'x', 'ck' : 'x' }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapSupplementing( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'x', '1' : 'x', '2' : 'x' }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapSupplementing( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapSupplementing( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll' );

  /* */

  test.open( 'onEach - routine returning unroll of maps' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a2',
    'xk' : 'ak',
    'bk' : 'b',
    'bk2' : 'b2',
    'ck' : 'c',
    'ck2' : 'c2'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapSupplementing( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b2',
    '22' : 'c2',
    '02' : 'a2',
    'xk' : 0
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapSupplementing( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src2', 'xk' : undefined };
  var src = 'src';
  var got = _.remapSupplementing( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll of maps' );

  /* */

  test.open( 'onEach - selector' );

  test.case = 'src - map';
  var exp = { 'a' : 'a.f1', 'b' : 'b.f1', 'c' : 'c.f1' };
  var src = { a : { f1 : 'a.f1', f2 : 'a.f2' }, b : { f1 : 'b.f1', f2 : 'b.f2' }, c : { f1 : 'c.f1', f2 : 'c.f2' } };
  var got = _.remapSupplementing( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a.f1', '1' : 'b.f1', '2' : 'c.f1' };
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.remapSupplementing( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapSupplementing( src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* */

} /* end of function remapSupplementing */

//

function remapAppending( test )
{

  /* */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapAppending( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapAppending( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapAppending( src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapAppending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = {};
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapAppending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remapAppending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapAppending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a', '1' : 'b', '2' : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapAppending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapAppending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { 'ak' : 'ak', 'bk' : 'bk', 'ck' : 'ck' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapAppending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 0, '1' : 1, '2' : 2 };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapAppending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remapAppending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* */

  test.open( 'onEach - routine returning map' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : [ 'a', 'b', 'c' ],
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapAppending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : [ 'a', 'b', 'c' ],
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapAppending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src', 'x' : 'src' }
  var src = 'src';
  var got = _.remapAppending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning map' );

  /* */

  test.open( 'onEach - routine returning unroll' );

  test.case = 'src - map';
  var exp = { 'ak' : 'x', 'bk' : 'x', 'ck' : 'x' }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapAppending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'x', '1' : 'x', '2' : 'x' }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapAppending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapAppending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll' );

  /* */

  test.open( 'onEach - routine returning unroll of maps' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a2',
    'xk' : [ 'ak', 'bk', 'ck' ],
    'bk' : 'b',
    'bk2' : 'b2',
    'ck' : 'c',
    'ck2' : 'c2'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapAppending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b2',
    '22' : 'c2',
    '02' : 'a2',
    'xk' : [ 0, 1, 2 ],
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapAppending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src2', 'xk' : undefined };
  var src = 'src';
  var got = _.remapAppending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll of maps' );

  /* */

  test.open( 'onEach - selector' );

  test.case = 'src - map';
  var exp = { 'a' : 'a.f1', 'b' : 'b.f1', 'c' : 'c.f1' };
  var src = { a : { f1 : 'a.f1', f2 : 'a.f2' }, b : { f1 : 'b.f1', f2 : 'b.f2' }, c : { f1 : 'c.f1', f2 : 'c.f2' } };
  var got = _.remapAppending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a.f1', '1' : 'b.f1', '2' : 'c.f1' };
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.remapAppending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapAppending( src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* */

} /* end of function remapAppending */

//

function remapPrepending( test )
{

  /* */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapPrepending( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapPrepending( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapPrepending( src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapPrepending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = {};
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapPrepending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remapPrepending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapPrepending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a', '1' : 'b', '2' : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapPrepending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapPrepending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { 'ak' : 'ak', 'bk' : 'bk', 'ck' : 'ck' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapPrepending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 0, '1' : 1, '2' : 2 };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapPrepending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remapPrepending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* */

  test.open( 'onEach - routine returning map' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : [ 'c', 'b', 'a' ],
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapPrepending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : [ 'c', 'b', 'a' ],
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapPrepending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src', 'x' : 'src' }
  var src = 'src';
  var got = _.remapPrepending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning map' );

  /* */

  test.open( 'onEach - routine returning unroll' );

  test.case = 'src - map';
  var exp = { 'ak' : 'x', 'bk' : 'x', 'ck' : 'x' }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapPrepending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'x', '1' : 'x', '2' : 'x' }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapPrepending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapPrepending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll' );

  /* */

  test.open( 'onEach - routine returning unroll of maps' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a2',
    'xk' : [ 'ck', 'bk', 'ak' ],
    'bk' : 'b',
    'bk2' : 'b2',
    'ck' : 'c',
    'ck2' : 'c2'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapPrepending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b2',
    '22' : 'c2',
    '02' : 'a2',
    'xk' : [ 2, 1, 0 ],
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapPrepending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src2', 'xk' : undefined };
  var src = 'src';
  var got = _.remapPrepending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll of maps' );

  /* */

  test.open( 'onEach - selector' );

  test.case = 'src - map';
  var exp = { 'a' : 'a.f1', 'b' : 'b.f1', 'c' : 'c.f1' };
  var src = { a : { f1 : 'a.f1', f2 : 'a.f2' }, b : { f1 : 'b.f1', f2 : 'b.f2' }, c : { f1 : 'c.f1', f2 : 'c.f2' } };
  var got = _.remapPrepending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a.f1', '1' : 'b.f1', '2' : 'c.f1' };
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.remapPrepending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapPrepending( src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* */

} /* end of function remapPrepending */

//

function indexInplace( test )
{
  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexInplace( src );
  test.is( src === got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexInplace( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var src = 'src';
  var got = _.indexInplace( src );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexInplace( src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = {};
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexInplace( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.indexInplace( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { 'a' : 'a', 'b' : 'b', 'c' : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexInplace( src, ( e, k ) => e );
  test.is( src === got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : 'a', b : 'b', c : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexInplace( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'src' : 'src' };
  var src = 'src';
  var got = _.indexInplace( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexInplace( src, ( e, k ) => k );
  test.is( src === got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexInplace( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.indexInplace( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* */

  test.open( 'onEach - routine returning map' );

  test.case = 'src - map';
  var exp = { '[object Object]' : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexInplace( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '[object Object]' : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexInplace( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { '[object Object]' : 'src' };
  var src = 'src';
  var got = _.indexInplace( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning map' );

  /* */

  test.open( 'onEach - routine returning unroll' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : 'c',
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexInplace( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : 'c'
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexInplace( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined2' : 'src', 'x' : 'src' };
  var src = 'src';
  var got = _.indexInplace( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll' );

  /* */

  test.open( 'onEach - routine returning unroll of maps' );

  test.case = 'src - map';
  var exp = { '[object Object]' : 'c' }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexInplace( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '[object Object]' : 'c' }
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexInplace( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { '[object Object]' : 'src' };
  var src = 'src';
  var got = _.indexInplace( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll of maps' );

  /* */

  test.open( 'onEach - selector' );

  test.case = 'src - map';
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  var src = { a : { f1 : 'a.f1', f2 : 'a.f2' }, b : { f1 : 'b.f1', f2 : 'b.f2' }, c : { f1 : 'c.f1', f2 : 'c.f2' } };
  var got = _.indexInplace( src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.indexInplace( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { '3' : 'src' };
  var src = 'src';
  var got = _.indexInplace( src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function indexInplaceSupplementing( test )
{
  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexInplaceSupplementing( src );
  test.is( src === got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexInplaceSupplementing( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'src' : undefined };
  var src = 'src';
  var got = _.indexInplaceSupplementing( src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexInplaceSupplementing( src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = {};
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexInplaceSupplementing( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.indexInplaceSupplementing( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { 'a' : 'a', 'b' : 'b', 'c' : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexInplaceSupplementing( src, ( e, k ) => e );
  test.is( src === got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : 'a', b : 'b', c : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexInplaceSupplementing( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'src' : 'src' };
  var src = 'src';
  var got = _.indexInplaceSupplementing( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexInplaceSupplementing( src, ( e, k ) => k );
  test.is( src === got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexInplaceSupplementing( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.indexInplaceSupplementing( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* */

  test.open( 'onEach - routine returning map' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : 'a',
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexInplaceSupplementing( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : 'a',
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexInplaceSupplementing( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src', 'x' : 'src' }
  var src = 'src';
  var got = _.indexInplaceSupplementing( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning map' );

  /* */

  test.open( 'onEach - routine returning unroll' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : 'c',
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexInplaceSupplementing( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : 'c'
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexInplaceSupplementing( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined2' : 'src', 'x' : 'src' };
  var src = 'src';
  var got = _.indexInplaceSupplementing( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll' );

  /* */

  test.open( 'onEach - routine returning unroll of maps' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a2',
    'bk' : 'b',
    'bk2' : 'b2',
    'ck' : 'c',
    'ck2' : 'c2',
    'xk' : 'ak'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexInplaceSupplementing( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b2',
    '22' : 'c2',
    '02' : 'a2',
    'xk' : 0,
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexInplaceSupplementing( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src2', 'xk' : undefined }
  var src = 'src';
  var got = _.indexInplaceSupplementing( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll of maps' );

  /* */

  test.open( 'onEach - selector' );

  test.case = 'src - map';
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  var src = { a : { f1 : 'a.f1', f2 : 'a.f2' }, b : { f1 : 'b.f1', f2 : 'b.f2' }, c : { f1 : 'c.f1', f2 : 'c.f2' } };
  var got = _.indexInplaceSupplementing( src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.indexInplaceSupplementing( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { '3' : 'src' };
  var src = 'src';
  var got = _.indexInplaceSupplementing( src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

// --
//
// --

function _entityMost( test )
{
  test.open( 'returnMax - false' );

  test.case = 'src - array, without onEvaluate';
  var o =
  {
    src : [ 3, 1, 9, 0, 5 ],
    returnMax : 0
  }
  var exp = { index : 3, key : 3, value : 0, element : 0 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - array, onEach';
  var o =
  {
    src : [ 3, -4, 9, -16, 5, -2 ],
    returnMax : 0,
    onEach : ( e ) => e * e
  }
  var exp = { index : 5, key : 5, value : 4, element : -2 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - unroll, without onEvaluate';
  var o =
  {
    src : _.unrollMake( [ 3, 1, 9, 0, 5 ] ),
    returnMax : 0
  }
  var exp = { index : 3, key : 3, value : 0, element : 0 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - unroll, onEach';
  var o =
  {
    src : _.unrollMake( [ 3, -4, 9, -16, 5, -2 ] ),
    returnMax : 0,
    onEach : ( e ) => e * e
  }
  var exp = { index : 5, key : 5, value : 4, element : -2 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - BufferTyped, without onEvaluate';
  var o =
  {
    src : new U16x( [ 3, 1, 9, 0, 5 ] ),
    returnMax : 0
  }
  var exp = { index : 3, key : 3, value : 0, element : 0 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - BufferTyped, onEach';
  var o =
  {
    src : new F64x( [ 3, -4, 9, -16, 5, -2 ] ),
    returnMax : 0,
    onEach : ( e ) => e * e
  }
  var exp = { index : 5, key : 5, value : 4, element : -2 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - mapLike, without onEvaluate';
  var o =
  {
    src : { a : 1, b : 0, c : 3, d : 2 },
    returnMax : 0
  }
  var exp = { index : 1, key : 'b', value : 0, element : 0 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - mapLike, onEach';
  var o =
  {
    src : { a : 5, b : 1, c : 3, d : 2 },
    returnMax : 0,
    onEach : ( e ) => e * e
  }
  var exp = { index : 1, key : 'b', value : 1, element : 1 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.close( 'returnMax - false' );

  /* - */

  test.open( 'returnMax - true' );

  test.case = 'src - array, without onEvaluate';
  var o =
  {
    src : [ 3, 1, 9, 0, 5 ],
    returnMax : 1
  }
  var exp = { index : 2, key : 2, value : 9, element : 9 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - array, onEach';
  var o =
  {
    src : [ 3, -4, 9, -16, 5, -2 ],
    returnMax : 1,
    onEach : ( e ) => e * e
  }
  var exp = { index : 3, key : 3, value : 256, element : -16 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - unroll, without onEvaluate';
  var o =
  {
    src : _.unrollMake( [ 3, 1, 9, 0, 5 ] ),
    returnMax : 1
  }
  var exp = { index : 2, key : 2, value : 9, element : 9 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - unroll, onEach';
  var o =
  {
    src : _.unrollMake( [ 3, -4, 9, -16, 5, -2 ] ),
    returnMax : 1,
    onEach : ( e ) => e * e
  }
  var exp = { index : 3, key : 3, value : 256, element : -16 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - BufferTyped, without onEvaluate';
  var o =
  {
    src : new U16x( [ 3, 1, 9, 0, 5 ] ),
    returnMax : 1
  }
  var exp = { index : 2, key : 2, value : 9, element : 9 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - BufferTyped, onEach';
  var o =
  {
    src : new F64x( [ 3, -4, 9, -16, 5, -2 ] ),
    returnMax : 1,
    onEach : ( e ) => e * e
  }
  var exp = { index : 3, key : 3, value : 256, element : -16 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - mapLike, without onEvaluate';
  var o =
  {
    src : { a : 1, b : 0, c : 3, d : 2 },
    returnMax : 1
  }
  var exp = { index : 2, key : 'c', value : 3, element : 3 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - mapLike, onEach';
  var o =
  {
    src : { a : 5, b : 1, c : 3, d : 2 },
    returnMax : 1,
    onEach : ( e ) => e * e
  }
  var exp = { index : 0, key : 'a', value : 25, element : 5 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.close( 'returnMax - true' );

  /* - */

  test.case = 'src - array, onEach, onEvaluate1.length - 1';
  var o =
  {
    src : [ 1, 5, 6, 5 ],
    onEvaluate : ( e ) => e > 5
  }
  var exp = { index : 2, key : 2, value : 6, element : 6 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - array, onEach, onEvaluate1.length - 1';
  var o =
  {
    src : [ 1, 5, 6, 1, 7 ],
    onEach : ( e ) => e + 1,
    onEvaluate : ( e ) => e > 5
  }
  var exp = { index : 4, key : 4, value : 8, element : 7 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - array, onEvaluate.length - 2';
  var o =
  {
    src : [ 3, 5, 6, 6 ],
    onEvaluate : ( v, prev ) => v > prev + 1
  }
  var exp = { index : 1, key : 1, value : 5, element : 5 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - array, onEach, onEvaluate.length - 2';
  var o =
  {
    src : [ 3, 5, 6, 8 ],
    onEach : ( e ) => e - 1,
    onEvaluate : ( v, prev ) => v > prev + 2
  }
  var exp = { index : 2, key : 2, value : 5, element : 6 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  /* */

  test.case = 'src - mapLike, onEvaluate1.length - 1';
  var o =
  {
    src : { a : 0, b : 2, c : 3, d : 4 },
    onEvaluate : ( e ) => e > 5
  }
  var exp = { index : -1, key : undefined, value : undefined, element : undefined };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - mapLike, onEach, onEvaluate1.length - 1';
  var o =
  {
    src : { a : 0, b : 6, c : 3, d : 4 },
    onEach : ( e ) => e + 1,
    onEvaluate : ( e ) => e > 5
  }
  var exp = { index : 1, key : 'b', value : 7, element : 6 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - array, onEvaluate.length - 2';
  var o =
  {
    src : { a : 0, b : 1, c : 3, d : 4 },
    onEvaluate : ( v, prev ) => v > prev + 1
  }
  var exp = { index : 2, key : 'c', value : 3, element : 3 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - array, onEvaluate.length - 2';
  var o =
  {
    src : { a : 0, b : 1, c : 3, d : 4, e : 5 },
    onEvaluate : ( v, prev ) => v > prev + 1
  }
  var exp = { index : 4, key : 'e', value : 5, element : 5 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  test.case = 'src - array, onEach, onEvaluate.length - 2';
  var o =
  {
    src : { a : 0, b : 2, c : 3, d : 4 },
    onEach : ( e ) => e - 1,
    onEvaluate : ( v, prev ) => v > prev + 1
  }
  var exp = { index : 3, key : 'd', value : 3, element : 4 };
  var got = _._entityMost( o );
  test.is( got !== o );
  test.identical( got, exp );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _._entityMost() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _._entityMost( { src : [ 1, 2 ], returnMax : 0 }, 'extra' ) );

  test.case = 'wrong type of o';
  test.shouldThrowErrorSync( () => _._entityMost( [ { src : [ 1, 2 ], returnMax : 1 } ] ) );

  test.case = 'unnecessary fields in o';
  test.shouldThrowErrorSync( () => _._entityMost( [ { srcs : [ 1, 2 ], returnMax : 1 } ] ) );

  test.case = 'wrong type of o.src';
  test.shouldThrowErrorSync( () => _._entityMost( [ { src : 'wrong', returnMax : 1 } ] ) );

  test.case = 'wrong length of onEach';
  test.shouldThrowErrorSync( () => _._entityMost( [ { src : [ 1, 2 ], returnMax : 1, onEach : () => 2 } ] ) );
  test.shouldThrowErrorSync( () => _._entityMost( [ { src : [ 1, 2 ], returnMax : 1, onEach : ( a, b, c, d ) => a + b } ] ) );

  test.case = 'wrong length of onEvaluate';
  test.shouldThrowErrorSync( () => _._entityMost( [ { src : [ 1, 2 ], onEvaluate : () => 2 } ] ) );
  test.shouldThrowErrorSync( () => _._entityMost( [ { src : [ 1, 2 ],  onEvaluate : ( a, b, c ) => a + b } ] ) );

  test.case = 'without onEvaluate, without returnMax';
  test.shouldThrowErrorSync( () => _._entityMost( [ { src : [ 1, 2 ] } ] ) );

};

//

function entityMin( test )
{
  test.case = 'array, without onEvaluate';
  var src = [ 3, 1, 9, 0, 5 ];
  var exp = { index : 3, key : 3, value : 0, element : 0 };
  var got = _.entityMin( src );
  test.identical( got, exp );

  test.case = 'array, onEvaluate';
  var src = [ 3, -4, 9, -16, 5, -2 ];
  var exp = { index : 5, key : 5, value : 4, element : -2 };
  var got = _.entityMin( src, ( e ) => e * e );
  test.identical( src, [ 3, -4, 9, -16, 5, -2 ] );
  test.identical( got, exp );

  test.case = 'unroll, without onEvaluate';
  var src = _.unrollMake( [ 3, 1, 9, 0, 5 ] );
  var exp = { index : 3, key : 3, value : 0, element : 0 };
  var got = _.entityMin( src );
  test.identical( got, exp );

  test.case = 'unroll, onEvaluate';
  var src = _.unrollMake( [ 3, -4, 9, -16, 5, -2 ] );
  var exp = { index : 5, key : 5, value : 4, element : -2 };
  var got = _.entityMin( src, ( e ) => e * e );
  test.identical( src, [ 3, -4, 9, -16, 5, -2 ] );
  test.identical( got, exp );

  test.case = 'argumentsArray, without onEvaluate';
  var src = _.argumentsArrayMake( [ 3, 1, 9, 0, 5 ] );
  var exp = { index : 3, key : 3, value : 0, element : 0 };
  var got = _.entityMin( src );
  test.identical( got, exp );

  test.case = 'argumentsArray, onEvaluate';
  var src = _.argumentsArrayMake( [ 3, -4, 9, -16, 5, -2 ] );
  var exp = { index : 5, key : 5, value : 4, element : -2 };
  var got = _.entityMin( src, ( e ) => e * e );
  test.equivalent( src, [ 3, -4, 9, -16, 5, -2 ] );
  test.identical( got, exp );

  test.case = 'BufferTyped, without onEvaluate';
  var src = new U8x( [ 3, 1, 9, 0, 5 ] );
  var exp = { index : 3, key : 3, value : 0, element : 0 };
  var got = _.entityMin( src );
  test.identical( got, exp );

  test.case = 'BufferTyped, onEvaluate';
  var src = new I32x( [ 3, -4, 9, -16, 5, -2 ] );
  var exp = { index : 5, key : 5, value : 4, element : -2 };
  var got = _.entityMin( src, ( e ) => e * e );
  test.equivalent( src, [ 3, -4, 9, -16, 5, -2 ] );
  test.identical( got, exp );

  test.case = 'map, without onEvaluate';
  var src = { a : 25, b : 16, c : 9 };
  var exp = { index : 2, key : 'c', value : 9, element : 9  };
  var got = _.entityMin( src );
  test.identical( got, exp );

  test.case = 'map, onEvaluate';
  var src = { a : 25, b : 16, c : 9 };
  var exp = { index : 2, key : 'c', value : 81, element : 9  };
  var got = _.entityMin( src, ( e ) => e * e );
  test.identical( got, exp );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityMin() );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.entityMin( [ 1, 3 ], sqr, true ) );

  test.case = 'onEvaluate is not routine';
  test.shouldThrowErrorSync( () => _.entityMin( [ 1, 3 ], 'wrong' ) );
}

//

function entityMax( test )
{

  test.case = 'array, without onEvaluate';
  var src = [ 3, 1, 9, 0, 5 ];
  var exp = { index : 2, key : 2, value : 9, element : 9 };
  var got = _.entityMax( src );
  test.identical( got, exp );

  test.case = 'array, onEvaluate';
  var src = [ 3, -4, 9, -16, 5, -2 ];
  var exp = { index : 3, key : 3, value : 256, element : -16 };
  var got = _.entityMax( src, ( e ) => e * e );
  test.identical( src, [ 3, -4, 9, -16, 5, -2 ] );
  test.identical( got, exp );

  test.case = 'unroll, without onEvaluate';
  var src = _.unrollMake( [ 3, 1, 9, 0, 5 ] );
  var exp = { index : 2, key : 2, value : 9, element : 9 };
  var got = _.entityMax( src );
  test.identical( got, exp );

  test.case = 'unroll, onEvaluate';
  var src = _.unrollMake( [ 3, -4, 9, -16, 5, -2 ] );
  var exp = { index : 3, key : 3, value : 256, element : -16 };
  var got = _.entityMax( src, ( e ) => e * e );
  test.identical( src, [ 3, -4, 9, -16, 5, -2 ] );
  test.identical( got, exp );

  test.case = 'argumentsArray, without onEvaluate';
  var src = _.argumentsArrayMake( [ 3, 1, 9, 0, 5 ] );
  var exp = { index : 2, key : 2, value : 9, element : 9 };
  var got = _.entityMax( src );
  test.identical( got, exp );

  test.case = 'argumentsArray, onEvaluate';
  var src = _.argumentsArrayMake( [ 3, -4, 9, -16, 5, -2 ] );
  var exp = { index : 3, key : 3, value : 256, element : -16 };
  var got = _.entityMax( src, ( e ) => e * e );
  test.equivalent( src, [ 3, -4, 9, -16, 5, -2 ] );
  test.identical( got, exp );

  test.case = 'BufferTyped, without onEvaluate';
  var src = new U8x( [ 3, 1, 9, 0, 5 ] );
  var exp = { index : 2, key : 2, value : 9, element : 9 };
  var got = _.entityMax( src );
  test.identical( got, exp );

  test.case = 'BufferTyped, onEvaluate';
  var src = new I32x( [ 3, -4, 9, -16, 5, -2 ] );
  var exp = { index : 3, key : 3, value : 256, element : -16 };
  var got = _.entityMax( src, ( e ) => e * e );
  test.equivalent( src, [ 3, -4, 9, -16, 5, -2 ] );
  test.identical( got, exp );

  test.case = 'map, without onEvaluate';
  var src = { a : 25, b : 16, c : 9 };
  var exp = { index : 0, key : 'a', value : 25, element : 25  };
  var got = _.entityMax( src );
  test.identical( got, exp );

  test.case = 'map, onEvaluate';
  var src = { a : 25, b : 16, c : 9 };
  var exp = { index : 0, key : 'a', value : 625, element : 25  };
  var got = _.entityMax( src, ( e ) => e * e );
  test.identical( got, exp );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityMax() );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.entityMax( [ 1, 3 ], sqr, true ) );

  test.case = 'onEvaluate is not routine';
  test.shouldThrowErrorSync( () => _.entityMax( [ 1, 3 ], 'wrong' ) );
}

// --
// permutation
// --

function eachSample( test )
{
  test.case = 'sets - empty array';
  var src = [];
  var got = _.eachSample( src );
  var expected = [ [] ];
  test.identical( got, expected );
  test.identical( src, [] );

  test.case = 'sets - empty map';
  var src = {};
  var got = _.eachSample( { sets : src } );
  var expected = [ {} ];
  test.identical( got, expected );
  test.identical( src, {} );

  test.case = 'sets - empty map, onEach - null';
  var src = {};
  var got = _.eachSample( src, null );
  var expected = [ {} ];
  test.identical( got, expected );
  test.identical( src, {} );

  test.case = 'sets - empty unroll';
  var src = _.unrollMake( [] );
  var got = _.eachSample( src );
  var expected = [ [] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );
  test.isNot( _.unrollIs( got ) );
  test.identical( src, _.unrollMake( [] ) );

  test.case = 'sets - empty argumentsArray';
  var src = _.argumentsArrayMake( 0 );
  var got = _.eachSample( src, null );
  var expected = [ [] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );
  test.identical( src, _.argumentsArrayMake( 0 ) );

  /* */

  test.case = 'sets - array with single element';
  var src = [ 1 ];
  var got = _.eachSample( src );
  var expected = [ [ 1 ] ];
  test.identical( got, expected );
  test.identical( src, [ 1 ] );

  test.case = 'sets - map with single element';
  var src = { a : 1 };
  var got = _.eachSample( src, null );
  var expected = [ { a : 1 } ];
  test.identical( got, expected );
  test.identical( src, { a : 1 } );

  test.case = 'sets - array with several element';
  var src = [ 1, 2, null ];
  var got = _.eachSample( src );
  var expected = [ [ 1, 2, null ] ];
  test.identical( got, expected );
  test.identical( src, [ 1, 2, null ] );

  test.case = 'sets - map with several element';
  var src = { a : 1, b : 2, c : null };
  var got = _.eachSample( src, null );
  var expected = [ { a : 1, b : 2, c : null } ];
  test.identical( got, expected );
  test.identical( src, { a : 1, b : 2, c : null } );

  test.case = 'sets - unroll with single element';
  var src = _.unrollMake( [ 1 ] );
  var got = _.eachSample( src );
  var expected = [ [ 1 ] ];
  test.identical( got, expected );
  test.isNot( _.unrollIs( got ) );
  test.identical( src, _.unrollMake( [ 1 ] ) );

  test.case = 'sets - argumentsArray with single element';
  var src = _.argumentsArrayMake( [ 1 ] );
  var got = _.eachSample( src, null );
  var expected = [ [ 1 ] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );
  test.identical( src, _.argumentsArrayMake( [ 1 ] ) );

  /* */

  test.case = 'sets - array with nested empty array';
  var src = [ [] ];
  var got = _.eachSample( src );
  var expected = [ [ undefined ] ];
  test.identical( got, expected );
  test.identical( src, [ [] ] );

  test.case = 'sets - map with empty array';
  var src = { a : [] };
  var got = _.eachSample( src, null );
  var expected = [ { a : undefined } ];
  test.identical( got, expected );
  test.identical( src, { a : [] } );

  test.case = 'sets - array with several empty arrays';
  var src = [ [], [], [] ];
  var got = _.eachSample( src );
  var expected = [ [ undefined, undefined, undefined ] ];
  test.identical( got, expected );
  test.identical( src, [ [], [], [] ] );

  test.case = 'sets - map with several empty arrays';
  var src = { a : [], b : [], c : [] };
  var got = _.eachSample( src, null );
  var expected = [ { a : undefined, b : undefined, c : undefined } ];
  test.identical( got, expected );
  test.identical( src, { a : [], b : [], c : [] } );

  test.case = 'sets - unroll with several empty arrays';
  var src = _.unrollMake( [ [], [] ] );
  var got = _.eachSample( src );
  var expected = [ [ undefined, undefined ] ];
  test.identical( got, expected );
  test.isNot( _.unrollIs( got ) );
  test.identical( src, _.unrollMake( [ [], [] ] ) );

  test.case = 'sets - argumentsArray with several empty arrays';
  var src = _.argumentsArrayMake( [ [], [] ] );
  var got = _.eachSample( src );
  var expected = [ [ undefined, undefined ] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );
  test.identical( src, _.argumentsArrayMake( [ [], [] ] ) );

  /* */

  test.case = 'sets - array, result - 0';
  var src = [ 1, 2, 3 ];
  var got = _.eachSample( { sets : src, result : 0 } );
  var expected = 0;
  test.identical( got, expected );
  test.identical( src, [ 1, 2, 3 ] );

  test.case = 'sets - map, result - 0';
  var src = { a : 1, b : 2, c : null };
  var got = _.eachSample( { sets : src, result : 0 } );
  var expected = 0;
  test.identical( got, expected );
  test.identical( src, { a : 1, b : 2, c : null } );

  test.case = 'sets - unroll, result - 0';
  var src = _.unrollMake( [ 1, 2, 3 ] );
  var got = _.eachSample( { sets : src, result : 0 } );
  var expected = 0;
  test.identical( got, expected );
  test.is( _.primitiveIs( got ) );
  test.identical( src, _.unrollMake( [ 1, 2, 3 ] ) );

  test.case = 'sets - argumentsArray, result - 0';
  var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var got = _.eachSample( { sets : src, result : 0 } );
  var expected = 0;
  test.identical( got, expected );
  test.is( _.primitiveIs( got ) );
  test.identical( src, _.argumentsArrayMake( [ 1, 2, 3 ] ) );

  /* */

  test.case = 'sets - array contains array';
  var src = [ [ 1, 2, null, 'str' ] ] ;
  var got = _.eachSample( src );
  var expected = [ [ 1 ], [ 2 ], [ null ], [ 'str' ] ];
  test.identical( got, expected );
  test.identical( src, [ [ 1, 2, null, 'str' ] ]  );

  test.case = 'sets - map, contains array';
  var src = { a : [ 1, 2, null, 'str' ] };
  var got = _.eachSample( src, null );
  var expected =
  [
    { a : 1 },
    { a : 2 },
    { a : null },
    { a : 'str' }
  ];
  test.identical( got, expected );
  test.identical( src, { a : [ 1, 2, null, 'str' ] } );

  test.case = 'sets - unroll, contains array';
  var src = _.unrollMake( [ [ 1, 2, null, 'str' ] ] );
  var got = _.eachSample( src );
  var expected = [ [ 1 ], [ 2 ], [ null ], [ 'str' ] ];
  test.identical( got, expected );
  test.isNot( _.unrollIs( got ) );
  test.identical( src, _.unrollMake( [ [ 1, 2, null, 'str' ] ] ) );

  test.case = 'sets - argumentsArray, contains array';
  var src = _.argumentsArrayMake( [ [ 1, 2, null, 'str' ] ] );
  var got = _.eachSample( src );
  var expected = [ [ 1 ], [ 2 ], [ null ], [ 'str' ] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );
  test.identical( src, _.argumentsArrayMake( [ [ 1, 2, null, 'str' ] ] ) );

  /* aaa2 : strange? explain please */
  /* Dmytro : it was strange because BufferTyped was not used properly */
  // var src = _.arrayFrom( new F32x( [ 1, 2, 3 ] ) );
  // var got = _.eachSample( src );
  // var expected = [ [ 1, 2, 3 ] ];
  // test.identical( got, expected );
  // test.notIdentical( got, [ [ [ 1, 2, 3 ] ] ] );
  // test.is( _.arrayIs( got ) );

  /* */

  test.case = 'sets - two dimentional array, inner arrays has two elements';
  var src = [ [ 0, 1 ], [ 2, 3 ] ];
  var got = _.eachSample
  ({
    sets : src,
  });
  var expected =
  [
    [ 0, 2 ], [ 1, 2 ],
    [ 0, 3 ], [ 1, 3 ],
  ];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ] ] );

  test.case = 'sets - two elements map, elements have arrays with two elements';
  var src = { a : [ 0, 1 ], b : [ 2, 3 ] };
  var got = _.eachSample
  ({
    sets : src,
  });
  var expected =
  [
    { a : 0, b : 2 }, { a : 1, b : 2 },
    { a : 0, b : 3 }, { a : 1, b : 3 }
  ];
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [ 2, 3 ] } );

  test.case = 'sets - two dimentional array, with scalar element at the end of container';
  var src = [ [ 0, 1 ], [ 2, 3 ], 6 ];
  var got = _.eachSample
  ({
    sets : src,
  });
  var expected =
  [
    [ 0, 2, 6 ], [ 1, 2, 6 ],
    [ 0, 3, 6 ], [ 1, 3, 6 ],
  ];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ], 6 ] );

  test.case = 'sets - three elements map, two element have arrays, one has scalar';
  var src = { a : [ 0, 1 ], b : [ 2, 3 ],  c : 6 };
  var got = _.eachSample
  ({
    sets : src,
  });
  var expected =
  [
    { a : 0, b : 2, c : 6 },
    { a : 1, b : 2, c : 6 },
    { a : 0, b : 3, c : 6 },
    { a : 1, b : 3, c : 6 }
  ];
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [ 2, 3 ],  c : 6 } );

  test.case = 'sets - three elements, two dimentional array';
  var src = [ [ 0, 1 ], [ 2, 3 ], [ 6, null ] ];
  var got = _.eachSample
  ({
    sets : src,
  });
  var expected =
  [
    [ 0, 2, 6 ], [ 1, 2, 6 ],
    [ 0, 3, 6 ], [ 1, 3, 6 ],
    [ 0, 2, null ], [ 1, 2, null ],
    [ 0, 3, null ], [ 1, 3, null ],
  ];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ], [ 6, null ] ] );

  test.case = 'sets - three elements map, elements have arrays';
  var src = { a : [ 0, 1 ], b : [ 2, 3 ], c: [ 6, null ] };
  var got = _.eachSample
  ({
    sets : src,
  });
  var expected =
  [
    { a : 0, b : 2, c : 6 }, { a : 1, b : 2, c : 6 },
    { a : 0, b : 3, c : 6 }, { a : 1, b : 3, c : 6 },
    { a : 0, b : 2, c : null }, { a : 1, b : 2, c : null },
    { a : 0, b : 3, c : null }, { a : 1, b : 3, c : null },
  ];
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [ 2, 3 ], c: [ 6, null ] } );

  test.case = 'sets - two dimentional array, contains argumentsArray';
  var src = [ _.argumentsArrayMake( [ 0, 1 ] ), _.argumentsArrayMake( [ 2, 3 ] ) ];
  var got = _.eachSample
  ({
    sets : src,
  });
  var expected =
  [
    [ 0, 2 ], [ 1, 2 ],
    [ 0, 3 ], [ 1, 3 ],
  ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );
  test.identical( src, [ _.argumentsArrayMake( [ 0, 1 ] ), _.argumentsArrayMake( [ 2, 3 ] ) ] );

  /* */

  test.case = 'sets - two dimentional array, leftToRight - 0';
  var src = [ [ 0, 1 ], [ 5, 6 ] ];
  var got = _.eachSample
  ({
    sets : src,
    leftToRight : 0,
  });
  var expected =
  [
    [ 0, 5 ],[ 0, 6 ],
    [ 1, 5 ],[ 1, 6 ]
  ];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 5, 6 ] ] );

  test.case = 'sets - two elements map, leftToRight - 0';
  var src = { a : [ 0, 1 ], b : [ 5, 6 ] };
  var got = _.eachSample
  ({
    sets : src,
    leftToRight : 0,
  });
  var expected =
  [
    { a : 0, b : 5 }, { a : 0, b : 6 },
    { a : 1, b : 5 }, { a : 1, b : 6 }
  ];
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [ 5, 6 ] } );

  test.case = 'sets - three elements two dimentional array, leftToRight - 0';
  var src = [ [ 0, 1 ], [ 'str', null ], [ true, 2 ] ];
  var got = _.eachSample
  ({
    sets : src,
    leftToRight : 0,
  });
  var expected =
  [
    [ 0, 'str', true ], [ 0, 'str', 2 ],
    [ 0, null, true ], [ 0, null, 2 ],
    [ 1, 'str', true ], [ 1, 'str', 2 ],
    [ 1, null, true ], [ 1, null, 2 ]
  ];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 'str', null ], [ true, 2 ] ] );

  /* */

  test.case = 'sets - two dimentional array, leftToRight - 1, result - 0';
  var src = [ [ 0, 1 ], [ 2, 3 ] ];
  var got = _.eachSample
  ({
    sets : src,
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ] ] );

  test.case = 'sets - two elements map, leftToRight - 1, result - 0';
  var src = { a : [ 0, 1 ], b : [ 2, 3 ] };
  var got = _.eachSample
  ({
    sets : src,
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [ 2, 3 ] } );

  test.case = 'sets - two dimentional array with scalar, leftToRight - 1, result - 0';
  var src = [ [ 0, 1 ], [ 2, 3 ], 6 ];
  var got = _.eachSample
  ({
    sets : src,
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ], 6 ] );

  test.case = 'sets - three elements map with scalar, leftToRight - 1, result - 0';
  var src = { a : [ 0, 1 ], b : [ 2, 3 ],  c : 6 };
  var got = _.eachSample
  ({
    sets : src,
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [ 2, 3 ],  c : 6 } );

  test.case = 'sets - two dimentional three elements array, leftToRight - 1, result - 0';
  var src = [ [ 0, 1 ], [ 2, 3 ], [ 6, null ] ];
  var got = _.eachSample
  ({
    sets : src,
    result : 0,
  });
  var expected = 7;
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ], [ 6, null ] ] );

  test.case = 'sets - three elements map, elements have arrays, leftToRight - 1, result - 0';
  var src = { a : [ 0, 1 ], b : [ 2, 3 ], c: [ 6, null ] };
  var got = _.eachSample
  ({
    sets : src,
    result : 0,
  });
  var expected = 7;
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [ 2, 3 ], c: [ 6, null ] } );

  test.case = 'sets - array with unrolls, leftToRight - 1, result - 0';
  var src = [ _.unrollMake( [ 0, 1 ] ), _.unrollMake( [ 2, 3 ] ) ];
  var got = _.eachSample
  ({
    sets : src,
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );
  test.identical( src, [ _.unrollMake( [ 0, 1 ] ), _.unrollMake( [ 2, 3 ] ) ] );

  test.case = 'sets - array with argumentsArray, leftToRight - 1, result - 0';
  var src = [ _.argumentsArrayMake( [ 0, 1 ] ), _.argumentsArrayMake( [ 2, 3 ] ) ];
  var got = _.eachSample
  ({
    sets : src,
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );
  test.identical( src, [ _.argumentsArrayMake( [ 0, 1 ] ), _.argumentsArrayMake( [ 2, 3 ] ) ] );

  test.case = 'sets - two dimentional array, sample - not default, equal length of vectors';
  var src = [ [ 0, 1 ], [ 2, 3 ] ];
  var got = _.eachSample
  ({
    sets : src,
    sample : [ 1, 2 ]
  });
  var expected =
  [
    [ 0, 2 ], [ 1, 2 ],
    [ 0, 3 ], [ 1, 3 ],
  ];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ] ] );

  test.case = 'sets - two dimentional array, sample - not default, sample.length > vector.length';
  var src = [ [ 0, 1 ], [ 2, 3 ] ];
  var got = _.eachSample
  ({
    sets : src,
    sample : [ 1, 2, 3 ]
  });
  var expected =
  [
    [ 0, 2, 3 ], [ 1, 2, 3 ],
    [ 0, 3, 3 ], [ 1, 3, 3 ],
  ];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ] ] );

  test.case = 'sets - two elements map, sample - not default';
  var src = { a : [ 0, 1 ], b : [ 2, 3 ] };
  var got = _.eachSample
  ({
    sets : src,
    sample : { ak : 'a', bk : 'b', ck : 'c' }
  });
  var expected =
  [
    {
      'ak' : 'a',
      'bk' : 'b',
      'ck' : 'c',
      'a' : 0,
      'b' : 2
    },
    {
      'ak' : 'a',
      'bk' : 'b',
      'ck' : 'c',
      'a' : 1,
      'b' : 2
    },
    {
      'ak' : 'a',
      'bk' : 'b',
      'ck' : 'c',
      'a' : 0,
      'b' : 3
    },
    {
      'ak' : 'a',
      'bk' : 'b',
      'ck' : 'c',
      'a' : 1,
      'b' : 3
    }
  ]
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [ 2, 3 ] } );

  test.case = 'sets - two dimentional array, sample - not default, onEach';
  var onEach = ( sample, i ) => sample[ i ] = sample[ i ] + 12;
  var src = [ [ 0, 1 ], [ 2, 3 ] ];
  var got = _.eachSample
  ({
    sets : src,
    onEach,
    sample : [ 1, 2, 3 ]
  });
  var expected =
  [
    [ 0, 2, 3 ], [ 1, 2, 3 ],
    [ 0, 3, 3 ], [ 1, 3, 15 ],
  ];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ] ] );

  test.case = 'sets - two dimentional array, sample - not default, onEach';
  var result = [];
  var onEach = function( sample, i )
  {
    _.arrayAppend( result, sample[ i ] );
  };
  var src = [ [ 0, 1 ], [ 2, 3 ] ];
  var got = _.eachSample
  ({
    sets : src,
    onEach,
    sample : [ 1, 2, 3, 4 ]
  });
  var expected =
  [
    [ 0, 2, 3, 4 ], [ 1, 2, 3, 4 ],
    [ 0, 3, 3, 4 ], [ 1, 3, 3, 4 ],
  ];
  test.identical( got, expected );
  test.identical( result, [ 0, 2, 3, 4 ] );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ] ] );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'not argument, extra arguments';
  test.shouldThrowErrorSync( () => _.eachSample() );
  test.shouldThrowErrorSync( () => _.eachSample( [ [ 1 ], [ 2 ] ], null, [ 1 ] ) );

  test.case = 'o.sets is not arraylike, not mapLike';
  test.shouldThrowErrorSync( () => _.eachSample( {} ) );
  test.shouldThrowErrorSync( () => _.eachSample( 1 ) );
  test.shouldThrowErrorSync( () => _.eachSample( 'str', null ) );

  test.case = 'onEach is not a routine or null';
  test.shouldThrowErrorSync( () => _.eachSample( [ [ 1 ], [ 2 ] ], 'str' ) );

  test.case = 'o.base has a value';
  var o = { sets : [ [ 1, 0 ], [ 2, 3 ] ], base : [ 5 ] };
  test.shouldThrowErrorSync( () => _.eachSample( o ) );

  test.case = 'o.add has a value';
  var o = { sets : [ [ 1, 0 ], [ 2, 3 ] ], add : [ 5 ] };
  test.shouldThrowErrorSync( () => _.eachSample( o ) );

}

//

function eachSampleExperiment( test )
{
  var got = _.eachSample
  ({
    sets : [ [ 0, 1 ], [ 2, 3 ] ]
  });
  var expected =
  [
    [ 0, 2 ], [ 1, 2 ],
    [ 0, 3 ], [ 1, 3 ],
  ];
  test.identical( got, expected );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

  var got = _.eachSample
  ({
    sets : [ _.unrollMake( [ 0, 1 ] ), _.unrollMake( [ 2, 3 ] ) ]
  });
  var expected =
  [
    [ 0, 2 ], [ 1, 2 ],
    [ 0, 3 ], [ 1, 3 ],
  ];
  test.identical( got, expected );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

}
eachSampleExperiment.experimental = 1;

//

function eachPermutationBasic( test )
{
  let context = this;
  let permutation = [];
  let index = [];
  let left = [];
  let right = [];
  let swaps = [];
  let all = [];

  /* */

  test.case = '0 element';
  reset();
  var length = 0;
  _.eachPermutation({ onEach, container : length });
  var exp = [];
  test.identical( all, exp );
  test.identical( analyse({ container : length, permutation }), {} );
  test.identical( permutation.length, 0 );

  /* */

  test.case = '1 element';
  reset();
  var length = 1;
  _.eachPermutation({ onEach, container : length });
  var exp = [ [ 0, 'i', 0, 'l', 0, 'r', 0, 's', 0 ] ]
  test.identical( all, exp );
  test.identical( analyse({ container : length, permutation }), {} );
  test.identical( permutation.length, _.factorial( length ) );

  /* */

  test.case = '2 elements';
  reset();
  var length = 2;
  _.eachPermutation({ onEach, container : length });
  var exp =
  [
    [ 0, 1, 'i', 0, 'l', 1, 'r', 1, 's', 0 ],
    [ 1, 0, 'i', 1, 'l', 0, 'r', 1, 's', 1 ]
  ]
  test.identical( all, exp );
  test.identical( analyse({ container : length, permutation }), {} );
  test.identical( permutation.length, _.factorial( length ) );

  /* */

  test.case = '3 elements';
  reset();
  var length = 3;
  _.eachPermutation({ onEach, container : length });
  var exp =
  [
    [ 0, 1, 2, 'i', 0, 'l', 2, 'r', 2, 's', 0 ],
    [ 0, 2, 1, 'i', 1, 'l', 1, 'r', 2, 's', 1 ],
    [ 1, 2, 0, 'i', 2, 'l', 0, 'r', 2, 's', 1 ],
    [ 1, 0, 2, 'i', 3, 'l', 1, 'r', 2, 's', 1 ],
    [ 2, 0, 1, 'i', 4, 'l', 0, 'r', 2, 's', 1 ],
    [ 2, 1, 0, 'i', 5, 'l', 1, 'r', 2, 's', 1 ]
  ]
  test.identical( all, exp );
  test.identical( analyse({ container : length, permutation }), {} );
  test.identical( permutation.length, _.factorial( length ) );

  /* */

  test.case = '4 elements';
  reset();
  var length = 4;
  _.eachPermutation({ onEach, container : length });
  var exp =
  [
    [ 0, 1, 2, 3, 'i', 0, 'l', 3, 'r', 3, 's', 0 ],
    [ 0, 1, 3, 2, 'i', 1, 'l', 2, 'r', 3, 's', 1 ],
    [ 0, 2, 3, 1, 'i', 2, 'l', 1, 'r', 3, 's', 1 ],
    [ 0, 2, 1, 3, 'i', 3, 'l', 2, 'r', 3, 's', 1 ],
    [ 0, 3, 1, 2, 'i', 4, 'l', 1, 'r', 3, 's', 1 ],
    [ 0, 3, 2, 1, 'i', 5, 'l', 2, 'r', 3, 's', 1 ],
    [ 1, 2, 3, 0, 'i', 6, 'l', 0, 'r', 3, 's', 2 ],
    [ 1, 2, 0, 3, 'i', 7, 'l', 2, 'r', 3, 's', 1 ],
    [ 1, 3, 0, 2, 'i', 8, 'l', 1, 'r', 3, 's', 1 ],
    [ 1, 3, 2, 0, 'i', 9, 'l', 2, 'r', 3, 's', 1 ],
    [ 1, 0, 2, 3, 'i', 10, 'l', 1, 'r', 3, 's', 1 ],
    [ 1, 0, 3, 2, 'i', 11, 'l', 2, 'r', 3, 's', 1 ],
    [ 2, 3, 0, 1, 'i', 12, 'l', 0, 'r', 3, 's', 2 ],
    [ 2, 3, 1, 0, 'i', 13, 'l', 2, 'r', 3, 's', 1 ],
    [ 2, 0, 1, 3, 'i', 14, 'l', 1, 'r', 3, 's', 1 ],
    [ 2, 0, 3, 1, 'i', 15, 'l', 2, 'r', 3, 's', 1 ],
    [ 2, 1, 3, 0, 'i', 16, 'l', 1, 'r', 3, 's', 1 ],
    [ 2, 1, 0, 3, 'i', 17, 'l', 2, 'r', 3, 's', 1 ],
    [ 3, 0, 1, 2, 'i', 18, 'l', 0, 'r', 3, 's', 2 ],
    [ 3, 0, 2, 1, 'i', 19, 'l', 2, 'r', 3, 's', 1 ],
    [ 3, 1, 2, 0, 'i', 20, 'l', 1, 'r', 3, 's', 1 ],
    [ 3, 1, 0, 2, 'i', 21, 'l', 2, 'r', 3, 's', 1 ],
    [ 3, 2, 0, 1, 'i', 22, 'l', 1, 'r', 3, 's', 1 ],
    [ 3, 2, 1, 0, 'i', 23, 'l', 2, 'r', 3, 's', 1 ]
  ]
  test.identical( all, exp );
  var exp = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23 ];
  test.identical( analyse({ container : length, permutation }), {} );
  test.identical( permutation.length, _.factorial( length ) );

  /* */

  test.case = '5 elements';
  reset();
  var length = 5;
  _.eachPermutation({ onEach, container : length });
  var exp =
  [
    [ 0, 1, 2, 3, 4 ],
    [ 0, 1, 2, 4, 3 ],
    [ 0, 1, 3, 4, 2 ],
    [ 0, 1, 3, 2, 4 ],
    [ 0, 1, 4, 2, 3 ],
    [ 0, 1, 4, 3, 2 ],
    [ 0, 2, 3, 4, 1 ],
    [ 0, 2, 3, 1, 4 ],
    [ 0, 2, 4, 1, 3 ],
    [ 0, 2, 4, 3, 1 ],
    [ 0, 2, 1, 3, 4 ],
    [ 0, 2, 1, 4, 3 ],
    [ 0, 3, 4, 1, 2 ],
    [ 0, 3, 4, 2, 1 ],
    [ 0, 3, 1, 2, 4 ],
    [ 0, 3, 1, 4, 2 ],
    [ 0, 3, 2, 4, 1 ],
    [ 0, 3, 2, 1, 4 ],
    [ 0, 4, 1, 2, 3 ],
    [ 0, 4, 1, 3, 2 ],
    [ 0, 4, 2, 3, 1 ],
    [ 0, 4, 2, 1, 3 ],
    [ 0, 4, 3, 1, 2 ],
    [ 0, 4, 3, 2, 1 ],
    [ 1, 2, 3, 4, 0 ],
    [ 1, 2, 3, 0, 4 ],
    [ 1, 2, 4, 0, 3 ],
    [ 1, 2, 4, 3, 0 ],
    [ 1, 2, 0, 3, 4 ],
    [ 1, 2, 0, 4, 3 ],
    [ 1, 3, 4, 0, 2 ],
    [ 1, 3, 4, 2, 0 ],
    [ 1, 3, 0, 2, 4 ],
    [ 1, 3, 0, 4, 2 ],
    [ 1, 3, 2, 4, 0 ],
    [ 1, 3, 2, 0, 4 ],
    [ 1, 4, 0, 2, 3 ],
    [ 1, 4, 0, 3, 2 ],
    [ 1, 4, 2, 3, 0 ],
    [ 1, 4, 2, 0, 3 ],
    [ 1, 4, 3, 0, 2 ],
    [ 1, 4, 3, 2, 0 ],
    [ 1, 0, 2, 3, 4 ],
    [ 1, 0, 2, 4, 3 ],
    [ 1, 0, 3, 4, 2 ],
    [ 1, 0, 3, 2, 4 ],
    [ 1, 0, 4, 2, 3 ],
    [ 1, 0, 4, 3, 2 ],
    [ 2, 3, 4, 0, 1 ],
    [ 2, 3, 4, 1, 0 ],
    [ 2, 3, 0, 1, 4 ],
    [ 2, 3, 0, 4, 1 ],
    [ 2, 3, 1, 4, 0 ],
    [ 2, 3, 1, 0, 4 ],
    [ 2, 4, 0, 1, 3 ],
    [ 2, 4, 0, 3, 1 ],
    [ 2, 4, 1, 3, 0 ],
    [ 2, 4, 1, 0, 3 ],
    [ 2, 4, 3, 0, 1 ],
    [ 2, 4, 3, 1, 0 ],
    [ 2, 0, 1, 3, 4 ],
    [ 2, 0, 1, 4, 3 ],
    [ 2, 0, 3, 4, 1 ],
    [ 2, 0, 3, 1, 4 ],
    [ 2, 0, 4, 1, 3 ],
    [ 2, 0, 4, 3, 1 ],
    [ 2, 1, 3, 4, 0 ],
    [ 2, 1, 3, 0, 4 ],
    [ 2, 1, 4, 0, 3 ],
    [ 2, 1, 4, 3, 0 ],
    [ 2, 1, 0, 3, 4 ],
    [ 2, 1, 0, 4, 3 ],
    [ 3, 4, 0, 1, 2 ],
    [ 3, 4, 0, 2, 1 ],
    [ 3, 4, 1, 2, 0 ],
    [ 3, 4, 1, 0, 2 ],
    [ 3, 4, 2, 0, 1 ],
    [ 3, 4, 2, 1, 0 ],
    [ 3, 0, 1, 2, 4 ],
    [ 3, 0, 1, 4, 2 ],
    [ 3, 0, 2, 4, 1 ],
    [ 3, 0, 2, 1, 4 ],
    [ 3, 0, 4, 1, 2 ],
    [ 3, 0, 4, 2, 1 ],
    [ 3, 1, 2, 4, 0 ],
    [ 3, 1, 2, 0, 4 ],
    [ 3, 1, 4, 0, 2 ],
    [ 3, 1, 4, 2, 0 ],
    [ 3, 1, 0, 2, 4 ],
    [ 3, 1, 0, 4, 2 ],
    [ 3, 2, 4, 0, 1 ],
    [ 3, 2, 4, 1, 0 ],
    [ 3, 2, 0, 1, 4 ],
    [ 3, 2, 0, 4, 1 ],
    [ 3, 2, 1, 4, 0 ],
    [ 3, 2, 1, 0, 4 ],
    [ 4, 0, 1, 2, 3 ],
    [ 4, 0, 1, 3, 2 ],
    [ 4, 0, 2, 3, 1 ],
    [ 4, 0, 2, 1, 3 ],
    [ 4, 0, 3, 1, 2 ],
    [ 4, 0, 3, 2, 1 ],
    [ 4, 1, 2, 3, 0 ],
    [ 4, 1, 2, 0, 3 ],
    [ 4, 1, 3, 0, 2 ],
    [ 4, 1, 3, 2, 0 ],
    [ 4, 1, 0, 2, 3 ],
    [ 4, 1, 0, 3, 2 ],
    [ 4, 2, 3, 0, 1 ],
    [ 4, 2, 3, 1, 0 ],
    [ 4, 2, 0, 1, 3 ],
    [ 4, 2, 0, 3, 1 ],
    [ 4, 2, 1, 3, 0 ],
    [ 4, 2, 1, 0, 3 ],
    [ 4, 3, 0, 1, 2 ],
    [ 4, 3, 0, 2, 1 ],
    [ 4, 3, 1, 2, 0 ],
    [ 4, 3, 1, 0, 2 ],
    [ 4, 3, 2, 0, 1 ],
    [ 4, 3, 2, 1, 0 ]
  ]
  test.identical( permutation, exp );
  test.identical( analyse({ container : length, permutation }), {} );
  test.identical( permutation.length, _.factorial( length ) );

  /* */

  function analyse( o )
  {
    let encountered = Object.create( null );
    if( _.numberIs( o.container ) )
    {
      if( o.container < 0 )
      o.container = 0;
      let container = Array( o.container );
      for( let i = o.container-1 ; i >= 0 ; i-- )
      container[ i ] = i;
      o.container = container;
    }
    for( let p = 0 ; p < o.permutation.length ; p++ )
    {
      let permutation = o.permutation[ p ];
      let key = permutation.join( '-' );
      encountered[ key ] = encountered[ key ] || 0;
      encountered[ key ] += 1;
    }
    for( let key in encountered )
    {
      if( encountered[ key ] === 1 )
      delete encountered[ key ]
    }
    return encountered;
  }

  /* */

  function reset()
  {
    permutation = [];
    index = [];
    left = [];
    right = [];
    swaps = [];
    all = [];
  }

  /* */

  function onEach( _permutation, _index, _left, _right, _swaps )
  {
    console.log( _index, '.', `${_left}..${_right}`, '.', _permutation.join( ' ' ) );
    permutation.push( _permutation.slice() );
    index.push( _index );
    left.push( _left );
    right.push( _right );
    swaps.push( _swaps );
    all.push([ ... _permutation, 'i', _index, 'l', _left, 'r', _right, 's', _swaps ]);
  }

}

//

function eachPermutationOptions( test )
{
  let context = this;
  let all = [];
  let permutation = [];
  let index = [];
  let left = [];
  let right = [];
  let swaps = [];

  /* */

  test.case = 'empty container';
  reset();
  var container = [];
  var length = container.length;
  var got = _.eachPermutation({ onEach, container });
  var exp = [];
  test.identical( permutation, exp );
  test.identical( analyse({ container, permutation }), {} );
  test.identical( permutation.length, 0 );
  test.is( got === undefined );

  /* */

  test.case = 'container';
  reset();
  var container = [ 'a', 'b', 'c' ];
  var length = container.length;
  var got = _.eachPermutation({ onEach, container });
  var exp =
  [
    [ 'a', 'b', 'c' ],
    [ 'a', 'c', 'b' ],
    [ 'b', 'c', 'a' ],
    [ 'b', 'a', 'c' ],
    [ 'c', 'a', 'b' ],
    [ 'c', 'b', 'a' ],
  ]
  test.identical( permutation, exp );
  test.identical( analyse({ container, permutation }), {} );
  test.identical( permutation.length, _.factorial( length ) );
  test.is( got === undefined );

  /* */

  test.case = 'returning:1';
  reset();
  var container = [ 'a', 'b', 'c' ];
  var length = container.length;
  var got = _.eachPermutation({ onEach, container, returning : 1 });
  var exp =
  [
    [ 'a', 'b', 'c' ],
    [ 'a', 'c', 'b' ],
    [ 'b', 'c', 'a' ],
    [ 'b', 'a', 'c' ],
    [ 'c', 'a', 'b' ],
    [ 'c', 'b', 'a' ],
  ]
  test.identical( permutation, exp );
  test.identical( got, exp );
  test.is( got !== permutation );
  test.identical( analyse({ container, permutation }), {} );
  test.identical( permutation.length, _.factorial( length ) );

  /* */

  test.case = 'returning:1, dst:[]';
  reset();
  var container = [ 'a', 'b', 'c' ];
  var length = container.length;
  var dst = [];
  var got = _.eachPermutation({ onEach, container, dst, returning : 1 });
  var exp =
  [
    [ 'a', 'b', 'c' ],
    [ 'a', 'c', 'b' ],
    [ 'b', 'c', 'a' ],
    [ 'b', 'a', 'c' ],
    [ 'c', 'a', 'b' ],
    [ 'c', 'b', 'a' ],
  ]
  test.identical( permutation, exp );
  test.identical( got, exp );
  test.is( got !== permutation );
  test.is( got === dst );
  test.identical( analyse({ container, permutation }), {} );
  test.identical( permutation.length, _.factorial( length ) );

  /* */

  function analyse( o )
  {
    let encountered = Object.create( null );
    if( _.numberIs( o.container ) )
    {
      if( o.container < 0 )
      o.container = 0;
      let container = Array( o.container );
      for( let i = o.container-1 ; i >= 0 ; i-- )
      container[ i ] = i;
      o.container = container;
    }
    for( let p = 0 ; p < o.permutation.length ; p++ )
    {
      let permutation = o.permutation[ p ];
      let key = permutation.join( '-' );
      encountered[ key ] = encountered[ key ] || 0;
      encountered[ key ] += 1;
    }
    for( let key in encountered )
    {
      if( encountered[ key ] === 1 )
      delete encountered[ key ]
    }
    return encountered;
  }

  /* */

  function reset()
  {
    permutation = [];
    index = [];
    left = [];
    right = [];
    swaps = [];
    all = [];
  }

  /* */

  function onEach( _permutation, _index, _left, _right, _swaps )
  {
    console.log( _index, '.', `${_left}..${_right}`, '.', _permutation.join( ' ' ) );
    permutation.push( _permutation.slice() );
    index.push( _index );
    left.push( _left );
    right.push( _right );
    swaps.push( _swaps );
    all.push([ ... _permutation, 'i', _index, 'l', _left, 'r', _right, 's', _swaps ]);
  }

}

//

function swapsCount( test )
{

  var src = [];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 0;
  test.identical( got, exp );

  var src = [ 0 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 0;
  test.identical( got, exp );

  var src = [ 0, 1 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 0;
  test.identical( got, exp );

  var src = [ 1, 0 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 1;
  test.identical( got, exp );

  var src = [ 0, 1, 2 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 0;
  test.identical( got, exp );

  var src = [ 0, 2, 1 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 1;
  test.identical( got, exp );

  var src = [ 1, 0, 2 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 1;
  test.identical( got, exp );

  var src = [ 2, 0, 1 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 2;
  test.identical( got, exp );

  var src = [ 0, 1, 2, 3 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 0;
  test.identical( got, exp );

  var src = [ 0, 1, 3, 2 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 1;
  test.identical( got, exp );

  var src = [ 0, 2, 3, 1 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 2;
  test.identical( got, exp );

  var src = [ 0, 2, 1, 3 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 1;
  test.identical( got, exp );

  var src = [ 0, 3, 1, 2 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 2;
  test.identical( got, exp );

  var src = [ 0, 3, 2, 1 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 1;
  test.identical( got, exp );

  var src = [ 1, 2, 3, 0 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 3;
  test.identical( got, exp );

  var src = [ 1, 2, 0, 3 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 2;
  test.identical( got, exp );

  var src = [ 1, 3, 0, 2 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 3;
  test.identical( got, exp );

  var src = [ 1, 3, 2, 0 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 2;
  test.identical( got, exp );

  var src = [ 1, 0, 2, 3 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 1;
  test.identical( got, exp );

  var src = [ 1, 0, 3, 2 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 2;
  test.identical( got, exp );

  var src = [ 2, 3, 0, 1 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.swapsCount( src );
  var exp = 2;
  test.identical( got, exp );

}

// --
//
// --

var Self =
{

  name : 'Tools.base.Functional',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // scalar

    scalarAppend,
    scalarAppendOnce,
    scalarPrepend,
    scalarPrependOnce,

    scalarToVector,

    //

    entityTimeExperiment,

    entityEach,
    // entityEachKey,
    entityEachOwn,

    entityOnlyOnlyDst,
    entityOnlyOnlySrc,
    entityOnlyBothSame, /* aaa : implement */ /* Dmytro : implemented */
    entityOnlyBoth, /* aaa : implement */ /* Dmytro : implemented, cases with different types of src and dst added */
    entityOnlyDiffTypes, /* aaa : implement */ /* Dmytro : cases with different types of src and dst added */
    entityOnlyOnlySets,
    entityOnlyOnlyHashMaps,

    entityButOnlyDst, /* aaa : implement */ /* Dmytro : implemented */
    entityButOnlySrc, /* aaa : implement */ /* Dmytro : implemented */
    entityButBothSame, /* aaa : implement */ /* Dmytro : implemented */
    entityButBoth, /* aaa : implement */ /* Dmytro : implemented */
    entityButDiffTypes,
    entityButOnlySets,
    entityButOnlyHashMaps,

/*
                        only / but            and                      or                         xor                          xand
value for evaluator       src              dst, src                 dst, src                    dst, src                    dst, src
value for dst             dst                dst                    first +                     first +                   dst if positive
*/

    entityAndOnlyDst, /* aaa : implement */ /* Dmytro : implemented */
    entityAndOnlySrc, /* aaa : implement */ /* Dmytro : implemented */
    entityAndBothSame, /* aaa : implement */ /* Dmytro : implemented */
    entityAndBoth, /* aaa : implement */ /* Dmytro : implemented */
    entityAndDiffTypes,
    entityAndOnlySets,
    entityAndOnlyHashMaps,

    entityOrOnlyDst, /* aaa : implement */ /* Dmytro : implemented */
    entityOrOnlySrc, /* aaa : implement */ /* Dmytro : implemented */
    entityOrBothSame, /* aaa : implement */ /* Dmytro : implemented */
    entityOrBoth, /* aaa : implement */ /* Dmytro : implemented */
    entityOrDiffTypes,
    entityOrOnlySets,
    entityOrOnlyHashMaps,

    entityXorOnlyDst, /* aaa : implement */ /* Dmytro : implemented */
    entityXorOnlySrc, /* aaa : implement */ /* Dmytro : implemented */
    entityXorBothSame, /* aaa : implement */ /* Dmytro : implemented */
    entityXorBoth, /* aaa : implement */ /* Dmytro : implemented */
    entityXorDiffTypes,
    entityXorOnlySets,
    entityXorOnlyHashMaps,

    // entityXandOnlyDst, /* qqq : implement */
    // entityXandOnlySrc, /* qqq : implement */
    // entityXandBothSame, /* qqq : implement */
    // entityXandBoth, /* qqq : implement */

    entityAll,
    entityAny,
    entityNone,

    //

    _filter_functor,

    entityMap,

    entityMapWithoutDst_,
    entityMapDstNull_,
    entityMapDstNotNull_,

    entityFilter,

    entityFilterWithoutDst_,
    entityFilterDstNull_,
    entityFilterDstNotNull_,

    entityFilterDeep,

    //

    first,
    last,

    index,
    indexExtending,
    indexSupplementing,
    indexAppending,
    indexAppendingExperiment,
    indexPrepending,

    remap,
    remapExtending,
    remapSupplementing,
    remapAppending,
    remapPrepending,

    // indexInplace,
    // indexInplaceSupplementing,

    //

    _entityMost,
    entityMin,
    entityMax,

    // permutation

    eachSample,
    eachSampleExperiment,
    eachPermutationBasic,
    eachPermutationOptions,
    swapsCount,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
