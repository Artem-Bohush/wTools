( function _iLong_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;
let _ArrayIndexOf = Array.prototype.indexOf;
let _ArrayLastIndexOf = Array.prototype.lastIndexOf;

// --
// arguments array
// --

function argumentsArrayIs( src )
{
  return Object.prototype.toString.call( src ) === '[object Arguments]';
}

// --
// array
// --

/**
 * The arrayIs() routine determines whether the passed value is an Array.
 *
 * If the {-srcMap-} is an Array, true is returned,
 * otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * _.arrayIs( [ 1, 2 ] );
 * // returns true
 *
 * @example
 * _.arrayIs( 10 );
 * // returns false
 *
 * @returns { boolean } Returns true if {-srcMap-} is an Array.
 * @function arrayIs
 * @namespace Tools
 */

function arrayIs( src )
{
  return Array.isArray( src );
  // return Object.prototype.toString.call( src ) === '[object Array]';
}

//

function arrayIsEmpty( src )
{
  if( !_.arrayIs( src ) )
  return false;
  return src.length === 0;
}

//

function arrayIsPopulated( src )
{
  if( !_.arrayIs( src ) )
  return false;
  return src.length > 0;
}

//

function arrayLikeResizable( src )
{
  if( Object.prototype.toString.call( src ) === '[object Array]' )
  return true;
  return false;
}

//

function arrayLike( src )
{
  if( _.arrayIs( src ) )
  return true;
  if( _.argumentsArrayIs( src ) )
  return true;
  return false;
}

// --
// fields
// --

let Fields =
{

  // ArrayType : Array,

  accuracy : 1e-7,
  accuracySqrt : 1e-4,
  accuracySqr : 1e-14,

}

// --
// routines
// --

let Routines =
{

  // arguments array

  argumentsArrayIs,

  //

  arrayIs,
  arrayIsEmpty,
  arrayIsPopulated,
  arrayLikeResizable,
  arrayLike,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
