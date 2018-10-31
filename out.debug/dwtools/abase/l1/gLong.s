( function _gLong_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

//

let _ArrayIndexOf = Array.prototype.indexOf;
let _ArrayLastIndexOf = Array.prototype.lastIndexOf;
let _ArraySlice = Array.prototype.slice;
let _ArraySplice = Array.prototype.splice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;
let _propertyIsEumerable = Object.propertyIsEnumerable;

// --
// buffer
// --

function bufferRawIs( src )
{
  let type = _ObjectToString.call( src );
  let result = type === '[object ArrayBuffer]';
  return result;
}

//

function bufferTypedIs( src )
{
  let type = _ObjectToString.call( src );
  if( !/\wArray/.test( type ) )
  return false;
  if( _.bufferNodeIs( src ) )
  return false;
  return true;
}

//

function bufferViewIs( src )
{
  let type = _ObjectToString.call( src );
  let result = type === '[object DataView]';
  return result;
}

//

function bufferNodeIs( src )
{
  if( typeof Buffer !== 'undefined' )
  return src instanceof Buffer;
  return false;
}

//

function bufferAnyIs( src )
{
  if( !src )
  return false;
  return src.byteLength >= 0;
  // return bufferTypedIs( src ) || bufferViewIs( src )  || bufferRawIs( src ) || bufferNodeIs( src );
}

//

function bufferBytesIs( src )
{
  if( _.bufferNodeIs( src ) )
  return false;
  return src instanceof Uint8Array;
}

//

function constructorIsBuffer( src )
{
  if( !src )
  return false;
  if( !_.numberIs( src.BYTES_PER_ELEMENT ) )
  return false;
  if( !_.strIs( src.name ) )
  return false;
  return src.name.indexOf( 'Array' ) !== -1;
}

//

function buffersTypedAreEquivalent( src1, src2, accuracy )
{

  if( !_.bufferTypedIs( src1 ) )
  return false;
  if( !_.bufferTypedIs( src2 ) )
  return false;

  if( src1.length !== src2.length )
  debugger;
  if( src1.length !== src2.length )
  return false;

  debugger;
  if( accuracy === null || accuracy === undefined )
  accuracy = _.accuracy;

  for( let i = 0 ; i < src1.length ; i++ )
  if( Math.abs( src1[ i ] - src2[ i ] ) > accuracy )
  return false;

  return true;
}

//

function buffersTypedAreIdentical( src1, src2 )
{

  if( !_.bufferTypedIs( src1 ) )
  return false;
  if( !_.bufferTypedIs( src2 ) )
  return false;

  let t1 = _ObjectToString.call( src1 );
  let t2 = _ObjectToString.call( src2 );
  if( t1 !== t2 )
  return false;

  if( src1.length !== src2.length )
  debugger;
  if( src1.length !== src2.length )
  return false;

  for( let i = 0 ; i < src1.length ; i++ )
  if( !Object.is( src1[ i ], src2[ i ] ) )
  return false;

  return true;
}

//

function buffersRawAreIdentical( src1, src2 )
{

  if( !_.bufferRawIs( src1 ) )
  return false;
  if( !_.bufferRawIs( src2 ) )
  return false;

  if( src1.byteLength !== src2.byteLength )
  debugger;
  if( src1.byteLength !== src2.byteLength )
  return false;

  src1 = new Uint8Array( src1 );
  src2 = new Uint8Array( src2 );

  for( let i = 0 ; i < src1.length ; i++ )
  if( src1[ i ] !== src2[ i ] )
  return false;

  return true;
}

//

function buffersViewAreIdentical( src1, src2 )
{

  debugger;

  if( !_.bufferViewIs( src1 ) )
  return false;
  if( !_.bufferViewIs( src2 ) )
  return false;

  if( src1.byteLength !== src2.byteLength )
  debugger;
  if( src1.byteLength !== src2.byteLength )
  return false;

  for( let i = 0 ; i < src1.byteLength ; i++ )
  if( src1.getUint8( i ) !== src2.getUint8( i ) )
  return false;

  return true;
}

//

function buffersNodeAreIdentical( src1, src2 )
{

  debugger;

  if( !_.bufferNodeIs( src1 ) )
  return false;
  if( !_.bufferNodeIs( src2 ) )
  return false;

  return src1.equals( src2 );
}

//

function buffersAreEquivalent( src1, src2, accuracy )
{

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );

  if( _.bufferTypedIs( src1 ) )
  return _.buffersTypedAreEquivalent( src1 ,src2, accuracy );
  else if( _.bufferRawIs( src1 ) )
  return _.buffersRawAreIdentical( src1, src2 );
  else if( _.bufferViewIs( src1 ) )
  return _.buffersViewAreIdentical( src1, src2 );
  else if( _.bufferNodeIs( src1 ) )
  return _.buffersNodeAreIdentica( src1, src2 );
  else return false;

}

//

function buffersAreIdentical( src1, src2 )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  let t1 = _ObjectToString.call( src1 );
  let t2 = _ObjectToString.call( src2 );
  if( t1 !== t2 )
  return false;

  if( _.bufferTypedIs( src1 ) )
  return _.buffersTypedAreIdentical( src1, src2 );
  else if( _.bufferRawIs( src1 ) )
  return _.buffersRawAreIdentical( src1, src2 );
  else if( _.bufferViewIs( src1 ) )
  return _.buffersViewAreIdentical( src1, src2 );
  else if( _.bufferNodeIs( src1 ) )
  return _.buffersNodeAreIdentical( src1, src2 );
  else return false;

}

//

/**
 * The bufferMakeSimilar() routine returns a new array or a new TypedArray with length equal (length)
 * or new TypedArray with the same length of the initial array if second argument is not provided.
 *
 * @param { longIs } ins - The instance of an array.
 * @param { Number } [ length = ins.length ] - The length of the new array.
 *
 * @example
 * // returns [ , ,  ]
 * let arr = _.bufferMakeSimilar( [ 1, 2, 3 ] );
 *
 * @example
 * // returns [ , , ,  ]
 * let arr = _.bufferMakeSimilar( [ 1, 2, 3 ], 4 );
 *
 * @returns { longIs }  Returns an array with a certain (length).
 * @function bufferMakeSimilar
 * @throws { Error } If the passed arguments is less than two.
 * @throws { Error } If the (length) is not a number.
 * @throws { Error } If the first argument in not an array like object.
 * @throws { Error } If the (length === undefined) and (_.numberIs(ins.length)) is not a number.
 * @memberof wTools
 */

/* qqq : implement */

function bufferMakeSimilar( ins,src )
{
  let result, length;

  throw _.err( 'not tested' );

  if( _.routineIs( ins ) )
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( src === undefined )
  {
    length = _.definedIs( ins.length ) ? ins.length : ins.byteLength;
  }
  else
  {
    if( _.longIs( src ) )
    length = src.length;
    else if( _.bufferRawIs( src ) )
    length = src.byteLength;
    else if( _.numberIs( src ) )
    length = src;
    else _.assert( 0 );
  }

  if( _.argumentsArrayIs( ins ) )
  ins = [];

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIsFinite( length ) );
  _.assert( _.routineIs( ins ) || _.longIs( ins ) || _.bufferRawIs( ins ),'unknown type of array',_.strTypeOf( ins ) );

  if( _.longIs( src ) || _.bufferAnyIs( src ) )
  {

    if( ins.constructor === Array )
    {
      result = new( _.routineJoin( ins.constructor, ins.constructor, src ) );
    }
    else if( _.routineIs( ins ) )
    {
      if( ins.prototype.constructor.name === 'Array' )
      result = _ArraySlice.call( src );
      else
      result = new ins( src );
    }
    else
    result = new ins.constructor( src );

  }
  else
  {
    if( _.routineIs( ins ) )
    result = new ins( length );
    else
    result = new ins.constructor( length );
  }

  return result;
}

//

/* qqq : implement */

function bufferButRange( src, range, ins )
{
  let result;
  let range = _.rangeFrom( range );

  _.assert( _.bufferTypedIs( src ) );
  _.assert( ins === undefined || _.longIs( ins ) );
  _.assert( arguments.length === 2 || arguments.length === 3 );

  throw _.err( 'not implemented' )

  if( range[ 1 ] - range[ 0 ] <= 0 )
  return _.bufferSlice( src );

  // if( size > src.byteLength )
  // {
  //   result = longMakeSimilar( src, size );
  //   let resultTyped = new Uint8Array( result,0,result.byteLength );
  //   let srcTyped = new Uint8Array( src,0,src.byteLength );
  //   resultTyped.set( srcTyped );
  // }
  // else if( size < src.byteLength )
  // {
  //   result = src.slice( 0,size );
  // }

  return result;
}

//

/**
 * The bufferRelen() routine returns a new or the same typed array {-srcMap-} with a new or the same length (len).
 *
 * It creates the variable (result) checks, if (len) is more than (src.length),
 * if true, it creates and assigns to (result) a new typed array with the new length (len) by call the function(longMakeSimilar(src, len))
 * and copies each element from the {-srcMap-} into the (result) array while ensuring only valid data types, if data types are invalid they are replaced with zero.
 * Otherwise, if (len) is less than (src.length) it returns a new typed array from 0 to the (len) indexes, but not including (len).
 * Otherwise, it returns an initial typed array.
 *
 * @see {@link wTools.longMakeSimilar} - See for more information.
 *
 * @param { typedArray } src - The source typed array.
 * @param { Number } len - The length of a typed array.
 *
 * @example
 * // returns [ 3, 7, 13, 0 ]
 * let ints = new Int8Array( [ 3, 7, 13 ] );
 * _.bufferRelen( ints, 4 );
 *
 * @example
 * // returns [ 3, 7, 13 ]
 * let ints2 = new Int16Array( [ 3, 7, 13, 33, 77 ] );
 * _.bufferRelen( ints2, 3 );
 *
 * @example
 * // returns [ 3, 0, 13, 0, 77, 0 ]
 * let ints3 = new Int32Array( [ 3, 7, 13, 33, 77 ] );
 * _.bufferRelen( ints3, 6 );
 *
 * @returns { typedArray } - Returns a new or the same typed array {-srcMap-} with a new or the same length (len).
 * @function bufferRelen
 * @memberof wTools
 */

function bufferRelen( src,len )
{

  _.assert( _.bufferTypedIs( src ) );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.numberIs( len ) );

  let result = src;

  if( len > src.length )
  {
    result = longMakeSimilar( src, len );
    result.set( src );
  }
  else if( len < src.length )
  {
    result = src.subarray( 0,len );
  }

  return result;
}

//

/* qqq : implement for 2 other types of buffer and do code test coverage */

function bufferResize( srcBuffer, size )
{
  let result = srcBuffer;

  _.assert( _.bufferRawIs( srcBuffer ) || _.bufferTypedIs( srcBuffer ) );
  _.assert( srcBuffer.byteLength >= 0 );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( size > srcBuffer.byteLength )
  {
    result = _.longMakeSimilar( srcBuffer, size );
    let resultTyped = new Uint8Array( result,0,result.byteLength );
    let srcTyped = new Uint8Array( srcBuffer,0,srcBuffer.byteLength );
    resultTyped.set( srcTyped );
  }
  else if( size < srcBuffer.byteLength )
  {
    result = srcBuffer.slice( 0,size );
  }

  return result;
}

//

function bufferBytesGet( src )
{

  if( src instanceof ArrayBuffer )
  {
    return new Uint8Array( src );
  }
  else if( typeof Buffer !== 'undefined' && src instanceof Buffer )
  {
    return new Uint8Array( src.buffer, src.byteOffset, src.byteLength );
  }
  else if( _.bufferTypedIs( src ) )
  {
    return new Uint8Array( src.buffer, src.byteOffset, src.byteLength );
  }
  else if( _.strIs( src ) )
  {
    if( _global_.Buffer )
    return new Uint8Array( _.bufferRawFrom( Buffer.from( src, 'utf8' ) ) );
    else
    return new Uint8Array( _.encode.utf8ToBuffer( src ) );
  }
  else _.assert( 0, 'wrong argument' );

}

//

  /**
   * The bufferRetype() routine converts and returns a new instance of (bufferType) constructor.
   *
   * @param { typedArray } src - The typed array.
   * @param { typedArray } bufferType - The type of typed array.
   *
   * @example
   * // returns [ 513, 1027, 1541 ]
   * let view1 = new Int8Array( [ 1, 2, 3, 4, 5, 6 ] );
   * _.bufferRetype(view1, Int16Array);
   *
   * @example
   * // returns [ 1, 2, 3, 4, 5, 6 ]
   * let view2 = new Int16Array( [ 513, 1027, 1541 ] );
   * _.bufferRetype(view2, Int8Array);
   *
   * @returns { typedArray } Returns a new instance of (bufferType) constructor.
   * @function bufferRetype
   * @throws { Error } Will throw an Error if {-srcMap-} is not a typed array object.
   * @throws { Error } Will throw an Error if (bufferType) is not a type of the typed array.
   * @memberof wTools
   */

function bufferRetype( src,bufferType )
{

  _.assert( _.bufferTypedIs( src ) );
  _.assert( _.constructorIsBuffer( bufferType ) );

  let o = src.byteOffset;
  let l = Math.floor( src.byteLength / bufferType.BYTES_PER_ELEMENT );
  let result = new bufferType( src.buffer,o,l );

  return result;
}

//

function bufferJoin()
{

  if( arguments.length < 2 )
  return arguments[ 0 ] || null;

  let srcs = [];
  let size = 0;
  let firstSrc;
  for( let s = 0 ; s < arguments.length ; s++ )
  {
    let src = arguments[ s ];

    if( src === null )
    continue;

    if( !firstSrc )
    firstSrc = src;

    if( _.bufferRawIs( src ) )
    {
      srcs.push( new Uint8Array( src ) );
    }
    else if( src instanceof Uint8Array )
    {
      srcs.push( src );
    }
    else
    {
      srcs.push( new Uint8Array( src.buffer,src.byteOffset,src.byteLength ) );
    }

    _.assert( src.byteLength >= 0,'Expects buffers, but got',_.strTypeOf( src ) );

    size += src.byteLength;
  }

  if( srcs.length === 0 )
  return null;

  // if( srcs.length < 2 )
  // return firstSrc || null;

  /* */

  let resultBuffer = new ArrayBuffer( size );
  let result = _.bufferRawIs( firstSrc ) ? resultBuffer : new firstSrc.constructor( resultBuffer );
  let resultBytes = result.constructor === Uint8Array ? result : new Uint8Array( resultBuffer );

  /* */

  let offset = 0;
  for( let s = 0 ; s < srcs.length ; s++ )
  {
    let src = srcs[ s ];
    if( resultBytes.set )
    resultBytes.set( src , offset );
    else
    for( let i = 0 ; i < src.length ; i++ )
    resultBytes[ offset+i ] = src[ i ];
    offset += src.byteLength;
  }

  return result;
}

//

function bufferMove( dst,src )
{

  if( arguments.length === 2 )
  {

    _.assert( _.longIs( dst ) );
    _.assert( _.longIs( src ) );

    if( dst.length !== src.length )
    throw _.err( '_.bufferMove :','"dst" and "src" must have same length' );

    if( dst.set )
    {
      dst.set( src );
      return dst;
    }

    for( let s = 0 ; s < src.length ; s++ )
    dst[ s ] = src[ s ];

  }
  else if( arguments.length === 1 )
  {

    let options = arguments[ 0 ];
    _.assertMapHasOnly( options,bufferMove.defaults );

    let src = options.src;
    let dst = options.dst;

    if( _.bufferRawIs( dst ) )
    {
      dst = new Uint8Array( dst );
      if( _.bufferTypedIs( src ) && !( src instanceof Uint8Array ) )
      src = new Uint8Array( src.buffer,src.byteOffset,src.byteLength );
    }

    _.assert( _.longIs( dst ) );
    _.assert( _.longIs( src ) );

    options.dstOffset = options.dstOffset || 0;

    if( dst.set )
    {
      dst.set( src,options.dstOffset );
      return dst;
    }

    for( let s = 0, d = options.dstOffset ; s < src.length ; s++, d++ )
    dst[ d ] = src[ s ];

  }
  else _.assert( 0,'unexpected' );

  return dst;
}

bufferMove.defaults =
{
  dst : null,
  src : null,
  dstOffset : null,
}

//

function bufferToStr( src )
{
  let result = '';

  if( src instanceof ArrayBuffer )
  src = new Uint8Array( src,0,src.byteLength );

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.bufferAnyIs( src ) );

  if( bufferNodeIs( src ) )
  return src.toString( 'utf8' );

  try
  {
    result = String.fromCharCode.apply( null, src );
  }
  catch( e )
  {
    for( let i = 0 ; i < src.byteLength ; i++ )
    {
      result += String.fromCharCode( src[i] );
    }
  }

  return result;
}

//

function bufferToDom( xmlBuffer ) {

  let result;

  if( typeof DOMParser !== 'undefined' && DOMParser.prototype.parseFromBuffer )
  {

    let parser = new DOMParser();
    result = parser.parseFromBuffer( xmlBuffer,xmlBuffer.byteLength,'text/xml' );
    throw _.err( 'not tested' );

  }
  else
  {

    let xmlStr = _.bufferToStr( xmlBuffer );
    result = this.strToDom( xmlStr );

  }

  return result;
}

//

function bufferLeft( src,del )
{

  if( !_.bufferRawIs( src ) )
  src = _.bufferBytesGet( src );

  if( !_.bufferRawIs( del ) )
  del = _.bufferBytesGet( del );

  _.assert( src.indexOf );
  _.assert( del.indexOf );

  let index = src.indexOf( del[ 0 ] );
  while( index !== -1 )
  {

    for( let i = 0 ; i < del.length ; i++ )
    if( src[ index+i ] !== del[ i ] )
    break;

    if( i === del.length )
    return index;

    index += 1;
    index = src.indexOf( del[ 0 ],index );

  }

  return -1;
}

//

function bufferSplit( src,del )
{

  if( !_.bufferRawIs( src ) )
  src = _.bufferBytesGet( src );

  if( !_.bufferRawIs( del ) )
  del = _.bufferBytesGet( del );

  _.assert( src.indexOf );
  _.assert( del.indexOf );

  let result = [];
  let begin = 0;
  let index = src.indexOf( del[ 0 ] );
  while( index !== -1 )
  {

    for( let i = 0 ; i < del.length ; i++ )
    if( src[ index+i ] !== del[ i ] )
    break;

    if( i === del.length )
    {
      result.push( src.slice( begin,index ) );
      index += i;
      begin = index;
    }
    else
    {
      index += 1;
    }

    index = src.indexOf( del[ 0 ],index );

  }

  if( begin === 0 )
  result.push( src );
  else
  result.push( src.slice( begin,src.length ) );

  return result;
}

//

function bufferCutOffLeft( src,del )
{

  if( !_.bufferRawIs( src ) )
  src = _.bufferBytesGet( src );

  if( !_.bufferRawIs( del ) )
  del = _.bufferBytesGet( del );

  _.assert( src.indexOf );
  _.assert( del.indexOf );

  let result = [];
  let index = src.indexOf( del[ 0 ] );
  while( index !== -1 )
  {

    for( let i = 0 ; i < del.length ; i++ )
    if( src[ index+i ] !== del[ i ] )
    break;

    if( i === del.length )
    {
      result.push( src.slice( 0,index ) );
      result.push( src.slice( index,index+i ) );
      result.push( src.slice( index+i,src.length ) );
      return result;
    }
    else
    {
      index += 1;
    }

    index = src.indexOf( del[ 0 ],index );

  }

  result.push( null );
  result.push( null );
  result.push( src );

  return result;
}

//

function bufferFromArrayOfArray( array,options )
{

  if( _.objectIs( array ) )
  {
    options = array;
    array = options.buffer;
  }

  let options = options || Object.create( null );
  let array = options.buffer = array || options.buffer;

  //

  if( options.BufferType === undefined ) options.BufferType = Float32Array;
  if( options.sameLength === undefined ) options.sameLength = 1;
  if( !options.sameLength ) throw _.err( '_.bufferFromArrayOfArray :','differemt length of arrays is not implemented' );

  if( !array.length ) return new options.BufferType();

  let atomsPerElement = _.numberIs( array[ 0 ].length ) ? array[ 0 ].length : array[ 0 ].len;

  if( !_.numberIs( atomsPerElement ) ) throw _.err( '_.bufferFromArrayOfArray :','cant find out element length' );

  let length = array.length * atomsPerElement;
  let result = new options.BufferType( length );
  let i = 0;

  for( let a = 0 ; a < array.length ; a++ )
  {

    let element = array[ a ];

    for( let e = 0 ; e < atomsPerElement ; e++ )
    {

      result[ i ] = element[ e ];
      i += 1;

    }

  }

  return result;
}

//

function bufferFrom( o )
{
  let result;

  _.assert( arguments.length === 1 );
  _.assert( _.objectIs( o ) );
  _.assert( _.routineIs( o.bufferConstructor ),'Expects bufferConstructor' );
  _.assertMapHasOnly( o,bufferFrom.defaults );

  /* same */

  if( o.src.constructor )
  if( o.src.constructor === o.bufferConstructor  )
  return o.src;

  /* number */

  if( _.numberIs( o.src ) )
  o.src = [ o.src ];

  if( o.bufferConstructor.name === 'ArrayBuffer' )
  return _.bufferRawFrom( o.src );

  if( o.bufferConstructor.name === 'Buffer' )
  return _.bufferNodeFrom( o.src );

  /* str / buffer.node / buffer.raw */

  if( _.strIs( o.src ) || _.bufferNodeIs( o.src ) || _.bufferRawIs( o.src ) )
  o.src = _.bufferBytesFrom( o.src );

  /* buffer.typed */

  if( _.bufferTypedIs( o.src ) )
  {
    if( o.src.constructor === o.bufferConstructor  )
    return o.src;

    result = new o.bufferConstructor( o.src );
    return result;
  }

  /* verification */

  _.assert( _.objectLike( o.src ) || _.longIs( o.src ),'bufferFrom expects object-like or array-like as o.src' );

  /* length */

  let length = o.src.length;
  if( !_.numberIs( length ) )
  {

    let length = 0;
    while( o.src[ length ] !== undefined )
    length += 1;

  }

  /* make */

  if( _.arrayIs( o.src ) )
  {
    result = new o.bufferConstructor( o.src );
  }
  else if ( _.longIs( o.src ) )
  {
    result = new o.bufferConstructor( o.src );
    throw _.err( 'not tested' );
  }
  else
  {
    result = new o.bufferConstructor( length );
    for( let i = 0 ; i < length ; i++ )
    result[ i ] = o.src[ i ];
  }

  return result;
}

bufferFrom.defaults =
{
  src : null,
  bufferConstructor : null,
}

//

/**
 * The bufferRawFromTyped() routine returns a new ArrayBuffer from (buffer.byteOffset) to the end of an ArrayBuffer of a typed array (buffer)
 * or returns the same ArrayBuffer of the (buffer), if (buffer.byteOffset) is not provided.
 *
 * @param { typedArray } buffer - Entity to check.
 *
 * @example
 * // returns [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
 * let buffer1 = new ArrayBuffer( 10 );
 * let view1 = new Int8Array( buffer1 );
 * _.bufferRawFromTyped( view1 );
 *
 * @example
 * // returns [ 0, 0, 0, 0, 0, 0 ]
 * let buffer2 = new ArrayBuffer( 10 );
 * let view2 = new Int8Array( buffer2, 2 );
 * _.bufferRawFromTyped( view2 );
 *
 * @returns { ArrayBuffer } Returns a new or the same ArrayBuffer.
 * If (buffer) is instance of '[object ArrayBuffer]', it returns buffer.
 * @function bufferRawFromTyped
 * @throws { Error } Will throw an Error if (arguments.length) is not equal to the 1.
 * @throws { Error } Will throw an Error if (buffer) is not a typed array.
 * @memberof wTools
 */

function bufferRawFromTyped( buffer )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.bufferTypedIs( buffer ) || _.bufferRawIs( buffer ) );

  if( _.bufferRawIs( buffer ) )
  return buffer;

  let result = buffer.buffer;

  if( buffer.byteOffset || buffer.byteLength !== result.byteLength )
  result = result.slice( buffer.byteOffset || 0,buffer.byteLength );

  _.assert( _.bufferRawIs( result ) );

  return result;
}

//

function bufferRawFrom( buffer )
{
  let result;

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( buffer instanceof ArrayBuffer )
  return buffer;

  if( _.bufferNodeIs( buffer ) || _.arrayIs( buffer ) )
  {

    // result = buffer.buffer;
    result = new Uint8Array( buffer ).buffer;

  }
  else if( _.bufferTypedIs( buffer ) || _.bufferViewIs( buffer ) )
  {

    debugger;
    // _.assert( 0, 'not implemented' );
    result = buffer.buffer;
    if( buffer.byteOffset || buffer.byteLength !== result.byteLength )
    result = result.slice( buffer.byteOffset || 0,buffer.byteLength );

  }
  else if( _.strIs( buffer ) )
  {

    if( _global_.Buffer )
    {
      result = _.bufferRawFrom( Buffer.from( buffer, 'utf8' ) );
    }
    else
    {
      result = _.encode.utf8ToBuffer( buffer ).buffer;
    }

  }
  else if( _global.File && buffer instanceof File )
  {
    let fileReader = new FileReaderSync();
    result = fileReader.readAsArrayBuffer( buffer );
    _.assert( 0, 'not tested' );
  }
  else _.assert( 0, () => 'Unknown type of source ' + _.strTypeOf( buffer ) );

  _.assert( _.bufferRawIs( result ) );

  return result;
}

//

function bufferBytesFrom( buffer )
{
  let result;

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.bufferNodeIs( buffer ) )
  {

    _.assert( _.bufferRawIs( buffer.buffer ) )
    result = new U8x( buffer.buffer, buffer.byteOffset, buffer.byteLength );

  }
  else if( _.bufferRawIs( buffer ) )
  {

    result = new U8x( buffer, 0, buffer.byteLength );

  }
  else if( _.bufferTypedIs( buffer ) )
  {

    result = new U8x( buffer.buffer, buffer.byteOffset, buffer.byteLength );

  }
  else if( _.bufferViewIs( buffer ) )
  {

    debugger;
    // _.assert( 0, 'not tested' );
    result = new U8x( buffer.buffer, buffer.byteOffset, buffer.byteLength );

  }
  else
  {

    return _.bufferBytesFrom( _.bufferRawFrom( buffer ) );

  }

  _.assert( _.bufferBytesIs( result ) );

  return result;
}

//

function bufferBytesFromNode( src )
{
  _.assert( _.bufferNodeIs( src ) );
  let result = new Uint8Array( buffer );
  return result;
}

//

/*
qqq : cover it
*/

function bufferNodeFrom( buffer )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.bufferViewIs( buffer ) || _.bufferTypedIs( buffer ) || _.bufferRawIs( buffer ) || _.bufferNodeIs( buffer ) || _.strIs( buffer ) || _.arrayIs( buffer ), 'Expects typed or raw buffer, but got',_.strTypeOf( buffer ) );

  if( _.bufferNodeIs( buffer ) )
  return buffer;

  /* */

  // if( toBuffer === null )
  // try
  // {
  //   toBuffer = require( 'typedarray-to-buffer' );
  // }
  // catch( err )
  // {
  //   toBuffer = false;
  // }

  /* */

  let result;

  if( buffer.length === 0 || buffer.byteLength === 0 )
  {
    // _.assert( 0, 'not tested' );
    // result = new Buffer([]);
    result = Buffer.from([]);
  }
  else if( _.strIs( buffer ) )
  {
    debugger;
    result = _.bufferNodeFrom( _.bufferRawFrom( buffer ) );
  }
  else if( buffer.buffer )
  {
    result = Buffer.from( buffer.buffer, buffer.byteOffset, buffer.byteLength );
  }
  else
  {
    // _.assert( 0, 'not tested' );
    result = Buffer.from( buffer );
  }

  // if( !buffer.length && !buffer.byteLength )
  // {
  //   buffer = new Buffer([]);
  // }
  // else if( toBuffer )
  // try
  // {
  //   buffer = toBuffer( buffer );
  // }
  // catch( err )
  // {
  //   debugger;
  //   buffer = toBuffer( buffer );
  // }
  // else
  // {
  //   if( _.bufferTypedIs( buffer ) )
  //   buffer = Buffer.from( buffer.buffer );
  //   else
  //   buffer = Buffer.from( buffer );
  // }

  _.assert( _.bufferNodeIs( result ) );

  return result;
}

//

function buffersSerialize( o )
{
  let self = this;
  let size = 0;
  let o = o || Object.create( null );

  _.assertMapHasNoUndefine( o );
  _.assertMapHasOnly( o,buffersSerialize.defaults );
  _.mapComplement( o,buffersSerialize.defaults );
  _.assert( _.objectIs( o.store ) );

  let store = o.store;
  let storeAttributes = store[ 'attributes' ] = store[ 'attributes' ] || Object.create( null );
  let attributes = o.onAttributesGet.call( o.context );
  let buffers = [];

  /* eval size */

  for( let a = 0 ; a < attributes.length ; a++ )
  {

    let name = attributes[ a ][ 0 ];
    let attribute = attributes[ a ][ 1 ];
    let buffer = o.onBufferGet.call( o.context,attribute );

    _.assert( _.bufferTypedIs( buffer ) || buffer === null,'Expects buffer or null, got : ' + _.strTypeOf( buffer ) );

    let bufferSize = buffer ? buffer.length*buffer.BYTES_PER_ELEMENT : 0;

    if( o.dropAttribute && o.dropAttribute[ name ] )
    continue;

    let descriptor = Object.create( null );
    descriptor.attribute = attribute;
    descriptor.name = name;
    descriptor.buffer = buffer;
    descriptor.bufferSize = bufferSize;
    descriptor.sizeOfAtom = buffer ? buffer.BYTES_PER_ELEMENT : 0;
    buffers.push( descriptor );

    size += bufferSize;

  }

  /* make buffer */

  if( !store[ 'buffer' ] )
  store[ 'buffer' ] = new ArrayBuffer( size );

  let dstBuffer = _.bufferBytesGet( store[ 'buffer' ] );

  _.assert( store[ 'buffer' ].byteLength === size );
  if( store[ 'buffer' ].byteLength < size )
  throw _.err( 'buffersSerialize :','buffer does not have enough space' );

  /* sort by atom size */

  buffers.sort( function( a,b )
  {
    return b.sizeOfAtom - a.sizeOfAtom;
  });

  /* store into single buffer */

  let offset = 0;
  for( let b = 0 ; b < buffers.length ; b++ )
  {

    let name = buffers[ b ].name;
    let attribute = buffers[ b ].attribute;
    let buffer = buffers[ b ].buffer;
    let bytes = buffer ? _.bufferBytesGet( buffer ) : new Uint8Array();
    let bufferSize = buffers[ b ].bufferSize;

    if( o.dropAttribute && o.dropAttribute[ name ] )
    continue;

    _.bufferMove( dstBuffer.subarray( offset,offset+bufferSize ),bytes );

    let serialized = store[ 'attributes' ][ name ] =
    {
      'bufferConstructorName' : buffer ? buffer.constructor.name : 'null',
      'sizeOfAtom' : buffer ? buffer.BYTES_PER_ELEMENT : 0,
      'offsetInCommonBuffer' : offset,
      'size' : bytes.length,
    }

    if( attribute.copyCustom )
    serialized[ 'fields' ] = attribute.copyCustom
    ({

      dst : Object.create( null ),
      src : attribute,

      copyingComposes : 3,
      copyingAggregates : 3,
      copyingAssociates : 1,

      technique : 'data',

    });

    offset += bufferSize;

  }

  /* return */

  return store;
}

buffersSerialize.defaults =
{

  context : null,
  store : null,

  dropAttribute : {},

  onAttributesGet : function()
  {
    return _.mapPairs( this.attributes );
  },
  onBufferGet : function( attribute )
  {
    return attribute.buffer;
  },

}

//

function buffersDeserialize( o )
{
  let o = o || Object.create( null );
  let store = o.store;
  let commonBuffer = store[ 'buffer' ];

  _.assertMapHasNoUndefine( o );
  _.assertMapHasOnly( o,buffersDeserialize.defaults );
  _.mapComplement( o,buffersDeserialize.defaults );
  _.assert( _.objectIs( o.store ) );
  _.assert( _.bufferRawIs( commonBuffer ) || _.bufferTypedIs( commonBuffer ) );

  commonBuffer = _.bufferRawFromTyped( commonBuffer );

  for( let a in store[ 'attributes' ] )
  {
    let attribute = store[ 'attributes' ][ a ];

    let bufferConstructor = attribute[ 'bufferConstructorName' ] === 'null' ? null : _global[ attribute[ 'bufferConstructorName' ] ];
    let offset = attribute[ 'offsetInCommonBuffer' ];
    let size = attribute[ 'size' ];
    let sizeOfAtom = attribute[ 'sizeOfAtom' ];
    let fields = attribute[ 'fields' ];

    _.assert( _.routineIs( bufferConstructor ) || bufferConstructor === null,'unknown attribute\' constructor :',attribute[ 'bufferConstructorName' ] )
    _.assert( _.numberIs( offset ),'unknown attribute\' offset in common buffer :',offset )
    _.assert( _.numberIs( size ),'unknown attribute\' size of buffer :',size )
    _.assert( _.numberIs( sizeOfAtom ),'unknown attribute\' sizeOfAtom of buffer :',sizeOfAtom )

    if( attribute.offset+size > commonBuffer.byteLength )
    throw _.err( 'cant deserialize attribute','"'+a+'"','it is out of common buffer' );

    /* logger.log( 'bufferConstructor( ' + commonBuffer + ',' + offset + ',' + size / sizeOfAtom + ' )' ); */

    let buffer = bufferConstructor ? new bufferConstructor( commonBuffer,offset,size / sizeOfAtom ) : null;

    o.onAttribute.call( o.context,fields,buffer,a );

  }

}

buffersDeserialize.defaults =
{
  store : null,
  context : null,
  onAttribute : function( attributeOptions,buffer )
  {
    attributeOptions.buffer = buffer;
    new this.AttributeOfGeometry( attributeOptions ).addTo( this );
  },
}

// --
// long
// --

/**
 * The longMakeSimilar() routine returns a new array or a new TypedArray with length equal (length)
 * or new TypedArray with the same length of the initial array if second argument is not provided.
 *
 * @param { longIs } ins - The instance of an array.
 * @param { Number } [ length = ins.length ] - The length of the new array.
 *
 * @example
 * // returns [ , ,  ]
 * let arr = _.longMakeSimilar( [ 1, 2, 3 ] );
 *
 * @example
 * // returns [ , , ,  ]
 * let arr = _.longMakeSimilar( [ 1, 2, 3 ], 4 );
 *
 * @returns { longIs }  Returns an array with a certain (length).
 * @function longMakeSimilar
 * @throws { Error } If the passed arguments is less than two.
 * @throws { Error } If the (length) is not a number.
 * @throws { Error } If the first argument in not an array like object.
 * @throws { Error } If the (length === undefined) and (_.numberIs(ins.length)) is not a number.
 * @memberof wTools
 */

function longMakeSimilar( ins,src )
{
  let result, length;

  if( _.routineIs( ins ) )
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( src === undefined )
  {
    length = _.definedIs( ins.length ) ? ins.length : ins.byteLength;
  }
  else
  {
    if( _.longIs( src ) )
    length = src.length;
    // else if( _.bufferRawIs( src ) )
    // length = src.byteLength;
    else if( _.numberIs( src ) )
    length = src;
    else _.assert( 0 );
  }

  if( _.argumentsArrayIs( ins ) )
  ins = [];

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIsFinite( length ) );
  _.assert( _.routineIs( ins ) || _.longIs( ins ) || _.bufferRawIs( ins ),'unknown type of array',_.strTypeOf( ins ) );

  if( _.longIs( src ) )
  {

    // if( ins.constructor === Array )
    // debugger;
    // else
    // debugger;

    if( ins.constructor === Array )
    result = new( _.routineJoin( ins.constructor, ins.constructor, src ) );
    else if( _.routineIs( ins ) )
    {
      if( ins.prototype.constructor.name === 'Array' )
      result = _ArraySlice.call( src );
      else
      result = new ins( src );
    }
    else
    result = new ins.constructor( src );

  }
  else
  {
    if( _.routineIs( ins ) )
    result = new ins( length );
    else
    result = new ins.constructor( length );
  }

  return result;
}

//

function longMakeSimilarZeroed( ins,src )
{
  let result, length;

  if( _.routineIs( ins ) )
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( src === undefined )
  {
    length = _.definedIs( ins.length ) ? ins.length : ins.byteLength;
  }
  else
  {
    if( _.longIs( src ) )
    length = src.length;
    else if( _.bufferRawIs( src ) )
    length = src.byteLength;
    else
    length = src
  }

  if( _.argumentsArrayIs( ins ) )
  ins = [];

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIs( length ) );
  _.assert( _.routineIs( ins ) || _.longIs( ins ) || _.bufferRawIs( ins ),'unknown type of array',_.strTypeOf( ins ) );

  // if( _.longIs( src ) )
  // {
  //
  //   if( ins.constructor === Array )
  //   debugger;
  //   else
  //   debugger;
  //
  //   if( ins.constructor === Array )
  //   {
  //     result = new( _.routineJoin( ins.constructor, ins.constructor, src ) );
  //   }
  //   else
  //   {
  //     result = new ins.constructor( length );
  //     for( let i = 0 ; i < length ; i++ )
  //     result[ i ] = 0;
  //   }
  //
  // }
  // else
  // {

    if( _.routineIs( ins ) )
    {
      result = new ins( length );
    }
    else
    {
      result = new ins.constructor( length );
    }

    if( !_.bufferTypedIs( result ) && !_.bufferRawIs( result )  )
    for( let i = 0 ; i < length ; i++ )
    result[ i ] = 0;

  // }

  return result;
}

//

/**
 * Returns a copy of original array( array ) that contains elements from index( f ) to index( l ),
 * but not including ( l ).
 *
 * If ( l ) is omitted or ( l ) > ( array.length ), longSlice extracts through the end of the sequence ( array.length ).
 * If ( f ) > ( l ), end index( l ) becomes equal to begin index( f ).
 * If ( f ) < 0, zero is assigned to begin index( f ).

 * @param { Array/Buffer } array - Source array or buffer.
 * @param { Number } [ f = 0 ] f - begin zero-based index at which to begin extraction.
 * @param { Number } [ l = array.length ] l - end zero-based index at which to end extraction.
 *
 * @example
 * _.longSlice( [ 1, 2, 3, 4, 5, 6, 7 ], 2, 6 );
 * // returns [ 3, 4, 5, 6 ]
 *
 * @example
 * // begin index is less then zero
 * _.longSlice( [ 1, 2, 3, 4, 5, 6, 7 ], -1, 2 );
 * // returns [ 1, 2 ]
 *
 * @example
 * //end index is bigger then length of array
 * _.longSlice( [ 1, 2, 3, 4, 5, 6, 7 ], 5, 100 );
 * // returns [ 6, 7 ]
 *
 * @returns { Array } Returns a shallow copy of elements from the original array.
 * @function longSlice
 * @throws { Error } Will throw an Error if ( array ) is not an Array or Buffer.
 * @throws { Error } Will throw an Error if ( f ) is not a Number.
 * @throws { Error } Will throw an Error if ( l ) is not a Number.
 * @throws { Error } Will throw an Error if no arguments provided.
 * @memberof wTools
*/

function longSlice( array,f,l )
{
  let result;

  if( _.argumentsArrayIs( array ) )
  if( f === undefined && l === undefined )
  {
    if( array.length === 2 )
    return [ array[ 0 ],array[ 1 ] ];
    else if( array.length === 1 )
    return [ array[ 0 ] ];
    else if( array.length === 0 )
    return [];
  }

  _.assert( _.longIs( array ) );
  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( _.arrayLikeResizable( array ) )
  {
    _.assert( f === undefined || _.numberIs( f ) );
    _.assert( l === undefined || _.numberIs( l ) );
    result = array.slice( f,l );
    return result;
  }

  f = f !== undefined ? f : 0;
  l = l !== undefined ? l : array.length;

  _.assert( _.numberIs( f ) );
  _.assert( _.numberIs( l ) );

  if( f < 0 )
  f = array.length + f;
  if( l < 0 )
  l = array.length + l;

  if( f < 0 )
  f = 0;
  if( l > array.length )
  l = array.length;
  if( l < f )
  l = f;

  if( _.bufferTypedIs( array ) )
  result = new array.constructor( l-f );
  else
  result = new Array( l-f );

  for( let r = f ; r < l ; r++ )
  result[ r-f ] = array[ r ];

  return result;
}

//

function longButRange( src, range, ins )
{

  _.assert( _.longIs( src ) );
  _.assert( ins === undefined || _.longIs( ins ) );
  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( _.arrayIs( src ) )
  return _.arrayButRange( src, range, ins );

  let result;
  let range = _.rangeFrom( range );

  _.rangeClamp( range, [ 0, src.length ] );
  let d = range[ 1 ] - range[ 0 ];
  let l = src.length - d + ( ins ? ins.length : 0 );

  let result = _.longMakeSimilar( src, l );

  debugger;
  _.assert( 0,'not tested' )

  for( let i = 0 ; i < range[ 0 ] ; i++ )
  result[ i ] = src[ i ];

  for( let i = range[ 1 ] ; i < l ; i++ )
  result[ i-d ] = src[ i ];

  return result;

  // else if( _.bufferTypedIs( src ) )
  // result = _.bufferButRange( src, range, ins );
  // else _.assert( 0 );

  // if( size > src.byteLength )
  // {
  //   result = longMakeSimilar( src, size );
  //   let resultTyped = new Uint8Array( result,0,result.byteLength );
  //   let srcTyped = new Uint8Array( src,0,src.byteLength );
  //   resultTyped.set( srcTyped );
  // }
  // else if( size < src.byteLength )
  // {
  //   result = src.slice( 0,size );
  // }

  return result;
}

// // --
// // arguments array
// // --
//
// function argumentsArrayIs( src )
// {
//   return _ObjectToString.call( src ) === '[object Arguments]';
// }
//
// //
//
// function _argumentsArrayMake()
// {
//   return arguments;
// }
//
// //
//
// function argumentsArrayOfLength( length )
// {
//   debugger; xxx
//   let a = new Arguments( length );
//   return a;
// }
//
// //
//
// function argumentsArrayFrom( args )
// {
//   _.assert( arguments.length === 1, 'Expects single argument' );
//   if( _.argumentsArrayIs( args ) )
//   return args;
//   return _argumentsArrayMake.apply( this, args );
// }
//
// // --
// // unroll
// // --
//
// function unrollFrom( unrollMaybe )
// {
//   _.assert( arguments.length === 1 );
//   if( _.unrollIs( unrollMaybe ) )
//   return unrollMaybe;
//   return _.unrollAppend( null, unrollMaybe );
// }
//
// //
//
// function unrollPrepend( dstArray )
// {
//   _.assert( arguments.length >= 1 );
//   _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );
//
//   dstArray = dstArray || [];
//
//   for( let a = arguments.length - 1 ; a >= 1 ; a-- )
//   {
//     if( _.longIs( arguments[ a ] ) )
//     {
//       dstArray.unshift.apply( dstArray, arguments[ a ] );
//     }
//     else
//     {
//       dstArray.unshift( arguments[ a ] );
//     }
//   }
//
//   dstArray[ unrollSymbol ] = true;
//
//   return dstArray;
// }
//
// //
//
// function unrollAppend( dstArray )
// {
//   _.assert( arguments.length >= 1 );
//   _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );
//
//   dstArray = dstArray || [];
//
//   for( let a = 1, len = arguments.length ; a < len; a++ )
//   {
//     if( _.longIs( arguments[ a ] ) )
//     {
//       dstArray.push.apply( dstArray, arguments[ a ] );
//     }
//     else
//     {
//       dstArray.push( arguments[ a ] );
//     }
//   }
//
//   dstArray[ unrollSymbol ] = true;
//
//   return dstArray;
// }
//
// // --
// // array checker
// // --
//
// /**
//  * The arrayIs() routine determines whether the passed value is an Array.
//  *
//  * If the {-srcMap-} is an Array, true is returned,
//  * otherwise false is.
//  *
//  * @param { * } src - The object to be checked.
//  *
//  * @example
//  * // returns true
//  * arrayIs( [ 1, 2 ] );
//  *
//  * @example
//  * // returns false
//  * arrayIs( 10 );
//  *
//  * @returns { boolean } Returns true if {-srcMap-} is an Array.
//  * @function arrayIs
//  * @memberof wTools
//  */
//
// function arrayIs( src )
// {
//   return _ObjectToString.call( src ) === '[object Array]';
// }
//
// //
//
// function arrayLikeResizable( src )
// {
//   if( _ObjectToString.call( src ) === '[object Array]' )
//   return true;
//   return false;
// }
//
// //
//
// function arrayLike( src )
// {
//   if( _.arrayIs( src ) )
//   return true;
//   if( _.argumentsArrayIs( src ) )
//   return true;
//   return false;
// }
//
// //
//
// /**
//  * The longIs() routine determines whether the passed value is an array-like or an Array.
//  * Imortant : longIs returns false for Object, even if the object has length field.
//  *
//  * If {-srcMap-} is an array-like or an Array, true is returned,
//  * otherwise false is.
//  *
//  * @param { * } src - The object to be checked.
//  *
//  * @example
//  * // returns true
//  * longIs( [ 1, 2 ] );
//  *
//  * @example
//  * // returns false
//  * longIs( 10 );
//  *
//  * @example
//  * // returns true
//  * let isArr = ( function() {
//  *   return _.longIs( arguments );
//  * } )( 'Hello there!' );
//  *
//  * @returns { boolean } Returns true if {-srcMap-} is an array-like or an Array.
//  * @function longIs.
//  * @memberof wTools
//  */
//
// function longIs( src )
// {
//   if( _.primitiveIs( src ) )
//   return false;
//   if( _.routineIs( src ) )
//   return false;
//   if( _.objectIs( src ) )
//   return false;
//   if( _.strIs( src ) )
//   return false;
//
//   if( Object.propertyIsEnumerable.call( src, 'length' ) )
//   return false;
//   if( !_.numberIs( src.length ) )
//   return false;
//
//   return true;
// }
//
// //
//
// function unrollIs( src )
// {
//   if( !_.arrayIs( src ) )
//   return false;
//   return !!src[ unrollSymbol ];
// }
//
// //
//
// function constructorLikeArray( src )
// {
//   if( !src )
//   return false;
//
//   if( src === Function )
//   return false;
//   if( src === Object )
//   return false;
//   if( src === String )
//   return false;
//
//   if( _.primitiveIs( src ) )
//   return false;
//
//   if( !( 'length' in src.prototype ) )
//   return false;
//   if( Object.propertyIsEnumerable.call( src.prototype,'length' ) )
//   return false;
//
//   return true;
// }
//
// //
//
// /**
//  * The hasLength() routine determines whether the passed value has the property (length).
//  *
//  * If {-srcMap-} is equal to the (undefined) or (null) false is returned.
//  * If {-srcMap-} has the property (length) true is returned.
//  * Otherwise false is.
//  *
//  * @param { * } src - The object to be checked.
//  *
//  * @example
//  * // returns true
//  * hasLength( [ 1, 2 ] );
//  *
//  * @example
//  * // returns true
//  * hasLength( 'Hello there!' );
//  *
//  * @example
//  * // returns true
//  * let isLength = ( function() {
//  *   return _.hasLength( arguments );
//  * } )( 'Hello there!' );
//  *
//  * @example
//  * // returns false
//  * hasLength( 10 );
//  *
//  * @example
//  * // returns false
//  * hasLength( { } );
//  *
//  * @returns { boolean } Returns true if {-srcMap-} has the property (length).
//  * @function hasLength
//  * @memberof wTools
//  */
//
// function hasLength( src )
// {
//   if( src === undefined || src === null )
//   return false;
//   if( _.numberIs( src.length ) )
//   return true;
//   return false;
// }
//
// //
//
// function arrayHasArray( arr )
// {
//
//   if( !_.arrayLike( arr ) )
//   return false;
//
//   for( let a = 0 ; a < arr.length ; a += 1 )
//   if( _.arrayLike( arr[ a ] ) )
//   return true;
//
//   return false;
// }
//
// //
//
// /**
//  * The arrayCompare() routine returns the first difference between the values of the first array from the second.
//  *
//  * @param { longIs } src1 - The first array.
//  * @param { longIs } src2 - The second array.
//  *
//  * @example
//  * // returns 3
//  * let arr = _.arrayCompare( [ 1, 5 ], [ 1, 2 ] );
//  *
//  * @returns { Number } - Returns the first difference between the values of the two arrays.
//  * @function arrayCompare
//  * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
//  * @throws { Error } Will throw an Error if (src1 and src2) are not the array-like.
//  * @throws { Error } Will throw an Error if (src2.length) is less or not equal to the (src1.length).
//  * @memberof wTools
//  */
//
// function arrayCompare( src1,src2 )
// {
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.longIs( src1 ) && _.longIs( src2 ) );
//   _.assert( src2.length >= src1.length );
//
//   let result = 0;
//
//   for( let s = 0 ; s < src1.length ; s++ )
//   {
//
//     result = src1[ s ] - src2[ s ];
//     if( result !== 0 )
//     return result;
//
//   }
//
//   return result;
// }
//
// //
//
// /**
//  * The arrayIdentical() routine checks the equality of two arrays.
//  *
//  * @param { longIs } src1 - The first array.
//  * @param { longIs } src2 - The second array.
//  *
//  * @example
//  * // returns true
//  * let arr = _.arrayIdentical( [ 1, 2, 3 ], [ 1, 2, 3 ] );
//  *
//  * @returns { Boolean } - Returns true if all values of the two arrays are equal. Otherwise, returns false.
//  * @function arrayIdentical
//  * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
//  * @memberof wTools
//  */
//
// function arrayIdentical( src1,src2 )
// {
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.longIs( src1 ) );
//   _.assert( _.longIs( src2 ) );
//
//   let result = true;
//
//   if( src1.length !== src2.length )
//   return false;
//
//   for( let s = 0 ; s < src1.length ; s++ )
//   {
//
//     result = src1[ s ] === src2[ s ];
//
//     if( result === false )
//     return false;
//
//   }
//
//   return result;
// }
//
// //
//
// function arrayHas( array, value, evaluator1, evaluator2 )
// {
//   _.assert( 2 <= arguments.length && arguments.length <= 4 );
//   _.assert( _.arrayLike( array ) );
//
//   if( evaluator1 === undefined )
//   {
//     return _ArrayIndexOf.call( array, value ) !== -1;
//   }
//   else
//   {
//     if( _.arrayLeftIndex( array, value, evaluator1, evaluator2 ) >= 0 )
//     return true;
//     return false;
//   }
//
// }
//
// //
//
// /**
//  * The arrayHasAny() routine checks if the {-srcMap-} array has at least one value of the following arguments.
//  *
//  * It iterates over array-like (arguments[]) copies each argument to the array (ins) by the routine
//  * [arrayAs()]{@link wTools.arrayAs}
//  * Checks, if {-srcMap-} array has at least one value of the (ins) array.
//  * If true, it returns true.
//  * Otherwise, it returns false.
//  *
//  * @see {@link wTools.arrayAs} - See for more information.
//  *
//  * @param { longIs } src - The source array.
//  * @param {...*} arguments - One or more argument(s).
//  *
//  * @example
//  * // returns true
//  * let arr = _.arrayHasAny( [ 5, 'str', 42, false ], false, 7 );
//  *
//  * @returns { Boolean } - Returns true, if {-srcMap-} has at least one value of the following argument(s), otherwise false is returned.
//  * @function arrayHasAny
//  * @throws { Error } If the first argument in not an array.
//  * @memberof wTools
//  */
//
// function arrayHasAny( src )
// {
//   let empty = true;
//   empty = false;
//
//   _.assert( arguments.length >= 1, 'Expects at least one argument' );
//   _.assert( _.arrayLike( src ) || _.bufferTypedIs( src ),'arrayHasAny :','array expected' );
//
//   for( let a = 1 ; a < arguments.length ; a++ )
//   {
//     empty = false;
//
//     let ins = _.arrayAs( arguments[ a ] );
//     for( let i = 0 ; i < ins.length ; i++ )
//     {
//       if( src.indexOf( ins[ i ] ) !== -1 )
//       return true;
//     }
//
//   }
//
//   return empty;
// }
//
// //
//
// function arrayHasAll( src )
// {
//   _.assert( arguments.length >= 1, 'Expects at least one argument' );
//   _.assert( _.arrayLike( src ) || _.bufferTypedIs( src ),'arrayHasAll :','array expected' );
//
//   for( let a = 1 ; a < arguments.length ; a++ )
//   {
//
//     let ins = _.arrayAs( arguments[ a ] );
//     for( let i = 0 ; i < ins.length ; i++ )
//     if( src.indexOf( ins[ i ] ) === -1 )
//     return false;
//
//   }
//
//   return true;
// }
//
// //
//
// function arrayHasNone( src )
// {
//   _.assert( arguments.length >= 1, 'Expects at least one argument' );
//   _.assert( _.arrayLike( src ) || _.bufferTypedIs( src ),'arrayHasNone :','array expected' );
//
//   for( let a = 1 ; a < arguments.length ; a++ )
//   {
//
//     let ins = _.arrayAs( arguments[ a ] );
//     for( let i = 0 ; i < ins.length ; i++ )
//     if( src.indexOf( ins[ i ] ) !== -1 )
//     return false;
//
//   }
//
//   return true;
// }
//
// //
//
// function arrayAll( src )
// {
//
//   _.assert( arguments.length === 1, 'Expects single argument' );
//   _.assert( _.longIs( src ) );
//
//   for( let s = 0 ; s < src.length ; s += 1 )
//   {
//     if( !src[ s ] )
//     return false;
//   }
//
//   return true;
// }
//
// //
//
// function arrayAny( src )
// {
//   _.assert( arguments.length === 1, 'Expects single argument' );
//   _.assert( _.longIs( src ) );
//
//   debugger;
//   for( let s = 0 ; s < src.length ; s += 1 )
//   if( src[ s ] )
//   return true;
//
//   debugger;
//   return false;
// }
//
// //
//
// function arrayNone( src )
// {
//   _.assert( arguments.length === 1, 'Expects single argument' );
//   _.assert( _.longIs( src ) );
//
//   for( let s = 0 ; s < src.length ; s += 1 )
//   if( src[ s ] )
//   return false;
//
//   return true;
// }

// --
// array
// --

/*

alteration Routines :

- array { Op } { Tense } { How }
- array { Op } { Tense } Array { How }
- array { Op } { Tense } Arrays { How }
- arrayFlatten { Tense } { How }

alteration Op : Append , Prepend , Remove
alteration Tense : - , ed
alteration How : - , Once , OnceStrictly

// 60 routines

*/

// --
// array maker
// --

/**
 * The arrayMakeRandom() routine returns an array which contains random numbers.
 *
 * @param { Object } o - The options for getting random numbers.
 * @param { Number } o.length - The length of an array.
 * @param { Array } [ o.range = [ 0, 1 ] ] - The range of numbers.
 * @param { Boolean } [ o.int = false ] - Floating point numbers or not.
 *
 * @example
 * // returns [ 6, 2, 4, 7, 8 ]
 * let arr = _.arrayMakeRandom
 * ({
 *   length : 5,
 *   range : [ 1, 9 ],
 *   int : true,
 * });
 *
 * @returns { Array } - Returns an array of random numbers.
 * @function arrayMakeRandom
 * @memberof wTools
 */

function arrayMakeRandom( o )
{
  let result = [];

  if( _.numberIs( o ) )
  {
    o = { length : o };
  }

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( arrayMakeRandom,o );

  debugger;

  for( let i = 0 ; i < o.length ; i++ )
  {
    result[ i ] = o.range[ 0 ] + Math.random()*( o.range[ 1 ] - o.range[ 0 ] );
    if( o.int )
    result[ i ] = Math.floor( result[ i ] );
  }

  return result;
}

arrayMakeRandom.defaults =
{
  int : 0,
  range : [ 0,1 ],
  length : 1,
}

//

// /**
//  * The arrayNewOfSameLength() routine returns a new empty array
//  * or a new TypedArray with the same length as in (ins).
//  *
//  * @param { longIs } ins - The instance of an array.
//  *
//  * @example
//  * // returns [ , , , , ]
//  * let arr = _.arrayNewOfSameLength( [ 1, 2, 3, 4, 5 ] );
//  *
//  * @returns { longIs } - The new empty array with the same length as in (ins).
//  * @function arrayNewOfSameLength
//  * @throws { Error } If missed argument, or got more than one argument.
//  * @throws { Error } If the first argument in not array like object.
//  * @memberof wTools
//  */

// function arrayNewOfSameLength( ins )
// {
//
//   _.assert( arguments.length === 1, 'Expects single argument' );
//
//   if( _.primitiveIs( ins ) ) return;
//   if( !_.arrayIs( ins ) && !_.bufferTypedIs( ins ) ) return;
//   let result = longMakeSimilar( ins,ins.length );
//   return result;
// }

//

/**
 * The arrayFromNumber() routine returns a new array
 * which containing the static elements only type of Number.
 *
 * It takes two arguments (dst) and (length)
 * checks if the (dst) is a Number, If the (length) is greater than or equal to zero.
 * If true, it returns the new array of static (dst) numbers.
 * Otherwise, if the first argument (dst) is an Array,
 * and its (dst.length) is equal to the (length),
 * it returns the original (dst) Array.
 * Otherwise, it throws an Error.
 *
 * @param { ( Number | Array ) } dst - A number or an Array.
 * @param { Number } length - The length of the new array.
 *
 * @example
 * // returns [ 3, 3, 3, 3, 3, 3, 3 ]
 * let arr = _.arrayFromNumber( 3, 7 );
 *
 * @example
 * // returns [ 3, 7, 13 ]
 * let arr = _.arrayFromNumber( [ 3, 7, 13 ], 3 );
 *
 * @returns { Number[] | Array } - Returns the new array of static numbers or the original array.
 * @function arrayFromNumber
 * @throws { Error } If missed argument, or got less or more than two arguments.
 * @throws { Error } If type of the first argument is not a number or array.
 * @throws { Error } If the second argument is less than 0.
 * @throws { Error } If (dst.length) is not equal to the (length).
 * @memberof wTools
 */

function arrayFromNumber( dst,length )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.numberIs( dst ) || _.arrayIs( dst ),'Expects array of number as argument' );
  _.assert( length >= 0 );

  if( _.numberIs( dst ) )
  {
    dst = _.arrayFillTimes( [] , length , dst );
  }
  else
  {
    _.assert( dst.length === length,'Expects array of length',length,'but got',dst );
  }

  return dst;
}

//

/**
 * The arrayFrom() routine converts an object-like {-srcMap-} into Array.
 *
 * @param { * } src - To convert into Array.
 *
 * @example
 * // returns [ 3, 7, 13, 'abc', false, undefined, null, {} ]
 * _.arrayFrom( [ 3, 7, 13, 'abc', false, undefined, null, {} ] );
 *
 * @example
 * // returns [ [ 'a', 3 ], [ 'b', 7 ], [ 'c', 13 ] ]
 * _.arrayFrom( { a : 3, b : 7, c : 13 } );
 *
 * @example
 * // returns [ 3, 7, 13, 3.5, 5, 7.5, 13 ]
 * _.arrayFrom( "3, 7, 13, 3.5abc, 5def, 7.5ghi, 13jkl" );
 *
 * @example
 * // returns [ 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } ]
 * let args = ( function() {
 *   return arguments;
 * } )( 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } );
 * _.arrayFrom( args );
 *
 * @returns { Array } Returns an Array.
 * @function arrayFrom
 * @throws { Error } Will throw an Error if {-srcMap-} is not an object-like.
 * @memberof wTools
 */

function arrayFrom( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.arrayIs( src ) )
  return src;

  if( _.objectIs( src ) )
  return _.mapToArray( src );

  if( _.longIs( src ) )
  return _ArraySlice.call( src );

  if( _.strIs( src ) )
  return src.split(/[, ]+/).map( function( s ){ if( s.length ) return parseFloat(s); } );

  if( _.argumentsArrayIs( src ) )
  return _ArraySlice.call( src );

  _.assert( 0,'arrayFrom : unknown source : ' + _.strTypeOf( src ) );
}

//

/**
 * The arrayFromRange() routine generate array of arithmetic progression series,
 * from the range[ 0 ] to the range[ 1 ] with increment 1.
 *
 * It iterates over loop from (range[0]) to the (range[ 1 ] - range[ 0 ]),
 * and assigns to the each index of the (result) array (range[ 0 ] + 1).
 *
 * @param { longIs } range - The first (range[ 0 ]) and the last (range[ 1 ] - range[ 0 ]) elements of the progression.
 *
 * @example
 * // returns [ 1, 2, 3, 4 ]
 * let range = _.arrayFromRange( [ 1, 5 ] );
 *
 * @example
 * // returns [ 0, 1, 2, 3, 4 ]
 * let range = _.arrayFromRange( 5 );
 *
 * @returns { array } Returns an array of numbers for the requested range with increment 1.
 * May be an empty array if adding the step would not converge toward the end value.
 * @function arrayFromRange
 * @throws { Error } If passed arguments is less than one or more than one.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the length of the (range) is not equal to the two.
 * @memberof wTools
 */

function arrayFromRange( range )
{

  if( _.numberIs( range ) )
  range = [ 0,range ];

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( range.length === 2 );
  _.assert( _.longIs( range ) );

  let step = range[ 0 ] <= range[ 1 ] ? +1 : -1;

  return this.arrayFromRangeWithStep( range,step );
}

//

function arrayFromProgressionArithmetic( progression, numberOfSteps )
{
  let result;

  debugger;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( progression ) )
  _.assert( isFinite( progression[ 0 ] ) );
  _.assert( isFinite( progression[ 1 ] ) );
  _.assert( isFinite( numberOfSteps ) );
  _.assert( _.routineIs( this.ArrayType ) );

  debugger;

  if( numberOfSteps === 0 )
  return new this.ArrayType();

  if( numberOfSteps === 1 )
  return new this.ArrayType([ progression[ 0 ] ]);

  let range = [ progression[ 0 ],progression[ 0 ]+progression[ 1 ]*(numberOfSteps+1) ];
  let step = ( range[ 1 ]-range[ 0 ] ) / ( numberOfSteps-1 );

  return this.arrayFromRangeWithStep( range,step );
}

//

function arrayFromRangeWithStep( range,step )
{
  let result;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( isFinite( range[ 0 ] ) );
  _.assert( isFinite( range[ 1 ] ) );
  _.assert( step === undefined || step < 0 || step > 0 );
  _.assert( _.routineIs( this.ArrayType ) );

  if( range[ 0 ] === range[ 1 ] )
  return new this.ArrayType();

  if( range[ 0 ] < range[ 1 ] )
  {

    if( step === undefined )
    step = 1;

    _.assert( step > 0 );

    result = new this.ArrayType( Math.round( ( range[ 1 ]-range[ 0 ] ) / step ) );

    let i = 0;
    while( range[ 0 ] < range[ 1 ] )
    {
      result[ i ] = range[ 0 ];
      range[ 0 ] += step;
      i += 1;
    }

  }
  else
  {

    debugger;

    if( step === undefined )
    step = -1;

    _.assert( step < 0 );

    result = new this.ArrayType( Math.round( range[ 0 ]-range[ 1 ] / step ) );

    let i = 0;
    while( range[ 0 ] > range[ 1 ] )
    {
      result[ i ] = range[ 0 ];
      range[ 0 ] += step;
      i += 1;
    }

  }

  return result;
}

//

function arrayFromRangeWithNumberOfSteps( range , numberOfSteps )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( isFinite( range[ 0 ] ) );
  _.assert( isFinite( range[ 1 ] ) );
  _.assert( numberOfSteps >= 0 );
  _.assert( _.routineIs( this.ArrayType ) );

  if( numberOfSteps === 0 )
  return new this.ArrayType();

  if( numberOfSteps === 1 )
  return new this.ArrayType( range[ 0 ] );

  let step;

  if( range[ 0 ] < range[ 1 ] )
  step = ( range[ 1 ]-range[ 0 ] ) / (numberOfSteps-1);
  else
  step = ( range[ 0 ]-range[ 1 ] ) / (numberOfSteps-1);

  return this.arrayFromRangeWithStep( range , step );
}

//

/**
 * The arrayAs() routine copies passed argument to the array.
 *
 * @param { * } src - The source value.
 *
 * @example
 * // returns [ false ]
 * let arr = _.arrayAs( false );
 *
 * @example
 * // returns [ { a : 1, b : 2 } ]
 * let arr = _.arrayAs( { a : 1, b : 2 } );
 *
 * @returns { Array } - If passed null or undefined than return the empty array. If passed an array then return it.
 * Otherwise return an array which contains the element from argument.
 * @function arrayAs
 * @memberof wTools
 */

function arrayAs( src )
{
  _.assert( arguments.length === 1 );
  _.assert( src !== undefined );

  if( src === null )
  return [];
  else if( _.arrayLike( src ) )
  return src;
  else
  return [ src ];

}

//

function _longClone( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longIs( src ) || _.bufferAnyIs( src ) );
  _.assert( !_.bufferNodeIs( src ), 'not tested' );

  if( _.bufferViewIs( src ) )
  debugger;

  if( _.bufferRawIs( src ) )
  return new Uint8Array( new Uint8Array( src ) ).buffer;
  else if( _.bufferTypedIs( src ) || _.bufferNodeIs( src ) )
  return new src.constructor( src );
  else if( _.arrayIs( src ) )
  return src.slice();
  else if( _.bufferViewIs( src ) )
  return new src.constructor( src.buffer,src.byteOffset,src.byteLength );

  _.assert( 0, 'unknown kind of buffer', _.strTypeOf( src ) );
}

//

function longShallowClone()
{
  let result;
  let length = 0;

  if( arguments.length === 1 )
  {
    return _._longClone( arguments[ 0 ] );
  }

  /* eval length */

  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let argument = arguments[ a ];

    if( argument === undefined )
    throw _.err( 'longShallowClone','argument is not defined' );

    if( _.longIs( argument ) ) length += argument.length;
    else if( _.bufferRawIs( argument ) ) length += argument.byteLength;
    else length += 1;
  }

  /* make result */

  if( _.arrayIs( arguments[ 0 ] ) || _.bufferTypedIs( arguments[ 0 ] ) )
  result = longMakeSimilar( arguments[ 0 ],length );
  else if( _.bufferRawIs( arguments[ 0 ] ) )
  result = new ArrayBuffer( length );

  let bufferDst;
  let offset = 0;
  if( _.bufferRawIs( arguments[ 0 ] ) )
  {
    bufferDst = new Uint8Array( result );
  }

  /* copy */

  for( let a = 0, c = 0 ; a < arguments.length ; a++ )
  {
    let argument = arguments[ a ];
    if( _.bufferRawIs( argument ) )
    {
      bufferDst.set( new Uint8Array( argument ), offset );
      offset += argument.byteLength;
    }
    else if( _.bufferTypedIs( arguments[ 0 ] ) )
    {
      result.set( argument, offset );
      offset += argument.length;
    }
    else if( _.longIs( argument ) )
    for( let i = 0 ; i < argument.length ; i++ )
    {
      result[ c ] = argument[ i ];
      c += 1;
    }
    else
    {
      result[ c ] = argument;
      c += 1;
    }
  }

  return result;
}

// --
// array converter
// --

/**
 * The arrayToMap() converts an (array) into Object.
 *
 * @param { longIs } array - To convert into Object.
 *
 * @example
 * // returns {  }
 * _.arrayToMap( [  ] );
 *
 * @example
 * // returns { '0' : 3, '1' : [ 1, 2, 3 ], '2' : 'abc', '3' : false, '4' : undefined, '5' : null, '6' : {} }
 * _.arrayToMap( [ 3, [ 1, 2, 3 ], 'abc', false, undefined, null, {} ] );
 *
 * @example
 * // returns { '0' : 3, '1' : 'abc', '2' : false, '3' : undefined, '4' : null, '5' : { greeting: 'Hello there!' } }
 * let args = ( function() {
 *   return arguments;
 * } )( 3, 'abc', false, undefined, null, { greeting: 'Hello there!' } );
 * _.arrayToMap( args );
 *
 * @returns { Object } Returns an Object.
 * @function arrayToMap
 * @throws { Error } Will throw an Error if (array) is not an array-like.
 * @memberof wTools
 */

function arrayToMap( array )
{
  let result = Object.create( null );

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longIs( array ) );

  for( let a = 0 ; a < array.length ; a++ )
  result[ a ] = array[ a ];
  return result;
}

//

/**
 * The arrayToStr() routine joins an array {-srcMap-} and returns one string containing each array element separated by space,
 * only types of integer or floating point.
 *
 * @param { longIs } src - The source array.
 * @param { objectLike } [ options = {  } ] options - The options.
 * @param { Number } [ options.precision = 5 ] - The precision of numbers.
 * @param { String } [ options.type = 'mixed' ] - The type of elements.
 *
 * @example
 * // returns "1 2 3 "
 * _.arrayToStr( [ 1, 2, 3 ], { type : 'int' } );
 *
 * @example
 * // returns "3.500 13.77 7.330"
 * _.arrayToStr( [ 3.5, 13.77, 7.33 ], { type : 'float', precission : 4 } );
 *
 * @returns { String } Returns one string containing each array element separated by space,
 * only types of integer or floating point.
 * If (src.length) is empty, it returns the empty string.
 * @function arrayToStr
 * @throws { Error } Will throw an Error If (options.type) is not the number or float.
 * @memberof wTools
 */

function arrayToStr( src,options )
{

  let result = '';
  options = options || Object.create( null );

  if( options.precission === undefined ) options.precission = 5;
  if( options.type === undefined ) options.type = 'mixed';

  if( !src.length ) return result;

  if( options.type === 'float' )
  {
    for( var s = 0 ; s < src.length-1 ; s++ )
    {
      result += src[ s ].toPrecision( options.precission ) + ' ';
    }
    result += src[ s ].toPrecision( options.precission );
  }
  else if( options.type === 'int' )
  {
    for( var s = 0 ; s < src.length-1 ; s++ )
    {
      result += String( src[ s ] ) + ' ';
    }
    result += String( src[ s ] ) + ' ';
  }
  else
  {
    throw _.err( 'not tested' );
    for( let s = 0 ; s < src.length-1 ; s++ )
    {
      result += String( src[ s ] ) + ' ';
    }
    result += String( src[ s ] ) + ' ';
  }

  return result;
}

// --
// array transformer
// --

/**
 * The arraySub() routine returns a shallow copy of a portion of an array
 * or a new TypedArray that contains
 * the elements from (begin) index to the (end) index,
 * but not including (end).
 *
 * @param { Array } src - Source array.
 * @param { Number } begin - Index at which to begin extraction.
 * @param { Number } end - Index at which to end extraction.
 *
 * @example
 * // returns [ 3, 4 ]
 * let arr = _.arraySub( [ 1, 2, 3, 4, 5 ], 2, 4 );
 *
 * @example
 * // returns [ 2, 3 ]
 * _.arraySub( [ 1, 2, 3, 4, 5 ], -4, -2 );
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5 ]
 * _.arraySub( [ 1, 2, 3, 4, 5 ] );
 *
 * @returns { Array } - Returns a shallow copy of a portion of an array into a new Array.
 * @function arraySub
 * @throws { Error } If the passed arguments is more than three.
 * @throws { Error } If the first argument is not an array.
 * @memberof wTools
 */

/* xxx : not array */
function arraySub( src,begin,end )
{

  _.assert( arguments.length <= 3 );
  _.assert( _.longIs( src ),'unknown type of (-src-) argument' );
  _.assert( _.routineIs( src.slice ) || _.routineIs( src.subarray ) );

  if( _.routineIs( src.subarray ) )
  return src.subarray( begin,end );

  return src.slice( begin,end );
}

//

function arrayButRange( src, range, ins )
{
  _.assert( _.arrayLikeResizable( src ) );
  _.assert( ins === undefined || _.longIs( ins ) );
  _.assert( arguments.length === 2 || arguments.length === 3 );

  let args = [ range[ 0 ], range[ 1 ]-range[ 0 ] ];

  if( ins )
  _.arrayAppendArray( args, ins );

  let result = src.slice();
  result.splice.apply( result, args );
  return result;
}

//

/* qqq : requires good test coverage */

function arraySlice( srcArray,f,l )
{

  _.assert( _.arrayLikeResizable( srcArray ) );
  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  return srcArray.slice( f,l );
}

//

/**
 * Changes length of provided array( array ) by copying it elements to newly created array using begin( f ),
 * end( l ) positions of the original array and value to fill free space after copy( val ). Length of new array is equal to ( l ) - ( f ).
 * If ( l ) < ( f ) - value of index ( f ) will be assigned to ( l ).
 * If ( l ) === ( f ) - returns empty array.
 * If ( l ) > ( array.length ) - returns array that contains elements with indexies from ( f ) to ( array.length ),
 * and free space filled by value of ( val ) if it was provided.
 * If ( l ) < ( array.length ) - returns array that contains elements with indexies from ( f ) to ( l ).
 * If ( l ) < 0 and ( l ) > ( f ) - returns array filled with some amount of elements with value of argument( val ).
 * If ( f ) < 0 - prepends some number of elements with value of argument( let ) to the result array.
 * @param { Array/Buffer } array - source array or buffer;
 * @param { Number } [ f = 0 ] - index of a first element to copy into new array;
 * @param { Number } [ l = array.length ] - index of a last element to copy into new array;
 * @param { * } val - value used to fill the space left after copying elements of the original array.
 *
 * @example
 * //Just partial copy of origin array
 * let arr = [ 1, 2, 3, 4 ]
 * let result = _.arrayGrow( arr, 0, 2 );
 * console.log( result );
 * //[ 1, 2 ]
 *
 * @example
 * //Increase size, fill empty with zeroes
 * let arr = [ 1 ]
 * let result = _.arrayGrow( arr, 0, 5, 0 );
 * console.log( result );
 * //[ 1, 0, 0, 0, 0 ]
 *
 * @example
 * //Take two last elements from original, other fill with zeroes
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayGrow( arr, 3, 8, 0 );
 * console.log( result );
 * //[ 4, 5, 0, 0, 0 ]
 *
 * @example
 * //Add two zeroes at the beginning
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayGrow( arr, -2, arr.length, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5 ]
 *
 * @example
 * //Add two zeroes at the beginning and two at end
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayGrow( arr, -2, arr.length + 2, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5, 0, 0 ]
 *
 * @example
 * //Source can be also a Buffer
 * let buffer = Buffer.from( '123' );
 * let result = _.arrayGrow( buffer, 0, buffer.length + 2, 0 );
 * console.log( result );
 * //[ 49, 50, 51, 0, 0 ]
 *
 * @returns { Array } Returns resized copy of a part of an original array.
 * @function arrayGrow
 * @throws { Error } Will throw an Error if( array ) is not a Array or Buffer.
 * @throws { Error } Will throw an Error if( f ) or ( l ) is not a Number.
 * @throws { Error } Will throw an Error if not enough arguments provided.
 * @memberof wTools
 */

function arrayGrow( array,f,l,val )
{

  let result;

  f = f !== undefined ? f : 0;
  l = l !== undefined ? l : array.length;

  _.assert( _.longIs( array ) );
  _.assert( _.numberIs( f ) );
  _.assert( _.numberIs( l ) );
  _.assert( 1 <= arguments.length && arguments.length <= 4 );

  if( l < f )
  l = f;

  if( _.bufferTypedIs( array ) )
  result = new array.constructor( l-f );
  else
  result = new Array( l-f );

  /* */

  let lsrc = Math.min( array.length,l );
  for( let r = Math.max( f,0 ) ; r < lsrc ; r++ )
  result[ r-f ] = array[ r ];

  /* */

  if( val !== undefined )
  {
    for( let r = 0 ; r < -f ; r++ )
    {
      result[ r ] = val;
    }
    for( let r = lsrc - f; r < result.length ; r++ )
    {
      result[ r ] = val;
    }
  }

  return result;
}

//

/**
 * Routine performs two operations: slice and grow.
 * "Slice" means returning a copy of original array( array ) that contains elements from index( f ) to index( l ),
 * but not including ( l ).
 * "Grow" means returning a bigger copy of original array( array ) with free space supplemented by elements with value of ( val )
 * argument.
 *
 * Returns result of operation as new array with same type as original array, original array is not modified.
 *
 * If ( f ) > ( l ), end index( l ) becomes equal to begin index( f ).
 * If ( l ) === ( f ) - returns empty array.
 *
 * To run "Slice", first ( f ) and last ( l ) indexes must be in range [ 0, array.length ], otherwise routine will run "Grow" operation.
 *
 * Rules for "Slice":
 * If ( f ) >= 0  and ( l ) <= ( array.length ) - returns array that contains elements with indexies from ( f ) to ( l ) but not including ( l ).
 *
 * Rules for "Grow":
 *
 * If ( f ) < 0 - prepends some number of elements with value of argument( val ) to the result array.
 * If ( l ) > ( array.length ) - returns array that contains elements with indexies from ( f ) to ( array.length ),
 * and free space filled by value of ( val ) if it was provided.
 * If ( l ) < 0, ( l ) > ( f ) - returns array filled with some amount of elements with value of argument( val ).
 *
 * @param { Array/Buffer } array - Source array or buffer.
 * @param { Number } [ f = 0 ] f - begin zero-based index at which to begin extraction.
 * @param { Number } [ l = array.length ] l - end zero-based index at which to end extraction.
 * @param { * } val - value used to fill the space left after copying elements of the original array.
 *
 * @example
 * _.arrayResize( [ 1, 2, 3, 4, 5, 6, 7 ], 2, 6 );
 * // returns [ 3, 4, 5, 6 ]
 *
 * @example
 * // begin index is less then zero
 * _.arrayResize( [ 1, 2, 3, 4, 5, 6, 7 ], -1, 2 );
 * // returns [ 1, 2 ]
 *
 * @example
 * //end index is bigger then length of array
 * _.arrayResize( [ 1, 2, 3, 4, 5, 6, 7 ], 5, 100 );
 * // returns [ 6, 7 ]
 *
 * @example
 * //Increase size, fill empty with zeroes
 * let arr = [ 1 ]
 * let result = _.arrayResize( arr, 0, 5, 0 );
 * console.log( result );
 * //[ 1, 0, 0, 0, 0 ]
 *
 * @example
 * //Take two last elements from original, other fill with zeroes
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayResize( arr, 3, 8, 0 );
 * console.log( result );
 * //[ 4, 5, 0, 0, 0 ]
 *
 * @example
 * //Add two zeroes at the beginning
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayResize( arr, -2, arr.length, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5 ]
 *
 * @example
 * //Add two zeroes at the beginning and two at end
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayResize( arr, -2, arr.length + 2, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5, 0, 0 ]
 *
 * @example
 * //Source can be also a Buffer
 * let buffer = Buffer.from( '123' );
 * let result = _.arrayResize( buffer, 0, buffer.length + 2, 0 );
 * console.log( result );
 * //[ 49, 50, 51, 0, 0 ]
 *
 * @returns { Array } Returns a shallow copy of elements from the original array supplemented with value of( val ) if needed.
 * @function arrayResize
 * @throws { Error } Will throw an Error if ( array ) is not an Array-like or Buffer.
 * @throws { Error } Will throw an Error if ( f ) is not a Number.
 * @throws { Error } Will throw an Error if ( l ) is not a Number.
 * @throws { Error } Will throw an Error if no arguments provided.
 * @memberof wTools
*/

function arrayResize( array,f,l,val )
{
  _.assert( _.longIs( array ) );

  let result;

  f = f !== undefined ? f : 0;
  l = l !== undefined ? l : array.length;

  _.assert( _.numberIs( f ) );
  _.assert( _.numberIs( l ) );
  _.assert( 1 <= arguments.length && arguments.length <= 4 );

  if( l < f )
  l = f;
  let lsrc = Math.min( array.length,l );

  if( _.bufferTypedIs( array ) )
  result = new array.constructor( l-f );
  else
  result = new Array( l-f );

  for( let r = Math.max( f,0 ) ; r < lsrc ; r++ )
  result[ r-f ] = array[ r ];

  if( val !== undefined )
  if( f < 0 || l > array.length )
  {
    for( let r = 0 ; r < -f ; r++ )
    {
      result[ r ] = val;
    }
    let r = Math.max( lsrc-f, 0 );
    for( ; r < result.length ; r++ )
    {
      result[ r ] = val;
    }
  }

  return result;
}

//

/* srcBuffer = _.arrayMultislice( [ originalBuffer,f ],[ originalBuffer,0,srcAttribute.atomsPerElement ] ); */

function arrayMultislice()
{
  let length = 0;

  if( arguments.length === 0 )
  return [];

  for( let a = 0 ; a < arguments.length ; a++ )
  {

    let src = arguments[ a ];
    let f = src[ 1 ];
    let l = src[ 2 ];

    _.assert( _.longIs( src ) && _.longIs( src[ 0 ] ),'Expects array of array' );
    f = f !== undefined ? f : 0;
    l = l !== undefined ? l : src[ 0 ].length;
    if( l < f )
    l = f;

    _.assert( _.numberIs( f ) );
    _.assert( _.numberIs( l ) );

    src[ 1 ] = f;
    src[ 2 ] = l;

    length += l-f;

  }

  let result = new arguments[ 0 ][ 0 ].constructor( length );
  let r = 0;

  for( let a = 0 ; a < arguments.length ; a++ )
  {

    let src = arguments[ a ];
    let f = src[ 1 ];
    let l = src[ 2 ];

    for( let i = f ; i < l ; i++, r++ )
    result[ r ] = src[ 0 ][ i ];

  }

  return result;
}

//

/**
 * The arrayDuplicate() routine returns an array with duplicate values of a certain number of times.
 *
 * @param { objectLike } [ o = {  } ] o - The set of arguments.
 * @param { longIs } o.src - The given initial array.
 * @param { longIs } o.result - To collect all data.
 * @param { Number } [ o.numberOfAtomsPerElement = 1 ] o.numberOfAtomsPerElement - The certain number of times
 * to append the next value from (srcArray or o.src) to the (o.result).
 * If (o.numberOfAtomsPerElement) is greater that length of a (srcArray or o.src) it appends the 'undefined'.
 * @param { Number } [ o.numberOfDuplicatesPerElement = 2 ] o.numberOfDuplicatesPerElement = 2 - The number of duplicates per element.
 *
 * @example
 * // returns [ 'a', 'a', 'b', 'b', 'c', 'c' ]
 * _.arrayDuplicate( [ 'a', 'b', 'c' ] );
 *
 * @example
 * // returns [ 'abc', 'def', 'abc', 'def', 'abc', 'def' ]
 * let options = {
 *   src : [ 'abc', 'def' ],
 *   result : [  ],
 *   numberOfAtomsPerElement : 2,
 *   numberOfDuplicatesPerElement : 3
 * };
 * _.arrayDuplicate( options, {} );
 *
 * @example
 * // returns [ 'abc', 'def', undefined, 'abc', 'def', undefined, 'abc', 'def', undefined ]
 * let options = {
 *   src : [ 'abc', 'def' ],
 *   result : [  ],
 *   numberOfAtomsPerElement : 3,
 *   numberOfDuplicatesPerElement : 3
 * };
 * _.arrayDuplicate( options, { a : 7, b : 13 } );
 *
 * @returns { Array } Returns an array with duplicate values of a certain number of times.
 * @function arrayDuplicate
 * @throws { Error } Will throw an Error if ( o ) is not an objectLike.
 * @memberof wTools
 */

function arrayDuplicate( o )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( arguments.length === 2 )
  {
    o = { src : arguments[ 0 ], numberOfDuplicatesPerElement : arguments[ 1 ] };
  }
  else
  {
    if( !_.objectIs( o ) )
    o = { src : o };
  }

  _.assert( _.numberIs( o.numberOfDuplicatesPerElement ) || o.numberOfDuplicatesPerElement === undefined );
  _.routineOptions( arrayDuplicate,o );
  _.assert( _.longIs( o.src ), 'arrayDuplicate expects o.src as longIs entity' );
  _.assert( _.numberIsInt( o.src.length / o.numberOfAtomsPerElement ) );

  if( o.numberOfDuplicatesPerElement === 1 )
  {
    if( o.result )
    {
      _.assert( _.longIs( o.result ) || _.bufferTypedIs( o.result ), 'Expects o.result as longIs or TypedArray if numberOfDuplicatesPerElement equals 1' );

      if( _.bufferTypedIs( o.result ) )
      o.result = _.longShallowClone( o.result, o.src );
      else if( _.longIs( o.result ) )
      o.result.push.apply( o.result, o.src );
    }
    else
    {
      o.result = o.src;
    }
    return o.result;
  }

  let length = o.src.length * o.numberOfDuplicatesPerElement;
  let numberOfElements = o.src.length / o.numberOfAtomsPerElement;

  if( o.result )
  _.assert( o.result.length >= length );

  o.result = o.result || longMakeSimilar( o.src,length );

  let rlength = o.result.length;

  for( let c = 0, cl = numberOfElements ; c < cl ; c++ )
  {

    for( let d = 0, dl = o.numberOfDuplicatesPerElement ; d < dl ; d++ )
    {

      for( let e = 0, el = o.numberOfAtomsPerElement ; e < el ; e++ )
      {
        let indexDst = c*o.numberOfAtomsPerElement*o.numberOfDuplicatesPerElement + d*o.numberOfAtomsPerElement + e;
        let indexSrc = c*o.numberOfAtomsPerElement+e;
        o.result[ indexDst ] = o.src[ indexSrc ];
      }

    }

  }

  _.assert( o.result.length === rlength );

  return o.result;
}

arrayDuplicate.defaults =
{
  src : null,
  result : null,
  numberOfAtomsPerElement : 1,
  numberOfDuplicatesPerElement : 2,
}

//

/**
 * The arrayMask() routine returns a new instance of array that contains the certain value(s) from array (srcArray),
 * if an array (mask) contains the truth-value(s).
 *
 * The arrayMask() routine checks, how much an array (mask) contain the truth value(s),
 * and from that amount of truth values it builds a new array, that contains the certain value(s) of an array (srcArray),
 * by corresponding index(es) (the truth value(s)) of the array (mask).
 * If amount is equal 0, it returns an empty array.
 *
 * @param { longIs } srcArray - The source array.
 * @param { longIs } mask - The target array.
 *
 * @example
 * // returns [  ]
 * _.arrayMask( [ 1, 2, 3, 4 ], [ undefined, null, 0, '' ] );
 *
 * @example
 * // returns [ "c", 4, 5 ]
 * _arrayMask( [ 'a', 'b', 'c', 4, 5 ], [ 0, '', 1, 2, 3 ] );
 *
 * @example
 * // returns [ 'a', 'b', 5, 'd' ]
 * _.arrayMask( [ 'a', 'b', 'c', 4, 5, 'd' ], [ 3, 7, 0, '', 13, 33 ] );
 *
 * @returns { longIs } Returns a new instance of array that contains the certain value(s) from array (srcArray),
 * if an array (mask) contains the truth-value(s).
 * If (mask) contains all falsy values, it returns an empty array.
 * Otherwise, it returns a new array with certain value(s) of an array (srcArray).
 * @function arrayMask
 * @throws { Error } Will throw an Error if (arguments.length) is less or more that two.
 * @throws { Error } Will throw an Error if (srcArray) is not an array-like.
 * @throws { Error } Will throw an Error if (mask) is not an array-like.
 * @throws { Error } Will throw an Error if length of both (srcArray and mask) is not equal.
 * @memberof wTools
 */

function arrayMask( srcArray, mask )
{

  let atomsPerElement = mask.length;
  let length = srcArray.length / atomsPerElement;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( srcArray ),'arrayMask :','Expects array-like as srcArray' );
  _.assert( _.longIs( mask ),'arrayMask :','Expects array-like as mask' );
  _.assert
  (
    _.numberIsInt( length ),
    'arrayMask :','Expects mask that has component for each atom of srcArray',
    _.toStr
    ({
      'atomsPerElement' : atomsPerElement,
      'srcArray.length' : srcArray.length,
    })
  );

  let preserve = 0;
  for( let m = 0 ; m < mask.length ; m++ )
  if( mask[ m ] )
  preserve += 1;

  let dstArray = new srcArray.constructor( length*preserve );

  if( !preserve )
  return dstArray;

  let c = 0;
  for( let i = 0 ; i < length ; i++ )
  for( let m = 0 ; m < mask.length ; m++ )
  if( mask[ m ] )
  {
    dstArray[ c ] = srcArray[ i*atomsPerElement + m ];
    c += 1;
  }

  return dstArray;
}

//

function arrayUnmask( o )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( arguments.length === 2 )
  o =
  {
    src : arguments[ 0 ],
    mask : arguments[ 1 ],
  }

  _.assertMapHasOnly( o,arrayUnmask.defaults );
  _.assert( _.longIs( o.src ),'arrayUnmask : expects o.src as ArrayLike' );

  let atomsPerElement = o.mask.length;

  let atomsPerElementPreserved = 0;
  for( let m = 0 ; m < o.mask.length ; m++ )
  if( o.mask[ m ] )
  atomsPerElementPreserved += 1;

  let length = o.src.length / atomsPerElementPreserved;
  if( Math.floor( length ) !== length )
  throw _.err( 'arrayMask :','Expects mask that has component for each atom of o.src',_.toStr({ 'atomsPerElementPreserved' : atomsPerElementPreserved, 'o.src.length' : o.src.length  }) );

  let dstArray = new o.src.constructor( atomsPerElement*length );

  let e = [];
  for( let i = 0 ; i < length ; i++ )
  {

    for( let m = 0, p = 0 ; m < o.mask.length ; m++ )
    if( o.mask[ m ] )
    {
      e[ m ] = o.src[ i*atomsPerElementPreserved + p ];
      p += 1;
    }
    else
    {
      e[ m ] = 0;
    }

    if( o.onEach )
    o.onEach( e,i );

    for( let m = 0 ; m < o.mask.length ; m++ )
    dstArray[ i*atomsPerElement + m ] = e[ m ];

  }

  return dstArray;
}

arrayUnmask.defaults =
{
  src : null,
  mask : null,
  onEach : null,
}

//

function arrayInvestigateUniqueMap( o )
{

  if( _.longIs( o ) )
  o = { src : o };

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longIs( o.src ) );
  _.assertMapHasOnly( o,arrayInvestigateUniqueMap.defaults );

  /**/

  if( o.onEvaluate )
  {
    o.src = _.entityMap( o.src,( e ) => o.onEvaluate( e ) );
  }

  /**/

  let number = o.src.length;
  let isUnique = _.longMakeSimilar( o.src );
  let index;

  for( let i = 0 ; i < o.src.length ; i++ )
  isUnique[ i ] = 1;

  for( let i = 0 ; i < o.src.length ; i++ )
  {

    index = i;

    if( !isUnique[ i ] )
    continue;

    let currentUnique = 1;
    do
    {
      index = o.src.indexOf( o.src[ i ],index+1 );
      if( index !== -1 )
      {
        isUnique[ index ] = 0;
        number -= 1;
        currentUnique = 0;
      }
    }
    while( index !== -1 );

    if( !o.includeFirst )
    if( !currentUnique )
    {
      isUnique[ i ] = 0;
      number -= 1;
    }

  }

  return { number : number, array : isUnique };
}

arrayInvestigateUniqueMap.defaults =
{
  src : null,
  onEvaluate : null,
  includeFirst : 0,
}

//

function arrayUnique( src, onEvaluate )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  let isUnique = arrayInvestigateUniqueMap
  ({
    src : src,
    onEvaluate : onEvaluate,
    includeFirst : 1,
  });

  let result = longMakeSimilar( src,isUnique.number );

  let c = 0;
  for( let i = 0 ; i < src.length ; i++ )
  if( isUnique.array[ i ] )
  {
    result[ c ] = src[ i ];
    c += 1;
  }

  return result;
}

//

/**
 * The arraySelect() routine selects elements from (srcArray) by indexes of (indicesArray).
 *
 * @param { longIs } srcArray - Values for the new array.
 * @param { ( longIs | object ) } [ indicesArray = indicesArray.indices ] - Indexes of elements from the (srcArray) or options object.
 *
 * @example
 * // returns [ 3, 4, 5 ]
 * let arr = _.arraySelect( [ 1, 2, 3, 4, 5 ], [ 2, 3, 4 ] );
 *
 * @example
 * // returns [ undefined, undefined ]
 * let arr = _.arraySelect( [ 1, 2, 3 ], [ 4, 5 ] );
 *
 * @returns { longIs } - Returns a new array with the length equal (indicesArray.length) and elements from (srcArray).
   If there is no element with necessary index than the value will be undefined.
 * @function arraySelect
 * @throws { Error } If passed arguments is not array like object.
 * @throws { Error } If the atomsPerElement property is not equal to 1.
 * @memberof wTools
 */

function arraySelect( srcArray,indicesArray )
{
  let atomsPerElement = 1;

  if( _.objectIs( indicesArray ) )
  {
    atomsPerElement = indicesArray.atomsPerElement || 1;
    indicesArray = indicesArray.indices;
  }

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.bufferTypedIs( srcArray ) || _.arrayIs( srcArray ) );
  _.assert( _.bufferTypedIs( indicesArray ) || _.arrayIs( indicesArray ) );

  let result = new srcArray.constructor( indicesArray.length );

  if( atomsPerElement === 1 )
  for( let i = 0, l = indicesArray.length ; i < l ; i += 1 )
  {
    result[ i ] = srcArray[ indicesArray[ i ] ];
  }
  else
  for( let i = 0, l = indicesArray.length ; i < l ; i += 1 )
  {
    // throw _.err( 'not tested' );
    for( let a = 0 ; a < atomsPerElement ; a += 1 )
    result[ i*atomsPerElement+a ] = srcArray[ indicesArray[ i ]*atomsPerElement+a ];
  }

  return result;
}

// --
// array mutator
// --

function arraySet( dst, index, value )
{
  _.assert( arguments.length === 3, 'Expects exactly three argument' );
  _.assert( dst.length > index );
  dst[ index ] = value;
  return dst;
}

//

/**
 * The arraySwap() routine reverses the elements by indices (index1) and (index2) in the (dst) array.
 *
 * @param { Array } dst - The initial array.
 * @param { Number } index1 - The first index.
 * @param { Number } index2 - The second index.
 *
 * @example
 * // returns [ 5, 2, 3, 4, 1 ]
 * let arr = _.arraySwap( [ 1, 2, 3, 4, 5 ], 0, 4 );
 *
 * @returns { Array } - Returns the (dst) array that has been modified in place by indexes (index1) and (index2).
 * @function arraySwap
 * @throws { Error } If the first argument in not an array.
 * @throws { Error } If the second argument is less than 0 and more than a length initial array.
 * @throws { Error } If the third argument is less than 0 and more than a length initial array.
 * @memberof wTools
 */

function arraySwap( dst,index1,index2 )
{

  if( arguments.length === 1 )
  {
    index1 = 0;
    index2 = 1;
  }

  _.assert( arguments.length === 1 || arguments.length === 3 );
  _.assert( _.longIs( dst ),'arraySwap :','argument must be array' );
  _.assert( 0 <= index1 && index1 < dst.length,'arraySwap :','index1 is out of bound' );
  _.assert( 0 <= index2 && index2 < dst.length,'arraySwap :','index2 is out of bound' );

  let e = dst[ index1 ];
  dst[ index1 ] = dst[ index2 ];
  dst[ index2 ] = e;

  return dst;
}

//

/**
 * Removes range( range ) of elements from provided array( dstArray ) and adds elements from array( srcArray )
 * at the start position of provided range( range ) if( srcArray ) was provided.
 * On success returns array with deleted element(s), otherwise returns empty array.
 * For TypedArray's and buffers returns modified copy of ( dstArray ) or original array if nothing changed.
 *
 * @param { Array|TypedArray|Buffer } dstArray - The target array, TypedArray( Int8Array,Int16Array,Uint8Array ... etc ) or Buffer( ArrayBuffer, Buffer ).
 * @param { Array|Number } range - The range of elements or index of single element to remove from ( dstArray ).
 * @param { Array } srcArray - The array of elements to add to( dstArray ) at the start position of provided range( range ).
 * If one of ( range ) indexies is not specified it will be setted to zero.
 * If ( range ) start index is greater than the length of the array ( dstArray ), actual starting index will be set to the length of the array ( dstArray ).
 * If ( range ) start index is negative, will be setted to zero.
 * If ( range ) start index is greater than end index, the last will be setted to value of start index.
 *
 * @example
 * _.arrayCutin( [ 1, 2, 3, 4 ], 2 );
 * // returns [ 3 ]
 *
 * @example
 * _.arrayCutin( [ 1, 2, 3, 4 ], [ 1, 2 ] );
 * // returns [ 2 ]
 *
 * @example
 * _.arrayCutin( [ 1, 2, 3, 4 ], [ 0, 5 ] );
 * // returns [ 1, 2, 3, 4 ]
 *
 * @example
 * _.arrayCutin( [ 1, 2, 3, 4 ], [ -1, 5 ] );
 * // returns [ 1, 2, 3, 4 ]
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayCutin( dst, [ 0, 3 ], [ 0, 0, 0 ] );
 * console.log( dst );
 * // returns [ 0, 0, 0, 4 ]
 *
 * @example
 * let dst = new Int32Array( 4 );
 * dst.set( [ 1, 2, 3, 4 ] )
 * _.arrayCutin( dst, 0 );
 * // returns [ 2, 3, 4 ]
 *
 * @returns { Array|TypedArray|Buffer } For array returns array with deleted element(s), otherwise returns empty array.
 * For other types returns modified copy or origin( dstArray ).
 * @function arrayCutin
 * @throws { Error } If ( arguments.length ) is not equal to two or three.
 * @throws { Error } If ( dstArray ) is not an Array.
 * @throws { Error } If ( srcArray ) is not an Array.
 * @throws { Error } If ( range ) is not an Array.
 * @memberof wTools
 */

function arrayCutin( dstArray, range, srcArray )
{

  if( _.numberIs( range ) )
  range = [ range, range + 1 ];

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
  _.assert( _.arrayIs( dstArray ) || _.bufferAnyIs( dstArray ) );
  _.assert( _.arrayIs( range ) );
  _.assert( srcArray === undefined || _.arrayIs( srcArray ) );

  let length = _.definedIs( dstArray.length ) ? dstArray.length : dstArray.byteLength;
  let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  let last = range[ 1 ] !== undefined ? range[ 1 ] : length;
  let result;

  if( first < 0 )
  first = 0;
  if( first > length)
  first = length;
  if( last > length)
  last = length;
  if( last < first )
  last = first;

  if( _.bufferAnyIs( dstArray ) )
  {
    if( first === last )
    return dstArray;

    let newLength = length - last + first;
    let srcArrayLength = 0;

    if( srcArray )
    {
      srcArrayLength = _.definedIs( srcArray.length ) ? srcArray.length : srcArray.byteLength;
      newLength += srcArrayLength;
    }

    if( _.bufferRawIs( dstArray ) )
    {
      result = new ArrayBuffer( newLength );
    }
    else if( _.bufferNodeIs( dstArray ) )
    {
      result = Buffer.alloc( newLength );
    }
    else
    {
      result = longMakeSimilar( dstArray, newLength );
    }

    if( first > 0 )
    for( let i = 0; i < first; ++i )
    result[ i ] = dstArray[ i ];

    if( srcArray )
    for( let i = first, j = 0; j < srcArrayLength; )
    result[ i++ ] = srcArray[ j++ ];

    for( let j = last, i = first + srcArrayLength; j < length; )
    result[ i++ ] = dstArray[ j++ ];

    return result;
  }
  else
  {

    let args = srcArray ? srcArray.slice() : [];
    args.unshift( last-first );
    args.unshift( first );

    result = dstArray.splice.apply( dstArray,args );
  }

  return result;
}

//

/**
 * The arrayPut() routine puts all values of (arguments[]) after the second argument to the (dstArray)
 * in the position (dstOffset) and changes values of the following index.
 *
 * @param { longIs } dstArray - The source array.
 * @param { Number } [ dstOffset = 0 ] dstOffset - The index of element where need to put the new values.
 * @param {*} arguments[] - One or more argument(s).
 * If the (argument) is an array it iterates over array and adds each element to the next (dstOffset++) index of the (dstArray).
 * Otherwise, it adds each (argument) to the next (dstOffset++) index of the (dstArray).
 *
 * @example
 * // returns [ 1, 2, 'str', true, 7, 8, 9 ]
 * let arr = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 2, 'str', true, [ 7, 8 ] );
 *
 * @example
 * // returns [ 'str', true, 7, 8, 5, 6, 9 ]
 * let arr = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 0, 'str', true, [ 7, 8 ] );
 *
 * @returns { longIs } - Returns an array containing the changed values.
 * @function arrayPut
 * @throws { Error } Will throw an Error if (arguments.length) is less than one.
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (dstOffset) is not a Number.
 * @memberof wTools
 */

function arrayPut( dstArray, dstOffset )
{
  _.assert( arguments.length >= 1, 'Expects at least one argument' );
  _.assert( _.longIs( dstArray ) );
  _.assert( _.numberIs( dstOffset ) );

  dstOffset = dstOffset || 0;

  for( let a = 2 ; a < arguments.length ; a++ )
  {
    let argument = arguments[ a ];
    let aIs = _.arrayIs( argument ) || _.bufferTypedIs( argument );

    if( aIs && _.bufferTypedIs( dstArray ) )
    {
      dstArray.set( argument,dstOffset );
      dstOffset += argument.length;
    }
    else if( aIs )
    for( let i = 0 ; i < argument.length ; i++ )
    {
      dstArray[ dstOffset ] = argument[ i ];
      dstOffset += 1;
    }
    else
    {
      dstArray[ dstOffset ] = argument;
      dstOffset += 1;
    }

  }

  return dstArray;
}

//

/**
 * The arrayFill() routine fills all the elements of the given or a new array from the 0 index to an (options.times) index
 * with a static value.
 *
 * @param { ( Object | Number | Array ) } o - The options to fill the array.
 * @param { Number } [ o.times = result.length ] o.times - The count of repeats.
   If in the function passed an Array, the times will be equal the length of the array. If Number than this value.
 * @param { Number } [ o.value = 0 ] - The value for the filling.
 *
 * @example
 * // returns [ 3, 3, 3, 3, 3 ]
 * let arr = _.arrayFill( { times : 5, value : 3 } );
 *
 * @example
 * // returns [ 0, 0, 0, 0 ]
 * let arr = _.arrayFill( 4 );
 *
 * @example
 * // returns [ 0, 0, 0 ]
 * let arr = _.arrayFill( [ 1, 2, 3 ] );
 *
 * @returns { Array } - Returns an array filled with a static value.
 * @function arrayFill
 * @throws { Error } If missed argument, or got more than one argument.
 * @throws { Error } If passed argument is not an object.
 * @throws { Error } If the last element of the (o.result) is not equal to the (o.value).
 * @memberof wTools
 */

function arrayFillTimes( result,times,value )
{

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
  _.assert( _.longIs( result ) );

  if( value === undefined )
  value = 0;

  if( result.length < times )
  result = _.arrayGrow( result , 0 , times );

  if( _.routineIs( result.fill ) )
  {
    result.fill( value,0,times );
  }
  else
  {
    debugger;
    if( times < 0 )
    times = result.length + times;

    for( let t = 0 ; t < times ; t++ )
    result[ t ] = value;
  }

  _.assert( times <= 0 || result[ times-1 ] === value );

  return result;
}

//

function arrayFillWhole( result,value )
{
  _.assert( _.longIs( result ) );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  if( value === undefined )
  value = 0;
  return _.arrayFillTimes( result,result.length,value );
}

// {
//   _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
//   _.assert( _.objectIs( o ) || _.numberIs( o ) || _.arrayIs( o ),'arrayFill :','"o" must be object' );
//
//   if( arguments.length === 1 )
//   {
//     if( _.numberIs( o ) )
//     o = { times : o };
//     else if( _.arrayIs( o ) )
//     o = { result : o };
//   }
//   else
//   {
//     o = { result : arguments[ 0 ], value : arguments[ 1 ] };
//   }
//
//   _.assertMapHasOnly( o,arrayFill.defaults );
//   if( o.result )
//   _.assert( _.longIs( o.result ) );
//
//   let result = o.result || [];
//   let times = o.times !== undefined ? o.times : result.length;
//   let value = o.value !== undefined ? o.value : 0;
//
//   if( _.routineIs( result.fill ) )
//   {
//     if( result.length < times )
//     result.length = times;
//     result.fill( value,0,times );
//   }
//   else
//   {
//     for( let t = 0 ; t < times ; t++ )
//     result[ t ] = value;
//   }
//
//   _.assert( result[ times-1 ] === value );
//   return result;
// }
//
// arrayFill.defaults =
// {
//   result : null,
//   times : null,
//   value : null,
// }

//

/**
 * The arraySupplement() routine returns an array (dstArray), that contains values from following arrays only type of numbers.
 * If the initial (dstArray) isn't contain numbers, they are replaced.
 *
 * It finds among the arrays the biggest array, and assigns to the variable (length), iterates over from 0 to the (length),
 * creates inner loop that iterates over (arguments[...]) from the right (arguments.length - 1) to the (arguments[0]) left,
 * checks each element of the arrays, if it contains only type of number.
 * If true, it adds element to the array (dstArray) by corresponding index.
 * Otherwise, it skips and checks following array from the last executable index, previous array.
 * If the last executable index doesn't exist, it adds 'undefined' to the array (dstArray).
 * After that it returns to the previous array, and executes again, until (length).
 *
 * @param { longIs } dstArray - The initial array.
 * @param { ...longIs } arguments[...] - The following array(s).
 *
 * @example
 * // returns ?
 * _.arraySupplement( [ 4, 5 ], [ 1, 2, 3 ], [ 6, 7, 8, true, 9 ], [ 'a', 'b', 33, 13, 'e', 7 ] );
 * @returns { longIs } - Returns an array that contains values only type of numbers.
 * @function arraySupplement
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments[...]) is/are not the array-like.
 * @memberof wTools
 */

function arraySupplement( dstArray )
{
  let result = dstArray;
  if( result === null )
  result = [];

  let length = result.length;
  _.assert( _.longIs( result ) || _.numberIs( result ),'Expects object as argument' );

  for( let a = arguments.length-1 ; a >= 1 ; a-- )
  {
    _.assert( _.longIs( arguments[ a ] ),'argument is not defined :',a );
    length = Math.max( length,arguments[ a ].length );
  }

  if( _.numberIs( result ) )
  result = arrayFill
  ({
    value : result,
    times : length,
  });

  for( let k = 0 ; k < length ; k++ )
  {

    if( k in dstArray && isFinite( dstArray[ k ] ) )
    continue;

    let a;
    for( a = arguments.length-1 ; a >= 1 ; a-- )
    if( k in arguments[ a ] && !isNaN( arguments[ a ][ k ] ) )
    break;

    if( a === 0 )
    continue;

    result[ k ] = arguments[ a ][ k ];

  }

  return result;
}

//

/**
 * The arrayExtendScreening() routine iterates over (arguments[...]) from the right to the left (arguments[1]),
 * and returns a (dstArray) containing the values of the following arrays,
 * if the following arrays contains the indexes of the (screenArray).
 *
 * @param { longIs } screenArray - The source array.
 * @param { longIs } dstArray - To add the values from the following arrays,
 * if the following arrays contains indexes of the (screenArray).
 * If (dstArray) contains values, the certain values will be replaced.
 * @param { ...longIs } arguments[...] - The following arrays.
 *
 * @example
 * // returns [ 5, 6, 2 ]
 * _.arrayExtendScreening( [ 1, 2, 3 ], [  ], [ 0, 1, 2 ], [ 3, 4 ], [ 5, 6 ] );
 *
 * @example
 * // returns [ 'a', 6, 2, 13 ]
 * _.arrayExtendScreening( [ 1, 2, 3 ], [ 3, 'abc', 7, 13 ], [ 0, 1, 2 ], [ 3, 4 ], [ 'a', 6 ] );
 *
 * @example
 * // returns [ 3, 'abc', 7, 13 ]
 * _.arrayExtendScreening( [  ], [ 3, 'abc', 7, 13 ], [ 0, 1, 2 ], [ 3, 4 ], [ 'a', 6 ] )
 *
 * @returns { longIs } Returns a (dstArray) containing the values of the following arrays,
 * if the following arrays contains the indexes of the (screenArray).
 * If (screenArray) is empty, it returns a (dstArray).
 * If (dstArray) is equal to the null, it creates a new array,
 * and returns the corresponding values of the following arrays by the indexes of a (screenArray).
 * @function arrayExtendScreening
 * @throws { Error } Will throw an Error if (screenArray) is not an array-like.
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments[...]) is/are not an array-like.
 * @memberof wTools
 */

function arrayExtendScreening( screenArray,dstArray )
{
  let result = dstArray;
  if( result === null ) result = [];

  _.assert( _.longIs( screenArray ),'Expects object as screenArray' );
  _.assert( _.longIs( result ),'Expects object as argument' );
  for( let a = arguments.length-1 ; a >= 2 ; a-- )
  _.assert( arguments[ a ],'argument is not defined :',a );

  for( let k = 0 ; k < screenArray.length ; k++ )
  {

    if( screenArray[ k ] === undefined )
    continue;

    let a;
    for( a = arguments.length-1 ; a >= 2 ; a-- )
    if( k in arguments[ a ] ) break;
    if( a === 1 )
    continue;

    result[ k ] = arguments[ a ][ k ];

  }

  return result;
}

//

function arrayShuffle( dst,times )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.longIs( dst ) );

  if( times === undefined )
  times = dst.length;

  let l = dst.length;
  let e1,e2;
  for( let t1 = 0 ; t1 < times ; t1++ )
  {
    let t2 = Math.floor( Math.random() * l );
    e1 = dst[ t1 ];
    e2 = dst[ t2 ];
    dst[ t1 ] = e2;
    dst[ t2 ] = e1;
  }

  return dst;
}

//

function arraySort( srcArray, onEvaluate )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( onEvaluate === undefined || _.routineIs( onEvaluate ) );

  if( onEvaluate === undefined )
  {
    debugger;
    srcArray.sort();
  }
  else if( onEvaluate.length === 2 )
  {
    srcArray.sort( onEvaluate );
  }
  else if( onEvaluate.length === 1 )
  {
    srcArray.sort( function( a,b )
    {
      a = onEvaluate( a );
      b = onEvaluate( b );
      if( a > b ) return +1;
      else if( a < b ) return -1;
      else return 0;
    });
  }
  else _.assert( 0, 'Expects signle-arguments evaluator or two-argument comparator' );

  return srcArray;
}

//

// function arraySpliceArray( dstArray,srcArray,first,replace )
// {
//   debugger;
//
//   _.assert( arguments.length === 4 );
//   _.assert( _.arrayIs( dstArray ) );
//   _.assert( _.arrayIs( srcArray ) );
//   _.assert( _.numberIs( first ) );
//   _.assert( _.numberIs( replace ) );
//
//   let args = [ first,replace ];
//   args.push.apply( args,srcArray );
//
//   dstArray.splice.apply( dstArray,args );
//
//   return dstArray;
// }
//
// //
//
// function arraySplice( dstArray,first,replace,srcArray )
// {
//
//   _.assert( _.arrayIs( dstArray ) );
//   _.assert( _.arrayIs( srcArray ) );
//
//   let first = first !== undefined ? first : 0;
//   let replace = replace !== undefined ? replace : dstArray.length;
//   let result = dstArray.slice( first,first+replace );
//
//   let srcArray = srcArray.slice();
//   srcArray.unshift( replace );
//   srcArray.unshift( first );
//
//   dstArray.splice.apply( dstArray,srcArray );
//
//   return result;
// }

// --
// array etc
// --

function arrayIndicesOfGreatest( srcArray,numberOfElements,comparator )
{
  let result = [];
  let l = srcArray.length;

  debugger;
  throw _.err( 'not tested' );

  comparator = _._comparatorFromEvaluator( comparator );

  function rcomparator( a,b )
  {
    return comparator( srcArray[ a ],srcArray[ b ] );
  };

  for( let i = 0 ; i < l ; i += 1 )
  {

    if( result.length < numberOfElements )
    {
      _.sorted.add( result, i, rcomparator );
      continue;
    }

    _.sorted.add( result, i, rcomparator );
    result.splice( result.length-1,1 );

  }

  return result;
}

//

/**
 * The arraySum() routine returns the sum of an array {-srcMap-}.
 *
 * @param { longIs } src - The source array.
 * @param { Function } [ onEvaluate = function( e ) { return e } ] - A callback function.
 *
 * @example
 * // returns 15
 * _.arraySum( [ 1, 2, 3, 4, 5 ] );
 *
 * @example
 * // returns 29
 * _.arraySum( [ 1, 2, 3, 4, 5 ], function( e ) { return e * 2 } );
 *
 * @example
 * // returns 94
 * _.arraySum( [ true, false, 13, '33' ], function( e ) { return e * 2 } );
 *
 * @returns { Number } - Returns the sum of an array {-srcMap-}.
 * @function arraySum
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */

function arraySum( src,onEvaluate )
{
  let result = 0;

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.longIs( src ),'arraySum :','Expects ArrayLike' );

  if( onEvaluate === undefined )
  onEvaluate = function( e ){ return e; };

  _.assert( _.routineIs( onEvaluate ) );

  for( let i = 0 ; i < src.length ; i++ )
  {
    result += onEvaluate( src[ i ],i,src );
  }

  return result;
}

// // --
// // array sequential search
// // --
//
// function arrayLeftIndex( arr, ins, evaluator1, evaluator2 )
// {
//
//   _.assert( 2 <= arguments.length && arguments.length <= 4 );
//   _.assert( _.longIs( arr ) );
//   _.assert( !evaluator1 || evaluator1.length === 1 || evaluator1.length === 2 );
//   _.assert( !evaluator1 || _.routineIs( evaluator1 ) );
//   _.assert( !evaluator2 || evaluator2.length === 1 );
//   _.assert( !evaluator2 || _.routineIs( evaluator2 ) );
//
//   if( !evaluator1 )
//   {
//     _.assert( !evaluator2 );
//     return _ArrayIndexOf.call( arr, ins );
//   }
//   else if( evaluator1.length === 2 )
//   {
//     _.assert( !evaluator2 );
//     for( let a = 0 ; a < arr.length ; a++ )
//     {
//
//       if( evaluator1( arr[ a ],ins ) )
//       return a;
//
//     }
//   }
//   else
//   {
//
//     if( evaluator2 )
//     ins = evaluator2( ins );
//     else
//     ins = evaluator1( ins );
//
//     for( let a = 0 ; a < arr.length ; a++ )
//     {
//       if( evaluator1( arr[ a ] ) === ins )
//       return a;
//     }
//
//   }
//
//   return -1;
// }
//
// //
//
// function arrayRightIndex( arr, ins, evaluator1, evaluator2 )
// {
//
//   if( ins === undefined )
//   debugger;
//
//   _.assert( 2 <= arguments.length && arguments.length <= 4 );
//   _.assert( !evaluator1 || evaluator1.length === 1 || evaluator1.length === 2 );
//   _.assert( !evaluator1 || _.routineIs( evaluator1 ) );
//   _.assert( !evaluator2 || evaluator2.length === 1 );
//   _.assert( !evaluator2 || _.routineIs( evaluator2 ) );
//
//   if( !evaluator1 )
//   {
//     _.assert( !evaluator2 );
//     if( !_.arrayIs( arr ) )
//     debugger;
//     return _ArrayLastIndexOf.call( arr, ins );
//   }
//   else if( evaluator1.length === 2 )
//   {
//     _.assert( !evaluator2 );
//     for( let a = arr.length-1 ; a >= 0 ; a-- )
//     {
//       if( evaluator1( arr[ a ],ins ) )
//       return a;
//     }
//   }
//   else
//   {
//
//     if( evaluator2 )
//     ins = evaluator2( ins );
//     else
//     ins = evaluator1( ins );
//
//     for( let a = arr.length-1 ; a >= 0 ; a-- )
//     {
//       if( evaluator1( arr[ a ] ) === ins )
//       return a;
//     }
//
//   }
//
//   return -1;
// }
//
// //
// //
// // /**
// //  * The arrayLeftIndex() routine returns the index of the first matching (ins) element in a array (arr)
// //  * that corresponds to the condition in the callback function.
// //  *
// //  * It iterates over an array (arr) from the left to the right,
// //  * and checks by callback function( evaluator1( arr[ a ], ins ) ).
// //  * If callback function returns true, it returns corresponding index.
// //  * Otherwise, it returns -1.
// //  *
// //  * @param { longIs } arr - The target array.
// //  * @param { * } ins - The value to compare.
// //  * @param { wTools~compareCallback } [equalizer] evaluator1 - A callback function.
// //  * By default, it checks the equality of two arguments.
// //  *
// //  * @example
// //  * // returns 0
// //  * _.arrayLeftIndex( [ 1, 2, 3 ], 1 );
// //  *
// //  * @example
// //  * // returns -1
// //  * _.arrayLeftIndex( [ 1, 2, 3 ], 4 );
// //  *
// //  * @example
// //  * // returns 3
// //  * _.arrayLeftIndex( [ 1, 2, 3, 4 ], 3, function( el, ins ) { return el > ins } );
// //  *
// //  * @example
// //  * // returns 3
// //  * _.arrayLeftIndex( 'abcdef', 'd' );
// //  *
// //  * @example
// //  * // returns 2
// //  * function arr() {
// //  *   return arguments;
// //  * }( 3, 7, 13 );
// //  * _.arrayLeftIndex( arr, 13 );
// //  *
// //  * @returns { Number } Returns the corresponding index, if a callback function ( evaluator1 ) returns true.
// //  * Otherwise, it returns -1.
// //  * @function arrayLeftIndex
// //  * @throws { Error } Will throw an Error if (arguments.length) is not equal to the 2 or 3.
// //  * @throws { Error } Will throw an Error if (evaluator1.length) is not equal to the 1 or 2.
// //  * @throws { Error } Will throw an Error if (evaluator1) is not a Function.
// //  * @memberof wTools
// //  */
// //
// // function arrayLeftIndex( arr, ins, evaluator1, evaluator2 )
// // {
// //
// //   _.assert( 2 <= arguments.length || arguments.length <= 4 );
// //   _.assert( !evaluator1 || evaluator1.length === 1 || evaluator1.length === 2 );
// //   _.assert( !evaluator1 || _.routineIs( evaluator1 ) );
// //   _.assert( !evaluator2 || evaluator2.length === 1 );
// //   _.assert( !evaluator2 || _.routineIs( evaluator2 ) );
// //
// //   if( !evaluator1 )
// //   {
// //     _.assert( !evaluator2 );
// //     if( !_.arrayIs( arr ) )
// //     debugger;
// //     return _ArrayIndexOf.call( arr, ins );
// //     // if( _.argumentsArrayIs( arr ) )
// //     // {
// //     //   let array = _ArraySlice.call( arr );
// //     //   return array.indexOf( ins );
// //     // }
// //     // return arr.indexOf( ins );
// //   }
// //   else if( evaluator1.length === 2 )
// //   {
// //     _.assert( !evaluator2 );
// //     for( let a = 0 ; a < arr.length ; a++ )
// //     {
// //
// //       if( evaluator1( arr[ a ],ins ) )
// //       return a;
// //
// //     }
// //   }
// //   else
// //   {
// //
// //     debugger;
// //     if( evaluator2 )
// //     ins = evaluator2( ins );
// //
// //     debugger;
// //     for( let a = 0 ; a < arr.length ; a++ )
// //     {
// //       if( evaluator1( arr[ a ] ) === evaluator1( ins ) )
// //       return a;
// //     }
// //
// //   }
// //
// //   return -1;
// // }
// //
// // //
// //
// // function arrayRightIndex( arr, ins, evaluator1, evaluator2 )
// // {
// //
// //   if( ins === undefined )
// //   debugger;
// //
// //   debugger;
// //
// //   _.assert( 2 <= arguments.length || arguments.length <= 4 );
// //   _.assert( !evaluator1 || evaluator1.length === 1 || evaluator1.length === 2 );
// //   _.assert( !evaluator1 || _.routineIs( evaluator1 ) );
// //
// //   if( !evaluator1 )
// //   {
// //     _.assert( !evaluator2 );
// //     if( !_.arrayIs( arr ) )
// //     debugger;
// //     return _ArrayLastIndexOf.call( arr, ins );
// //     // if( _.argumentsArrayIs( arr ) )
// //     // {
// //     //   let array = _ArraySlice.call( arr );
// //     //   return array.lastIndexOf( ins );
// //     // }
// //     // return arr.lastIndexOf( ins );
// //   }
// //   else if( evaluator1.length === 2 )
// //   {
// //     _.assert( !evaluator2 );
// //     for( let a = arr.length-1 ; a >= 0 ; a-- )
// //     {
// //
// //       if( evaluator1( arr[ a ],ins ) )
// //       return a;
// //
// //     }
// //   }
// //   else
// //   {
// //
// //     debugger;
// //     for( let a = arr.length-1 ; a >= 0 ; a-- )
// //     {
// //       if( evaluator1( arr[ a ] ) === evaluator1 ( ins ) )
// //       return a;
// //     }
// //
// //   }
// //
// //   return -1;
// // }
//
// //
//
// /**
//  * The arrayLeft() routine returns a new object containing the properties, (index, element),
//  * corresponding to a found value (ins) from an array (arr).
//  *
//  * It creates the variable (i), assigns and calls to it the function( _.arrayLeftIndex( arr, ins, evaluator1 ) ),
//  * that returns the index of the value (ins) in the array (arr).
//  * [wTools.arrayLeftIndex()]{@link wTools.arrayLeftIndex}
//  * If (i) is more or equal to the zero, it returns the object containing the properties ({ index : i, element : arr[ i ] }).
//  * Otherwise, it returns the empty object.
//  *
//  * @see {@link wTools.arrayLeftIndex} - See for more information.
//  *
//  * @param { longIs } arr - Entity to check.
//  * @param { * } ins - Element to locate in the array.
//  * @param { wTools~compareCallback } evaluator1 - A callback function.
//  *
//  * @example
//  * // returns { index : 3, element : 'str' }
//  * _.arrayLeft( [ 1, 2, false, 'str', 5 ], 'str', function( a, b ) { return a === b } );
//  *
//  * @example
//  * // returns {  }
//  * _.arrayLeft( [ 1, 2, 3, 4, 5 ], 6 );
//  *
//  * @returns { Object } Returns a new object containing the properties, (index, element),
//  * corresponding to the found value (ins) from the array (arr).
//  * Otherwise, it returns the empty object.
//  * @function arrayLeft
//  * @throws { Error } Will throw an Error if (evaluator1) is not a Function.
//  * @memberof wTools
//  */
//
// function arrayLeft( arr, ins, evaluator1, evaluator2 )
// {
//   let result = Object.create( null );
//   let i = _.arrayLeftIndex( arr, ins, evaluator1, evaluator2 );
//
//   _.assert( 2 <= arguments.length && arguments.length <= 4 );
//
//   if( i >= 0 )
//   {
//     result.index = i;
//     result.element = arr[ i ];
//   }
//
//   return result;
// }
//
// //
//
// function arrayRight( arr, ins, evaluator1, evaluator2 )
// {
//   let result = Object.create( null );
//   let i = _.arrayRightIndex( arr, ins, evaluator1, evaluator2 );
//
//   _.assert( 2 <= arguments.length && arguments.length <= 4 );
//
//   if( i >= 0 )
//   {
//     result.index = i;
//     result.element = arr[ i ];
//   }
//
//   return result;
// }
//
// //
//
// function arrayLeftDefined( arr )
// {
//
//   _.assert( arguments.length === 1, 'Expects single argument' );
//
//   return _.arrayLeft( arr,true,function( e ){ return e !== undefined; } );
// }
//
// //
//
// function arrayRightDefined( arr )
// {
//
//   _.assert( arguments.length === 1, 'Expects single argument' );
//
//   return _.arrayRight( arr,true,function( e ){ return e !== undefined; } );
// }
//
// //
//
// /**
//  * The arrayCount() routine returns the count of matched elements in the {-srcMap-} array.
//  *
//  * @param { Array } src - The source array.
//  * @param { * } instance - The value to search.
//  *
//  * @example
//  * // returns 2
//  * let arr = _.arrayCount( [ 1, 2, 'str', 10, 10, true ], 10 );
//  *
//  * @returns { Number } - Returns the count of matched elements in the {-srcMap-}.
//  * @function arrayCount
//  * @throws { Error } If passed arguments is less than two or more than two.
//  * @throws { Error } If the first argument is not an array-like object.
//  * @memberof wTools
//  */
//
// function arrayCount( src,instance )
// {
//   let result = 0;
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.longIs( src ),'arrayCount :','Expects ArrayLike' );
//
//   let index = src.indexOf( instance );
//   while( index !== -1 )
//   {
//     result += 1;
//     index = src.indexOf( instance,index+1 );
//   }
//
//   return result;
// }
//
// //
//
// /**
//  * The arrayCountUnique() routine returns the count of matched pairs ([ 1, 1, 2, 2, ., . ]) in the array {-srcMap-}.
//  *
//  * @param { longIs } src - The source array.
//  * @param { Function } [ onEvaluate = function( e ) { return e } ] - A callback function.
//  *
//  * @example
//  * // returns 3
//  * _.arrayCountUnique( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
//  *
//  * @example
//  * // returns 0
//  * _.arrayCountUnique( [ 1, 2, 3, 4, 5 ] );
//  *
//  * @returns { Number } - Returns the count of matched pairs ([ 1, 1, 2, 2, ., . ]) in the array {-srcMap-}.
//  * @function arrayCountUnique
//  * @throws { Error } If passed arguments is less than one or more than two.
//  * @throws { Error } If the first argument is not an array-like object.
//  * @throws { Error } If the second argument is not a Function.
//  * @memberof wTools
//  */
//
// function arrayCountUnique( src, onEvaluate )
// {
//   let found = [];
//   let onEvaluate = onEvaluate || function( e ){ return e };
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//   _.assert( _.longIs( src ),'arrayCountUnique :','Expects ArrayLike' );
//   _.assert( _.routineIs( onEvaluate ) );
//   _.assert( onEvaluate.length === 1 );
//
//   for( let i1 = 0 ; i1 < src.length ; i1++ )
//   {
//     let element1 = onEvaluate( src[ i1 ] );
//     if( found.indexOf( element1 ) !== -1 )
//     continue;
//
//     for( let i2 = i1+1 ; i2 < src.length ; i2++ )
//     {
//
//       let element2 = onEvaluate( src[ i2 ] );
//       if( found.indexOf( element2 ) !== -1 )
//       continue;
//
//       if( element1 === element2 )
//       found.push( element1 );
//
//     }
//
//   }
//
//   return found.length;
// }
//
// // --
// // array prepend
// // --
//
// function _arrayPrependUnrolling( dstArray, srcArray )
// {
//   _.assert( arguments.length === 2 );
//   _.assert( _.arrayIs( dstArray ), 'Expects array' );
//
//   for( let a = srcArray.length - 1 ; a >= 0 ; a-- )
//   {
//     if( _.unrollIs( srcArray[ a ] ) )
//     {
//       _arrayPrependUnrolling( dstArray, srcArray[ a ] );
//     }
//     else
//     {
//       dstArray.unshift( srcArray[ a ] );
//     }
//   }
//
//   return dstArray;
// }
//
// //
//
// function arrayPrependUnrolling( dstArray )
// {
//   _.assert( arguments.length >= 1 );
//   _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );
//
//   dstArray = dstArray || [];
//
//   _._arrayPrependUnrolling( dstArray, _.longSlice( arguments, 1 ) );
//
//   return dstArray;
// }
//
// //
//
// function arrayPrepend_( dstArray )
// {
//   _.assert( arguments.length >= 1 );
//   _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );
//
//   dstArray = dstArray || [];
//
//   for( let a = arguments.length - 1 ; a >= 1 ; a-- )
//   {
//     if( _.longIs( arguments[ a ] ) )
//     {
//       dstArray.unshift.apply( dstArray, arguments[ a ] );
//     }
//     else
//     {
//       dstArray.unshift( arguments[ a ] );
//     }
//   }
//
//   return dstArray;
// }
//
// //
//
// /**
//  * Routine adds a value of argument( ins ) to the beginning of an array( dstArray ).
//  *
//  * @param { Array } dstArray - The destination array.
//  * @param { * } ins - The element to add.
//  *
//  * @example
//  * // returns [ 5, 1, 2, 3, 4 ]
//  * _.arrayPrependElement( [ 1, 2, 3, 4 ], 5 );
//  *
//  * @example
//  * // returns [ 5, 1, 2, 3, 4, 5 ]
//  * _.arrayPrependElement( [ 1, 2, 3, 4, 5 ], 5 );
//  *
//  * @returns { Array } Returns updated array, that contains new element( ins ).
//  * @function arrayPrependElement
//  * @throws { Error } An Error if ( dstArray ) is not an Array.
//  * @throws { Error } An Error if ( arguments.length ) is less or more than two.
//  * @memberof wTools
//  */
//
// function arrayPrependElement( dstArray, ins )
// {
//   arrayPrependedElement.apply( this,arguments );
//   return dstArray;
// }
//
// //
//
// /**
//  * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
//  * if destination( dstArray ) doesn't have the value of ( ins ).
//  * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
//  *
//  * @param { Array } dstArray - The destination array.
//  * @param { * } ins - The value to add.
//  * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
//  *
//  * @example
//  * // returns [ 5, 1, 2, 3, 4 ]
//  * _.arrayPrependOnce( [ 1, 2, 3, 4 ], 5 );
//  *
//  * @example
//  * // returns [ 1, 2, 3, 4, 5 ]
//  * _.arrayPrependOnce( [ 1, 2, 3, 4, 5 ], 5 );
//  *
//  * @example
//  * // returns [ 'Dmitry', 'Petre', 'Mikle', 'Oleg' ]
//  * _.arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
//  *
//  * @example
//  * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
//  * _.arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
//  *
//  * @example
//  * function onEqualize( a, b )
//  * {
//  *  return a.value === b.value;
//  * };
//  * _.arrayPrependOnce( [ { value : 1 }, { value : 2 } ], { value : 1 }, onEqualize );
//  * // returns [ { value : 1 }, { value : 2 } ]
//  *
//  * @returns { Array } If an array ( dstArray ) doesn't have a value ( ins ) it returns the updated array ( dstArray ) with the new length,
//  * otherwise, it returns the original array ( dstArray ).
//  * @function arrayPrependOnce
//  * @throws { Error } An Error if ( dstArray ) is not an Array.
//  * @throws { Error } An Error if ( onEqualize ) is not an Function.
//  * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
//  * @memberof wTools
//  */
//
// function arrayPrependOnce( dstArray, ins, evaluator1, evaluator2 )
// {
//   arrayPrependedOnce.apply( this,arguments );
//   return dstArray;
// }
//
// //
//
// /**
//  * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
//  * if destination( dstArray ) doesn't have the value of ( ins ).
//  * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
//  * Returns updated array( dstArray ) if( ins ) was added, otherwise throws an Error.
//  *
//  * @param { Array } dstArray - The destination array.
//  * @param { * } ins - The value to add.
//  * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
//  *
//  * @example
//  * // returns [ 5, 1, 2, 3, 4 ]
//  * _.arrayPrependOnceStrictly( [ 1, 2, 3, 4 ], 5 );
//  *
//  * @example
//  * // throws error
//  * _.arrayPrependOnceStrictly( [ 1, 2, 3, 4, 5 ], 5 );
//  *
//  * @example
//  * // returns [ 'Dmitry', 'Petre', 'Mikle', 'Oleg' ]
//  * _.arrayPrependOnceStrictly( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
//  *
//  * @example
//  * // throws error
//  * _.arrayPrependOnceStrictly( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
//  *
//  * @example
//  * function onEqualize( a, b )
//  * {
//  *  return a.value === b.value;
//  * };
//  * _.arrayPrependOnceStrictly( [ { value : 1 }, { value : 2 } ], { value : 0 }, onEqualize );
//  * // returns [ { value : 0 }, { value : 1 }, { value : 2 } ]
//  *
//  * @returns { Array } If an array ( dstArray ) doesn't have a value ( ins ) it returns the updated array ( dstArray ) with the new length,
//  * otherwise, it throws an Error.
//  * @function arrayPrependOnceStrictly
//  * @throws { Error } An Error if ( dstArray ) is not an Array.
//  * @throws { Error } An Error if ( onEqualize ) is not an Function.
//  * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
//  * @throws { Error } An Error if ( ins ) already exists on( dstArray ).
//  * @memberof wTools
//  */
//
// function arrayPrependOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
// {
//
//   let result = arrayPrependedOnce.apply( this, arguments );
//   _.assert( result >= 0,'array should have only unique elements, but has several',ins );
//
//   return dstArray;
// }
//
// //
//
// /**
//  * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
//  * and returns zero if value was succesfully added.
//  *
//  * @param { Array } dstArray - The destination array.
//  * @param { * } ins - The element to add.
//  *
//  * @example
//  * // returns 0
//  * _.arrayPrependedElement( [ 1, 2, 3, 4 ], 5 );
//  *
//  * @returns { Array } Returns updated array, that contains new element( ins ).
//  * @function arrayPrependedElement
//  * @throws { Error } An Error if ( dstArray ) is not an Array.
//  * @throws { Error } An Error if ( arguments.length ) is not equal to two.
//  * @memberof wTools
//  */
//
// function arrayPrependedElement( dstArray, ins )
// {
//   _.assert( arguments.length === 2  );
//   _.assert( _.arrayIs( dstArray ) );
//
//   dstArray.unshift( ins );
//   return 0;
// }
//
// //
//
// /**
//  * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
//  * if destination( dstArray ) doesn't have the value of ( ins ).
//  * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
//  *
//  * @param { Array } dstArray - The destination array.
//  * @param { * } ins - The value to add.
//  * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
//  *
//  * @example
//  * // returns 0
//  * _.arrayPrependedOnce( [ 1, 2, 3, 4 ], 5 );
//  *
//  * @example
//  * // returns -1
//  * _.arrayPrependedOnce( [ 1, 2, 3, 4, 5 ], 5 );
//  *
//  * @example
//  * // returns 0
//  * _.arrayPrependedOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
//  *
//  * @example
//  * // returns -1
//  * _.arrayPrependedOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
//  *
//  * @example
//  * function onEqualize( a, b )
//  * {
//  *  return a.value === b.value;
//  * };
//  * _.arrayPrependedOnce( [ { value : 1 }, { value : 2 } ], { value : 1 }, onEqualize );
//  * // returns -1
//  *
//  * @returns { Array } Returns zero if elements was succesfully added, otherwise returns -1.
//  *
//  * @function arrayPrependedOnce
//  * @throws { Error } An Error if ( dstArray ) is not an Array.
//  * @throws { Error } An Error if ( onEqualize ) is not an Function.
//  * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
//  * @memberof wTools
//  */
//
// function arrayPrependedOnce( dstArray, ins, evaluator1, evaluator2 )
// {
//   _.assert( _.arrayIs( dstArray ) );
//
//   let i = _.arrayLeftIndex.apply( _, arguments );
//
//   if( i === -1 )
//   {
//     dstArray.unshift( ins );
//     return 0;
//   }
//   return -1;
// }
//
// //
//
// /**
//  * Method adds all elements from array( insArray ) to the beginning of an array( dstArray ).
//  *
//  * @param { Array } dstArray - The destination array.
//  * @param { ArrayLike } insArray - The source array.
//  *
//  * @example
//  * // returns [ 5, 1, 2, 3, 4 ]
//  * _.arrayPrependArray( [ 1, 2, 3, 4 ], [ 5 ] );
//  *
//  * @example
//  * // returns [ 5, 1, 2, 3, 4, 5 ]
//  * _.arrayPrependArray( [ 1, 2, 3, 4, 5 ], [ 5 ] );
//  *
//  * @returns { Array } Returns updated array, that contains elements from( insArray ).
//  * @function arrayPrependArray
//  * @throws { Error } An Error if ( dstArray ) is not an Array.
//  * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
//  * @throws { Error } An Error if ( arguments.length ) is less or more than two.
//  * @memberof wTools
//  */
//
// function arrayPrependArray( dstArray, insArray )
// {
//   arrayPrependedArray.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// /**
//  * Method adds all unique elements from array( insArray ) to the beginning of an array( dstArray )
//  * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
//  *
//  * @param { Array } dstArray - The destination array.
//  * @param { ArrayLike } insArray - The source array.
//  * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
//  *
//  * @example
//  * // returns [ 0, 1, 2, 3, 4 ]
//  * _.arrayPrependArrayOnce( [ 1, 2, 3, 4 ], [ 0, 1, 2, 3, 4 ] );
//  *
//  * @example
//  * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
//  * _.arrayPrependArrayOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], [ 'Dmitry' ] );
//  *
//  * @example
//  * function onEqualize( a, b )
//  * {
//  *  return a.value === b.value;
//  * };
//  * _.arrayPrependArrayOnce( [ { value : 1 }, { value : 2 } ], [ { value : 1 } ], onEqualize );
//  * // returns [ { value : 1 }, { value : 2 } ]
//  *
//  * @returns { Array } Returns updated array( dstArray ) or original if nothing added.
//  * @function arrayPrependArrayOnce
//  * @throws { Error } An Error if ( dstArray ) is not an Array.
//  * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
//  * @throws { Error } An Error if ( onEqualize ) is not an Function.
//  * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
//  * @memberof wTools
//  */
//
// function arrayPrependArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
// {
//   arrayPrependedArrayOnce.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// /**
//  * Method adds all unique elements from array( insArray ) to the beginning of an array( dstArray )
//  * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
//  * Returns updated array( dstArray ) if all elements from( insArray ) was added, otherwise throws error.
//  * Even error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
//  *
//  * @param { Array } dstArray - The destination array.
//  * @param { ArrayLike } insArray - The source array.
//  * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
//  *
//  * @example
//  * // returns [ 0, 1, 2, 3, 4 ]
//  * _.arrayPrependArrayOnceStrictly( [ 1, 2, 3, 4 ], [ 0, 1, 2, 3, 4 ] );
//  *
//  * @example
//  * function onEqualize( a, b )
//  * {
//  *  return a.value === b.value;
//  * };
//  * _.arrayPrependArrayOnceStrictly( [ { value : 1 }, { value : 2 } ], { value : 1 }, onEqualize );
//  * // returns [ { value : 1 }, { value : 2 } ]
//  *
//  * * @example
//  * let dst = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
//  * _.arrayPrependArrayOnceStrictly( dst, [ 'Antony', 'Dmitry' ] );
//  * // throws error, but dstArray was updated by one element from insArray
//  *
//  * @returns { Array } Returns updated array( dstArray ) or throws an error if not all elements from source
//  * array( insArray ) was added.
//  * @function arrayPrependArrayOnceStrictly
//  * @throws { Error } An Error if ( dstArray ) is not an Array.
//  * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
//  * @throws { Error } An Error if ( onEqualize ) is not an Function.
//  * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
//  * @memberof wTools
//  */
//
// function arrayPrependArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
// {
//   let result = arrayPrependedArrayOnce.apply( this, arguments );
//   _.assert( result === insArray.length );
//   return dstArray;
// }
//
// //
//
// /**
//  * Method adds all elements from array( insArray ) to the beginning of an array( dstArray ).
//  * Returns count of added elements.
//  *
//  * @param { Array } dstArray - The destination array.
//  * @param { ArrayLike } insArray - The source array.
//  *
//  * @example
//  * let dst = [ 1, 2, 3, 4 ];
//  * _.arrayPrependedArray( dst, [ 5, 6, 7 ] );
//  * // returns 3
//  * console.log( dst );
//  * //returns [ 5, 6, 7, 1, 2, 3, 4 ]
//  *
//  * @returns { Array } Returns count of added elements.
//  * @function arrayPrependedArray
//  * @throws { Error } An Error if ( dstArray ) is not an Array.
//  * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
//  * @throws { Error } An Error if ( arguments.length ) is less or more than two.
//  * @memberof wTools
//  */
//
// function arrayPrependedArray( dstArray, insArray )
// {
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.arrayIs( dstArray ),'arrayPrependedArray :','Expects array' );
//   _.assert( _.longIs( insArray ),'arrayPrependedArray :','Expects longIs' );
//
//   dstArray.unshift.apply( dstArray,insArray );
//   return insArray.length;
// }
//
// //
//
// /**
//  * Method adds all unique elements from array( insArray ) to the beginning of an array( dstArray )
//  * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
//  * Returns count of added elements.
//  *
//  * @param { Array } dstArray - The destination array.
//  * @param { ArrayLike } insArray - The source array.
//  * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
//  *
//  * @example
//  * // returns 3
//  * _.arrayPrependedArrayOnce( [ 1, 2, 3 ], [ 4, 5, 6] );
//  *
//  * @example
//  * // returns 1
//  * _.arrayPrependedArrayOnce( [ 0, 2, 3, 4 ], [ 1, 1, 1 ] );
//  *
//  * @example
//  * // returns 0
//  * _.arrayPrependedArrayOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], [ 'Dmitry' ] );
//  *
//  * @example
//  * function onEqualize( a, b )
//  * {
//  *  return a.value === b.value;
//  * };
//  * _.arrayPrependedArrayOnce( [ { value : 1 }, { value : 2 } ], [ { value : 1 } ], onEqualize );
//  * // returns 0
//  *
//  * @returns { Array } Returns count of added elements.
//  * @function arrayPrependedArrayOnce
//  * @throws { Error } An Error if ( dstArray ) is not an Array.
//  * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
//  * @throws { Error } An Error if ( onEqualize ) is not an Function.
//  * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
//  * @memberof wTools
//  */
//
// function arrayPrependedArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
// {
//   _.assert( _.arrayIs( dstArray ) );
//   _.assert( _.longIs( insArray ) );
//   _.assert( dstArray !== insArray );
//   _.assert( 2 <= arguments.length && arguments.length <= 4 );
//
//   let result = 0;
//
//   for( let i = insArray.length - 1; i >= 0; i-- )
//   {
//     if( _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 ) === -1 )
//     {
//       dstArray.unshift( insArray[ i ] );
//       result += 1;
//     }
//   }
//
//   return result;
// }
//
// //
//
// /**
//  * Method adds all elements from provided arrays to the beginning of an array( dstArray ) in same order
//  * that they are in( arguments ).
//  * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
//  * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
//  * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
//  * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
//  *
//  * @param { Array } dstArray - The destination array.
//  * @param{ longIs | * } arguments[...] - Source arguments.
//  *
//  * @example
//  * // returns [ 5, 6, 7, 1, 2, 3, 4 ]
//  * _.arrayPrependArrays( [ 1, 2, 3, 4 ], [ 5 ], [ 6 ], 7 );
//  *
//  * @example
//  * let dst = [ 1, 2, 3, 4 ];
//  * _.arrayPrependArrays( dst, [ 5 ], [ 6 ], undefined );
//  * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
//  *
//  * @returns { Array } Returns updated array( dstArray ).
//  * @function arrayPrependArrays
//  * @throws { Error } An Error if ( dstArray ) is not an Array.
//  * @throws { Error } An Error if one of ( arguments ) is undefined.
//  * @memberof wTools
//  */
//
// function arrayPrependArrays( dstArray, insArray )
// {
//   arrayPrependedArrays.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// /**
//  * Method adds all unique elements from provided arrays to the beginning of an array( dstArray ) in same order
//  * that they are in( arguments ).
//  * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
//  * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
//  * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
//  * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
//
//  * @param { Array } dstArray - The destination array.
//  * @param{ longIs | * } arguments[...] - Source arguments.
//  *
//  * @example
//  * // returns [ 5, 6, 7, 1, 2, 3, 4 ]
//  * _.arrayPrependArraysOnce( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
//  *
//  * @example
//  * let dst = [ 1, 2, 3, 4 ];
//  * _.arrayPrependArraysOnce( dst, [ 5 ], 5, [ 6 ], 6, undefined );
//  * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
//  *
//  * @returns { Array } Returns updated array( dstArray ).
//  * @function arrayPrependArraysOnce
//  * @throws { Error } An Error if ( dstArray ) is not an Array.
//  * @throws { Error } An Error if one of ( arguments ) is undefined.
//  * @memberof wTools
//  */
//
// function arrayPrependArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
// {
//   arrayPrependedArraysOnce.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// /**
//  * Method adds all unique elements from provided arrays to the beginning of an array( dstArray ) in same order
//  * that they are in( arguments ).
//  * Throws an error if one of arguments is undefined.
//  * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
//  * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
//  * Example: _.arrayPrependArraysOnce( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
//  * After copying checks if all elements( from first two levels ) was copied, if true returns updated array( dstArray ), otherwise throws an error.
//  * Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
//
//  * @param { Array } dstArray - The destination array.
//  * @param { longIs | * } arguments[...] - Source arguments.
//  * @param { wTools~compareCallback } onEqualize - A callback function that can be provided through routine`s context. By default, it checks the equality of two arguments.
//  *
//  * @example
//  * // returns [ 5, 6, 7, 8, 1, 2, 3, 4 ]
//  * _.arrayPrependArraysOnceStrictly( [ 1, 2, 3, 4 ], 5, [ 6, [ 7 ] ], 8 );
//  *
//  * @example
//  * // throws error
//  * _.arrayPrependArraysOnceStrictly( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
//  *
//  * @example
//  * function onEqualize( a, b )
//  * {
//  *  return a === b;
//  * };
//  * let dst = [];
//  * let arguments = [ dst, [ 1, [ 2 ], [ [ 3 ] ] ], 4 ];
//  * _.arrayPrependArraysOnceStrictly.apply( { onEqualize : onEqualize }, arguments );
//  * //returns [ 1, 2, [ 3 ], 4 ]
//  *
//  * @returns { Array } Returns updated array( dstArray ).
//  * @function arrayPrependArraysOnceStrictly
//  * @throws { Error } An Error if ( dstArray ) is not an Array.
//  * @throws { Error } An Error if one of ( arguments ) is undefined.
//  * @throws { Error } An Error if count of added elements is not equal to count of elements from( arguments )( only first two levels inside of array are counted ).
//  * @memberof wTools
//  */
//
// function arrayPrependArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
// {
//   let result = arrayPrependedArraysOnce.apply( this, arguments );
//   let expected = 0;
//
//   if( Config.debug )
//   {
//
//     for( let i = insArray.length - 1; i >= 0; i-- )
//     {
//       if( _.longIs( insArray[ i ] ) )
//       expected += insArray[ i ].length;
//       else
//       expected += 1;
//     }
//
//     _.assert( result === expected, '{-dstArray-} should have none element from {-insArray-}' );
//
//   }
//
//   return dstArray;
// }
//
// //
//
// /**
//  * Method adds all elements from provided arrays to the beginning of an array( dstArray ) in same order
//  * that they are in( arguments ).
//  * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
//  * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
//  * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
//  * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
//  *
//  * @param { Array } dstArray - The destination array.
//  * @param{ longIs | * } arguments[...] - Source arguments.
//  *
//  * @example
//  * // returns 3
//  * _.arrayPrependedArrays( [ 1, 2, 3, 4 ], [ 5 ], [ 6 ], 7 );
//  *
//  * @example
//  * let dst = [ 1, 2, 3, 4 ];
//  * _.arrayPrependedArrays( dst, [ 5 ], [ 6 ], undefined );
//  * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
//  *
//  * @returns { Array } Returns count of added elements.
//  * @function arrayPrependedArrays
//  * @throws { Error } An Error if ( dstArray ) is not an Array.
//  * @memberof wTools
//  */
//
// function arrayPrependedArrays( dstArray, insArray )
// {
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.arrayIs( dstArray ),'arrayPrependedArrays :','Expects array' );
//   _.assert( _.longIs( insArray ),'arrayPrependedArrays :','Expects longIs entity' );
//
//   let result = 0;
//
//   for( let a = insArray.length - 1 ; a >= 0 ; a-- )
//   {
//     if( _.longIs( insArray[ a ] ) )
//     {
//       dstArray.unshift.apply( dstArray, insArray[ a ] );
//       result += insArray[ a ].length;
//     }
//     else
//     {
//       dstArray.unshift( insArray[ a ] );
//       result += 1;
//     }
//   }
//
//   return result;
// }
//
// //
//
// /**
//  * Method adds all unique elements from provided arrays to the beginning of an array( dstArray ) in same order
//  * that they are in( arguments ).
//  * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
//  * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
//  * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
//  * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
//  *
//  * @param { Array } dstArray - The destination array.
//  * @param{ longIs | * } arguments[...] - Source arguments.
//  *
//  * @example
//  * // returns 0
//  * _.arrayPrependedArraysOnce( [ 1, 2, 3, 4, 5, 6, 7 ], [ 5 ], [ 6 ], 7 );
//  *
//  * @example
//  * // returns 3
//  * _.arrayPrependedArraysOnce( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
//  *
//  * @example
//  * let dst = [ 1, 2, 3, 4 ];
//  * _.arrayPrependedArraysOnce( dst, [ 5 ], [ 6 ], undefined );
//  * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
//  *
//  * @returns { Array } Returns count of added elements.
//  * @function arrayPrependedArraysOnce
//  * @throws { Error } An Error if ( dstArray ) is not an Array.
//  * @memberof wTools
//  */
//
// function arrayPrependedArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
// {
//   _.assert( 2 <= arguments.length && arguments.length <= 4 );
//   _.assert( _.arrayIs( dstArray ),'arrayPrependedArraysOnce :','Expects array' );
//   _.assert( _.longIs( insArray ),'arrayPrependedArraysOnce :','Expects longIs entity' );
//
//   let result = 0;
//
//   function _prependOnce( element )
//   {
//     let index = _.arrayLeftIndex( dstArray, element, evaluator1, evaluator2 );
//     if( index === -1 )
//     {
//       // dstArray.unshift( argument );
//       dstArray.splice( result, 0, element );
//       result += 1;
//     }
//   }
//
//   // for( let ii = insArray.length - 1; ii >= 0; ii-- )
//   for( let ii = 0 ; ii < insArray.length ; ii++ )
//   {
//     if( _.longIs( insArray[ ii ] ) )
//     {
//       let array = insArray[ ii ];
//       // for( let a = array.length - 1; a >= 0; a-- )
//       for( let a = 0 ; a < array.length ; a++ )
//       _prependOnce( array[ a ] );
//     }
//     else
//     {
//       _prependOnce( insArray[ ii ] );
//     }
//   }
//
//   return result;
// }
//
// // --
// // array append
// // --
//
// function _arrayAppendUnrolling( dstArray, srcArray )
// {
//   _.assert( arguments.length === 2 );
//   _.assert( _.arrayIs( dstArray ), 'Expects array' );
//
//   for( let a = 0, len = srcArray.length ; a < len; a++ )
//   {
//     if( _.unrollIs( srcArray[ a ] ) )
//     {
//       _arrayAppendUnrolling( dstArray, srcArray[ a ] );
//     }
//     else
//     {
//       dstArray.push( srcArray[ a ] );
//     }
//   }
//
//   return dstArray;
// }
//
// //
//
// function arrayAppendUnrolling( dstArray )
// {
//   _.assert( arguments.length >= 1 );
//   _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );
//
//   dstArray = dstArray || [];
//
//   _._arrayAppendUnrolling( dstArray, _.longSlice( arguments, 1 ) );
//
//   return dstArray;
// }
//
// //
//
// function arrayAppend_( dstArray )
// {
//   _.assert( arguments.length >= 1 );
//   _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );
//
//   dstArray = dstArray || [];
//
//   for( let a = 1, len = arguments.length ; a < len; a++ )
//   {
//     if( _.longIs( arguments[ a ] ) )
//     {
//       dstArray.push.apply( dstArray, arguments[ a ] );
//     }
//     else
//     {
//       dstArray.push( arguments[ a ] );
//     }
//   }
//
//   return dstArray;
// }
//
// //
//
// function arrayAppendElement( dstArray, ins )
// {
//   arrayAppendedElement.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// /**
//  * The arrayAppendOnce() routine adds at the end of an array (dst) a value {-srcMap-},
//  * if the array (dst) doesn't have the value {-srcMap-}.
//  *
//  * @param { Array } dst - The source array.
//  * @param { * } src - The value to add.
//  *
//  * @example
//  * // returns [ 1, 2, 3, 4, 5 ]
//  * _.arrayAppendOnce( [ 1, 2, 3, 4 ], 5 );
//  *
//  * @example
//  * // returns [ 1, 2, 3, 4, 5 ]
//  * _.arrayAppendOnce( [ 1, 2, 3, 4, 5 ], 5 );
//  *
//  * @example
//  * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
//  * _.arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
//  *
//  * @example
//  * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
//  * _.arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
//  *
//  * @returns { Array } If an array (dst) doesn't have a value {-srcMap-} it returns the updated array (dst) with the new length,
//  * otherwise, it returns the original array (dst).
//  * @function arrayAppendOnce
//  * @throws { Error } Will throw an Error if (dst) is not an Array.
//  * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
//  * @memberof wTools
//  */
//
// function arrayAppendOnce( dstArray, ins, evaluator1, evaluator2 )
// {
//   arrayAppendedOnce.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// function arrayAppendOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
// {
//
//   let result = arrayAppendedOnce.apply( this, arguments );
//   _.assert( result >= 0,'array should have only unique elements, but has several', ins );
//   return dstArray;
// }
//
// //
//
// function arrayAppendedElement( dstArray, ins )
// {
//   _.assert( arguments.length === 2  );
//   _.assert( _.arrayIs( dstArray ) );
//   dstArray.push( ins );
//   return dstArray.length - 1;
// }
//
// //
//
// function arrayAppendedOnce( dstArray, ins, evaluator1, evaluator2 )
// {
//   let i = _.arrayLeftIndex.apply( _, arguments );
//
//   if( i === -1 )
//   {
//     dstArray.push( ins );
//     return dstArray.length - 1;
//   }
//
//   return -1;
// }
//
// //
//
// /**
//  * The arrayAppendArrayOnce() routine returns an array of elements from (dst)
//  * and appending only unique following arguments to the end.
//  *
//  * It creates two variables the (result) - array and the (argument) - elements of array-like object (arguments[]),
//  * iterate over array-like object (arguments[]) and assigns to the (argument) each element,
//  * checks, if (argument) is equal to the 'undefined'.
//  * If true, it throws an Error.
//  * if (argument) is an array-like.
//  * If true, it iterate over array (argument) and checks if (result) has the same values as the (argument).
//  * If false, it adds elements of (argument) to the end of the (result) array.
//  * Otherwise, it checks if (result) has not the same values as the (argument).
//  * If true, it adds elements to the end of the (result) array.
//  *
//  * @param { Array } dst - Initial array.
//  * @param {*} arguments[] - One or more argument(s).
//  *
//  * @example
//  * // returns [ 1, 2, 'str', {}, 5 ]
//  * let arr = _.arrayAppendArrayOnce( [ 1, 2 ], 'str', 2, {}, [ 'str', 5 ] );
//  *
//  * @returns { Array } - Returns an array (dst) with only unique following argument(s) that were added to the end of the (dst) array.
//  * @function arrayAppendArrayOnce
//  * @throws { Error } If the first argument is not array.
//  * @throws { Error } If type of the argument is equal undefined.
//  * @memberof wTools
//  */
//
// function arrayAppendArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
// {
//   arrayAppendedArrayOnce.apply( this,arguments )
//   return dstArray;
// }
//
// //
//
// function arrayAppendArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
// {
//   let result = arrayAppendedArrayOnce.apply( this,arguments )
//   _.assert( result === insArray.length );
//   return dstArray;
// }
//
// //
//
// function arrayAppendedArray( dstArray, insArray )
// {
//   _.assert( arguments.length === 2 )
//   _.assert( _.arrayIs( dstArray ),'arrayPrependedArray :','Expects array' );
//   _.assert( _.longIs( insArray ),'arrayPrependedArray :','Expects longIs' );
//
//   dstArray.push.apply( dstArray,insArray );
//   return insArray.length;
// }
//
// //
//
// function arrayAppendedArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
// {
//   _.assert( _.longIs( insArray ) );
//   _.assert( dstArray !== insArray );
//   _.assert( 2 <= arguments.length && arguments.length <= 4 );
//
//   let result = 0;
//
//   for( let i = 0 ; i < insArray.length ; i++ )
//   {
//     if( _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 ) === -1 )
//     {
//       dstArray.push( insArray[ i ] );
//       result += 1;
//     }
//   }
//
//   return result;
// }
//
// //
//
// /**
//  * The arrayAppendArray() routine adds one or more elements to the end of the (dst) array
//  * and returns the new length of the array.
//  *
//  * It creates two variables the (result) - array and the (argument) - elements of array-like object (arguments[]),
//  * iterate over array-like object (arguments[]) and assigns to the (argument) each element,
//  * checks, if (argument) is equal to the 'undefined'.
//  * If true, it throws an Error.
//  * If (argument) is an array-like.
//  * If true, it merges the (argument) into the (result) array.
//  * Otherwise, it adds element to the result.
//  *
//  * @param { Array } dst - Initial array.
//  * @param {*} arguments[] - One or more argument(s) to add to the end of the (dst) array.
//  *
//  * @example
//  * // returns [ 1, 2, 'str', false, { a : 1 }, 42, 3, 7, 13 ];
//  * let arr = _.arrayAppendArray( [ 1, 2 ], 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
//  *
//  * @returns { Array } - Returns an array (dst) with all of the following argument(s) that were added to the end of the (dst) array.
//  * @function arrayAppendArray
//  * @throws { Error } If the first argument is not an array.
//  * @throws { Error } If type of the argument is equal undefined.
//  * @memberof wTools
//  */
//
// function arrayAppendArray( dstArray, insArray )
// {
//   arrayAppendedArray.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// function arrayAppendArrays( dstArray )
// {
//   arrayAppendedArrays.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// function arrayAppendArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
// {
//   arrayAppendedArraysOnce.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// function arrayAppendArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
// {
//   let result = arrayAppendedArraysOnce.apply( this, arguments );
//
//   if( Config.debug )
//   {
//
//     let expected = 0;
//     for( let i = insArray.length - 1; i >= 0; i-- )
//     {
//       if( _.longIs( insArray[ i ] ) )
//       expected += insArray[ i ].length;
//       else
//       expected += 1;
//     }
//
//     _.assert( result === expected, '{-dstArray-} should have none element from {-insArray-}' );
//
//   }
//
//   return dstArray;
// }
//
// //
//
// function arrayAppendedArrays( dstArray, insArray )
// {
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.arrayIs( dstArray ), 'Expects array' );
//   _.assert( _.longIs( insArray ), 'Expects longIs entity' );
//
//   let result = 0;
//
//   for( let a = 0, len = insArray.length; a < len; a++ )
//   {
//     if( _.longIs( insArray[ a ] ) )
//     {
//       dstArray.push.apply( dstArray, insArray[ a ] );
//       result += insArray[ a ].length;
//     }
//     else
//     {
//       dstArray.push( insArray[ a ] );
//       result += 1;
//     }
//   }
//
//   return result;
// }
//
// //
//
// function arrayAppendedArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
// {
//   _.assert( 2 <= arguments.length && arguments.length <= 4 );
//   _.assert( _.arrayIs( dstArray ),'arrayAppendedArraysOnce :','Expects array' );
//   _.assert( _.longIs( insArray ),'arrayAppendedArraysOnce :','Expects longIs entity' );
//
//   let result = 0;
//
//   function _appendOnce( argument )
//   {
//     let index = _.arrayLeftIndex( dstArray, argument, evaluator1, evaluator2 );
//     if( index === -1 )
//     {
//       dstArray.push( argument );
//       result += 1;
//     }
//   }
//
//   for( let a = 0, len = insArray.length; a < len; a++ )
//   {
//     if( _.longIs( insArray[ a ] ) )
//     {
//       let array = insArray[ a ];
//       for( let i = 0, alen = array.length; i < alen; i++ )
//       _appendOnce( array[ i ] );
//     }
//     else
//     {
//       _appendOnce( insArray[ a ] );
//     }
//   }
//
//   return result;
// }
//
// // --
// // array remove
// // --
//
// function arrayRemoveElement( dstArray, ins, evaluator1, evaluator2 )
// {
//   arrayRemovedElement.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// /**
//  * The arrayRemoveElementOnce() routine removes the first matching element from (dstArray)
//  * that corresponds to the condition in the callback function and returns a modified array.
//  *
//  * It takes two (dstArray, ins) or three (dstArray, ins, onEvaluate) arguments,
//  * checks if arguments passed two, it calls the routine
//  * [arrayRemovedElementOnce( dstArray, ins )]{@link wTools.arrayRemovedElementOnce}
//  * Otherwise, if passed three arguments, it calls the routine
//  * [arrayRemovedElementOnce( dstArray, ins, onEvaluate )]{@link wTools.arrayRemovedElementOnce}
//  * @see  wTools.arrayRemovedElementOnce
//  * @param { Array } dstArray - The source array.
//  * @param { * } ins - The value to remove.
//  * @param { wTools~compareCallback } [ onEvaluate ] - The callback that compares (ins) with elements of the array.
//  * By default, it checks the equality of two arguments.
//  *
//  * @example
//  * // returns [ 1, 2, 3, 'str' ]
//  * let arr = _.arrayRemoveElementOnce( [ 1, 'str', 2, 3, 'str' ], 'str' );
//  *
//  * @example
//  * // returns [ 3, 7, 13, 33 ]
//  * let arr = _.arrayRemoveElementOnce( [ 3, 7, 33, 13, 33 ], 13, function( el, ins ) {
//  *   return el > ins;
//  * });
//  *
//  * @returns { Array } - Returns the modified (dstArray) array with the new length.
//  * @function arrayRemoveElementOnce
//  * @throws { Error } If the first argument is not an array.
//  * @throws { Error } If passed less than two or more than three arguments.
//  * @throws { Error } If the third argument is not a function.
//  * @memberof wTools
//  */
//
// function arrayRemoveElementOnce( dstArray, ins, evaluator1, evaluator2 )
// {
//   arrayRemovedElementOnce.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// function arrayRemoveElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
// {
//   let result = arrayRemovedElementOnce.apply( this, arguments );
//   _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
//   return dstArray;
// }
//
// //
//
// function arrayRemovedElement( dstArray, ins, evaluator1, evaluator2 )
// {
//   let index = _.arrayLeftIndex.apply( _, arguments );
//
//   /* qqq : this is not correct! */
//
//   if( index !== -1 )
//   {
//     dstArray.splice( index,1 );
//   }
//
//   return index;
// }
//
// //
//
// /**
//  * The callback function to compare two values.
//  *
//  * @callback wTools~compareCallback
//  * @param { * } el - The element of the array.
//  * @param { * } ins - The value to compare.
//  */
//
// /**
//  * The arrayRemovedElementOnce() routine returns the index of the first matching element from (dstArray)
//  * that corresponds to the condition in the callback function and remove this element.
//  *
//  * It takes two (dstArray, ins) or three (dstArray, ins, onEvaluate) arguments,
//  * checks if arguments passed two, it calls built in function(dstArray.indexOf(ins))
//  * that looking for the value of the (ins) in the (dstArray).
//  * If true, it removes the value (ins) from (dstArray) array by corresponding index.
//  * Otherwise, if passed three arguments, it calls the routine
//  * [arrayLeftIndex( dstArray, ins, onEvaluate )]{@link wTools.arrayLeftIndex}
//  * If callback function(onEvaluate) returns true, it returns the index that will be removed from (dstArray).
//  * @see {@link wTools.arrayLeftIndex} - See for more information.
//  *
//  * @param { Array } dstArray - The source array.
//  * @param { * } ins - The value to remove.
//  * @param { wTools~compareCallback } [ onEvaluate ] - The callback that compares (ins) with elements of the array.
//  * By default, it checks the equality of two arguments.
//  *
//  * @example
//  * // returns 1
//  * let arr = _.arrayRemovedElementOnce( [ 2, 4, 6 ], 4, function( el ) {
//  *   return el;
//  * });
//  *
//  * @example
//  * // returns 0
//  * let arr = _.arrayRemovedElementOnce( [ 2, 4, 6 ], 2 );
//  *
//  * @returns { Number } - Returns the index of the value (ins) that was removed from (dstArray).
//  * @function arrayRemovedElementOnce
//  * @throws { Error } If the first argument is not an array-like.
//  * @throws { Error } If passed less than two or more than three arguments.
//  * @throws { Error } If the third argument is not a function.
//  * @memberof wTools
//  */
//
// function arrayRemovedElementOnce( dstArray, ins, evaluator1, evaluator2 )
// {
//
//   let index = _.arrayLeftIndex.apply( _, arguments );
//   if( index >= 0 )
//   dstArray.splice( index, 1 );
//
//   return index;
// }
//
// //
//
// function arrayRemovedOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
// {
//   let result = arrayRemovedElementOnce.apply( this, arguments );
//   _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
//   return dstArray;
// }
//
// //
//
// function arrayRemovedOnceElement( dstArray, ins, evaluator1, evaluator2 )
// {
//
//   let result;
//   let index = _.arrayLeftIndex.apply( _, arguments );
//   if( index >= 0 )
//   {
//     result = dstArray[ index ];
//     dstArray.splice( index, 1 );
//   }
//
//   return result;
// }
//
// //
//
// function arrayRemovedOnceElementStrictly( dstArray, ins, evaluator1, evaluator2 )
// {
//
//   let result;
//   let index = _.arrayLeftIndex.apply( _, arguments );
//   if( index >= 0 )
//   {
//     result = dstArray[ index ];
//     dstArray.splice( index, 1 );
//   }
//   else _.assert( 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
//
//   return result;
// }
// //
//
// function arrayRemoveArray( dstArray, insArray )
// {
//   arrayRemovedArray.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// function arrayRemoveArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
// {
//   arrayRemovedArrayOnce.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// function arrayRemoveArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
// {
//   let result = arrayRemovedArrayOnce.apply( this, arguments );
//   _.assert( result === insArray.length );
//   return dstArray;
// }
//
// //
//
// function arrayRemovedArray( dstArray, insArray )
// {
//   _.assert( arguments.length === 2 )
//   _.assert( _.arrayIs( dstArray ) );
//   _.assert( _.longIs( insArray ) );
//   _.assert( dstArray !== insArray );
//
//   let result = 0;
//   let index = -1;
//
//   for( let i = 0, len = insArray.length; i < len ; i++ )
//   {
//     index = dstArray.indexOf( insArray[ i ] );
//     while( index !== -1 )
//     {
//       dstArray.splice( index,1 );
//       result += 1;
//       index = dstArray.indexOf( insArray[ i ], index );
//     }
//   }
//
//   return result;
// }
//
// //
//
// /**
//  * The callback function to compare two values.
//  *
//  * @callback arrayRemovedArrayOnce~onEvaluate
//  * @param { * } el - The element of the (dstArray[n]) array.
//  * @param { * } ins - The value to compare (insArray[n]).
//  */
//
// /**
//  * The arrayRemovedArrayOnce() determines whether a (dstArray) array has the same values as in a (insArray) array,
//  * and returns amount of the deleted elements from the (dstArray).
//  *
//  * It takes two (dstArray, insArray) or three (dstArray, insArray, onEqualize) arguments, creates variable (let result = 0),
//  * checks if (arguments[..]) passed two, it iterates over the (insArray) array and calls for each element built in function(dstArray.indexOf(insArray[i])).
//  * that looking for the value of the (insArray[i]) array in the (dstArray) array.
//  * If true, it removes the value (insArray[i]) from (dstArray) array by corresponding index,
//  * and incrementing the variable (result++).
//  * Otherwise, if passed three (arguments[...]), it iterates over the (insArray) and calls for each element the routine
//  *
//  * If callback function(onEqualize) returns true, it returns the index that will be removed from (dstArray),
//  * and then incrementing the variable (result++).
//  *
//  * @see wTools.arrayLeftIndex
//  *
//  * @param { longIs } dstArray - The target array.
//  * @param { longIs } insArray - The source array.
//  * @param { function } onEqualize - The callback function. By default, it checks the equality of two arguments.
//  *
//  * @example
//  * // returns 0
//  * _.arrayRemovedArrayOnce( [  ], [  ] );
//  *
//  * @example
//  * // returns 2
//  * _.arrayRemovedArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ] );
//  *
//  * @example
//  * // returns 4
//  * let got = _.arrayRemovedArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ], function( a, b ) {
//  *   return a < b;
//  * } );
//  *
//  * @returns { number }  Returns amount of the deleted elements from the (dstArray).
//  * @function arrayRemovedArrayOnce
//  * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
//  * @throws { Error } Will throw an Error if (insArray) is not an array-like.
//  * @throws { Error } Will throw an Error if (arguments.length < 2  || arguments.length > 3).
//  * @memberof wTools
//  */
//
// function arrayRemovedArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
// {
//   _.assert( _.arrayIs( dstArray ) );
//   _.assert( _.longIs( insArray ) );
//   _.assert( dstArray !== insArray );
//   _.assert( 2 <= arguments.length && arguments.length <= 4 );
//
//   let result = 0;
//   let index = -1;
//
//   for( let i = 0, len = insArray.length; i < len ; i++ )
//   {
//     index = _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 );
//
//     if( index >= 0 )
//     {
//       dstArray.splice( index,1 );
//       result += 1;
//     }
//   }
//
//   return result;
// }
//
// //
//
// function arrayRemoveArrays( dstArray, insArray )
// {
//   arrayRemovedArrays.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// function arrayRemoveArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
// {
//   arrayRemovedArraysOnce.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// function arrayRemoveArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
// {
//   let result = arrayRemovedArraysOnce.apply( this, arguments );
//
//   let expected = 0;
//   for( let i = insArray.length - 1; i >= 0; i-- )
//   {
//     if( _.longIs( insArray[ i ] ) )
//     expected += insArray[ i ].length;
//     else
//     expected += 1;
//   }
//
//   _.assert( result === expected );
//
//   return dstArray;
// }
//
// //
//
// function arrayRemovedArrays( dstArray, insArray )
// {
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.arrayIs( dstArray ),'arrayRemovedArrays :','Expects array' );
//   _.assert( _.longIs( insArray ),'arrayRemovedArrays :','Expects longIs entity' );
//
//   let result = 0;
//
//   function _remove( argument )
//   {
//     let index = dstArray.indexOf( argument );
//     while( index !== -1 )
//     {
//       dstArray.splice( index,1 );
//       result += 1;
//       index = dstArray.indexOf( argument, index );
//     }
//   }
//
//   for( let a = insArray.length - 1; a >= 0; a-- )
//   {
//     if( _.longIs( insArray[ a ] ) )
//     {
//       let array = insArray[ a ];
//       for( let i = array.length - 1; i >= 0; i-- )
//       _remove( array[ i ] );
//     }
//     else
//     {
//       _remove( insArray[ a ] );
//     }
//   }
//
//   return result;
// }
//
// //
//
// function arrayRemovedArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
// {
//   _.assert( 2 <= arguments.length && arguments.length <= 4 );
//   _.assert( _.arrayIs( dstArray ),'arrayRemovedArraysOnce :','Expects array' );
//   _.assert( _.longIs( insArray ),'arrayRemovedArraysOnce :','Expects longIs entity' );
//
//   let result = 0;
//
//   function _removeOnce( argument )
//   {
//     let index = _.arrayLeftIndex( dstArray, argument, evaluator1, evaluator2 );
//     if( index >= 0 )
//     {
//       dstArray.splice( index, 1 );
//       result += 1;
//     }
//   }
//
//   for( let a = insArray.length - 1; a >= 0; a-- )
//   {
//     if( _.longIs( insArray[ a ] ) )
//     {
//       let array = insArray[ a ];
//       for( let i = array.length - 1; i >= 0; i-- )
//       _removeOnce( array[ i ] );
//     }
//     else
//     {
//       _removeOnce( insArray[ a ] );
//     }
//   }
//
//   return result;
// }
//
// //
//
// /**
//  * Callback for compare two value.
//  *
//  * @callback arrayRemoveAll~compareCallback
//  * @param { * } el - Element of the array.
//  * @param { * } ins - Value to compare.
//  */
//
// /**
//  * The arrayRemoveAll() routine removes all (ins) values from (dstArray)
//  * that corresponds to the condition in the callback function and returns the modified array.
//  *
//  * It takes two (dstArray, ins) or three (dstArray, ins, onEvaluate) arguments,
//  * checks if arguments passed two, it calls the routine
//  * [arrayRemovedElement( dstArray, ins )]{@link wTools.arrayRemovedElement}
//  * Otherwise, if passed three arguments, it calls the routine
//  * [arrayRemovedElement( dstArray, ins, onEvaluate )]{@link wTools.arrayRemovedElement}
//  *
//  * @see wTools.arrayRemovedElement
//  *
//  * @param { Array } dstArray - The source array.
//  * @param { * } ins - The value to remove.
//  * @param { wTools~compareCallback } [ onEvaluate ] - The callback that compares (ins) with elements of the array.
//  * By default, it checks the equality of two arguments.
//  *
//  * @example
//  * // returns [ 2, 2, 3, 5 ]
//  * let arr = _.arrayRemoveAll( [ 1, 2, 2, 3, 5 ], 2, function( el, ins ) {
//  *   return el < ins;
//  * });
//  *
//  * @example
//  * // returns [ 1, 3, 5 ]
//  * let arr = _.arrayRemoveAll( [ 1, 2, 2, 3, 5 ], 2 );
//  *
//  * @returns { Array } - Returns the modified (dstArray) array with the new length.
//  * @function arrayRemoveAll
//  * @throws { Error } If the first argument is not an array-like.
//  * @throws { Error } If passed less than two or more than three arguments.
//  * @throws { Error } If the third argument is not a function.
//  * @memberof wTools
//  */
//
// function arrayRemoveAll( dstArray, ins, evaluator1, evaluator2 )
// {
//   arrayRemovedAll.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// function arrayRemovedAll( dstArray, ins, evaluator1, evaluator2  )
// {
//   let index = _.arrayLeftIndex.apply( _, arguments );
//   let result = 0;
//
//   while( index >= 0 )
//   {
//     dstArray.splice( index,1 );
//     result += 1;
//     index = _.arrayLeftIndex.apply( _, arguments );
//   }
//
//   return result;
// }
//
// // --
// // array flatten
// // --
//
// /**
//  * The arrayFlatten() routine returns an array that contains all the passed arguments.
//  *
//  * It creates two variables the (result) - array and the {-srcMap-} - elements of array-like object (arguments[]),
//  * iterate over array-like object (arguments[]) and assigns to the {-srcMap-} each element,
//  * checks if {-srcMap-} is not equal to the 'undefined'.
//  * If true, it adds element to the result.
//  * If {-srcMap-} is an Array and if element(s) of the {-srcMap-} is not equal to the 'undefined'.
//  * If true, it adds to the (result) each element of the {-srcMap-} array.
//  * Otherwise, if {-srcMap-} is an Array and if element(s) of the {-srcMap-} is equal to the 'undefined' it throws an Error.
//  *
//  * @param {...*} arguments - One or more argument(s).
//  *
//  * @example
//  * // returns [ 'str', {}, 1, 2, 5, true ]
//  * let arr = _.arrayFlatten( 'str', {}, [ 1, 2 ], 5, true );
//  *
//  * @returns { Array } - Returns an array of the passed argument(s).
//  * @function arrayFlatten
//  * @throws { Error } If (arguments[...]) is an Array and has an 'undefined' element.
//  * @memberof wTools
//  */
//
// // function arrayFlatten()
// // {
// //   let result = _.arrayIs( this ) ? this : [];
// //
// //   for( let a = 0 ; a < arguments.length ; a++ )
// //   {
// //
// //     let src = arguments[ a ];
// //
// //     if( !_.longIs( src ) )
// //     {
// //       if( src !== undefined ) result.push( src );
// //       continue;
// //     }
// //
// //     for( let s = 0 ; s < src.length ; s++ )
// //     {
// //       if( _.arrayIs( src[ s ] ) )
// //       _.arrayFlatten.call( result,src[ s ] );
// //       else if( src[ s ] !== undefined )
// //       result.push( src[ s ] );
// //       else if( src[ s ] === undefined )
// //       throw _.err( 'array should have no undefined' );
// //     }
// //
// //   }
// //
// //   return result;
// // }
// //
// //
//
// function arrayFlatten( dstArray, insArray )
// {
//   if( arguments[ 0 ] === null )
//   arguments[ 0 ] = [];
//   _.arrayFlattened.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// function arrayFlattenOnce( dstArray, insArray, evaluator1, evaluator2 )
// {
//   arrayFlattenedOnce.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// function arrayFlattenOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
// {
//   let result = arrayFlattenedOnce.apply( this, arguments );
//
//   function _count( arr )
//   {
//     let expected = 0;
//     for( let i = arr.length - 1; i >= 0; i-- )
//     {
//       if( _.longIs( arr[ i ] ) )
//       expected += _count( arr[ i ] );
//       else
//       expected += 1;
//     }
//     return expected;
//   }
//
//  _.assert( result === _count( insArray ) );
//
//  return dstArray;
// }
//
// //
//
// function arrayFlattened( dstArray, insArray )
// {
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.objectIs( this ) );
//   _.assert( _.arrayIs( dstArray ) );
//   // _.assert( _.longIs( insArray ) );
//
//   let result = 0;
//
//   if( _.longIs( insArray ) )
//   {
//     for( let i = 0, len = insArray.length; i < len; i++ )
//     {
//       if( _.longIs( insArray[ i ] ) )
//       {
//         let c = _.arrayFlattened( dstArray, insArray[ i ] );
//         result += c;
//       }
//       else
//       {
//         _.assert( insArray[ i ] !== undefined, 'The array should have no undefined' );
//         dstArray.push( insArray[ i ] );
//         result += 1;
//       }
//     }
//   }
//   else
//   {
//     dstArray.push( insArray );
//     result += 1;
//   }
//
//   return result;
// }
//
// //
//
// function arrayFlattenedOnce( dstArray, insArray, evaluator1, evaluator2 )
// {
//   _.assert( 2 <= arguments.length && arguments.length <= 4 );
//   _.assert( _.arrayIs( dstArray ) );
//   // _.assert( _.longIs( insArray ) );
//
//   let result = 0;
//
//   if( _.longIs( insArray ) )
//   {
//     for( let i = 0, len = insArray.length; i < len; i++ )
//     {
//       _.assert( insArray[ i ] !== undefined );
//       if( _.longIs( insArray[ i ] ) )
//       {
//         let c = _.arrayFlattenedOnce( dstArray, insArray[ i ], evaluator1, evaluator2 );
//         result += c;
//       }
//       else
//       {
//         let index = _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 );
//         if( index === -1 )
//         {
//           dstArray.push( insArray[ i ] );
//           result += 1;
//         }
//       }
//     }
//   }
//   else
//   {
//     let index = _.arrayLeftIndex( dstArray, insArray, evaluator1, evaluator2 );
//     if( index === -1 )
//     {
//       dstArray.push( insArray );
//       result += 1;
//     }
//   }
//
//   return result;
// }
//
// // --
// // array replace
// // --
//
// /**
//  * The arrayReplaceOnce() routine returns the index of the (dstArray) array which will be replaced by (sub),
//  * if (dstArray) has the value (ins).
//  *
//  * It takes three arguments (dstArray, ins, sub), calls built in function(dstArray.indexOf(ins)),
//  * that looking for value (ins) in the (dstArray).
//  * If true, it replaces (ins) value of (dstArray) by (sub) and returns the index of the (ins).
//  * Otherwise, it returns (-1) index.
//  *
//  * @param { Array } dstArray - The source array.
//  * @param { * } ins - The value to find.
//  * @param { * } sub - The value to replace.
//  *
//  * @example
//  * // returns -1
//  * _.arrayReplaceOnce( [ 2, 4, 6, 8, 10 ], 12, 14 );
//  *
//  * @example
//  * // returns 1
//  * _.arrayReplaceOnce( [ 1, undefined, 3, 4, 5 ], undefined, 2 );
//  *
//  * @example
//  * // returns 3
//  * _.arrayReplaceOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry', 'Bob' );
//  *
//  * @example
//  * // returns 4
//  * _.arrayReplaceOnce( [ true, true, true, true, false ], false, true );
//  *
//  * @returns { number }  Returns the index of the (dstArray) array which will be replaced by (sub),
//  * if (dstArray) has the value (ins).
//  * @function arrayReplaceOnce
//  * @throws { Error } Will throw an Error if (dstArray) is not an array.
//  * @throws { Error } Will throw an Error if (arguments.length) is less than three.
//  * @memberof wTools
//  */
//
// function arrayReplaceOnce( dstArray, ins, sub, evaluator1, evaluator2 )
// {
//   arrayReplacedOnce.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// function arrayReplaceOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
// {
//   let result = arrayReplacedOnce.apply( this, arguments );
//   _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
//   return dstArray;
// }
//
// //
//
// function arrayReplacedOnce( dstArray, ins, sub, evaluator1, evaluator2 )
// {
//   _.assert( 3 <= arguments.length && arguments.length <= 5 );
//
//   let index = -1;
//
//   index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
//
//   if( index >= 0 )
//   dstArray.splice( index, 1, sub );
//
//   return index;
// }
//
// //
//
// function arrayReplaceArrayOnce( dstArray, ins, sub, evaluator1, evaluator2  )
// {
//   arrayReplacedArrayOnce.apply( this,arguments );
//   return dstArray;
// }
//
// //
//
// function arrayReplaceArrayOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2  )
// {
//   let result = arrayReplacedArrayOnce.apply( this,arguments );
//   _.assert( result === ins.length, '{-dstArray-} should have each element of {-insArray-}' );
//   _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has' );
//   return dstArray;
// }
//
// //
//
// function arrayReplacedArrayOnce( dstArray, ins, sub, evaluator1, evaluator2 )
// {
//   _.assert( _.longIs( ins ) );
//   _.assert( _.longIs( sub ) );
//   _.assert( 3 <= arguments.length && arguments.length <= 5 );
//
//   let index = -1;
//   let result = 0;
//
//   for( let i = 0, len = ins.length; i < len; i++ )
//   {
//     index = _.arrayLeftIndex( dstArray, ins[ i ], evaluator1, evaluator2 )
//     if( index >= 0 )
//     {
//       let subValue = sub[ i ];
//       if( subValue === undefined )
//       dstArray.splice( index, 1 );
//       else
//       dstArray.splice( index, 1, subValue );
//       result += 1;
//     }
//   }
//
//   return result;
// }
//
// //
//
// function arrayReplaceAll( dstArray, ins, sub, evaluator1, evaluator2 )
// {
//   arrayReplacedAll.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// function arrayReplacedAll( dstArray, ins, sub, evaluator1, evaluator2 )
// {
//   _.assert( 3 <= arguments.length && arguments.length <= 5 );
//
//   let index = -1;
//   let result = 0;
//
//   index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
//
//   while( index !== -1 )
//   {
//     dstArray.splice( index,1,sub );
//     result += 1;
//     index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
//   }
//
//   return result;
// }
//
// //
//
// /**
//  * The arrayUpdate() routine adds a value (sub) to an array (dstArray) or replaces a value (ins) of the array (dstArray) by (sub),
//  * and returns the last added index or the last replaced index of the array (dstArray).
//  *
//  * It creates the variable (index) assigns and calls to it the function(arrayReplaceOnce( dstArray, ins, sub ).
//  * [arrayReplaceOnce( dstArray, ins, sub )]{@link wTools.arrayReplaceOnce}.
//  * Checks if (index) equal to the -1.
//  * If true, it adds to an array (dstArray) a value (sub), and returns the last added index of the array (dstArray).
//  * Otherwise, it returns the replaced (index).
//  *
//  * @see wTools.arrayReplaceOnce
//  *
//  * @param { Array } dstArray - The source array.
//  * @param { * } ins - The value to change.
//  * @param { * } sub - The value to add or replace.
//  *
//  * @example
//  * // returns 3
//  * let add = _.arrayUpdate( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry', 'Dmitry' );
//  * console.log( add ) = > [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
//  *
//  * @example
//  * // returns 5
//  * let add = _.arrayUpdate( [ 1, 2, 3, 4, 5 ], 6, 6 );
//  * console.log( add ) => [ 1, 2, 3, 4, 5, 6 ];
//  *
//  * @example
//  * // returns 4
//  * let replace = _.arrayUpdate( [ true, true, true, true, false ], false, true );
//  * console.log( replace ) => [ true, true true, true, true ];
//  *
//  * @returns { number } Returns the last added or the last replaced index.
//  * @function arrayUpdate
//  * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
//  * @throws { Error } Will throw an Error if (arguments.length) is less or more than three.
//  * @memberof wTools
//  */
//
// function arrayUpdate( dstArray, ins, sub, evaluator1, evaluator2 )
// {
//   let index = arrayReplacedOnce.apply( this, arguments );
//
//   if( index === -1 )
//   {
//     dstArray.push( sub );
//     index = dstArray.length - 1;
//   }
//
//   return index;
// }

// --
// array set
// --

/**
 * Returns new array that contains difference between two arrays: ( src1 ) and ( src2 ).
 * If some element is present in both arrays, this element and all copies of it are ignored.
 * @param { longIs } src1 - source array;
 * @param { longIs} src2 - array to compare with ( src1 ).
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5, 6 ]
 * _.arraySetDiff( [ 1, 2, 3 ], [ 4, 5, 6 ] );
 *
 * @example
 * // returns [ 2, 4, 3, 5 ]
 * _.arraySetDiff( [ 1, 2, 4 ], [ 1, 3, 5 ] );
 *
 * @returns { Array } Array with unique elements from both arrays.
 * @function arraySetDiff
 * @throws { Error } If arguments count is not 2.
 * @throws { Error } If one or both argument(s) are not longIs entities.
 * @memberof wTools
 */

function arraySetDiff( src1, src2 )
{
  let result = [];

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( src1 ) );
  _.assert( _.longIs( src2 ) );

  for( let i = 0 ; i < src1.length ; i++ )
  {
    if( src2.indexOf( src1[ i ] ) === -1 )
    result.push( src1[ i ] );
  }

  for( let i = 0 ; i < src2.length ; i++ )
  {
    if( src1.indexOf( src2[ i ] ) === -1 )
    result.push( src2[ i ] );
  }

  return result;
}

//

/**
 * Returns new array that contains elements from ( src ) that are not present in ( but ).
 * All copies of ignored element are ignored too.
 * @param { longIs } src - source array;
 * @param { longIs} but - array of elements to ignore.
 *
 * @example
 * // returns []
 * _.arraySetBut( [ 1, 1, 1 ], [ 1 ] );
 *
 * @example
 * // returns [ 2, 2 ]
 * _.arraySetBut( [ 1, 1, 2, 2, 3, 3 ], [ 1, 3 ] );
 *
 * @returns { Array } Source array without elements from ( but ).
 * @function arraySetBut
 * @throws { Error } If arguments count is not 2.
 * @throws { Error } If one or both argument(s) are not longIs entities.
 * @memberof wTools
 */

function arraySetBut( dst )
{
  let args = _.longSlice( arguments );

  if( dst === null )
  if( args.length > 1 )
  {
    dst = _.longSlice( args[ 1 ] );
    args.splice( 1,1 );
  }
  else
  {
    return [];
  }

  args[ 0 ] = dst;

  _.assert( arguments.length >= 1, 'Expects at least one argument' );
  for( let a = 0 ; a < args.length ; a++ )
  _.assert( _.longIs( args[ a ] ) );

  for( let i = dst.length-1 ; i >= 0 ; i-- )
  {
    for( let a = 1 ; a < args.length ; a++ )
    {
      let but = args[ a ];
      if( but.indexOf( dst[ i ] ) !== -1 )
      {
        dst.splice( i,1 );
        break;
      }
    }
  }

  return dst;
}

//

/**
 * Returns array that contains elements from ( src ) that exists at least in one of arrays provided after first argument.
 * If element exists and it has copies, all copies of that element will be included into result array.
 * @param { longIs } src - source array;
 * @param { ...longIs } - sequence of arrays to compare with ( src ).
 *
 * @example
 * // returns [ 1, 3 ]
 * _.arraySetIntersection( [ 1, 2, 3 ], [ 1 ], [ 3 ] );
 *
 * @example
 * // returns [ 1, 1, 2, 2, 3, 3 ]
 * _.arraySetIntersection( [ 1, 1, 2, 2, 3, 3 ], [ 1 ], [ 2 ], [ 3 ], [ 4 ] );
 *
 * @returns { Array } Array with elements that are a part of at least one of the provided arrays.
 * @function arraySetIntersection
 * @throws { Error } If one of arguments is not an longIs entity.
 * @memberof wTools
 */

function arraySetIntersection( dst )
{

  let first = 1;
  if( dst === null )
  if( arguments.length > 1 )
  {
    dst = _.longSlice( arguments[ 1 ] );
    first = 2;
  }
  else
  {
    return [];
  }

  _.assert( arguments.length >= 1, 'Expects at least one argument' );
  _.assert( _.longIs( dst ) );
  for( let a = 1 ; a < arguments.length ; a++ )
  _.assert( _.longIs( arguments[ a ] ) );

  for( let i = dst.length-1 ; i >= 0 ; i-- )
  {

    for( let a = first ; a < arguments.length ; a++ )
    {
      let ins = arguments[ a ];
      if( ins.indexOf( dst[ i ] ) === -1 )
      {
        dst.splice( i,1 );
        break;
      }
    }

  }

  return dst;
}

//

function arraySetUnion( dst )
{
  let args = _.longSlice( arguments );

  if( dst === null )
  if( arguments.length > 1 )
  {
    dst = [];
    // dst = _.longSlice( args[ 1 ] );
    // args.splice( 1,1 );
  }
  else
  {
    return [];
  }

  _.assert( arguments.length >= 1, 'Expects at least one argument' );
  _.assert( _.longIs( dst ) );
  for( let a = 1 ; a < args.length ; a++ )
  _.assert( _.longIs( args[ a ] ) );

  for( let a = 1 ; a < args.length ; a++ )
  {
    let ins = args[ a ];
    for( let i = 0 ; i < ins.length ; i++ )
    {
      if( dst.indexOf( ins[ i ] ) === -1 )
      dst.push( ins[ i ] )
    }
  }

  return dst;
}

//

/*
function arraySetContainAll( src )
{
  let result = [];

  _.assert( _.longIs( src ) );

  for( let a = 1 ; a < arguments.length ; a++ )
  {

    _.assert( _.longIs( arguments[ a ] ) );

    if( src.length > arguments[ a ].length )
    return false;

    for( let i = 0 ; i < src.length ; i++ )
    {

      throw _.err( 'Not tested' );
      if( arguments[ a ].indexOf( src[ i ] ) !== -1 )
      {
        throw _.err( 'Not tested' );
        return false;
      }

    }

  }

  return true;
}
*/
//
  /**
   * The arraySetContainAll() routine returns true, if at least one of the following arrays (arguments[...]),
   * contains all the same values as in the {-srcMap-} array.
   *
   * @param { longIs } src - The source array.
   * @param { ...longIs } arguments[...] - The target array.
   *
   * @example
   * // returns true
   * _.arraySetContainAll( [ 1, 'b', 'c', 4 ], [ 1, 2, 3, 4, 5, 'b', 'c' ] );
   *
   * @example
   * // returns false
   * _.arraySetContainAll( [ 'abc', 'def', true, 26 ], [ 1, 2, 3, 4 ], [ 26, 'abc', 'def', true ] );
   *
   * @returns { boolean } Returns true, if at least one of the following arrays (arguments[...]),
   * contains all the same values as in the {-srcMap-} array.
   * If length of the {-srcMap-} is more than the next argument, it returns false.
   * Otherwise, it returns false.
   * @function arraySetContainAll
   * @throws { Error } Will throw an Error if {-srcMap-} is not an array-like.
   * @throws { Error } Will throw an Error if (arguments[...]) is not an array-like.
   * @memberof wTools
   */

function arraySetContainAll( src )
{
  _.assert( _.longIs( src ) );
  for( let a = 1 ; a < arguments.length ; a++ )
  _.assert( _.longIs( arguments[ a ] ) );

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    let ins = arguments[ a ];

    for( let i = 0 ; i < ins.length ; i++ )
    {
      if( src.indexOf( ins[ i ] ) === -1 )
      return false;
    }

  }

  return true;
}

//

/**
 * The arraySetContainAny() routine returns true, if at least one of the following arrays (arguments[...]),
 * contains the first matching value from {-srcMap-}.
 *
 * @param { longIs } src - The source array.
 * @param { ...longIs } arguments[...] - The target array.
 *
 * @example
 * // returns true
 * _.arraySetContainAny( [ 33, 4, 5, 'b', 'c' ], [ 1, 'b', 'c', 4 ], [ 33, 13, 3 ] );
 *
 * @example
 * // returns true
 * _.arraySetContainAny( [ 'abc', 'def', true, 26 ], [ 1, 2, 3, 4 ], [ 26, 'abc', 'def', true ] );
 *
 * @example
 * // returns false
 * _.arraySetContainAny( [ 1, 'b', 'c', 4 ], [ 3, 5, 'd', 'e' ], [ 'abc', 33, 7 ] );
 *
 * @returns { Boolean } Returns true, if at least one of the following arrays (arguments[...]),
 * contains the first matching value from {-srcMap-}.
 * Otherwise, it returns false.
 * @function arraySetContainAny
 * @throws { Error } Will throw an Error if {-srcMap-} is not an array-like.
 * @throws { Error } Will throw an Error if (arguments[...]) is not an array-like.
 * @memberof wTools
 */

function arraySetContainAny( src )
{
  _.assert( _.longIs( src ) );
  for( let a = 1 ; a < arguments.length ; a++ )
  _.assert( _.longIs( arguments[ a ] ) );

  if( src.length === 0 )
  return true;

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    let ins = arguments[ a ];

    let i;
    for( i = 0 ; i < ins.length ; i++ )
    {
      if( src.indexOf( ins[ i ] ) !== -1 )
      break;
    }

    if( i === ins.length )
    return false;

  }

  return true;
}

//

function arraySetContainNone( src )
{
  _.assert( _.longIs( src ) );

  for( let a = 1 ; a < arguments.length ; a++ )
  {

    _.assert( _.longIs( arguments[ a ] ) );

    for( let i = 0 ; i < src.length ; i++ )
    {

      if( arguments[ a ].indexOf( src[ i ] ) !== -1 )
      {
        return false;
      }

    }

  }

  return true;
}

//

/**
 * Returns true if ( ins1 ) and ( ins2) arrays have same length and elements, elements order doesn't matter.
 * Inner arrays of arguments are not compared and result of such combination will be false.
 * @param { longIs } ins1 - source array;
 * @param { longIs} ins2 - array to compare with.
 *
 * @example
 * // returns false
 * _.arraySetIdentical( [ 1, 2, 3 ], [ 4, 5, 6 ] );
 *
 * @example
 * // returns true
 * _.arraySetIdentical( [ 1, 2, 4 ], [ 4, 2, 1 ] );
 *
 * @returns { Boolean } Result of comparison as boolean.
 * @function arraySetIdentical
 * @throws { Error } If one of arguments is not an ArrayLike entity.
 * @throws { Error } If arguments length is not 2.
 * @memberof wTools
 */

function arraySetIdentical( ins1,ins2 )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( ins1 ) );
  _.assert( _.longIs( ins2 ) );

  if( ins1.length !== ins2.length )
  return false;

  let result = _.arraySetDiff( ins1,ins2 );

  return result.length === 0;
}

// --
// fields
// --

// let unrollSymbol = Symbol.for( 'unroll' );

let Fields =
{

  // ArrayType : Array,
  //
  // accuracy : 1e-7,
  // accuracySqrt : 1e-4,
  // accuracySqr : 1e-14,

}

// --
// routines
// --

let Routines =
{

  // buffer

  bufferRawIs : bufferRawIs,
  bufferTypedIs : bufferTypedIs,
  bufferViewIs : bufferViewIs,
  bufferNodeIs : bufferNodeIs,
  bufferAnyIs : bufferAnyIs,
  bufferBytesIs : bufferBytesIs,
  bytesIs : bufferBytesIs,
  constructorIsBuffer : constructorIsBuffer,

  buffersTypedAreEquivalent : buffersTypedAreEquivalent,
  buffersTypedAreIdentical : buffersTypedAreIdentical,
  buffersRawAreIdentical : buffersRawAreIdentical,
  buffersViewAreIdentical : buffersViewAreIdentical,
  buffersNodeAreIdentical : buffersNodeAreIdentical,
  buffersAreEquivalent : buffersAreEquivalent,
  buffersAreIdentical : buffersAreIdentical,

  bufferMakeSimilar : bufferMakeSimilar,
  bufferButRange : bufferButRange,
  bufferRelen : bufferRelen,
  bufferResize : bufferResize,
  bufferBytesGet : bufferBytesGet,
  bufferRetype : bufferRetype,

  bufferJoin : bufferJoin,

  bufferMove : bufferMove,
  bufferToStr : bufferToStr,
  bufferToDom : bufferToDom,

  bufferLeft : bufferLeft,
  bufferSplit : bufferSplit,
  bufferCutOffLeft : bufferCutOffLeft,

  bufferFromArrayOfArray : bufferFromArrayOfArray,
  bufferFrom : bufferFrom,
  bufferRawFromTyped : bufferRawFromTyped,
  bufferRawFrom : bufferRawFrom,
  bufferBytesFrom : bufferBytesFrom,
  bufferBytesFromNode : bufferBytesFromNode,
  bufferNodeFrom : bufferNodeFrom,

  buffersSerialize : buffersSerialize, /* deprecated */
  buffersDeserialize : buffersDeserialize, /* deprecated */

  // long

  longMakeSimilar : longMakeSimilar,
  longMakeSimilarZeroed : longMakeSimilarZeroed,

  longSlice : longSlice,
  longButRange : longButRange,

  // arguments array

  // argumentsArrayIs : argumentsArrayIs,
  // _argumentsArrayMake : _argumentsArrayMake,
  // args : _argumentsArrayMake,
  // argumentsArrayOfLength : argumentsArrayOfLength,
  // argumentsArrayFrom : argumentsArrayFrom,
  //
  // // unroll
  //
  // unrollFrom : unrollFrom,
  // unrollPrepend : unrollPrepend,
  // unrollAppend : unrollAppend,
  //
  // // array checker
  //
  // arrayIs : arrayIs,
  // arrayLikeResizable : arrayLikeResizable,
  // arrayLike : arrayLike,
  // longIs : longIs,
  // unrollIs : unrollIs,
  //
  // constructorLikeArray : constructorLikeArray,
  // hasLength : hasLength,
  // arrayHasArray : arrayHasArray,
  //
  // arrayCompare : arrayCompare,
  // arrayIdentical : arrayIdentical,
  //
  // arrayHas : arrayHas, /* dubious */
  // arrayHasAny : arrayHasAny, /* dubious */
  // arrayHasAll : arrayHasAll, /* dubious */
  // arrayHasNone : arrayHasNone, /* dubious */
  //
  // arrayAll : arrayAll,
  // arrayAny : arrayAny,
  // arrayNone : arrayNone,

  // array maker

  arrayMakeRandom : arrayMakeRandom,
  arrayFromNumber : arrayFromNumber,
  arrayFrom : arrayFrom,
  arrayAs : arrayAs,

  _longClone : _longClone,
  longShallowClone : longShallowClone,

  arrayFromRange : arrayFromRange,
  arrayFromProgressionArithmetic : arrayFromProgressionArithmetic,
  arrayFromRangeWithStep : arrayFromRangeWithStep,
  arrayFromRangeWithNumberOfSteps : arrayFromRangeWithNumberOfSteps,

  // array converter

  arrayToMap : arrayToMap, /* dubious */
  arrayToStr : arrayToStr, /* dubious */

  // array transformer

  arraySub : arraySub,
  arrayButRange : arrayButRange,

  arraySlice : arraySlice,
  arrayGrow : arrayGrow,
  arrayResize : arrayResize,
  arrayMultislice : arrayMultislice,
  arrayDuplicate : arrayDuplicate,

  arrayMask : arrayMask, /* dubious */
  arrayUnmask : arrayUnmask, /* dubious */

  arrayInvestigateUniqueMap : arrayInvestigateUniqueMap,  /* dubious */
  arrayUnique : arrayUnique,  /* dubious */
  arraySelect : arraySelect,

  // array mutator

  arraySet : arraySet,
  arraySwap : arraySwap,

  arrayCutin : arrayCutin,
  arrayPut : arrayPut,
  arrayFillTimes : arrayFillTimes,
  arrayFillWhole : arrayFillWhole,

  arraySupplement : arraySupplement, /* experimental */
  arrayExtendScreening : arrayExtendScreening, /* experimental */

  arrayShuffle : arrayShuffle,
  arraySort : arraySort,

  // array etc

  arrayIndicesOfGreatest : arrayIndicesOfGreatest, /* dubious */
  arraySum : arraySum, /* dubious */

  // // array sequential search
  //
  // arrayLeftIndex : arrayLeftIndex,
  // arrayRightIndex : arrayRightIndex,
  //
  // arrayLeft : arrayLeft,
  // arrayRight : arrayRight,
  //
  // arrayLeftDefined : arrayLeftDefined,
  // arrayRightDefined : arrayRightDefined,
  //
  // arrayCount : arrayCount,
  // arrayCountUnique : arrayCountUnique,
  //
  // // array prepend
  //
  // _arrayPrependUnrolling : _arrayPrependUnrolling,
  // arrayPrependUnrolling : arrayPrependUnrolling,
  // arrayPrepend_ : arrayPrepend_,
  //
  // arrayPrependElement : arrayPrependElement,
  // arrayPrependOnce : arrayPrependOnce,
  // arrayPrependOnceStrictly : arrayPrependOnceStrictly,
  // arrayPrependedElement : arrayPrependedElement,
  // arrayPrependedOnce : arrayPrependedOnce,
  //
  // arrayPrependArray : arrayPrependArray,
  // arrayPrependArrayOnce : arrayPrependArrayOnce,
  // arrayPrependArrayOnceStrictly : arrayPrependArrayOnceStrictly,
  // arrayPrependedArray : arrayPrependedArray,
  // arrayPrependedArrayOnce : arrayPrependedArrayOnce,
  //
  // arrayPrependArrays : arrayPrependArrays,
  // arrayPrependArraysOnce : arrayPrependArraysOnce,
  // arrayPrependArraysOnceStrictly : arrayPrependArraysOnceStrictly,
  // arrayPrependedArrays : arrayPrependedArrays,
  // arrayPrependedArraysOnce : arrayPrependedArraysOnce,
  //
  // // array append
  //
  // _arrayAppendUnrolling : _arrayAppendUnrolling,
  // arrayAppendUnrolling : arrayAppendUnrolling,
  // arrayAppend_ : arrayAppend_,
  //
  // arrayAppendElement : arrayAppendElement,
  // arrayAppendOnce : arrayAppendOnce,
  // arrayAppendOnceStrictly : arrayAppendOnceStrictly,
  // arrayAppendedElement : arrayAppendedElement,
  // arrayAppendedOnce : arrayAppendedOnce,
  //
  // arrayAppendArray : arrayAppendArray,
  // arrayAppendArrayOnce : arrayAppendArrayOnce,
  // arrayAppendArrayOnceStrictly : arrayAppendArrayOnceStrictly,
  // arrayAppendedArray : arrayAppendedArray,
  // arrayAppendedArrayOnce : arrayAppendedArrayOnce,
  //
  // arrayAppendArrays : arrayAppendArrays,
  // arrayAppendArraysOnce : arrayAppendArraysOnce,
  // arrayAppendArraysOnceStrictly : arrayAppendArraysOnceStrictly,
  // arrayAppendedArrays : arrayAppendedArrays,
  // arrayAppendedArraysOnce : arrayAppendedArraysOnce,
  //
  // // array remove
  //
  // arrayRemoveElement : arrayRemoveElement,
  // arrayRemoveElementOnce : arrayRemoveElementOnce,
  // arrayRemoveElementOnceStrictly : arrayRemoveElementOnceStrictly,
  // arrayRemovedElement : arrayRemovedElement,
  // arrayRemovedElementOnce : arrayRemovedElementOnce,
  // arrayRemovedOnceStrictly : arrayRemovedOnceStrictly, /* qqq : test required */
  // arrayRemovedOnceElement : arrayRemovedOnceElement, /* qqq : test required */
  // arrayRemovedOnceElementStrictly : arrayRemovedOnceElementStrictly, /* qqq : test required */
  //
  // arrayRemoveArray : arrayRemoveArray,
  // arrayRemoveArrayOnce : arrayRemoveArrayOnce,
  // arrayRemoveArrayOnceStrictly : arrayRemoveArrayOnceStrictly,
  // arrayRemovedArray : arrayRemovedArray,
  // arrayRemovedArrayOnce : arrayRemovedArrayOnce,
  //
  // arrayRemoveArrays : arrayRemoveArrays,
  // arrayRemoveArraysOnce : arrayRemoveArraysOnce,
  // arrayRemoveArraysOnceStrictly : arrayRemoveArraysOnceStrictly,
  // arrayRemovedArrays : arrayRemovedArrays,
  // arrayRemovedArraysOnce : arrayRemovedArraysOnce,
  //
  // arrayRemoveAll : arrayRemoveAll,
  // arrayRemovedAll : arrayRemovedAll,
  //
  // // array flatten
  //
  // arrayFlatten : arrayFlatten,
  // arrayFlattenOnce : arrayFlattenOnce,
  // arrayFlattenOnceStrictly : arrayFlattenOnceStrictly,
  // arrayFlattened : arrayFlattened,
  // arrayFlattenedOnce : arrayFlattenedOnce,
  //
  // // array replace
  //
  // arrayReplaceOnce : arrayReplaceOnce,
  // arrayReplaceOnceStrictly : arrayReplaceOnceStrictly,
  // arrayReplacedOnce : arrayReplacedOnce,
  //
  // // arrayReplacedOnceStrictly : arrayReplacedOnceStrictly, /* qqq : implement */
  // // arrayReplacedOnceElement : arrayReplacedOnceElement, /* qqq : implement */
  // // arrayReplacedOnceElementStrictly : arrayReplacedOnceElementStrictly, /* qqq : implement */
  //
  // arrayReplaceArrayOnce : arrayReplaceArrayOnce,
  // arrayReplaceArrayOnceStrictly : arrayReplaceArrayOnceStrictly,
  // arrayReplacedArrayOnce : arrayReplacedArrayOnce,
  //
  // arrayReplaceAll : arrayReplaceAll,
  // arrayReplacedAll : arrayReplacedAll,
  //
  // arrayUpdate : arrayUpdate,

  // array set

  arraySetDiff : arraySetDiff,

  arraySetBut : arraySetBut,
  arraySetIntersection : arraySetIntersection,
  arraySetUnion : arraySetUnion,

  arraySetContainAll : arraySetContainAll,
  arraySetContainAny : arraySetContainAny,
  arraySetContainNone : arraySetContainNone,
  arraySetIdentical : arraySetIdentical,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' )
if( _global.WTOOLS_PRIVATE )
delete require.cache[ module.id ];

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
